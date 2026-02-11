package interntrack

import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.JSON
import grails.rest.RestfulController

import interntrack.TaskService
import interntrack.ReportService
import interntrack.EvaluationService
class ApiInternController extends RestfulController<Intern> {

    static responseFormats = ['json', 'xml']

    SpringSecurityService springSecurityService
    TaskService taskService
    ReportService reportService
    EvaluationService evaluationService

    ApiInternController() {
        super(Intern)
    }

    def index() {
        def currentUser = springSecurityService.currentUser
        def role = springSecurityService.getAuthentication().authorities*.authority[0]

        def internList = []

        switch (role) {
            case 'ROLE_ADMIN':
                internList = Intern.list(params)
                break
            case 'ROLE_SUPERVISOR':
                def supervisor = Supervisor.findByUser(currentUser)
                internList = Intern.findAllBySupervisor(supervisor, params)
                break
            default:
                respond([])
                return
        }

        respond(internList)
    }

    def show(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            respond([error: "Intern not found"], status: 404)
            return
        }

        if (!hasAccessToIntern(intern)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        def response = [
                intern         : intern,
                supervisor     : intern.supervisor,
                user           : intern.user,
                taskStats      : taskService.calculateTaskStats(intern),
                weeklyStats    : reportService.calculateWeeklyStats(intern),
                evaluationStats: evaluationService.getEvaluationStats(intern)
        ]

        respond(response)
    }
    def save() {
        def internData = request.JSON

        try {
            // Validate required fields
            if (!internData.userId) {
                respond([error: "User ID is required"], status: 400)
                return
            }

            def user = User.get(internData.userId)
            if (!user) {
                respond([error: "User not found"], status: 404)
                return
            }

            // Check if user already has an intern profile
            def existingIntern = Intern.findByUser(user)
            if (existingIntern) {
                respond([error: "User already has an intern profile"], status: 400)
                return
            }

            // Create intern
            def intern = new Intern(internData)
            intern.user = user

            if (intern.save()) {
                respond(intern, status: 201)
            } else {
                respond([error: intern.errors], status: 400)
            }

        } catch (Exception e) {
            respond([error: e.message], status: 500)
        }
    }

    def update(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            respond([error: "Intern not found"], status: 404)
            return
        }

        if (!hasAccessToIntern(intern)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        try {
            intern.properties = request.JSON

            if (intern.save()) {
                respond(intern)
            } else {
                respond([error: intern.errors], status: 400)
            }

        } catch (Exception e) {
            respond([error: e.message], status: 500)
        }
    }

    def delete(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            respond([error: "Intern not found"], status: 404)
            return
        }

        if (!hasAccessToIntern(intern)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        try {
            intern.delete()
            respond([message: "Intern deleted successfully"])
        } catch (Exception e) {
            respond([error: e.message], status: 500)
        }
    }

    def getTasks(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            respond([error: "Intern not found"], status: 404)
            return
        }

        if (!hasAccessToIntern(intern)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        def tasks = taskService.getTasksByIntern(intern, params)
        respond(tasks)
    }

    def getReports(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            respond([error: "Intern not found"], status: 404)
            return
        }

        if (!hasAccessToIntern(intern)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        def reports = WeeklyReport.findAllByIntern(intern, params)
        respond(reports)
    }

    def getEvaluations(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            respond([error: "Intern not found"], status: 404)
            return
        }

        if (!hasAccessToIntern(intern)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        def evaluations = Evaluation.findAllByIntern(intern, params)
        respond(evaluations)
    }

    def getPerformanceReport(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            respond([error: "Intern not found"], status: 404)
            return
        }

        if (!hasAccessToIntern(intern)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        def report = evaluationService.generatePerformanceReport(intern)
        respond(report)
    }

    private boolean hasAccessToIntern(Intern intern) {
        def currentUser = springSecurityService.currentUser
        def role = springSecurityService.getAuthentication().authorities*.authority[0]

        switch(role) {
            case 'ROLE_ADMIN':
                return true
            case 'ROLE_SUPERVISOR':
                def supervisor = Supervisor.findByUser(currentUser)
                return intern.supervisor == supervisor
            default:
                return false
        }
    }
}