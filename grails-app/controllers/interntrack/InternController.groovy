// File: grails-app/controllers/intern/track/InternController.groovy
package interntrack
import interntrack.TaskService
import interntrack.ReportService
import interntrack.EvaluationService

import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.JSON

class InternController {

    SpringSecurityService springSecurityService
    TaskService taskService
    ReportService reportService
    EvaluationService evaluationService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()

        def internList = []

        switch(role) {
            case 'ROLE_SUPERVISOR':
                def supervisor = Supervisor.findByUser(currentUser)
                if (supervisor) {
                    internList = Intern.findAllBySupervisor(supervisor, [sort: 'startDate', order: 'desc'])
                }
                break
            case 'ROLE_ADMIN':
                internList = Intern.list([sort: 'startDate', order: 'desc'])
                break
            default:
                flash.error = "Access denied"
                redirect(controller: 'dashboard', action: 'index')
                return
        }

        render(view: 'index', model: [
                internList: internList,
                statusList: ['ACTIVE', 'COMPLETED', 'TERMINATED']
        ])
    }

    def show(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            flash.error = "Intern not found"
            redirect(action: 'index')
            return
        }

        if (!hasAccessToIntern(intern)) {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        def taskStats = taskService.getTaskStatistics(intern)
        def reportStats = reportService.getReportStatistics(intern)
        def evalStats = evaluationService.getEvaluationStatistics(intern)
        def recentTasks = Task.findAllByIntern(intern, [max: 5, sort: 'dueDate', order: 'asc'])
        def recentReports = WeeklyReport.findAllByIntern(intern, [max: 5, sort: 'reportDate', order: 'desc'])
        def evaluations = Evaluation.findAllByIntern(intern, [max: 5, sort: 'evaluationDate', order: 'desc'])

        render(view: 'show', model: [
                intern: intern,
                taskStats: taskStats,
                reportStats: reportStats,
                evalStats: evalStats,
                recentTasks: recentTasks,
                recentReports: recentReports,
                evaluations: evaluations,
                performanceReport: evaluationService.generatePerformanceReport(intern)
        ])
    }

    def create() {
        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()

        if (role != 'ROLE_ADMIN') {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        def users = User.list()
        def supervisors = Supervisor.list()

        render(view: 'create', model: [
                intern: new Intern(),
                users: users,
                supervisors: supervisors,
                statusList: ['ACTIVE', 'COMPLETED', 'TERMINATED'],
                yearOfStudyList: ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate']
        ])
    }

    def save() {
        try {
            def currentUser = springSecurityService.currentUser
            def role = getCurrentUserRole()

            if (role != 'ROLE_ADMIN') {
                flash.error = "Access denied"
                redirect(action: 'index')
                return
            }

            def intern = new Intern(params)

            if (!intern.save(flush: true)) {
                throw new RuntimeException("Failed to save intern: ${intern.errors}")
            }

            flash.message = "Intern created successfully"
            redirect(action: 'show', id: intern.id)

        } catch (Exception e) {
            flash.error = "Error creating intern: ${e.message}"
            redirect(action: 'create')
        }
    }

    def edit(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            flash.error = "Intern not found"
            redirect(action: 'index')
            return
        }

        if (!hasAccessToIntern(intern)) {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        def users = User.list()
        def supervisors = Supervisor.list()

        render(view: 'edit', model: [
                intern: intern,
                users: users,
                supervisors: supervisors,
                statusList: ['ACTIVE', 'COMPLETED', 'TERMINATED'],
                yearOfStudyList: ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate']
        ])
    }

    def update(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            flash.error = "Intern not found"
            redirect(action: 'index')
            return
        }

        if (!hasAccessToIntern(intern)) {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        try {
            intern.properties = params

            if (!intern.save(flush: true)) {
                throw new RuntimeException("Failed to update intern: ${intern.errors}")
            }

            flash.message = "Intern updated successfully"
            redirect(action: 'show', id: intern.id)

        } catch (Exception e) {
            flash.error = "Error updating intern: ${e.message}"
            redirect(action: 'edit', id: id)
        }
    }

    def delete(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            flash.error = "Intern not found"
            redirect(action: 'index')
            return
        }

        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()

        if (role != 'ROLE_ADMIN') {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        try {
            intern.delete(flush: true)
            flash.message = "Intern deleted successfully"

        } catch (Exception e) {
            flash.error = "Error deleting intern: ${e.message}"
        }

        redirect(action: 'index')
    }

    def assignSupervisor() {
        try {
            def intern = Intern.get(params.internId)
            def supervisor = Supervisor.get(params.supervisorId)

            if (!intern || !supervisor) {
                render([success: false, message: 'Intern or Supervisor not found'] as JSON)
                return
            }

            if (!hasAccessToIntern(intern)) {
                render([success: false, message: 'Access denied'] as JSON)
                return
            }

            intern.supervisor = supervisor

            if (!intern.save(flush: true)) {
                render([success: false, message: 'Failed to assign supervisor'] as JSON)
                return
            }

            render([success: true, intern: intern] as JSON)

        } catch (Exception e) {
            render([success: false, message: e.message] as JSON)
        }
    }

    def updateStatus() {
        try {
            def intern = Intern.get(params.id)

            if (!intern) {
                render([success: false, message: 'Intern not found'] as JSON)
                return
            }

            if (!hasAccessToIntern(intern)) {
                render([success: false, message: 'Access denied'] as JSON)
                return
            }

            intern.status = params.status

            if (!intern.save(flush: true)) {
                render([success: false, message: 'Failed to update status'] as JSON)
                return
            }

            render([success: true, intern: intern] as JSON)

        } catch (Exception e) {
            render([success: false, message: e.message] as JSON)
        }
    }

    // API endpoints
    def apiInterns() {
        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()

        def interns = []

        switch(role) {
            case 'ROLE_SUPERVISOR':
                def supervisor = Supervisor.findByUser(currentUser)
                if (supervisor) {
                    interns = Intern.findAllBySupervisor(supervisor)
                }
                break
            case 'ROLE_ADMIN':
                interns = Intern.list(params)
                break
        }

        render interns as JSON
    }

    def apiPerformanceReport(Long id) {
        def intern = Intern.get(id)

        if (!intern) {
            render([error: 'Intern not found'] as JSON)
            return
        }

        if (!hasAccessToIntern(intern)) {
            render([error: 'Access denied'] as JSON)
            return
        }

        def report = evaluationService.generatePerformanceReport(intern)
        render report as JSON
    }

    private boolean hasAccessToIntern(Intern intern) {
        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()

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

    private String getCurrentUserRole() {
        def authorities = springSecurityService.authentication.authorities
        return authorities?.find()?.authority
    }
}