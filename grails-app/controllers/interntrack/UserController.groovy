
package interntrack

import grails.plugin.springsecurity.annotation.Secured
import grails.gorm.transactions.Transactional
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

@Secured(['ROLE_ADMIN'])
@Transactional
class UserController {

    def springSecurityService

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
            render(view: 'create', model: [user: user, roles: Role.list()])
            return
        }

        // التحقق من وجود المستخدم
        if (User.findByUsername(user.username)) {
            flash.error = "Username already exists"
            render(view: 'create', model: [user: user, roles: Role.list()])
            return
        }

        if (User.findByEmail(user.email)) {
            flash.error = "Email already exists"
            render(view: 'create', model: [user: user, roles: Role.list()])
            return
        }

        try {
            // حفظ المستخدم
            if (!user.save(flush: true)) {
                flash.error = "Error saving user: ${user.errors}"
                render(view: 'create', model: [user: user, roles: Role.list()])
                return
            }

            // إضافة الأدوار
            def selectedRoles = params.list('selectedRoles')
            def hasSupervisorRole = false
            def hasInternRole = false

            selectedRoles.each { roleId ->
                def role = Role.get(roleId)
                if (role) {
                    new UserRole(user: user, role: role).save(flush: true)

                    // التحقق من نوع الدور
                    if (role.authority == 'ROLE_SUPERVISOR') {
                        hasSupervisorRole = true
                    } else if (role.authority == 'ROLE_INTERN') {
                        hasInternRole = true
                    }
                }
            }

            flash.message = "User '${user.username}' created successfully"

            // ========== إنشاء Supervisor تلقائياً إذا كان Role SUPERVISOR ==========
            if (hasSupervisorRole) {
                try {
                    def supervisor = new Supervisor()
                    supervisor.user = user

                    // إنشاء بيانات افتراضية للمشرف
                    supervisor.employeeId = "EMP" + System.currentTimeMillis().toString().takeRight(6)
                    supervisor.department = "Not Specified"
                    supervisor.position = "Supervisor"
                    supervisor.maxInterns = 5

                    if (supervisor.save(flush: true)) {
                        flash.message += " - Supervisor profile created automatically with Employee ID: ${supervisor.employeeId}"
                    } else {
                        flash.warning = " - User created but Supervisor profile could not be created automatically. Please complete supervisor profile manually."
                    }
                } catch (Exception e) {
                    log.error "Error creating supervisor automatically: ${e.message}"
                    flash.warning = " - User created but Supervisor profile could not be created automatically. Please complete supervisor profile manually."
                }
            }

            // ========== إنشاء Intern تلقائياً إذا كان Role INTERN ==========
            else if (hasInternRole) {
                try {
                    def intern = new Intern()
                    intern.user = user

                    // إنشاء بيانات افتراضية للمتدرب
                    intern.studentId = "STU" + System.currentTimeMillis().toString().takeRight(8)
                    intern.university = "Not Specified"
                    intern.major = "Not Specified"
                    intern.startDate = new Date()

                    Calendar cal = Calendar.getInstance()
                    cal.add(Calendar.DAY_OF_MONTH, 90)
                    intern.endDate = cal.time
                    intern.status = 'ACTIVE'

                    if (intern.save(flush: true)) {
                        flash.message += " - Intern profile created automatically with Student ID: ${intern.studentId}"
                    } else {
                        flash.warning = " - User created but Intern profile could not be created automatically. Please complete intern profile manually."
                    }
                } catch (Exception e) {
                    log.error "Error creating intern automatically: ${e.message}"
                    flash.warning = " - User created but Intern profile could not be created automatically. Please complete intern profile manually."
                }
            }

            redirect(action: 'index')

        } catch (Exception e) {
            flash.error = "Error creating user: ${e.message}"
            render(view: 'create', model: [user: user, roles: Role.list()])
        }
    }

    def show(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.error = "User not found"
            redirect(action: 'index')
            return
        }
        [user: user]
    }

    def edit(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.error = "User not found"
            redirect(action: 'index')
            return
        }

        def selectedRoles = UserRole.findAllByUser(user)*.role*.id
        [user: user, roles: Role.list(), selectedRoles: selectedRoles]
    }

//    def update(Long id) {
//        def user = User.get(id)
//        if (!user) {
//            flash.error = "User not found"
//            redirect(action: 'index')
//            return
//        }
//
//        println "=== Updating User ID: ${id} ==="
//        println "Params: ${params}"
//
//        // حفظ القيم القديمة للمقارنة
//        def oldEmail = user.email
//        def oldFullName = user.fullName
//
//        try {
//            // تحديث الحقول الأساسية
//            user.fullName = params.fullName
//            user.email = params.email
//            user.phone = params.phone ?: null
//
//            // تحديث حالة الحساب
//            user.enabled = params.enabled ? true : false
//            user.accountExpired = params.accountExpired ? true : false
//            user.accountLocked = params.accountLocked ? true : false
//            user.passwordExpired = params.passwordExpired ? true : false
//
//            // تحديث كلمة المرور إذا تم إدخالها
//            if (params.password && params.password.trim()) {
//                if (params.password.length() < 6) {
//                    flash.error = "Password must be at least 6 characters long"
//                    def selectedRoles = UserRole.findAllByUser(user)*.role*.id
//                    render(view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles])
//                    return
//                }
//                user.password = params.password
//                println "Password updated for user: ${user.username}"
//            }
//
//            // حفظ المستخدم
//            if (!user.save(flush: true)) {
//                log.error "Failed to update user: ${user.errors}"
//                flash.error = "Error updating user: ${user.errors}"
//                def selectedRoles = UserRole.findAllByUser(user)*.role*.id
//                render(view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles])
//                return
//            }
//
//            println "User saved successfully: ${user.fullName}"
//
//            // تحديث الأدوار
//            def oldRoles = UserRole.findAllByUser(user)*.role*.id
//            def newRoles = params.list('selectedRoles')?.collect { it as Long } ?: []
//
//            println "Old roles: ${oldRoles}"
//            println "New roles: ${newRoles}"
//
//            // حذف الأدوار القديمة
//            UserRole.removeAll(user)
//
//            // إضافة الأدوار الجديدة
//            newRoles.each { roleId ->
//                def role = Role.get(roleId)
//                if (role) {
//                    def userRole = new UserRole(user: user, role: role)
//                    if (userRole.save(flush: true)) {
//                        println "Added role: ${role.authority} to user: ${user.username}"
//                    } else {
//                        log.error "Failed to add role ${roleId} to user ${user.id}: ${userRole.errors}"
//                    }
//                }
//            }
//
//            // التحقق من التغييرات في الـ Supervisor أو Intern
//            if (newRoles.contains(Role.findByAuthority('ROLE_SUPERVISOR')?.id)) {
//                // إذا أضيف Role SUPERVISOR ولم يكن موجوداً من قبل
//                if (!user.supervisor) {
//                    try {
//                        def supervisor = new Supervisor()
//                        supervisor.user = user
//                        supervisor.employeeId = "EMP" + System.currentTimeMillis().toString().takeRight(6)
//                        supervisor.department = "Not Specified"
//                        supervisor.position = "Supervisor"
//                        supervisor.maxInterns = 5
//
//                        if (supervisor.save(flush: true)) {
//                            flash.message = "Supervisor profile created automatically for this user."
//                        }
//                    } catch (Exception e) {
//                        log.error "Error creating supervisor: ${e.message}"
//                    }
//                }
//            } else {
//                // إذا أزيل Role SUPERVISOR
//                if (user.supervisor) {
//                    try {
//                        user.supervisor.delete()
//                        println "Supervisor deleted for user: ${user.username}"
//                    } catch (Exception e) {
//                        log.error "Error deleting supervisor: ${e.message}"
//                    }
//                }
//            }
//
//            // رسالة النجاح
//            def message = "User '${user.username}' updated successfully"
//            if (oldEmail != user.email || oldFullName != user.fullName) {
//                message += " - Email: ${oldEmail} → ${user.email}, Name: ${oldFullName} → ${user.fullName}"
//            }
//
//            flash.message = message
//            println "=== Update completed successfully ==="
//
//            redirect(action: 'show', id: user.id)
//
//        } catch (Exception e) {
//            log.error "Error updating user: ${e.message}", e
//            flash.error = "Error updating user: ${e.message}"
//            def selectedRoles = params.list('selectedRoles')
//            render(view: 'edit', model: [user: user, roles: Role.list(), selectedRoles: selectedRoles])
//        }
//    }
    def update(Long id) {

        def user = User.get(id)
        if (!user) {
            flash.error = "User not found"
            redirect(action: 'index')
            return
        }

        println "=== UPDATE USER ${id} ==="
        println "PARAMS: ${params}"

        def oldEmail = user.email
        def oldName  = user.fullName

        try {

            /* =========================
               تحديث البيانات الأساسية
            ========================== */
            user.fullName = params.fullName
            user.email    = params.email
            user.phone    = params.phone ?: null

            user.enabled         = params.enabled ? true : false
            user.accountExpired  = params.accountExpired ? true : false
            user.accountLocked   = params.accountLocked ? true : false
            user.passwordExpired = params.passwordExpired ? true : false

            /* =========================
               تحديث كلمة المرور
            ========================== */
            if (params.password?.trim()) {

                if (params.password.length() < 6) {
                    flash.error = "Password must be at least 6 characters long"
                    render(view:'edit', model:[
                            user:user,
                            roles:Role.list(),
                            selectedRoles: UserRole.findAllByUser(user)*.role*.id
                    ])
                    return
                }

                user.password = springSecurityService.encodePassword(params.password)
                println "Password updated for ${user.username}"
            }

            /* =========================
               حفظ المستخدم
            ========================== */
            if (!user.save(flush:true)) {
                flash.error = "Error updating user: ${user.errors}"
                render(view:'edit', model:[
                        user:user,
                        roles:Role.list(),
                        selectedRoles: UserRole.findAllByUser(user)*.role*.id
                ])
                return
            }

            /* =========================
               تحديث الأدوار
            ========================== */
            def oldRoles = UserRole.findAllByUser(user)*.role*.id
            def newRoles = params.list('selectedRoles')*.toLong().unique()

            println "OLD ROLES = ${oldRoles}"
            println "NEW ROLES = ${newRoles}"

            // حذف القديم
            UserRole.removeAll(user)

            // تنظيف session (مهم جداً لتجنب NonUniqueObjectException)
            UserRole.withSession { s ->
                s.flush()
                s.clear()
            }

            // إضافة الجديد
            newRoles.each { roleId ->
                Role role = Role.get(roleId)
                if (role) {
                    def userRole = new UserRole(user: user, role: role)
                    if (!userRole.save(flush:true)) {
                        log.error "Failed to add role ${role.authority} to user ${user.id}: ${userRole.errors}"
                    } else {
                        println "Role added → ${role.authority}"
                    }
                }
            }

            /* =========================
               إنشاء / حذف Supervisor تلقائياً
            ========================== */
            def supervisorRoleId = Role.findByAuthority('ROLE_SUPERVISOR')?.id

            if (supervisorRoleId && newRoles.contains(supervisorRoleId)) {
                // إنشاء Supervisor إذا لم يكن موجود
                if (!user.supervisor) {
                    def supervisor = new Supervisor(
                            user: user,
                            employeeId: "EMP" + System.currentTimeMillis().toString().takeRight(6),
                            department: "Not Specified",
                            position: "Supervisor",
                            maxInterns: 5
                    )
                    supervisor.save(flush:true)
                    println "Supervisor profile created"
                }
            } else {
                // إزالة Supervisor إذا تم إزالة الدور
                if (user.supervisor) {
                    user.supervisor.delete(flush:true)
                    println "Supervisor removed"
                }
            }

            /* =========================
               رسالة النجاح
            ========================== */
            def msg = "User '${user.username}' updated successfully"
            if(oldEmail != user.email || oldName != user.fullName){
                msg += " | Changes → Email: ${oldEmail} → ${user.email}, Name: ${oldName} → ${user.fullName}"
            }
            flash.message = msg

            println "=== UPDATE SUCCESS ==="
            redirect(action:'show', id:user.id)

        } catch (Exception e) {
            log.error "UPDATE ERROR: ${e.message}", e
            flash.error = "Error updating user: ${e.message}"
            render(view:'edit', model:[
                    user:user,
                    roles:Role.list(),
                    selectedRoles: params.list('selectedRoles')
            ])
        }
    }


    def delete(Long id) {
        def user = User.get(id)
        if (!user) {
            flash.error = "User not found"
            redirect(action: 'index')
            return
        }

        try {
            // منع حذف المستخدم الحالي
            def currentUser = springSecurityService?.currentUser
            if (currentUser?.id == user.id) {
                flash.error = "You cannot delete your own account"
                redirect(action: 'index')
                return
            }

            // حذف العلاقات أولاً
            UserRole.removeAll(user)

            // حذف Intern أو Supervisor إذا وجد
            if (user.intern) {
                user.intern.delete()
            }
            if (user.supervisor) {
                user.supervisor.delete()
            }

            // حذف المستخدم
            user.delete(flush: true)

            flash.message = "User '${user.username}' deleted successfully"
        } catch (Exception e) {
            flash.error = "Error deleting user: ${e.message}"
        }

        redirect(action: 'index')
    }

}