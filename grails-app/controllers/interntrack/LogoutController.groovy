//package interntrack
//
//import grails.plugin.springsecurity.SpringSecurityService
//import grails.plugin.springsecurity.annotation.Secured
//
//class LogoutController {
//
//    SpringSecurityService springSecurityService
//
//    def index() {
//        // إذا كان المستخدم مسجل دخول، قم بتسجيل خروجه
//        if (springSecurityService.isLoggedIn()) {
//            // إزالة بيانات الجلسة
//            session.invalidate()
//
//            // تسجيل الخروج باستخدام Spring Security
//            try {
//                springSecurityService.logout()
//                flash.message = "You have been logged out successfully."
//            } catch (Exception e) {
//                log.error("Error during logout: ${e.message}", e)
//                flash.error = "An error occurred during logout."
//            }
//        } else {
//            flash.message = "You are already logged out."
//        }
//
//        // التحويل إلى صفحة تسجيل الدخول
//        redirect controller: 'login', action: 'auth'
//    }
//
//    // دالة تسجيل الخروج بصورة آمنة
//    @Secured('IS_AUTHENTICATED_FULLY')
//    def secureLogout() {
//        try {
//            // تسجيل الخروج
//            springSecurityService.logout()
//
//            // إزالة الجلسة
//            session.invalidate()
//
//            // إعادة تعيين الاستجابة
//            response.reset()
//
//            flash.message = "You have been securely logged out."
//
//        } catch (Exception e) {
//            log.error("Secure logout error: ${e.message}", e)
//            flash.error = "Error during secure logout."
//        }
//
//        redirect controller: 'login', action: 'auth'
//    }
//
//    // دالة تسجيل الخروج لجميع الجلسات
//    @Secured('IS_AUTHENTICATED_FULLY')
//    def logoutAll() {
//        try {
//            // إعدادات إضافية لتسجيل الخروج من جميع الجلسات
//            session.invalidate()
//            springSecurityService.logout()
//
//            // إضافة رؤوس الأمان
//            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate")
//            response.setHeader("Pragma", "no-cache")
//            response.setDateHeader("Expires", 0)
//
//            flash.message = "You have been logged out from all sessions."
//
//        } catch (Exception e) {
//            log.error("Logout all error: ${e.message}", e)
//            flash.error = "Error logging out from all sessions."
//        }
//
//        redirect controller: 'login', action: 'auth'
//    }
//}
//package interntrack
//
//import grails.plugin.springsecurity.annotation.Secured
//
//class LogoutController {
//
//    def index() {
//        // Spring Security سيتولى تسجيل الخروج
//        redirect uri: '/'
//    }
//}
package interntrack

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import grails.plugin.springsecurity.SpringSecurityUtils

@Secured(['permitAll'])
class LogoutController {
    def springSecurityService
    /**
     * Index action. Redirects to the Spring security logout uri.
     */
    def index = {
        // TODO put any pre-logout code here
        if (springSecurityService.isLoggedIn()) {
            println("---------------")
            request.session.removeAttribute("failLoginCount")
            session.invalidate()
            redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl
        }
        /**
         * remove failed login count form session.
         */
     // '/j_spring_security_logout'
    }
}
//class LogoutController {
//
//    SpringSecurityService springSecurityService
//
//    def index() {
//        println " Logout initiated - Session ID: ${session.id}"
//
//        session.invalidate()
//
//        SecurityContextHolder.clearContext()
//
//        redirect(uri: '/login/auth')
//    }
//
//    def secureLogout() {
//        HttpServletRequest request = request
//        HttpServletResponse response = response
//
//        def auth = SecurityContextHolder.context.authentication
//        if (auth) {
//            new SecurityContextLogoutHandler().logout(request, response, auth)
//        }
//
//        session.invalidate()
//        redirect(uri: '/login/auth')
//    }
//}
//package interntrack
//
//import grails.plugin.springsecurity.annotation.Secured
//import org.springframework.security.core.context.SecurityContextHolder
//import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
//
//@Secured(['permitAll'])
//class LogoutController {
//
//    def index() {
//
//        def auth = SecurityContextHolder.context.authentication
//        if (auth) {
//            new SecurityContextLogoutHandler().logout(request, response, auth)
//        }
//
//        redirect(uri: '/login/auth')
//    }
//}