//
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
//        // التحقق من المستخدم المسجل
//        if (springSecurityService.isLoggedIn()) {
//            redirect(controller: 'dashboard', action: 'index')
//            return
//        }
//
//        render(view: 'auth')
//    }
//
//    def authenticate() {
//        // Spring Security بتعامل مع المصادقة تلقائياً
//        redirect(action: 'success')
//    }
//
//    def success() {
//        redirect(controller: 'dashboard', action: 'index')
//    }
//
//    def authfail() {
//        flash.error = "Invalid username or password"
//        redirect(action: 'auth')
//    }
//
//    def denied() {
//        render(view: 'denied')
//    }
//
//    def testAuth() {
//        def username = params.username
//        def password = getDefaultPassword(username)
//
//        if (!password) {
//            flash.error = "No default password for user: ${username}"
//            redirect(action: 'auth')
//            return
//        }
//
//        try {
//            springSecurityService.reauthenticate(username, password)
//
//            if (springSecurityService.isLoggedIn()) {
//                redirect(controller: 'dashboard', action: 'index')
//            } else {
//                flash.error = "Login failed"
//                redirect(action: 'auth')
//            }
//        } catch (Exception e) {
//            flash.error = "Error: ${e.message}"
//            redirect(action: 'auth')
//        }
//    }
//
//    private String getDefaultPassword(String username) {
//        def passwords = [
//                'admin@intern.com': 'admin123',
//                'ahmed.supervisor@company.com': 'super123',
//                'mohammed.student@university.edu': 'intern123'
//        ]
//        return passwords[username]
//    }
//}
package interntrack

import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.core.context.SecurityContextHolder
import grails.plugin.springsecurity.SpringSecurityUtils

class LoginController {

    SpringSecurityService springSecurityService

    def auth() {
        // If user is already logged in - go to dashboard
        if (springSecurityService.isLoggedIn()) {
            redirectToDashboard()
            return
        }
        render(view: 'auth')
    }
//
//    def authenticate() {
//        // Spring Security handles authentication automatically
//        redirect(action: 'success')
//    }

    def success() {
        // New login - check role and redirect to appropriate dashboard
        if (!springSecurityService.isLoggedIn()) {
            redirect(action: 'auth')
            return
        }

        redirectToDashboard()
    }

    def authfail() {
        flash.error = "❌ Invalid username or password"
        redirect(action: 'auth')
    }

    def denied() {
        flash.error = "⛔ You don't have permission to access this page"
        render(view: 'denied')
    }

//    def testAuth() {
//        def username = params.username
//        def password = getDefaultPassword(username)
//
//        if (!password) {
//            flash.error = "❌ No default password found for user: ${username}"
//            redirect(action: 'auth')
//            return
//        }
//
//        try {
//            springSecurityService.reauthenticate(username, password)
//
//            if (springSecurityService.isLoggedIn()) {
//                redirectToDashboard()
//            } else {
//                flash.error = "❌ Login failed"
//                redirect(action: 'auth')
//            }
//        } catch (Exception e) {
//            flash.error = "❌ Error: ${e.message}"
//            redirect(action: 'auth')
//        }
//    }

    // ========== Helper Methods ==========
//
//    private void redirectToDashboard() {
//        if (springSecurityService.ifAnyGranted('ROLE_ADMIN')) {
//            redirect(controller: 'dashboard', action: 'admin')
//        } else if (springSecurityService.ifAnyGranted('ROLE_SUPERVISOR')) {
//            redirect(controller: 'dashboard', action: 'supervisor')
//        } else if (springSecurityService.ifAnyGranted('ROLE_INTERN')) {
//            redirect(controller: 'dashboard', action: 'intern')
//        } else {
//            // If no role found - go to home page
//            redirect(uri: '/')
//        }
//    }
    private void redirectToDashboard() {

        def authorities = springSecurityService.authentication?.authorities*.authority

        if (authorities?.contains('ROLE_ADMIN')) {
            redirect(controller: 'dashboard', action: 'admin')

        } else if (authorities?.contains('ROLE_SUPERVISOR')) {
            redirect(controller: 'dashboard', action: 'supervisor')

        } else if (authorities?.contains('ROLE_INTERN')) {
            redirect(controller: 'dashboard', action: 'intern')

        } else {
            redirect(uri: '/')
        }
    }


    private String getDefaultPassword(String username) {
        def passwords = [
                'admin@intern.com': 'admin123',
                'ahmed.supervisor@company.com': 'super123',
                'mohammed.student@university.edu': 'intern123'
        ]
        return passwords[username]
    }
}