//////// File: grails-app/controllers/intern/track/LoginController.groovy
//////package interntrack
//////
//////import grails.plugin.springsecurity.SpringSecurityService
//////
//////class LoginController {
//////
//////    SpringSecurityService springSecurityService
//////
//////    def auth() {
//////        if (springSecurityService.isLoggedIn()) {
//////            redirect(controller: 'dashboard', action: 'index')
//////            return
//////        }
//////
//////        render(view: 'auth')
//////    }
//////
//////    def denied() {
//////        render(view: 'denied')
//////    }
//////
//////    def register() {
//////        if (springSecurityService.isLoggedIn()) {
//////            redirect(controller: 'dashboard', action: 'index')
//////            return
//////        }
//////
//////        render(view: 'register')
//////    }
//////
//////    def doRegister() {
//////        try {
//////            // Check if username already exists
//////            def existingUser = User.findByUsername(params.username)
//////            if (existingUser) {
//////                flash.error = "Username already exists"
//////                redirect(action: 'register')
//////                return
//////            }
//////
//////            // Check if email already exists
//////            existingUser = User.findByEmail(params.email)
//////            if (existingUser) {
//////                flash.error = "Email already registered"
//////                redirect(action: 'register')
//////                return
//////            }
//////
//////            // Create new user
//////            def user = new User(
//////                    username: params.username,
//////                    password: params.password,
//////                    email: params.email,
//////                    fullName: params.fullName,
//////                    phone: params.phone,
//////                    enabled: true
//////            )
//////
//////            if (!user.save(flush: true)) {
//////                throw new RuntimeException("Failed to create user: ${user.errors}")
//////            }
//////
//////            // Assign default role (Intern)
//////            def internRole = Role.findByAuthority('ROLE_INTERN') ?:
//////                    new Role(authority: 'ROLE_INTERN').save(flush: true)
//////
//////            UserRole.create(user, internRole, true)
//////
//////            // Create intern profile
//////            def intern = new Intern(
//////                    user: user,
//////                    studentId: params.studentId ?: "STU${new Date().time}",
//////                    university: params.university ?: 'Not specified',
//////                    major: params.major ?: 'Not specified',
//////                    startDate: new Date(),
//////                    endDate: new Date() + 90, // 3 months default
//////                    status: 'ACTIVE'
//////            )
//////
//////            if (!intern.save(flush: true)) {
//////                log.error("Failed to create intern profile: ${intern.errors}")
//////            }
//////
//////            flash.message = "Registration successful. Please login."
//////            redirect(action: 'auth')
//////
//////        } catch (Exception e) {
//////            flash.error = "Registration failed: ${e.message}"
//////            redirect(action: 'register')
//////        }
//////    }
//////}
////package interntrack
////
////import grails.plugin.springsecurity.SpringSecurityService
////import grails.plugin.springsecurity.annotation.Secured
////import org.springframework.security.authentication.AccountExpiredException
////import org.springframework.security.authentication.CredentialsExpiredException
////import org.springframework.security.authentication.DisabledException
////import org.springframework.security.authentication.LockedException
////import org.springframework.security.web.WebAttributes
////
////class LoginController {
////
////    SpringSecurityService springSecurityService
////
////    def auth() {
////        def config = springSecurityService.securityConfig
////
////        if (springSecurityService.isLoggedIn()) {
////            redirectByRole()
////            return
////        }
////
////        // معالجة أخطاء المصادقة
////        String view = 'auth'
////        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
////
////        render view: view, model: [
////                postUrl: postUrl,
////                rememberMeParameter: config.rememberMe.parameter,
////                usernameParameter: config.apf.usernameParameter,
////                passwordParameter: config.apf.passwordParameter,
////                gspLayout: 'main'
////        ]
////    }
////
////    def authfail() {
////        // هذه الدالة لمعالجة فشل المصادقة
////        def msg = ''
////        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
////
////        if (exception) {
////            if (exception instanceof AccountExpiredException) {
////                msg = 'Account has expired'
////            } else if (exception instanceof CredentialsExpiredException) {
////                msg = 'Password has expired'
////            } else if (exception instanceof DisabledException) {
////                msg = 'Account is disabled'
////            } else if (exception instanceof LockedException) {
////                msg = 'Account is locked'
////            } else {
////                msg = 'Invalid username or password'
////            }
////        }
////
////        flash.error = msg
////        redirect action: 'auth', params: params
////    }
////
////    def success() {
////        redirectByRole()
////    }
////
////    def denied() {
////        render view: 'denied'
////    }
////
////    private void redirectByRole() {
////        def user = springSecurityService.currentUser
////
////        if (!user) {
////            redirect controller: 'login', action: 'auth'
////            return
////        }
////
////        def roles = user.authorities*.authority
////        log.info("User ${user.username} has roles: ${roles}")
////
////        if (roles.contains('ROLE_ADMIN')) {
////            log.info("Redirecting to admin dashboard")
////            redirect controller: 'dashboard', action: 'admin'
////        } else if (roles.contains('ROLE_SUPERVISOR')) {
////            log.info("Redirecting to supervisor dashboard")
////            redirect controller: 'dashboard', action: 'supervisor'
////        } else if (roles.contains('ROLE_INTERN')) {
////            log.info("Redirecting to intern dashboard")
////            redirect controller: 'dashboard', action: 'intern'
////        } else {
////            log.warn("No valid role found for user: ${user.username}")
////            redirect controller: 'login', action: 'auth'
////        }
////    }
////
////    // دالة لاختبار المصادقة
////    def testAuth() {
////        def username = params.username ?: 'admin@intern.com'
////        def password = params.password ?: 'admin123'
////
////        try {
////            springSecurityService.reauthenticate(username, password)
////            log.info("Test authentication successful for: ${username}")
////            redirectByRole()
////        } catch (Exception e) {
////            log.error("Test authentication failed: ${e.message}")
////            flash.error = "Authentication failed: ${e.message}"
////            redirect action: 'auth'
////        }
////    }
////}
//package interntrack
//
//import grails.plugin.springsecurity.SpringSecurityService
//import org.springframework.security.web.WebAttributes
//
//class LoginController {
//
//    SpringSecurityService springSecurityService
//
//    // صفحة تسجيل الدخول الرئيسية
//    def auth() {
//        if (springSecurityService.isLoggedIn()) {
//            println "User already logged in, redirecting..."
//            redirectByRole()
//            return
//        }
//
//        println "Showing login page"
//        render(view: 'auth')
//    }
//
//    // يتم استدعاؤها بعد المصادقة الناجحة من Spring Security
//    def success() {
//        println "Login successful, checking user role..."
//        redirectByRole()
//    }
//
//    // معالجة فشل المصادقة
//    def authfail() {
//        def msg = 'Invalid username or password'
//        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
//
//        if (exception) {
//            msg = exception.message
//        }
//
//        flash.error = msg
//        println "Authentication failed: ${msg}"
//        redirect action: 'auth'
//    }
//
//    // صفحة رفض الوصول
//    def denied() {
//        render view: 'denied'
//    }
//
//    // صفحة اختيار الدور (تظهر للمستخدمين متعددي الأدوار)
//    def chooseRole() {
//        if (!springSecurityService.isLoggedIn()) {
//            redirect action: 'auth'
//            return
//        }
//
//        def user = springSecurityService.currentUser
//        def roles = user.authorities*.authority
//
//        println "User ${user.username} has roles: ${roles}"
//
//        // إذا كان لديه دور واحد فقط، توجيه مباشر
//        if (roles.size() == 1) {
//            redirectByRole()
//            return
//        }
//
//        render view: '/login/chooseRole'
//    }
//
//    // تحديث الدور المختار
//    def updateRole() {
//        if (!springSecurityService.isLoggedIn()) {
//            redirect action: 'auth'
//            return
//        }
//
//        def role = params.role
//        def user = springSecurityService.currentUser
//
//        println "User ${user.username} selected role: ${role}"
//
//        try {
//            // تخزين الدور المختار في الجلسة
//            session['selectedRole'] = role
//
//            // التوجيه حسب الدور المختار
//            switch(role) {
//                case 'admin':
//                    redirect controller: 'dashboard', action: 'admin'
//                    break
//                case 'supervisor':
//                    redirect controller: 'dashboard', action: 'supervisor'
//                    break
//                case 'intern':
//                    redirect controller: 'dashboard', action: 'intern'
//                    break
//                default:
//                    flash.error = "Invalid role selected"
//                    redirect action: 'chooseRole'
//            }
//        } catch(Exception e) {
//            flash.error = "Error switching role: ${e.message}"
//            redirect action: 'chooseRole'
//        }
//    }
//
//    // التوجيه التلقائي حسب دور المستخدم
//    private void redirectByRole() {
//        def user = springSecurityService.currentUser
//
//        if (!user) {
//            println "No user found, redirecting to login"
//            redirect controller: 'login', action: 'auth'
//            return
//        }
//
//        def roles = user.authorities*.authority
//        println "User ${user.username} has roles: ${roles}"
//
//        // إذا كان لديه أكثر من دور، عرض صفحة الاختيار
//        if (roles.size() > 1) {
//            println "User has multiple roles, redirecting to chooseRole"
//            redirect action: 'chooseRole'
//            return
//        }
//
//        // التوجيه حسب الدور الوحيد
//        if (roles.contains('ROLE_ADMIN')) {
//            println "Redirecting to admin dashboard"
//            redirect controller: 'dashboard', action: 'admin'
//        } else if (roles.contains('ROLE_SUPERVISOR')) {
//            println "Redirecting to supervisor dashboard"
//            redirect controller: 'dashboard', action: 'supervisor'
//        } else if (roles.contains('ROLE_INTERN')) {
//            println "Redirecting to intern dashboard"
//            redirect controller: 'dashboard', action: 'intern'
//        } else {
//            println "No valid role found for user: ${user.username}"
//            flash.error = "No valid role assigned"
//            redirect controller: 'login', action: 'auth'
//        }
//    }
//
//    // دالة لاختبار المصادقة السريعة (للاختبار فقط)
//    def testAuth() {
//        def username = params.username
//
//        // بيانات الاختبار
//        def testUsers = [
//                'admin@intern.com': ['password': 'admin123', 'role': 'admin'],
//                'ahmed.supervisor@company.com': ['password': 'super123', 'role': 'supervisor'],
//                'mohammed.student@university.edu': ['password': 'intern123', 'role': 'intern'],
//                'fatima.student@university.edu': ['password': 'intern123', 'role': 'intern'],
//                'sara.supervisor@company.com': ['password': 'super123', 'role': 'supervisor']
//        ]
//
//        if (testUsers.containsKey(username)) {
//            def userInfo = testUsers[username]
//
//            try {
//                // محاولة المصادقة
//                springSecurityService.reauthenticate(username, userInfo.password)
//
//                // تخزين الدور المختار في الجلسة
//                session['selectedRole'] = userInfo.role
//
//                println "Test authentication successful for: ${username}"
//
//                // التوجيه مباشرة إلى لوحة التحكم المناسبة
//                switch(userInfo.role) {
//                    case 'admin':
//                        redirect controller: 'dashboard', action: 'admin'
//                        break
//                    case 'supervisor':
//                        redirect controller: 'dashboard', action: 'supervisor'
//                        break
//                    case 'intern':
//                        redirect controller: 'dashboard', action: 'intern'
//                        break
//                }
//            } catch(Exception e) {
//                println "Test authentication failed: ${e.message}"
//                flash.error = "Authentication failed. Make sure user exists in database."
//                redirect action: 'auth'
//            }
//        } else {
//            flash.error = "Test user not found"
//            redirect action: 'auth'
//        }
//    }
//
//    // تسجيل مستخدم جديد (اختياري)
//    def register() {
//        if (springSecurityService.isLoggedIn()) {
//            redirect action: 'chooseRole'
//            return
//        }
//        render view: 'register'
//    }
//
//    def doRegister() {
//        // كود التسجيل (يمكنك إضافته لاحقاً)
//        flash.message = "Registration feature coming soon"
//        redirect action: 'auth'
//    }
//}
// File: grails-app/controllers/interntrack/LoginController.groovy
//package interntrack
//
//import grails.plugin.springsecurity.SpringSecurityService
//import org.springframework.security.core.context.SecurityContextHolder
//
//class LoginController {
//
//    SpringSecurityService springSecurityService
//
//    def auth() {
//        println "========== LOGIN AUTH CALLED =========="
//
//        // التحقق من حالة المصادقة الحالية
//        def auth = SecurityContextHolder.context?.authentication
//        println "Current authentication: ${auth?.name}"
//        println "Is authenticated: ${auth?.authenticated}"
//        println "Is logged in via springSecurityService: ${springSecurityService.isLoggedIn()}"
//
//        // إذا كان المستخدم مسجل دخول بالفعل، توجيه مباشر
//        if (springSecurityService.isLoggedIn()) {
//            println "User already logged in. Redirecting to dashboard..."
//            redirectToDashboard()
//            return
//        }
//
//        // الحصول على postUrl من Spring Security configuration
//        def config = springSecurityService.securityConfig
//        def postUrl = config.auth.loginFormUrl ?: '/login/authenticate'
//        println "Post URL for form: ${postUrl}"
//
//        // إرجاع النموذج مع postUrl
//        [postUrl: postUrl, error: params.error ?: '']
//    }
//
//    def success() {
//        println "========== LOGIN SUCCESS CALLED =========="
//
//        // التحقق من أن المستخدم مسجل دخول فعلاً
//        if (!springSecurityService.isLoggedIn()) {
//            println "ERROR: User not logged in on success page!"
//            flash.error = "Authentication failed"
//            redirect(controller: 'login', action: 'auth')
//            return
//        }
//
//        redirectToDashboard()
//    }
//
//    def authfail() {
//        println "========== LOGIN AUTHFAIL CALLED =========="
//
//        def msg = 'Invalid username or password'
//        def exception = session[org.springframework.security.web.WebAttributes.AUTHENTICATION_EXCEPTION]
//
//        if (exception) {
//            msg = exception.message ?: 'Invalid username or password'
//            println "Authentication exception: ${exception.class.name} - ${msg}"
//        }
//
//        // إعادة الحصول على postUrl لعرضه في الصفحة
//        def config = springSecurityService.securityConfig
//        def postUrl = config.auth.loginFormUrl ?: '/login/authenticate'
//
//        render(view: 'auth', model: [postUrl: postUrl, error: msg])
//    }
//
//    def authenticate() {
//        println "========== AUTHENTICATE CALLED =========="
//        println "Params: ${params}"
//        // هذه الدالة لا ينبغي أن تصل إليها لأن Spring Security يعالج المصادقة
//        redirect(action: 'auth')
//    }
//
//    private void redirectToDashboard() {
//        println "========== REDIRECTING TO DASHBOARD =========="
//
//        def user = springSecurityService.currentUser
//        println "Current user from springSecurityService: ${user?.username}"
//
//        if (!user) {
//            println "ERROR: No current user found!"
//
//            // محاولة الحصول من SecurityContext
//            def auth = SecurityContextHolder.context?.authentication
//            println "Authentication from context: ${auth?.name}"
//
//            if (auth?.principal instanceof String) {
//                user = User.findByUsername(auth.name)
//                println "Found user from username: ${user?.username}"
//            }
//        }
//
//        if (!user) {
//            println "FATAL: User not found in database"
//            flash.error = "User account not found"
//            redirect(controller: 'login', action: 'auth')
//            return
//        }
//
//        println "User found: ${user.username} (ID: ${user.id})"
//
//        // الحصول على الأدوار
//        def authorities = user.getAuthorities()*.authority
//        println "User authorities: ${authorities}"
//
//        if (authorities.contains('ROLE_ADMIN')) {
//            println "Redirecting to ADMIN dashboard"
//            redirect(controller: 'dashboard', action: 'admin')
//        } else if (authorities.contains('ROLE_SUPERVISOR')) {
//            println "Redirecting to SUPERVISOR dashboard"
//            redirect(controller: 'dashboard', action: 'supervisor')
//        } else if (authorities.contains('ROLE_INTERN')) {
//            println "Redirecting to INTERN dashboard"
//            redirect(controller: 'dashboard', action: 'intern')
//        } else {
//            println "ERROR: No valid role found!"
//            flash.error = "No valid role assigned to user"
//            redirect(controller: 'login', action: 'auth')
//        }
//    }
//
//    def testAuth() {
//        def username = params.username
//        println "========== TEST AUTH FOR: ${username} =========="
//
//        def testUsers = [
//                'admin@intern.com': ['password': 'admin123', 'role': 'ROLE_ADMIN'],
//                'ahmed.supervisor@company.com': ['password': 'super123', 'role': 'ROLE_SUPERVISOR'],
//                'mohammed.student@university.edu': ['password': 'intern123', 'role': 'ROLE_INTERN']
//        ]
//
//        if (testUsers.containsKey(username)) {
//            def userInfo = testUsers[username]
//            def user = User.findByUsername(username)
//
//            if (user) {
//                println "User found in DB: ${user.username}"
//                println "User enabled: ${user.enabled}"
//
//                // محاولة المصادقة
//                try {
//                    println "Attempting authentication for ${username}"
//                    springSecurityService.reauthenticate(username, userInfo.password)
//                    println "Authentication successful!"
//                    redirectToDashboard()
//                } catch (Exception e) {
//                    println "Authentication failed: ${e.message}"
//                    flash.error = "Authentication failed: ${e.message}"
//                    redirect(action: 'auth')
//                }
//            } else {
//                println "User not found in database"
//                flash.error = "User ${username} not found in database"
//                redirect(action: 'auth')
//            }
//        } else {
//            flash.error = "Test user not found"
//            redirect(action: 'auth')
//        }
//    }
//}
// File: grails-app/controllers/interntrack/LoginController.groovy
package interntrack

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.SpringSecurityUtils
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.authentication.BadCredentialsException
import org.springframework.security.core.context.SecurityContextHolder

class LoginController {

    SpringSecurityService springSecurityService

//    def auth() {
//        // التحقق مما إذا كان المستخدم مسجل دخول باستخدام SecurityContextHolder مباشرة
//        def authentication = SecurityContextHolder.context?.authentication
//        if (authentication && authentication.isAuthenticated() && authentication.principal != 'anonymousUser') {
//            println "✓ User already logged in: ${authentication.name}"
//            redirectToDashboard()
//            return
//        }
//
//        println "Showing login page"
//        render(view: 'auth')
//    }
    def auth() {
        // التحقق من حالة تسجيل الدخول
        def auth = SecurityContextHolder.context?.authentication
        if (auth && auth.isAuthenticated() && auth.principal != 'anonymousUser') {
            redirectByRole()
            return
        }

        render(view: 'auth')
    }

    def success() {
        redirectToDashboard()
    }

    def authfail() {
        def msg = 'Invalid username or password'
        def exception = session[SpringSecurityUtils.SECURITY_LAST_EXCEPTION]

        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = 'Account has expired'
            } else if (exception instanceof CredentialsExpiredException) {
                msg = 'Password has expired'
            } else if (exception instanceof DisabledException) {
                msg = 'Account is disabled'
            } else if (exception instanceof LockedException) {
                msg = 'Account is locked'
            } else if (exception instanceof BadCredentialsException) {
                msg = 'Invalid username or password'
            } else {
                msg = "Login failed: ${exception.message}"
            }
        }

        println "✗ Authentication failed: ${msg}"
        flash.error = msg
        redirect(action: 'auth')
    }

    def denied() {
        render(view: 'denied')
    }

    // دالة الاختبار - يتم استدعاؤها من أزرار الاختبار
    def testAuth() {
        println "=== Test Authentication ==="
        println "Username: ${params.username}"

        try {
            def username = params.username

            // البحث عن المستخدم في قاعدة البيانات
            def user = User.findByUsername(username)

            if (!user) {
                flash.error = "User not found: ${username}"
                redirect(action: 'auth')
                return
            }

            println "Found user: ${user.username}"

            // تسجيل الدخول باستخدام reauthenticate
            def password = getDefaultPassword(username)

            if (!password) {
                flash.error = "No default password for user: ${username}"
                redirect(action: 'auth')
                return
            }

            // محاولة المصادقة
            springSecurityService.reauthenticate(username, password)

            // التحقق من نجاح المصادقة
            def authentication = SecurityContextHolder.context?.authentication
            if (authentication && authentication.isAuthenticated()) {
                println "✓ Authentication successful for: ${username}"

                // إعادة توجيه حسب الدور
                def roles = user.getAuthorities()*.authority
                println "User roles: ${roles}"

                if (roles.contains('ROLE_ADMIN')) {
                    redirect(controller: 'dashboard', action: 'admin')
                } else if (roles.contains('ROLE_SUPERVISOR')) {
                    redirect(controller: 'dashboard', action: 'supervisor')
                } else if (roles.contains('ROLE_INTERN')) {
                    redirect(controller: 'dashboard', action: 'intern')
                } else {
                    println "No valid role found for user: ${username}"
                    redirect(controller: 'dashboard', action: 'index')
                }
            } else {
                println "✗ Authentication failed for: ${username}"
                flash.error = "Authentication failed"
                redirect(action: 'auth')
            }

        } catch (Exception e) {
            println "✗ Error during test authentication: ${e.message}"
            e.printStackTrace()
            flash.error = "Error: ${e.message}"
            redirect(action: 'auth')
        }
    }

    private void redirectToDashboard() {
        def authentication = SecurityContextHolder.context?.authentication

        if (!authentication || !authentication.isAuthenticated() || authentication.principal == 'anonymousUser') {
            println "No authenticated user found, redirecting to login"
            redirect(action: 'auth')
            return
        }

        def username = authentication.name
        println "Redirecting user: ${username}"

        def user = User.findByUsername(username)

        if (!user) {
            println "User not found in database: ${username}"
            redirect(action: 'auth')
            return
        }

        def roles = user.getAuthorities()*.authority
        println "User roles: ${roles}"

        if (roles.contains('ROLE_ADMIN')) {
            println "→ Redirecting to admin dashboard"
            redirect(controller: 'dashboard', action: 'admin')
        } else if (roles.contains('ROLE_SUPERVISOR')) {
            println "→ Redirecting to supervisor dashboard"
            redirect(controller: 'dashboard', action: 'supervisor')
        } else if (roles.contains('ROLE_INTERN')) {
            println "→ Redirecting to intern dashboard"
            redirect(controller: 'dashboard', action: 'intern')
        } else {
            println "No valid role for user: ${username}"
            redirect(action: 'auth')
        }
    }

    private String getDefaultPassword(String username) {
        def passwordMap = [
                'admin@intern.com': 'admin123',
                'ahmed.supervisor@company.com': 'super123',
                'sara.supervisor@company.com': 'super123',
                'mohammed.student@university.edu': 'intern123',
                'fatima.student@university.edu': 'intern123',
                'omar.student@university.edu': 'intern123',
                'noor.student@university.edu': 'intern123'
        ]
        return passwordMap[username]
    }
}