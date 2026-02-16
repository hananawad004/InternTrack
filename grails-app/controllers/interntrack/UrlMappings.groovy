//
//class UrlMappings {
//
//    static mappings = {
//        "/$controller/$action?/$id?(.$format)?"{
//            constraints {
//                // apply constraints here
//            }
//        }
//
//        "/"(view:"/index")
//        "500"(view:'/error')
//        "404"(view:'/notFound')
//    }
//}
//class UrlMappings {
//
//    static mappings = {
//        // Home
//        "/"(controller: "login", action: "auth")
//
////        "/"(controller: "dashboard", action: "index")
//        "/dashboard"(controller: "dashboard", action: "index")
//
//        // Admin
//        "/admin"(controller: "dashboard", action: "adminDashboard")
//        "/admin/users"(controller: "user", action: "index")
//        "/admin/users/create"(controller: "user", action: "create")
//        "/admin/users/$id"(controller: "user", action: "show")
//        "/admin/interns"(controller: "intern", action: "index")
//        "/admin/interns/create"(controller: "intern", action: "create")
//        "/admin/interns/$id"(controller: "intern", action: "show")
//        "/admin/system/settings"(controller: "system", action: "settings")
//
//        // Intern
//        "/intern"(controller: "dashboard", action: "internDashboard")
//        "/intern/tasks"(controller: "task", action: "index")
//        "/intern/tasks/create"(controller: "task", action: "create")
//        "/intern/tasks/$id"(controller: "task", action: "show")
//        "/intern/reports"(controller: "weeklyReport", action: "index")
//        "/intern/reports/create"(controller: "weeklyReport", action: "create")
//        "/intern/reports/$id"(controller: "weeklyReport", action: "show")
//
//        // Supervisor
//        "/supervisor"(controller: "dashboard", action: "supervisorDashboard")
//        "/supervisor/interns"(controller: "intern", action: "index")
//        "/supervisor/evaluations/create"(controller: "evaluation", action: "create")
//        "/supervisor/reports/review"(controller: "weeklyReport", action: "review")
//        "/supervisor/reports/$id"(controller: "weeklyReport", action: "show")
//        "/supervisor/tasks"(controller: "task", action: "index")
//
//        // API endpoints (AJAX updates)
//        "/api/dashboard/stats"(controller: "dashboard", action: "apiStats")
//        "/api/weeklyReport/updateStatus"(controller: "weeklyReport", action: "updateStatus")
//
//        // Default mappings
//        "500"(view:'/error')
//        "404"(view:'/notFound')
//    }
//}
//class UrlMappings {
//
//    static mappings = {
//
//        // ========= HOME / LOGIN =========
//        "/"(controller: "login", action: "auth")
//        // ========= LOGIN REDIRECTS =========
//        "/login/success"(controller: "login", action: "success")
//        "/login/redirectByRole"(controller: "login", action: "redirectByRole")
//
//        // ========= AUTHENTICATION PATHS =========
//        "/login/auth"(controller: "login", action: "auth")
//        "/login/authfail"(controller: "login", action: "authfail")
//        "/login/success"(controller: "login", action: "success")
//        "/login/denied"(controller: "login", action: "denied")
//        "/login/testAuth"(controller: "login", action: "testAuth")
//        "/logout"(controller: "logout", action: "index")
//        "/logoff"(controller: "logout", action: "index")
//
//        // ========= ADMIN =========
//        "/admin"(controller: "dashboard", action: "admin")
//        "/admin/users"(controller: "user", action: "index")
//        "/admin/users/create"(controller: "user", action: "create")
//        "/admin/users/$id"(controller: "user", action: "show")
//        "/admin/interns"(controller: "intern", action: "index")
//        "/admin/interns/create"(controller: "intern", action: "create")
//        "/admin/interns/$id"(controller: "intern", action: "show")
//        "/admin/system/settings"(controller: "system", action: "settings")
//
//        // ========= INTERN =========
//        "/intern"(controller: "dashboard", action: "intern")
//        "/intern/tasks"(controller: "task", action: "index")
//        "/intern/tasks/create"(controller: "task", action: "create")
//        "/intern/tasks/$id"(controller: "task", action: "show")
//        "/intern/reports"(controller: "weeklyReport", action: "index")
//        "/intern/reports/create"(controller: "weeklyReport", action: "create")
//        "/intern/reports/$id"(controller: "weeklyReport", action: "show")
//
//        // ========= SUPERVISOR =========
//        "/supervisor"(controller: "dashboard", action: "supervisor")
//        "/supervisor/interns"(controller: "intern", action: "index")
//        "/supervisor/evaluations/create"(controller: "evaluation", action: "create")
//        "/supervisor/reports/review"(controller: "weeklyReport", action: "review")
//        "/supervisor/reports/$id"(controller: "weeklyReport", action: "show")
//        "/supervisor/tasks"(controller: "task", action: "index")
//
//        // ========= API (AJAX) =========
//        "/api/dashboard/stats"(controller: "dashboard", action: "apiStats")
//        "/api/weeklyReport/updateStatus"(controller: "weeklyReport", action: "updateStatus")
//
//        "/logout"(controller: "logout", action: "index")
//        "/logout/index"(controller: "logout", action: "index")
//        "/logout/secure"(controller: "logout", action: "secureLogout")
//        "/logout/all"(controller: "logout", action: "logoutAll")
//        "/logoff"(controller: "logout", action: "index")  // اسم بديل
//        // ========= ERRORS =========
//        "500"(view: '/error')
//        "404"(view: '/notFound')
//    }
//}
//class UrlMappings {
//
//    static mappings = {
//        // ========= LOGIN/AUTH =========
//        "/"(controller: "login", action: "auth")
//        "/login/auth"(controller: "login", action: "auth")
//        "/login/authfail"(controller: "login", action: "authfail")
//        "/login/success"(controller: "login", action: "success")
//        "/login/denied"(controller: "login", action: "denied")
//        "/login/chooseRole"(controller: "login", action: "chooseRole")
//        "/login/updateRole"(controller: "login", action: "updateRole")
//        "/login/testAuth"(controller: "login", action: "testAuth")
//
//        // ========= LOGOUT =========
//        "/logout"(controller: "logout", action: "index")
//        "/logoff"(controller: "logout", action: "index")
//
//        // ========= DASHBOARD =========
//        "/dashboard/admin"(controller: "dashboard", action: "admin")
//        "/dashboard/supervisor"(controller: "dashboard", action: "supervisor")
//        "/dashboard/intern"(controller: "dashboard", action: "intern")
//
//        // ========= ERRORS =========
//        "500"(view: '/error')
//        "404"(view: '/notFound')
//    }

//class UrlMappings {
//
//    static mappings = {
//        "/"(controller: "login", action: "auth")
//
//        "/login/auth"(controller: "login", action: "auth")
//        "/login/success"(controller: "login", action: "success")
//        "/login/authfail"(controller: "login", action: "authfail")
//        "/login/chooseRole"(controller: "login", action: "chooseRole")
//
//        "/logout"(controller: "logout", action: "index")
//
//        "/dashboard/admin"(controller: "dashboard", action: "admin")
//        "/dashboard/supervisor"(controller: "dashboard", action: "supervisor")
//        "/dashboard/intern"(controller: "dashboard", action: "intern")
//
//        "500"(view: '/error')
//        "404"(view: '/notFound')
//    }
//}
// File: grails-app/conf/interntrack/UrlMappings.groovy

//
//class UrlMappings {
//
//    static mappings = {
//        "/"(controller: "login", action: "auth")
//
//        "/login/auth"(controller: "login", action: "auth")
//        "/login/success"(controller: "login", action: "success")
//        "/login/authfail"(controller: "login", action: "authfail")
//        "/login/chooseRole"(controller: "login", action: "chooseRole")
//
//        "/logout"(controller: "logout", action: "index")
//
//        "/dashboard/admin"(controller: "dashboard", action: "admin")
//        "/dashboard/supervisor"(controller: "dashboard", action: "supervisor")
//        "/dashboard/intern"(controller: "dashboard", action: "intern")
//
//        // User management routes
//        "/user"(controller: "user", action: "index")
//        "/user/index"(controller: "user", action: "index")
//        "/user/create"(controller: "user", action: "create")
//        "/user/save"(controller: "user", action: "save")
//        "/user/show/$id"(controller: "user", action: "show")
//        "/user/edit/$id"(controller: "user", action: "edit")
//        "/user/update/$id"(controller: "user", action: "update")
//        "/user/delete/$id"(controller: "user", action: "delete")
//
//        "500"(view: '/error')
//        "404"(view: '/notFound')
//    }
//}

// File: grails-app/conf/interntrack/UrlMappings.groovy


//class UrlMappings {
//
//    static mappings = {
//        "/$controller/$action?/$id?(.${format})?" {
//            constraints {
//                // apply constraints here
//            }
//        }
//
//        "/"(controller: "login", action: "auth")
//        "/login/auth"(controller: "login", action: "auth")
//        "/login/success"(controller: "login", action: "success")
//        "/login/authfail"(controller: "login", action: "authfail")
//        "/login/test"(controller: "login", action: "testLogin")
//
//        "/dashboard/admin"(controller: "dashboard", action: "admin")
//        "/dashboard/supervisor"(controller: "dashboard", action: "supervisor")
//        "/dashboard/intern"(controller: "dashboard", action: "intern")
//
//        // User management
//        "/user"(controller: "user", action: "index")
//        "/user/index"(controller: "user", action: "index")
//        "/user/create"(controller: "user", action: "create")
//        "/user/save"(controller: "user", action: "save")
//        "/user/show/$id"(controller: "user", action: "show")
//        "/user/edit/$id"(controller: "user", action: "edit")
//        "/user/update/$id"(controller: "user", action: "update")
//        "/user/delete/$id"(controller: "user", action: "delete")
//
//        "500"(view: '/error')
//        "404"(view: '/notFound')
//    }
//}
// File: grails-app/controllers/interntrack/UrlMappings.groovy
// File: grails-app/controllers/interntrack/UrlMappings.groovy


//
//package interntrack
//
//class UrlMappings {
//
//    static mappings = {
//        "/$controller/$action?/$id?(.$format)?"{}
//
//        "/"(controller: "login", action: "auth")
//        "/index"(controller: "login", action: "auth")
//
//        // ========== LOGIN ==========
//        "/login/auth"(controller: "login", action: "auth")
//        "/login/authenticate"(controller: "login", action: "authenticate")
//        "/login/success"(controller: "login", action: "success")
//        "/login/authfail"(controller: "login", action: "authfail")
//        "/login/testAuth"(controller: "login", action: "testAuth")
//        "/logout"(controller: "logout", action: "index")
//
//        // ========== DASHBOARD ==========
//        "/dashboard/admin"(controller: "dashboard", action: "admin")
//        "/dashboard/supervisor"(controller: "dashboard", action: "supervisor")
//        "/dashboard/intern"(controller: "dashboard", action: "intern")
//        "/dashboard/index"(controller: "dashboard", action: "index")
//
//        // ========== INTERN ==========
//        "/intern"(controller: "intern", action: "index")
//        "/intern/index"(controller: "intern", action: "index")
//        "/intern/create"(controller: "intern", action: "create")
//        "/intern/save"(controller: "intern", action: "save")
//        "/intern/show/$id"(controller: "intern", action: "show")
//        "/intern/edit/$id"(controller: "intern", action: "edit")
//        "/intern/update/$id"(controller: "intern", action: "update")
//        "/intern/delete/$id"(controller: "intern", action: "delete")
//
//        // ========== USER ==========
//        "/user"(controller: "user", action: "index")
//        "/user/index"(controller: "user", action: "index")
//        "/user/create"(controller: "user", action: "create")
//        "/user/save"(controller: "user", action: "save")
//        "/user/show/$id"(controller: "user", action: "show")
//        "/user/edit/$id"(controller: "user", action: "edit")
//        "/user/update/$id"(controller: "user", action: "update")
//        "/user/delete/$id"(controller: "user", action: "delete")
//        "/test"(view: '/test')
//        // ========== ERROR ==========
//        "500"(view: '/error')
//        "404"(view: '/notFound')
//    }
//}


//class UrlMappings {
//
//    static mappings = {
//        "/$controller/$action?/$id?(.$format)?"{
//            constraints {
//                // apply constraints here
//            }
//        }
//
////        "/"(controller: "login", action: "auth")
////        "/index"(controller: "login", action: "auth")\
//        "/"(controller: "login", action: "auth")
//        "/index"(controller: "login", action: "auth")
//
//
//
//        // ========== LOGIN ==========
//        "/login/auth"(controller: "login", action: "auth")
//        "/login/authenticate"(controller: "login", action: "authenticate")
//        "/login/success"(controller: "login", action: "success")
//        "/login/authfail"(controller: "login", action: "authfail")
//        "/login/testAuth"(controller: "login", action: "testAuth")
//        "/logout"(controller: "logout", action: "index")
//
//        // ========== DASHBOARD ==========
//        "/dashboard/admin"(controller: "dashboard", action: "admin")
//        "/dashboard/supervisor"(controller: "dashboard", action: "supervisor")
//        "/dashboard/intern"(controller: "dashboard", action: "intern")
//        "/dashboard/index"(controller: "dashboard", action: "index")
//
//        // ========== INTERN ==========
//        "/intern"(controller: "intern", action: "index")
//        "/intern/index"(controller: "intern", action: "index")
//        "/intern/create"(controller: "intern", action: "create")
//        "/intern/save"(controller: "intern", action: "save")
//        "/intern/show/$id"(controller: "intern", action: "show")
//        "/intern/edit/$id"(controller: "intern", action: "edit")
//        "/intern/update/$id"(controller: "intern", action: "update")
//        "/intern/delete/$id"(controller: "intern", action: "delete")
//
//        // ========== USER ==========
//        "/user"(controller: "user", action: "index")
//        "/user/index"(controller: "user", action: "index")
//        "/user/create"(controller: "user", action: "create")
//        "/user/save"(controller: "user", action: "save")
//        "/user/show/$id"(controller: "user", action: "show")
//        "/user/edit/$id"(controller: "user", action: "edit")
//        "/user/update/$id"(controller: "user", action: "update")
//        "/user/delete/$id"(controller: "user", action: "delete")
//
//        "/test"(view: '/test')
//
//        // ========== ERROR ==========
//        "500"(view: '/error')
//        "404"(view: '/notFound')
//    }
//}
// grails-app/controllers/interntrack/UrlMappings.groovy

package interntrack
class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(controller: "login", action: "auth")
        "/index"(controller: "login", action: "auth")

        // ========== LOGIN ==========
        "/login/auth"(controller: "login", action: "auth")
        "/login/authenticate"(controller: "login", action: "authenticate")
        "/login/success"(controller: "login", action: "success")
        "/login/authfail"(controller: "login", action: "authfail")
        "/login/testAuth"(controller: "login", action: "testAuth")
        "/logout"(controller: "logout", action: "index")

        // ========== DASHBOARD ==========
        "/dashboard/admin"(controller: "dashboard", action: "admin")
        "/dashboard/supervisor"(controller: "dashboard", action: "supervisor")
        "/dashboard/intern"(controller: "dashboard", action: "intern")
        "/dashboard/index"(controller: "dashboard", action: "index")

        // ========== INTERN ==========
        "/intern"(controller: "intern", action: "index")
        "/intern/index"(controller: "intern", action: "index")
        "/intern/create"(controller: "intern", action: "create")
        "/intern/save"(controller: "intern", action: "save")
        "/intern/show/$id"(controller: "intern", action: "show")
        "/intern/edit/$id"(controller: "intern", action: "edit")
        "/intern/update/$id"(controller: "intern", action: "update")
        "/intern/delete/$id"(controller: "intern", action: "delete")

        // ========== USER ==========
        "/user"(controller: "user", action: "index")
        "/user/index"(controller: "user", action: "index")
        "/user/create"(controller: "user", action: "create")
        "/user/save"(controller: "user", action: "save")
        "/user/show/$id"(controller: "user", action: "show")
        "/user/edit/$id"(controller: "user", action: "edit")
        "/user/update/$id"(controller: "user", action: "update")
        "/user/delete/$id"(controller: "user", action: "delete")

        // ========== WEEKLY REPORT ==========
        "/weeklyReport/index"(controller: "weeklyReport", action: "index")
        "/weeklyReport/create"(controller: "weeklyReport", action: "create")
        "/weeklyReport/save"(controller: "weeklyReport", action: "save")
        "/weeklyReport/show/$id"(controller: "weeklyReport", action: "show")
        "/weeklyReport/edit/$id"(controller: "weeklyReport", action: "edit")
        "/weeklyReport/update/$id"(controller: "weeklyReport", action: "update")
        "/weeklyReport/delete/$id"(controller: "weeklyReport", action: "delete")
        "/weeklyReport/review/$id"(controller: "weeklyReport", action: "reviewReport")  // ✅ جديد
        "/weeklyReport/updateStatus"(controller: "weeklyReport", action: "updateStatus")

        // ========== ATTACHMENT ==========
        "/attachment/download/$id"(controller: "attachment", action: "download")      // ✅ جديد
        "/attachment/preview/$id"(controller: "attachment", action: "preview")        // ✅ جديد
        "/attachment/delete/$id"(controller: "attachment", action: "delete")          // ✅ جديد
        "/attachment/upload"(controller: "attachment", action: "upload")              // ✅ جديد
// ========== TASK ==========
        "/task/index"(controller: "task", action: "index")
        "/task/create"(controller: "task", action: "create")
        "/task/save"(controller: "task", action: "save")
        "/task/show/$id"(controller: "task", action: "show")
        "/task/edit/$id"(controller: "task", action: "edit")
        "/task/update/$id"(controller: "task", action: "update")
        "/task/delete/$id"(controller: "task", action: "delete")
        "/test"(view: '/test')

        // ========== ERROR ==========
        "500"(view: '/error')
        "404"(view: '/notFound')
    }
}