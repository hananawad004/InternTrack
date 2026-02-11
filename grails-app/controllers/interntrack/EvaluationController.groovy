// File: grails-app/controllers/intern/track/EvaluationController.groovy
package interntrack

import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.JSON
import interntrack.EvaluationService
import interntrack.NotificationService
class EvaluationController {

    SpringSecurityService springSecurityService
    EvaluationService evaluationService
    NotificationService notificationService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()

        def evaluationList = []

        switch(role) {
            case 'ROLE_SUPERVISOR':
                def supervisor = Supervisor.findByUser(currentUser)
                if (supervisor) {
                    def interns = Intern.findAllBySupervisor(supervisor)
                    evaluationList = Evaluation.createCriteria().list {
                        intern {
                            inList('id', interns*.id)
                        }
                        order('evaluationDate', 'desc')
                    }
                }
                break
            case 'ROLE_ADMIN':
                evaluationList = Evaluation.list([sort: 'evaluationDate', order: 'desc'])
                break
            default:
                flash.error = "Access denied"
                redirect(controller: 'dashboard', action: 'index')
                return
        }

        render(view: 'index', model: [evaluationList: evaluationList])
    }

    def show(Long id) {
        def evaluation = Evaluation.get(id)

        if (!evaluation) {
            flash.error = "Evaluation not found"
            redirect(action: 'index')
            return
        }

        if (!hasAccessToEvaluation(evaluation)) {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        render(view: 'show', model: [evaluation: evaluation])
    }

    def create() {
        def currentUser = springSecurityService.currentUser
        def supervisor = Supervisor.findByUser(currentUser)

        if (!supervisor) {
            flash.error = "Supervisor profile not found"
            redirect(action: 'index')
            return
        }

        def interns = Intern.findAllBySupervisor(supervisor)

        render(view: 'create', model: [
                evaluation: new Evaluation(),
                interns: interns,
                evaluatorName: supervisor.user.fullName
        ])
    }

    def save() {
        try {
            def currentUser = springSecurityService.currentUser
            def supervisor = Supervisor.findByUser(currentUser)

            if (!supervisor) {
                flash.error = "Supervisor profile not found"
                redirect(action: 'create')
                return
            }

            def intern = Intern.get(params.internId)

            if (!intern) {
                flash.error = "Intern not found"
                redirect(action: 'create')
                return
            }

            if (intern.supervisor != supervisor) {
                flash.error = "Access denied"
                redirect(action: 'create')
                return
            }

            def evaluation = evaluationService.createEvaluation(params, intern, supervisor.user.fullName)

            // Send notification
            notificationService.sendEvaluationNotification(evaluation)

            flash.message = "Evaluation created successfully"
            redirect(action: 'show', id: evaluation.id)

        } catch (Exception e) {
            flash.error = "Error creating evaluation: ${e.message}"
            redirect(action: 'create')
        }
    }

    def edit(Long id) {
        def evaluation = Evaluation.get(id)

        if (!evaluation) {
            flash.error = "Evaluation not found"
            redirect(action: 'index')
            return
        }

        if (!hasAccessToEvaluation(evaluation)) {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        def currentUser = springSecurityService.currentUser
        def supervisor = Supervisor.findByUser(currentUser)
        def interns = Intern.findAllBySupervisor(supervisor)

        render(view: 'edit', model: [
                evaluation: evaluation,
                interns: interns
        ])
    }

    def update(Long id) {
        def evaluation = Evaluation.get(id)

        if (!evaluation) {
            flash.error = "Evaluation not found"
            redirect(action: 'index')
            return
        }

        if (!hasAccessToEvaluation(evaluation)) {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        try {
            evaluation.properties = params

            if (!evaluation.save(flush: true)) {
                throw new RuntimeException("Failed to update evaluation: ${evaluation.errors}")
            }

            flash.message = "Evaluation updated successfully"
            redirect(action: 'show', id: evaluation.id)

        } catch (Exception e) {
            flash.error = "Error updating evaluation: ${e.message}"
            redirect(action: 'edit', id: id)
        }
    }

    def delete(Long id) {
        def evaluation = Evaluation.get(id)

        if (!evaluation) {
            flash.error = "Evaluation not found"
            redirect(action: 'index')
            return
        }

        if (!hasAccessToEvaluation(evaluation)) {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        try {
            evaluation.delete(flush: true)
            flash.message = "Evaluation deleted successfully"

        } catch (Exception e) {
            flash.error = "Error deleting evaluation: ${e.message}"
        }

        redirect(action: 'index')
    }

    def internEvaluations(Long internId) {
        def intern = Intern.get(internId)

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

        def evaluations = Evaluation.findAllByIntern(intern, [sort: 'evaluationDate', order: 'desc'])
        def evalStats = evaluationService.getEvaluationStatistics(intern)

        render(view: 'internEvaluations', model: [
                intern: intern,
                evaluations: evaluations,
                evalStats: evalStats
        ])
    }

    // API endpoints
    def apiEvaluations() {
        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()

        def evaluations = []

        switch(role) {
            case 'ROLE_SUPERVISOR':
                def supervisor = Supervisor.findByUser(currentUser)
                if (supervisor) {
                    def interns = Intern.findAllBySupervisor(supervisor)
                    evaluations = Evaluation.createCriteria().list {
                        intern {
                            inList('id', interns*.id)
                        }
                    }
                }
                break
            case 'ROLE_ADMIN':
                evaluations = Evaluation.list(params)
                break
        }

        render evaluations as JSON
    }

    private boolean hasAccessToEvaluation(Evaluation evaluation) {
        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()

        switch(role) {
            case 'ROLE_ADMIN':
                return true
            case 'ROLE_SUPERVISOR':
                def supervisor = Supervisor.findByUser(currentUser)
                return evaluation.intern.supervisor == supervisor
            default:
                return false
        }
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