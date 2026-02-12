//////package interntrack
//////
//////import grails.plugin.springsecurity.annotation.Secured
//////
//////@Secured(['ROLE_ADMIN'])
//////class UserController {
//////
//////    def springSecurityService
//////    def passwordEncoder
//////
//////    def index() {
//////        [users: User.list()]
//////    }
//////
//////    def create() {
//////        [user: new User(), roles: Role.list()]
//////    }
//////
//////    def save(UserCommand cmd) {
//////        if (cmd.hasErrors()) {
//////            render view: 'create', model: [user: cmd, roles: Role.list()]
//////            return
//////        }
//////
//////        try {
//////            // التحقق من عدم وجود مستخدم بنفس الاسم أو البريد
//////            if (User.findByUsername(cmd.username)) {
//////                flash.error = "Username already exists"
//////                render view: 'create', model: [user: cmd, roles: Role.list()]
//////                return
//////            }
//////
//////            if (User.findByEmail(cmd.email)) {
//////                flash.error = "Email already exists"
//////                render view: 'create', model: [user: cmd, roles: Role.list()]
//////                return
//////            }
//////
//////            // إنشاء المستخدم الجديد
//////            def user = new User(
//////                    username: cmd.username,
//////                    password: cmd.password,
//////                    email: cmd.email,
//////                    fullName: cmd.fullName,
//////                    phone: cmd.phone,
//////                    enabled: cmd.enabled ?: true
//////            )
//////
//////            // حفظ المستخدم (سيتم تشفير كلمة المرور تلقائياً في beforeInsert)
//////            if (!user.save(flush: true)) {
//////                flash.error = "Error saving user: ${user.errors}"
//////                render view: 'create', model: [user: cmd, roles: Role.list()]
//////                return
//////            }
//////
//////            // إضافة الأدوار للمستخدم
//////            cmd.selectedRoles?.each { roleId ->
//////                def role = Role.get(roleId)
//////                if (role && !UserRole.exists(user.id, role.id)) {
//////                    new UserRole(user: user, role: role).save(flush: true)
//////                }
//////            }
//////
//////            flash.message = "User '${user.username}' created successfully"
//////            redirect action: 'index'
//////
//////        } catch (Exception e) {
//////            flash.error = "Error creating user: ${e.message}"
//////            render view: 'create', model: [user: cmd, roles: Role.list()]
//////        }
//////    }
//////
//////    def show(Long id) {
//////        def user = User.get(id)
//////        if (!user) {
//////            flash.error = "User not found"
//////            redirect action: 'index'
//////            return
//////        }
//////        [user: user]
//////    }
//////
//////    def edit(Long id) {
//////        def user = User.get(id)
//////        if (!user) {
//////            flash.error = "User not found"
//////            redirect action: 'index'
//////            return
//////        }
//////
//////        def selectedRoles = UserRole.findAllByUser(user)*.role*.id
//////        [user: user, roles: Role.list(), selectedRoles: selectedRoles]
//////    }
//////
//////    def update(UserCommand cmd) {
//////        if (cmd.hasErrors()) {
//////            render view: 'edit', model: [user: cmd, roles: Role.list(),
//////                                         selectedRoles: cmd.selectedRoles]
//////            return
//////        }
//////
//////        def user = User.get(cmd.id)
//////        if (!user) {
//////            flash.error = "User not found"
//////            redirect action: 'index'
//////            return
//////        }
//////
//////        try {
//////            // تحديث بيانات المستخدم
//////            user.properties['email', 'fullName', 'phone', 'enabled'] = cmd.properties
//////
//////            // إذا تم تغيير كلمة المرور
//////            if (cmd.password) {
//////                user.password = cmd.password
//////            }
//////
//////            if (!user.save(flush: true)) {
//////                flash.error = "Error updating user: ${user.errors}"
//////                render view: 'edit', model: [user: cmd, roles: Role.list(),
//////                                             selectedRoles: cmd.selectedRoles]
//////                return
//////            }
//////
//////            // تحديث الأدوار (حذف القديم وإضافة الجديد)
//////            UserRole.removeAll(user)
//////            cmd.selectedRoles?.each { roleId ->
//////                def role = Role.get(roleId)
//////                if (role) {
//////                    new UserRole(user: user, role: role).save(flush: true)
//////                }
//////            }
//////
//////            flash.message = "User '${user.username}' updated successfully"
//////            redirect action: 'show', id: user.id
//////
//////        } catch (Exception e) {
//////            flash.error = "Error updating user: ${e.message}"
//////            render view: 'edit', model: [user: cmd, roles: Role.list(),
//////                                         selectedRoles: cmd.selectedRoles]
//////        }
//////    }
//////
//////    def delete(Long id) {
//////        def user = User.get(id)
//////        if (!user) {
//////            flash.error = "User not found"
//////            redirect action: 'index'
//////            return
//////        }
//////
//////        try {
//////            // حذف العلاقات أولاً
//////            UserRole.removeAll(user)
//////
//////            // حذف المستخدم
//////            user.delete(flush: true)
//////
//////            flash.message = "User '${user.username}' deleted successfully"
//////        } catch (Exception e) {
//////            flash.error = "Error deleting user: ${e.message}"
//////        }
//////
//////        redirect action: 'index'
//////    }
//////}
////// File: grails-app/controllers/interntrack/UserController.groovy
////package interntrack
////
////import grails.plugin.springsecurity.annotation.Secured
////
////@Secured(['ROLE_ADMIN'])
////class UserController {
////
////    def index() {
////        [users: User.list(), userCount: User.count()]
////    }
////
////    def create() {
////        [user: new User(), roles: Role.list()]
////    }
////
////    def save() {
////        def user = new User(params)
////
////        if (!user.username || !user.password || !user.email || !user.fullName) {
////            flash.error = "Please fill all required fields"
////            render view: 'create', model: [user: user, roles: Role.list()]
////            return
////        }
////
////        if (User.findByUsername(user.username)) {
////            flash.error = "Username already exists"
////            render view: 'create', model: [user: user, roles: Role.list()]
////            return
////        }
////
////        if (User.findByEmail(user.email)) {
////            flash.error = "Email already exists"
////            render view: 'create', model: [user: user, roles: Role.list()]
////            return
////        }
////
////        try {
////            User.withNewTransaction { status ->
////                try {
////                    if (!user.save(flush: true)) {
////                        flash.error = "Error saving user: ${user.errors}"
////                        render view: 'create', model: [user: user, roles: Role.list()]
////                        status.setRollbackOnly()
////                        return
////                    }
////
////                    def selectedRoles = params.list('selectedRoles')
////                    selectedRoles.each { roleId ->
////                        def role = Role.get(roleId)
////                        if (role && !UserRole.exists(user.id, role.id)) {
////                            new UserRole(user: user, role: role).save(flush: true)
////                        }
////                    }
////
////                    flash.message = "User '${user.username}' created successfully"
////                    redirect action: 'index'
////
////                } catch (Exception e) {
////                    flash.error = "Error creating user: ${e.message}"
////                    render view: 'create', model: [user: user, roles: Role.list()]
////                    status.setRollbackOnly()
////                }
////            }
////
////        } catch (Exception e) {
////            flash.error = "Error creating user: ${e.message}"
////            render view: 'create', model: [user: user, roles: Role.list()]
////        }
////    }
////
////    def show(Long id) {
////        def user = User.get(id)
////        if (!user) {
////            flash.error = "User not found"
////            redirect action: 'index'
////            return
////        }
////        [user: user]
////    }
////
////    def edit(Long id) {
////        def user = User.get(id)
////        if (!user) {
////            flash.error = "User not found"
////            redirect action: 'index'
////            return
////        }
////
////        def selectedRoles = UserRole.findAllByUser(user)*.role*.id
////        [user: user, roles: Role.list(), selectedRoles: selectedRoles]
////    }
////
////    def update(Long id) {
////        def user = User.get(id)
////        if (!user) {
////            flash.error = "User not found"
////            redirect action: 'index'
////            return
////        }
////
////        user.properties['email', 'fullName', 'phone', 'enabled'] = params
////
////        if (params.password) {
////            user.password = params.password
////        }
////
////        try {
////            User.withNewTransaction { status ->
////                try {
////                    if (!user.save(flush: true)) {
////                        flash.error = "Error updating user: ${user.errors}"
////                        def selectedRoles = UserRole.findAllByUser(user)*.role*.id
////                        render view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles]
////                        status.setRollbackOnly()
////                        return
////                    }
////
////                    UserRole.removeAll(user)
////                    def selectedRoles = params.list('selectedRoles')
////                    selectedRoles.each { roleId ->
////                        def role = Role.get(roleId)
////                        if (role) {
////                            new UserRole(user: user, role: role).save(flush: true)
////                        }
////                    }
////
////                    flash.message = "User '${user.username}' updated successfully"
////                    redirect action: 'show', id: user.id
////
////                } catch (Exception e) {
////                    flash.error = "Error updating user: ${e.message}"
////                    def selectedRoles = params.list('selectedRoles')
////                    render view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles]
////                    status.setRollbackOnly()
////                }
////            }
////
////        } catch (Exception e) {
////            flash.error = "Error updating user: ${e.message}"
////            def selectedRoles = params.list('selectedRoles')
////            render view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles]
////        }
////    }
////
////    def delete(Long id) {
////        def user = User.get(id)
////        if (!user) {
////            flash.error = "User not found"
////            redirect action: 'index'
////            return
////        }
////
////        try {
////            User.withNewTransaction { status ->
////                try {
////                    def username = user.username
////                    UserRole.removeAll(user)
////                    user.delete(flush: true)
////                    flash.message = "User '${username}' deleted successfully"
////                    redirect action: 'index'
////
////                } catch (Exception e) {
////                    flash.error = "Error deleting user: ${e.message}"
////                    status.setRollbackOnly()
////                    redirect action: 'index'
////                }
////            }
////        } catch (Exception e) {
////            flash.error = "Error deleting user: ${e.message}"
////            redirect action: 'index'
////        }
////    }
////}
//// File: grails-app/controllers/interntrack/UserController.groovy
////package interntrack
////
////import grails.plugin.springsecurity.annotation.Secured
////
////@Secured(['ROLE_ADMIN'])
////class UserController {
////
////    def index() {
////        try {
////            def users = User.list()
////            def userCount = User.count()
////            [users: users, userCount: userCount]
////        } catch (Exception e) {
////            log.error "Error loading users: ${e.message}", e
////            flash.error = "Error loading users: ${e.message}"
////            [users: [], userCount: 0]
////        }
////    }
////
////    def create() {
////        try {
////            def roles = Role.list()
////            [user: new User(), roles: roles]
////        } catch (Exception e) {
////            log.error "Error loading roles: ${e.message}", e
////            flash.error = "Error loading roles: ${e.message}"
////            redirect action: 'index'
////        }
////    }
////
////    def save() {
////        def user = new User()
////        bindData(user, params, [include: ['username', 'password', 'email', 'fullName', 'phone', 'enabled']])
////
////        // التحقق من الحقول المطلوبة
////        if (!user.username || !user.password || !user.email || !user.fullName) {
////            flash.error = "Please fill all required fields: Username, Password, Email, and Full Name"
////            def roles = Role.list()
////            render view: 'create', model: [user: user, roles: roles]
////            return
////        }
////
////        // التحقق من تنسيق البريد الإلكتروني
////        if (!user.username.contains('@') || !user.email.contains('@')) {
////            flash.error = "Please enter valid email addresses"
////            def roles = Role.list()
////            render view: 'create', model: [user: user, roles: roles]
////            return
////        }
////
////        // التحقق من طول كلمة المرور
////        if (user.password.length() < 6) {
////            flash.error = "Password must be at least 6 characters long"
////            def roles = Role.list()
////            render view: 'create', model: [user: user, roles: roles]
////            return
////        }
////
////        // التحقق من عدم وجود مستخدم بنفس الاسم أو البريد
////        def existingUser = User.findByUsername(user.username)
////        if (existingUser) {
////            flash.error = "Username '${user.username}' already exists"
////            def roles = Role.list()
////            render view: 'create', model: [user: user, roles: roles]
////            return
////        }
////
////        def existingEmail = User.findByEmail(user.email)
////        if (existingEmail) {
////            flash.error = "Email '${user.email}' already exists"
////            def roles = Role.list()
////            render view: 'create', model: [user: user, roles: roles]
////            return
////        }
////
////        try {
////            // استخدام transaction جديدة
////            User.withNewTransaction { status ->
////                try {
////                    // تعيين القيم الافتراضية
////                    user.enabled = user.enabled ?: true
////
////                    // حفظ المستخدم (سيتم تشفير كلمة المرور تلقائياً في beforeInsert)
////                    if (!user.save(flush: true, failOnError: true)) {
////                        log.error "Failed to save user: ${user.errors}"
////                        flash.error = "Error saving user: ${user.errors}"
////                        def roles = Role.list()
////                        render view: 'create', model: [user: user, roles: roles]
////                        status.setRollbackOnly()
////                        return
////                    }
////
////                    // إضافة الأدوار للمستخدم
////                    def selectedRoles = params.list('selectedRoles')
////                    if (selectedRoles) {
////                        selectedRoles.each { roleId ->
////                            def role = Role.get(roleId)
////                            if (role && !UserRole.exists(user.id, role.id)) {
////                                def userRole = new UserRole(user: user, role: role)
////                                if (!userRole.save(flush: true, failOnError: true)) {
////                                    log.error "Failed to assign role ${roleId} to user ${user.id}: ${userRole.errors}"
////                                }
////                            }
////                        }
////                    } else {
////                        log.warn "No roles selected for user ${user.username}"
////                    }
////
////                    flash.message = "User '${user.username}' has been created successfully"
////                    redirect action: 'index'
////
////                } catch (Exception e) {
////                    log.error "Error in save transaction: ${e.message}", e
////                    flash.error = "Error creating user: ${e.message}"
////                    def roles = Role.list()
////                    render view: 'create', model: [user: user, roles: roles]
////                    status.setRollbackOnly()
////                }
////            }
////
////        } catch (Exception e) {
////            log.error "Error creating user: ${e.message}", e
////            flash.error = "Error creating user: ${e.message}"
////            def roles = Role.list()
////            render view: 'create', model: [user: user, roles: roles]
////        }
////    }
////
////    def show(Long id) {
////        try {
////            def user = User.get(id)
////            if (!user) {
////                flash.error = "User with ID ${id} not found"
////                redirect action: 'index'
////                return
////            }
////            [user: user]
////        } catch (Exception e) {
////            log.error "Error showing user ${id}: ${e.message}", e
////            flash.error = "Error loading user: ${e.message}"
////            redirect action: 'index'
////        }
////    }
////
////    def edit(Long id) {
////        try {
////            def user = User.get(id)
////            if (!user) {
////                flash.error = "User with ID ${id} not found"
////                redirect action: 'index'
////                return
////            }
////
////            def roles = Role.list()
////            def selectedRoles = UserRole.findAllByUser(user)*.role*.id
////
////            [user: user, roles: roles, selectedRoles: selectedRoles]
////        } catch (Exception e) {
////            log.error "Error loading user for edit ${id}: ${e.message}", e
////            flash.error = "Error loading user: ${e.message}"
////            redirect action: 'index'
////        }
////    }
////
////    def update(Long id) {
////        def user = User.get(id)
////        if (!user) {
////            flash.error = "User with ID ${id} not found"
////            redirect action: 'index'
////            return
////        }
////
////        // حفظ البيانات القديمة للاستخدام في الرسائل
////        def oldEmail = user.email
////        def oldFullName = user.fullName
////
////        // تحديث الخصائص
////        user.email = params.email
////        user.fullName = params.fullName
////        user.phone = params.phone
////        user.enabled = params.enabled ? params.enabled == 'on' : false
////
////        // التحقق من الحقول المطلوبة
////        if (!user.email || !user.fullName) {
////            flash.error = "Email and Full Name are required"
////            def roles = Role.list()
////            def selectedRoles = params.list('selectedRoles') ?: UserRole.findAllByUser(user)*.role*.id
////            render view: 'edit', model: [user: user, roles: roles, selectedRoles: selectedRoles]
////            return
////        }
////
////        // التحقق من تنسيق البريد الإلكتروني
////        if (!user.email.contains('@')) {
////            flash.error = "Please enter a valid email address"
////            def roles = Role.list()
////            def selectedRoles = params.list('selectedRoles') ?: UserRole.findAllByUser(user)*.role*.id
////            render view: 'edit', model: [user: user, roles: roles, selectedRoles: selectedRoles]
////            return
////        }
////
////        // التحقق من البريد الإلكتروني إذا تغير
////        if (user.email != oldEmail && User.findByEmail(user.email)) {
////            flash.error = "Email '${user.email}' already exists"
////            def roles = Role.list()
////            def selectedRoles = params.list('selectedRoles') ?: UserRole.findAllByUser(user)*.role*.id
////            render view: 'edit', model: [user: user, roles: roles, selectedRoles: selectedRoles]
////            return
////        }
////
////        // تحديث كلمة المرور إذا تم إدخالها
////        if (params.password && params.password.trim()) {
////            if (params.password.length() < 6) {
////                flash.error = "Password must be at least 6 characters long"
////                def roles = Role.list()
////                def selectedRoles = params.list('selectedRoles') ?: UserRole.findAllByUser(user)*.role*.id
////                render view: 'edit', model: [user: user, roles: roles, selectedRoles: selectedRoles]
////                return
////            }
////            user.password = params.password
////        }
////
////        try {
////            User.withNewTransaction { status ->
////                try {
////                    // حفظ المستخدم
////                    if (!user.save(flush: true, failOnError: true)) {
////                        log.error "Failed to update user: ${user.errors}"
////                        flash.error = "Error updating user: ${user.errors}"
////                        def roles = Role.list()
////                        def selectedRoles = params.list('selectedRoles') ?: UserRole.findAllByUser(user)*.role*.id
////                        render view: 'edit', model: [user: user, roles: roles, selectedRoles: selectedRoles]
////                        status.setRollbackOnly()
////                        return
////                    }
////
////                    // تحديث الأدوار
////                    def selectedRoles = params.list('selectedRoles')
////
////                    // إزالة الأدوار القديمة
////                    UserRole.removeAll(user)
////
////                    // إضافة الأدوار الجديدة
////                    if (selectedRoles) {
////                        selectedRoles.each { roleId ->
////                            def role = Role.get(roleId)
////                            if (role) {
////                                def userRole = new UserRole(user: user, role: role)
////                                if (!userRole.save(flush: true, failOnError: true)) {
////                                    log.error "Failed to assign role ${roleId} to user ${user.id}: ${userRole.errors}"
////                                }
////                            }
////                        }
////                    } else {
////                        log.warn "No roles selected for user ${user.username}"
////                    }
////
////                    // إعداد رسالة النجاح
////                    def message = "User '${user.username}' has been updated"
////                    if (oldEmail != user.email || oldFullName != user.fullName) {
////                        message += ". Email: ${oldEmail} → ${user.email}, Name: ${oldFullName} → ${user.fullName}"
////                    }
////
////                    flash.message = message
////                    redirect action: 'show', id: user.id
////
////                } catch (Exception e) {
////                    log.error "Error in update transaction: ${e.message}", e
////                    flash.error = "Error updating user: ${e.message}"
////                    def roles = Role.list()
////                    def selectedRoles = params.list('selectedRoles') ?: UserRole.findAllByUser(user)*.role*.id
////                    render view: 'edit', model: [user: user, roles: roles, selectedRoles: selectedRoles]
////                    status.setRollbackOnly()
////                }
////            }
////
////        } catch (Exception e) {
////            log.error "Error updating user: ${e.message}", e
////            flash.error = "Error updating user: ${e.message}"
////            def roles = Role.list()
////            def selectedRoles = params.list('selectedRoles') ?: UserRole.findAllByUser(user)*.role*.id
////            render view: 'edit', model: [user: user, roles: roles, selectedRoles: selectedRoles]
////        }
////    }
////
////    def delete(Long id) {
////        def user = User.get(id)
////        if (!user) {
////            flash.error = "User with ID ${id} not found"
////            redirect action: 'index'
////            return
////        }
////
////        try {
////            User.withNewTransaction { status ->
////                try {
////                    def username = user.username
////
////                    // منع حذف المستخدم نفسه
////                    def currentUser = springSecurityService?.currentUser
////                    if (currentUser?.id == user.id) {
////                        flash.error = "You cannot delete your own account"
////                        redirect action: 'index'
////                        status.setRollbackOnly()
////                        return
////                    }
////
////                    // حذف الأدوار أولاً
////                    UserRole.removeAll(user)
////
////                    // حذف المستخدم
////                    user.delete(flush: true)
////
////                    flash.message = "User '${username}' has been deleted successfully"
////                    redirect action: 'index'
////
////                } catch (Exception e) {
////                    log.error "Error in delete transaction: ${e.message}", e
////                    flash.error = "Error deleting user: ${e.message}"
////                    status.setRollbackOnly()
////                    redirect action: 'index'
////                }
////            }
////
////        } catch (Exception e) {
////            log.error "Error deleting user: ${e.message}", e
////            flash.error = "Error deleting user: ${e.message}"
////            redirect action: 'index'
////        }
////    }
////}
//// File: grails-app/controllers/interntrack/UserController.groovy
//package interntrack
//
//import grails.plugin.springsecurity.annotation.Secured
//
//@Secured(['ROLE_ADMIN'])
//class UserController {
//
//    def index() {
//        [users: User.list(), userCount: User.count()]
//    }
//
//    def create() {
//        [user: new User(), roles: Role.list()]
//    }
//
//    def save() {
//        def user = new User(params)
//
//        if (!user.username || !user.password || !user.email || !user.fullName) {
//            flash.error = "Please fill all required fields"
//            render view: 'create', model: [user: user, roles: Role.list()]
//            return
//        }
//
//        if (User.findByUsername(user.username)) {
//            flash.error = "Username already exists"
//            render view: 'create', model: [user: user, roles: Role.list()]
//            return
//        }
//
//        if (User.findByEmail(user.email)) {
//            flash.error = "Email already exists"
//            render view: 'create', model: [user: user, roles: Role.list()]
//            return
//        }
//
//        try {
//            User.withNewTransaction { status ->
//                try {
//                    if (!user.save(flush: true)) {
//                        flash.error = "Error saving user: ${user.errors}"
//                        render view: 'create', model: [user: user, roles: Role.list()]
//                        status.setRollbackOnly()
//                        return
//                    }
//
//                    def selectedRoles = params.list('selectedRoles')
//                    selectedRoles.each { roleId ->
//                        def role = Role.get(roleId)
//                        if (role && !UserRole.exists(user.id, role.id)) {
//                            new UserRole(user: user, role: role).save(flush: true)
//                        }
//                    }
//
//                    flash.message = "User '${user.username}' created successfully"
//                    redirect action: 'index'
//
//                } catch (Exception e) {
//                    flash.error = "Error creating user: ${e.message}"
//                    render view: 'create', model: [user: user, roles: Role.list()]
//                    status.setRollbackOnly()
//                }
//            }
//
//        } catch (Exception e) {
//            flash.error = "Error creating user: ${e.message}"
//            render view: 'create', model: [user: user, roles: Role.list()]
//        }
//    }
//
//    def show(Long id) {
//        def user = User.get(id)
//        if (!user) {
//            flash.error = "User not found"
//            redirect action: 'index'
//            return
//        }
//        [user: user]
//    }
//
//    def edit(Long id) {
//        def user = User.get(id)
//        if (!user) {
//            flash.error = "User not found"
//            redirect action: 'index'
//            return
//        }
//
//        def selectedRoles = UserRole.findAllByUser(user)*.role*.id
//        [user: user, roles: Role.list(), selectedRoles: selectedRoles]
//    }
//
//    def update(Long id) {
//        def user = User.get(id)
//        if (!user) {
//            flash.error = "User not found"
//            redirect action: 'index'
//            return
//        }
//
//        user.properties['email', 'fullName', 'phone', 'enabled'] = params
//
//        if (params.password) {
//            user.password = params.password
//        }
//
//        try {
//            User.withNewTransaction { status ->
//                try {
//                    if (!user.save(flush: true)) {
//                        flash.error = "Error updating user: ${user.errors}"
//                        def selectedRoles = UserRole.findAllByUser(user)*.role*.id
//                        render view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles]
//                        status.setRollbackOnly()
//                        return
//                    }
//
//                    UserRole.removeAll(user)
//                    def selectedRoles = params.list('selectedRoles')
//                    selectedRoles.each { roleId ->
//                        def role = Role.get(roleId)
//                        if (role) {
//                            new UserRole(user: user, role: role).save(flush: true)
//                        }
//                    }
//
//                    flash.message = "User '${user.username}' updated successfully"
//                    redirect action: 'show', id: user.id
//
//                } catch (Exception e) {
//                    flash.error = "Error updating user: ${e.message}"
//                    def selectedRoles = params.list('selectedRoles')
//                    render view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles]
//                    status.setRollbackOnly()
//                }
//            }
//
//        } catch (Exception e) {
//            flash.error = "Error updating user: ${e.message}"
//            def selectedRoles = params.list('selectedRoles')
//            render view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles]
//        }
//    }
//
//    def delete(Long id) {
//        def user = User.get(id)
//        if (!user) {
//            flash.error = "User not found"
//            redirect action: 'index'
//            return
//        }
//
//        try {
//            User.withNewTransaction { status ->
//                try {
//                    def username = user.username
//                    UserRole.removeAll(user)
//                    user.delete(flush: true)
//                    flash.message = "User '${username}' deleted successfully"
//                    redirect action: 'index'
//
//                } catch (Exception e) {
//                    flash.error = "Error deleting user: ${e.message}"
//                    status.setRollbackOnly()
//                    redirect action: 'index'
//                }
//            }
//        } catch (Exception e) {
//            flash.error = "Error deleting user: ${e.message}"
//            redirect action: 'index'
//        }
//    }
//}

package interntrack

import grails.plugin.springsecurity.annotation.Secured

//@Secured(['ROLE_ADMIN'])
class UserController {

    def index() {
        [users: User.list(), userCount: User.count()]
    }

    def create() {
        [user: new User(), roles: Role.list()]
    }

    def save() {
        def user = new User(params)

        if (!user.username || !user.password || !user.email || !user.fullName) {
            flash.error = "Please fill all required fields"
            render view: 'create', model: [user: user, roles: Role.list()]
            return
        }

        if (User.findByUsername(user.username)) {
            flash.error = "Username already exists"
            render view: 'create', model: [user: user, roles: Role.list()]
            return
        }

        if (User.findByEmail(user.email)) {
            flash.error = "Email already exists"
            render view: 'create', model: [user: user, roles: Role.list()]
            return
        }

        try {
            User.withNewTransaction { status ->
                try {
                    if (!user.save(flush: true)) {
                        flash.error = "Error saving user: ${user.errors}"
                        render view: 'create', model: [user: user, roles: Role.list()]
                        status.setRollbackOnly()
                        return
                    }

                    def selectedRoles = params.list('selectedRoles')
                    selectedRoles.each { roleId ->
                        def role = Role.get(roleId)
                        if (role && !UserRole.exists(user.id, role.id)) {
                            new UserRole(user: user, role: role).save(flush: true)
                        }
                    }

                    flash.message = "User '${user.username}' created successfully"
                    redirect action: 'index'

                } catch (Exception e) {
                    flash.error = "Error creating user: ${e.message}"
                    render view: 'create', model: [user: user, roles: Role.list()]
                    status.setRollbackOnly()
                }
            }

        } catch (Exception e) {
            flash.error = "Error creating user: ${e.message}"
            render view: 'create', model: [user: user, roles: Role.list()]
        }
    }

    def show(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.error = "User not found"
            redirect action: 'index'
            return
        }
        [user: user]
    }

    def edit(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.error = "User not found"
            redirect action: 'index'
            return
        }

        def selectedRoles = UserRole.findAllByUser(user)*.role*.id
        [user: user, roles: Role.list(), selectedRoles: selectedRoles]
    }

    def update(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.error = "User not found"
            redirect action: 'index'
            return
        }

        user.properties['email', 'fullName', 'phone', 'enabled'] = params

        if (params.password) {
            user.password = params.password
        }

        try {
            User.withNewTransaction { status ->
                try {
                    if (!user.save(flush: true)) {
                        flash.error = "Error updating user: ${user.errors}"
                        def selectedRoles = UserRole.findAllByUser(user)*.role*.id
                        render view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles]
                        status.setRollbackOnly()
                        return
                    }

                    UserRole.removeAll(user)
                    def selectedRoles = params.list('selectedRoles')
                    selectedRoles.each { roleId ->
                        def role = Role.get(roleId)
                        if (role) {
                            new UserRole(user: user, role: role).save(flush: true)
                        }
                    }

                    flash.message = "User '${user.username}' updated successfully"
                    redirect action: 'show', id: user.id

                } catch (Exception e) {
                    flash.error = "Error updating user: ${e.message}"
                    def selectedRoles = params.list('selectedRoles')
                    render view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles]
                    status.setRollbackOnly()
                }
            }

        } catch (Exception e) {
            flash.error = "Error updating user: ${e.message}"
            def selectedRoles = params.list('selectedRoles')
            render view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles]
        }
    }

    def delete(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.error = "User not found"
            redirect action: 'index'
            return
        }

        try {
            User.withNewTransaction { status ->
                try {
                    def username = user.username
                    UserRole.removeAll(user)
                    user.delete(flush: true)
                    flash.message = "User '${username}' deleted successfully"
                    redirect action: 'index'

                } catch (Exception e) {
                    flash.error = "Error deleting user: ${e.message}"
                    status.setRollbackOnly()
                    redirect action: 'index'
                }
            }
        } catch (Exception e) {
            flash.error = "Error deleting user: ${e.message}"
            redirect action: 'index'
        }
    }
}