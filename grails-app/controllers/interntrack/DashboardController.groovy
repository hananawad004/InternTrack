////////package interntrack
////////
////////import grails.plugin.springsecurity.SpringSecurityService
////////import grails.converters.JSON
////////import interntrack.TaskService
////////import interntrack.ReportService
////////import interntrack.EvaluationService
////////
////////class DashboardController {
////////
////////    SpringSecurityService springSecurityService
////////    TaskService taskService
////////    ReportService reportService
////////    EvaluationService evaluationService
////////
////////    def index() {
////////        def currentUser = springSecurityService.currentUser
////////        def role = getCurrentUserRole()
////////
////////        switch(role) {
////////            case 'ROLE_INTERN':
////////                redirect(action: 'intern')
////////                break
////////            case 'ROLE_SUPERVISOR':
////////                redirect(action: 'supervisor')
////////                break
////////            case 'ROLE_ADMIN':
////////                redirect(action: 'admin')
////////                break
////////            default:
////////                redirect(controller: 'login', action: 'auth')
////////        }
////////    }
////////
////////    def intern() {
////////        def currentUser = springSecurityService.currentUser
////////        def intern = Intern.findByUser(currentUser)
////////
////////        if (!intern) {
////////            flash.error = "Intern profile not found"
////////            redirect(controller: 'logout')
////////            return
////////        }
////////
////////        def taskStats = taskService.getTaskStatistics(intern)
////////        def reportStats = reportService.getReportStatistics(intern)
////////        def evalStats = evaluationService.getEvaluationStatistics(intern)
////////        def upcomingTasks = taskService.getUpcomingTasks(intern)
////////        def recentReports = WeeklyReport.findAllByIntern(intern, [max: 5, sort: 'reportDate', order: 'desc'])
////////
////////        render(view: 'intern', model: [
////////                intern: intern,
////////                taskStats: taskStats,
////////                reportStats: reportStats,
////////                evalStats: evalStats,
////////                upcomingTasks: upcomingTasks,
////////                recentReports: recentReports,
////////                remainingDays: intern.remainingDays
////////        ])
////////    }
////////
////////    def supervisor() {
////////        def currentUser = springSecurityService.currentUser
////////        def supervisor = Supervisor.findByUser(currentUser)
////////
////////        if (!supervisor) {
////////            flash.error = "Supervisor profile not found"
////////            redirect(controller: 'logout')
////////            return
////////        }
////////
////////        def interns = Intern.findAllBySupervisor(supervisor)
////////        def pendingReports = reportService.getPendingReports(supervisor)
////////        def tasks = taskService.getTasksBySupervisor(supervisor, [max: 10])
////////
////////        def internStats = interns.collect { intern ->
////////            [
////////                    intern: intern,
////////                    taskStats: taskService.getTaskStatistics(intern),
////////                    reportStats: reportService.getReportStatistics(intern)
////////            ]
////////        }
////////
////////        render(view: 'supervisor', model: [
////////                supervisor: supervisor,
////////                interns: interns,
////////                pendingReports: pendingReports,
////////                tasks: tasks,
////////                internStats: internStats,
////////                currentInternCount: supervisor.currentInternCount,
////////                maxInterns: supervisor.maxInterns
////////        ])
////////    }
////////
////////    def admin() {
////////        def totalInterns = Intern.count()
////////        def activeInterns = Intern.countByStatus('ACTIVE')
////////        def totalSupervisors = Supervisor.count()
////////        def totalUsers = User.count()
////////        def pendingReports = WeeklyReport.countByStatus('SUBMITTED')
////////        def overdueTasks = Task.countByStatus('OVERDUE')
////////
////////        def recentUsers = User.list(max: 5, sort: 'dateCreated', order: 'desc')
////////        def recentInterns = Intern.list(max: 5, sort: 'dateCreated', order: 'desc')
////////
////////        render(view: 'admin', model: [
////////                totalInterns: totalInterns,
////////                activeInterns: activeInterns,
////////                totalSupervisors: totalSupervisors,
////////                totalUsers: totalUsers,
////////                pendingReports: pendingReports,
////////                overdueTasks: overdueTasks,
////////                recentUsers: recentUsers,
////////                recentInterns: recentInterns
////////        ])
////////    }
////////
////////    def apiStats() {
////////        def role = getCurrentUserRole()
////////        def stats = [:]
////////
////////        switch(role) {
////////            case 'ROLE_INTERN':
////////                def currentUser = springSecurityService.currentUser
////////                def intern = Intern.findByUser(currentUser)
////////                if (intern) {
////////                    stats = [
////////                            taskStats: taskService.getTaskStatistics(intern),
////////                            reportStats: reportService.getReportStatistics(intern)
////////                    ]
////////                }
////////                break
////////            case 'ROLE_SUPERVISOR':
////////                def currentUser = springSecurityService.currentUser
////////                def supervisor = Supervisor.findByUser(currentUser)
////////                if (supervisor) {
////////                    stats = [
////////                            internCount: supervisor.currentInternCount,
////////                            pendingReports: reportService.getPendingReports(supervisor).size(),
////////                            maxInterns: supervisor.maxInterns
////////                    ]
////////                }
////////                break
////////            case 'ROLE_ADMIN':
////////                stats = [
////////                        totalUsers: User.count(),
////////                        totalInterns: Intern.count(),
////////                        totalSupervisors: Supervisor.count(),
////////                        activeInterns: Intern.countByStatus('ACTIVE')
////////                ]
////////                break
////////        }
////////
////////        render stats as JSON
////////    }
////////
////////    private String getCurrentUserRole() {
////////        def authorities = springSecurityService.authentication?.authorities
////////        return authorities?.find()?.authority
////////    }
////////}
//////package interntrack
//////
//////import grails.plugin.springsecurity.annotation.Secured
//////
//////class DashboardController {
//////
//////    @Secured('ROLE_ADMIN')
//////    def admin() {
//////        render view: '/dashboard/admin'
//////    }
//////
//////    @Secured('ROLE_SUPERVISOR')
//////    def supervisor() {
//////        render view: '/dashboard/supervisor'
//////    }
//////
//////    @Secured('ROLE_INTERN')
//////    def intern() {
//////        render view: '/dashboard/intern'
//////    }
//////}
////package interntrack
////
////import grails.plugin.springsecurity.annotation.Secured
////import java.util.Calendar
////class DashboardController {
////
////    @Secured('ROLE_ADMIN')
////    def admin() {
////        println "Rendering admin dashboard"
////
////        // بيانات عينة للمسؤول
////        def model = [
////                totalUsers: 25,
////                totalInterns: 15,
////                activeInterns: 10,
////                totalSupervisors: 5,
////                pendingReports: 3,
////                overdueTasks: 2,
////                recentUsers: [],
////                recentInterns: []
////        ]
////
////        render view: '/dashboard/admin', model: model
////    }
////
////    @Secured('ROLE_SUPERVISOR')
////    def supervisor() {
////        println "Rendering supervisor dashboard"
////
////        // بيانات عينة للمشرف
////        def model = [
////                supervisor: [user: [fullName: 'Ahmed Mohammed']],
////                currentInternCount: 3,
////                maxInterns: 5,
////                pendingReports: [],
////                tasks: [],
////                interns: [],
////                internStats: []
////        ]
////
////        render view: '/dashboard/supervisor', model: model
////    }
////
//////    @Secured('ROLE_INTERN')
//////    def intern() {
//////        println "Rendering intern dashboard"
//////        def cal = Calendar.getInstance()
//////        cal.time = new Date()
//////        cal.add(Calendar.DAY_OF_YEAR, 60)
//////
//////        // بيانات عينة للمتدرب
//////        def model = [
//////                intern: [
//////                        user: [fullName: 'Mohammed Hassan'],
//////                        university: 'King Saud University',
//////                        major: 'Computer Science',
//////                        studentId: '20231001',
//////                        supervisor: [user: [fullName: 'Ahmed Mohammed']],
//////                        startDate: new Date(),
//////                        endDate: cal.time,
//////                        status: 'ACTIVE'
//////                ],
//////                remainingDays: 45,
//////                taskStats: [total: 10, completionRate: 70, completed: 7, pending: 2, inProgress: 1, overdue: 0],
//////                reportStats: [total: 5, approved: 4, totalHours: 200, avgHours: 40],
//////                evalStats: [averageScore: 85],
//////                upcomingTasks: [],
//////                recentReports: []
//////        ]
//////
//////        render view: '/dashboard/intern', model: model
//////    }
////    @Secured('ROLE_INTERN')
////    def intern() {
////        println "Rendering intern dashboard"
////
////        // إنشاء تاريخ النهاية يدوياً
////        Calendar cal = Calendar.getInstance()
////        cal.time = new Date()
////        cal.add(Calendar.DAY_OF_YEAR, 60)
////        Date endDate = cal.time
////
////        println "Start Date: ${new Date()}"
////        println "End Date: ${endDate}"
////
////        // بيانات عينة للمتدرب
////        def model = [
////                intern: [
////                        user: [fullName: 'Mohammed Hassan'],
////                        university: 'King Saud University',
////                        major: 'Computer Science',
////                        studentId: '20231001',
////                        supervisor: [user: [fullName: 'Ahmed Mohammed']],
////                        startDate: new Date(),
////                        endDate: endDate,  // استخدام المتغير الذي أنشأناه
////                        status: 'ACTIVE'
////                ],
////                remainingDays: 45,
////                taskStats: [total: 10, completionRate: 70, completed: 7, pending: 2, inProgress: 1, overdue: 0],
////                reportStats: [total: 5, approved: 4, totalHours: 200, avgHours: 40],
////                evalStats: [averageScore: 85],
////                upcomingTasks: [],
////                recentReports: []
////        ]
////
////        render view: '/dashboard/intern', model: model
////    }
////}
////package interntrack
////
////import grails.plugin.springsecurity.annotation.Secured
////
////class DashboardController {
////
////    @Secured('ROLE_ADMIN')
////    def admin() {
////        println "Rendering admin dashboard"
////        def user = springSecurityService.currentUser
////        println "Admin user: ${user?.username}"
////
////        def model = [
////                totalUsers: User.count(),
////                totalInterns: 15,
////                activeInterns: 10,
////                totalSupervisors: 5,
////                pendingReports: 3,
////                overdueTasks: 2,
////                recentUsers: User.list(max: 5, sort: 'dateCreated', order: 'desc'),
////                recentInterns: []
////        ]
////
////        render view: '/dashboard/admin', model: model
////    }
////
////    @Secured('ROLE_SUPERVISOR')
////    def supervisor() {
////        println "Rendering supervisor dashboard"
////
////        def model = [
////                supervisor: [user: [fullName: 'Ahmed Mohammed']],
////                currentInternCount: 3,
////                maxInterns: 5,
////                pendingReports: [],
////                tasks: [],
////                interns: [],
////                internStats: []
////        ]
////
////        render view: '/dashboard/supervisor', model: model
////    }
////
////    @Secured('ROLE_INTERN')
////    def intern() {
////        println "Rendering intern dashboard"
////
////        def cal = Calendar.getInstance()
////        cal.time = new Date()
////        cal.add(Calendar.DAY_OF_YEAR, 60)
////        Date endDate = cal.time
////
////        def model = [
////                intern: [
////                        user: [fullName: 'Mohammed Hassan'],
////                        university: 'King Saud University',
////                        major: 'Computer Science',
////                        studentId: '20231001',
////                        supervisor: [user: [fullName: 'Ahmed Mohammed']],
////                        startDate: new Date(),
////                        endDate: endDate,
////                        status: 'ACTIVE'
////                ],
////                remainingDays: 45,
////                taskStats: [total: 10, completionRate: 70, completed: 7, pending: 2, inProgress: 1, overdue: 0],
////                reportStats: [total: 5, approved: 4, totalHours: 200, avgHours: 40],
////                evalStats: [averageScore: 85],
////                upcomingTasks: [],
////                recentReports: []
////        ]
////
////        render view: '/dashboard/intern', model: model
////    }
////}
//
//// File: grails-app/controllers/interntrack/DashboardController.groovy
//package interntrack
//
//import grails.plugin.springsecurity.annotation.Secured
//import grails.plugin.springsecurity.SpringSecurityService
//import org.springframework.security.core.context.SecurityContextHolder
//
//class DashboardController {
//
//    SpringSecurityService springSecurityService
//
//    @Secured('ROLE_ADMIN')
//    def admin() {
//        println "=== Admin Dashboard ==="
//
//        try {
//            def totalUsers = User.count() ?: 0
//            def totalInterns = Intern.count() ?: 0
//            def activeInterns = Intern.countByStatus('ACTIVE') ?: 0
//            def totalSupervisors = Supervisor.count() ?: 0
//            def pendingReports = WeeklyReport.countByStatus('SUBMITTED') ?: 0
//            def overdueTasks = Task.countByStatus('OVERDUE') ?: 0
//
//            // بدون sort على dateCreated
//            def recentUsers = User.list(max: 5)
//            def recentInterns = Intern.list(max: 5)
//
//            def model = [
//                    totalUsers: totalUsers,
//                    totalInterns: totalInterns,
//                    activeInterns: activeInterns,
//                    totalSupervisors: totalSupervisors,
//                    pendingReports: pendingReports,
//                    overdueTasks: overdueTasks,
//                    recentUsers: recentUsers,
//                    recentInterns: recentInterns
//            ]
//
//            render(view: '/dashboard/admin', model: model)
//
//        } catch (Exception e) {
//            println "Error in admin dashboard: ${e.message}"
//            e.printStackTrace()
//            render(view: '/dashboard/admin', model: [
//                    totalUsers: 0, totalInterns: 0, activeInterns: 0,
//                    totalSupervisors: 0, pendingReports: 0, overdueTasks: 0,
//                    recentUsers: [], recentInterns: []
//            ])
//        }
//    }
//
//    @Secured('ROLE_SUPERVISOR')
//    def supervisor() {
//        println "=== Supervisor Dashboard ==="
//
//        try {
//            def username = SecurityContextHolder.context?.authentication?.name
//            def user = username ? User.findByUsername(username) : null
//            def supervisor = user ? Supervisor.findByUser(user) : null
//
//            def model = [:]
//
//            if (supervisor) {
//                def interns = Intern.findAllBySupervisor(supervisor) ?: []
//
//                model = [
//                        supervisor: supervisor,
//                        currentInternCount: interns.size(),
//                        maxInterns: supervisor.maxInterns ?: 5,
//                        pendingReports: interns ? WeeklyReport.findAllByInternInListAndStatus(interns, 'SUBMITTED') : [],
//                        tasks: Task.createCriteria().list(max: 10) {
//                            intern {
//                                eq('supervisor', supervisor)
//                            }
//                            order('dueDate', 'asc')
//                        } ?: [],
//                        interns: interns,
//                        internStats: interns.collect { intern ->
//                            [
//                                    intern: intern,
//                                    taskStats: getTaskStatistics(intern),
//                                    reportStats: getReportStatistics(intern)
//                            ]
//                        }
//                ]
//            } else {
//                model = [
//                        supervisor: [user: [fullName: username ?: 'Supervisor']],
//                        currentInternCount: 0,
//                        maxInterns: 5,
//                        pendingReports: [],
//                        tasks: [],
//                        interns: [],
//                        internStats: []
//                ]
//            }
//
//            render(view: '/dashboard/supervisor', model: model)
//
//        } catch (Exception e) {
//            println "Error in supervisor dashboard: ${e.message}"
//            render(view: '/dashboard/supervisor', model: [error: "Error loading dashboard"])
//        }
//    }
//
//    @Secured('ROLE_INTERN')
//    def intern() {
//        println "=== Intern Dashboard ==="
//
//        try {
//            def username = SecurityContextHolder.context?.authentication?.name
//            def user = username ? User.findByUsername(username) : null
//            def intern = user ? Intern.findByUser(user) : null
//
//            def model = [:]
//
//            if (intern) {
//                def endDate = intern.endDate ?: (new Date() + 60)
//                def remainingDays = endDate ? (endDate - new Date()).intValue() : 60
//
//                model = [
//                        intern: intern,
//                        remainingDays: remainingDays,
//                        taskStats: getTaskStatistics(intern),
//                        reportStats: getReportStatistics(intern),
//                        evalStats: getEvaluationStatistics(intern),
//                        upcomingTasks: Task.findAllByInternAndStatusInList(intern, ['PENDING', 'IN_PROGRESS'],
//                                [max: 5, sort: 'dueDate', order: 'asc']) ?: [],
//                        recentReports: WeeklyReport.findAllByIntern(intern,
//                                [max: 5, sort: 'reportDate', order: 'desc']) ?: []
//                ]
//            } else {
//                def endDate = new Date() + 60
//                model = [
//                        intern: [
//                                user: [fullName: username ?: 'Intern'],
//                                university: 'Not Assigned',
//                                major: 'Not Assigned',
//                                studentId: 'N/A',
//                                supervisor: [user: [fullName: 'Not Assigned']],
//                                startDate: new Date(),
//                                endDate: endDate,
//                                status: 'ACTIVE'
//                        ],
//                        remainingDays: 60,
//                        taskStats: [total: 0, completionRate: 0, completed: 0, pending: 0, inProgress: 0, overdue: 0],
//                        reportStats: [total: 0, approved: 0, totalHours: 0, avgHours: 0],
//                        evalStats: [totalEvaluations: 0, averageScore: 0],
//                        upcomingTasks: [],
//                        recentReports: []
//                ]
//            }
//
//            render(view: '/dashboard/intern', model: model)
//
//        } catch (Exception e) {
//            println "Error in intern dashboard: ${e.message}"
//            render(view: '/dashboard/intern', model: [error: "Error loading dashboard"])
//        }
//    }
//
//    // دوال مساعدة بدون تغيير
//    private Map getTaskStatistics(Intern intern) {
//        if (!intern) return [total: 0, completed: 0, pending: 0, inProgress: 0, overdue: 0, completionRate: 0]
//
//        try {
//            def total = Task.countByIntern(intern)
//            def completed = Task.countByInternAndStatus(intern, 'COMPLETED')
//            def pending = Task.countByInternAndStatus(intern, 'PENDING')
//            def inProgress = Task.countByInternAndStatus(intern, 'IN_PROGRESS')
//            def overdue = Task.countByInternAndStatus(intern, 'OVERDUE')
//            def completionRate = total > 0 ? Math.round((completed / total * 100)) : 0
//
//            return [
//                    total: total,
//                    completed: completed,
//                    pending: pending,
//                    inProgress: inProgress,
//                    overdue: overdue,
//                    completionRate: completionRate
//            ]
//        } catch (Exception e) {
//            return [total: 0, completed: 0, pending: 0, inProgress: 0, overdue: 0, completionRate: 0]
//        }
//    }
//
//    private Map getReportStatistics(Intern intern) {
//        if (!intern) return [total: 0, approved: 0, totalHours: 0, avgHours: 0]
//
//        try {
//            def total = WeeklyReport.countByIntern(intern)
//            def approved = WeeklyReport.countByInternAndStatus(intern, 'APPROVED')
//            def totalHours = 0
//            try {
//                totalHours = WeeklyReport.executeQuery(
//                        "SELECT COALESCE(SUM(hoursWorked), 0) FROM WeeklyReport WHERE intern = :intern",
//                        [intern: intern]
//                )[0] ?: 0
//            } catch (Exception e) {}
//            def avgHours = total > 0 ? Math.round(totalHours / total) : 0
//
//            return [
//                    total: total,
//                    approved: approved,
//                    totalHours: totalHours,
//                    avgHours: avgHours
//            ]
//        } catch (Exception e) {
//            return [total: 0, approved: 0, totalHours: 0, avgHours: 0]
//        }
//    }
//
//    private Map getEvaluationStatistics(Intern intern) {
//        if (!intern) return [totalEvaluations: 0, averageScore: 0]
//
//        try {
//            def evaluations = Evaluation.findAllByIntern(intern)
//            def averageScore = evaluations ? Math.round(evaluations*.overallScore.sum() / evaluations.size()) : 0
//            return [totalEvaluations: evaluations.size(), averageScore: averageScore]
//        } catch (Exception e) {
//            return [totalEvaluations: 0, averageScore: 0]
//        }
//    }
//}
// File: grails-app/controllers/interntrack/DashboardController.groovy
package interntrack

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.core.context.SecurityContextHolder

class DashboardController {

    SpringSecurityService springSecurityService

//    @Secured(['ROLE_ADMIN', 'ROLE_SUPERVISOR', 'ROLE_INTERN'])
//    def index() {
//        def user = springSecurityService.currentUser
//        def roles = user.authorities*.authority
//
//        println "Dashboard index - User: ${user?.username}, Roles: ${roles}"
//
//        if (roles.contains('ROLE_ADMIN')) {
//            redirect(action: 'admin')
//        } else if (roles.contains('ROLE_SUPERVISOR')) {
//            redirect(action: 'supervisor')
//        } else {
//            redirect(action: 'intern')
//        }
//    }
    @Secured(['ROLE_ADMIN', 'ROLE_SUPERVISOR', 'ROLE_INTERN'])
    def index() {
        def user = springSecurityService.currentUser
        def roles = user.authorities*.authority

        if (roles.contains('ROLE_ADMIN')) {
            redirect(action: 'admin')
        } else if (roles.contains('ROLE_SUPERVISOR')) {
            redirect(action: 'supervisor')
        } else {
            redirect(action: 'intern')
        }
    }
//    @Secured('ROLE_ADMIN')
    def admin() {
        println "=== Admin Dashboard ==="

        try {
            def totalUsers = User.count() ?: 0
            def totalInterns = Intern.count() ?: 0
            def activeInterns = Intern.countByStatus('ACTIVE') ?: 0
            def totalSupervisors = Supervisor.count() ?: 0
            def pendingReports = WeeklyReport.countByStatus('SUBMITTED') ?: 0
            def overdueTasks = Task.countByStatus('OVERDUE') ?: 0

            def recentUsers = User.list(max: 5)
            def recentInterns = Intern.list(max: 5)

            def model = [
                    totalUsers: totalUsers,
                    totalInterns: totalInterns,
                    activeInterns: activeInterns,
                    totalSupervisors: totalSupervisors,
                    pendingReports: pendingReports,
                    overdueTasks: overdueTasks,
                    recentUsers: recentUsers,
                    recentInterns: recentInterns
            ]

            render(view: '/dashboard/admin', model: model)

        } catch (Exception e) {
            println "Error in admin dashboard: ${e.message}"
            e.printStackTrace()
            render(view: '/dashboard/admin', model: [
                    totalUsers: 0, totalInterns: 0, activeInterns: 0,
                    totalSupervisors: 0, pendingReports: 0, overdueTasks: 0,
                    recentUsers: [], recentInterns: []
            ])
        }
    }

//    @Secured('ROLE_SUPERVISOR')
    def supervisor() {
        println "=== Supervisor Dashboard ==="

        try {
//            def username = SecurityContextHolder.context?.authentication?.name
//            def user = username ? User.findByUsername(username) : null
//            def supervisor = user ? Supervisor.findByUser(user) : null
             def user = springSecurityService.currentUser
             def supervisor = Supervisor.findByUser(user)


            def model = [:]

            if (supervisor) {
                def interns = Intern.findAllBySupervisor(supervisor) ?: []

                model = [
                        supervisor: supervisor,
                        currentInternCount: interns.size(),
                        maxInterns: supervisor.maxInterns ?: 5,
                        pendingReports: interns ? WeeklyReport.findAllByInternInListAndStatus(interns, 'SUBMITTED') : [],
                        tasks: Task.createCriteria().list(max: 10) {
                            intern {
                                eq('supervisor', supervisor)
                            }
                            order('dueDate', 'asc')
                        } ?: [],
                        interns: interns,
                        internStats: interns.collect { intern ->
                            [
                                    intern: intern,
                                    taskStats: getTaskStatistics(intern),
                                    reportStats: getReportStatistics(intern)
                            ]
                        }
                ]
            } else {
                model = [
                        supervisor: [user: [fullName: username ?: 'Supervisor']],
                        currentInternCount: 0,
                        maxInterns: 5,
                        pendingReports: [],
                        tasks: [],
                        interns: [],
                        internStats: []
                ]
            }

            render(view: '/dashboard/supervisor', model: model)

        } catch (Exception e) {
            println "Error in supervisor dashboard: ${e.message}"
            render(view: '/dashboard/supervisor', model: [error: "Error loading dashboard"])
        }
    }

//    @Secured('ROLE_INTERN')
    def intern() {
        println "=== Intern Dashboard ==="

        try {
//            def username = SecurityContextHolder.context?.authentication?.name
//            def user = username ? User.findByUsername(username) : null
//            def intern = user ? Intern.findByUser(user) : null
            def user = springSecurityService.currentUser
            def intern = Intern.findByUser(user)


            def model = [:]

            if (intern) {
                def endDate = intern.endDate ?: (new Date() + 60)
                def remainingDays = endDate ? (endDate - new Date()).intValue() : 60

                model = [
                        intern: intern,
                        remainingDays: remainingDays,
                        taskStats: getTaskStatistics(intern),
                        reportStats: getReportStatistics(intern),
                        evalStats: getEvaluationStatistics(intern),
                        upcomingTasks: Task.findAllByInternAndStatusInList(intern, ['PENDING', 'IN_PROGRESS'],
                                [max: 5, sort: 'dueDate', order: 'asc']) ?: [],
                        recentReports: WeeklyReport.findAllByIntern(intern,
                                [max: 5, sort: 'reportDate', order: 'desc']) ?: []
                ]
            } else {
                def endDate = new Date() + 60
                model = [
                        intern: [
                                user: [fullName: username ?: 'Intern'],
                                university: 'Not Assigned',
                                major: 'Not Assigned',
                                studentId: 'N/A',
                                supervisor: [user: [fullName: 'Not Assigned']],
                                startDate: new Date(),
                                endDate: endDate,
                                status: 'ACTIVE'
                        ],
                        remainingDays: 60,
                        taskStats: [total: 0, completionRate: 0, completed: 0, pending: 0, inProgress: 0, overdue: 0],
                        reportStats: [total: 0, approved: 0, totalHours: 0, avgHours: 0],
                        evalStats: [totalEvaluations: 0, averageScore: 0],
                        upcomingTasks: [],
                        recentReports: []
                ]
            }

            render(view: '/dashboard/intern', model: model)

        } catch (Exception e) {
            println "Error in intern dashboard: ${e.message}"
            render(view: '/dashboard/intern', model: [error: "Error loading dashboard"])
        }
    }

    // دوال مساعدة بدون تغيير
    private Map getTaskStatistics(Intern intern) {
        if (!intern) return [total: 0, completed: 0, pending: 0, inProgress: 0, overdue: 0, completionRate: 0]
        try {
            def total = Task.countByIntern(intern)
            def completed = Task.countByInternAndStatus(intern, 'COMPLETED')
            def pending = Task.countByInternAndStatus(intern, 'PENDING')
            def inProgress = Task.countByInternAndStatus(intern, 'IN_PROGRESS')
            def overdue = Task.countByInternAndStatus(intern, 'OVERDUE')
            def completionRate = total > 0 ? Math.round((completed / total * 100)) : 0
            return [total: total, completed: completed, pending: pending, inProgress: inProgress, overdue: overdue, completionRate: completionRate]
        } catch (Exception e) {
            return [total: 0, completed: 0, pending: 0, inProgress: 0, overdue: 0, completionRate: 0]
        }
    }

    private Map getReportStatistics(Intern intern) {
        if (!intern) return [total: 0, approved: 0, totalHours: 0, avgHours: 0]
        try {
            def total = WeeklyReport.countByIntern(intern)
            def approved = WeeklyReport.countByInternAndStatus(intern, 'APPROVED')
            def totalHours = 0
            try {
                totalHours = WeeklyReport.executeQuery(
                        "SELECT COALESCE(SUM(hoursWorked), 0) FROM WeeklyReport WHERE intern = :intern",
                        [intern: intern]
                )[0] ?: 0
            } catch (Exception e) {}
            def avgHours = total > 0 ? Math.round(totalHours / total) : 0
            return [total: total, approved: approved, totalHours: totalHours, avgHours: avgHours]
        } catch (Exception e) {
            return [total: 0, approved: 0, totalHours: 0, avgHours: 0]
        }
    }

    private Map getEvaluationStatistics(Intern intern) {
        if (!intern) return [totalEvaluations: 0, averageScore: 0]
        try {
            def evaluations = Evaluation.findAllByIntern(intern)
            def averageScore = evaluations ? Math.round(evaluations*.overallScore.sum() / evaluations.size()) : 0
            return [totalEvaluations: evaluations.size(), averageScore: averageScore]
        } catch (Exception e) {
            return [totalEvaluations: 0, averageScore: 0]
        }
    }
}