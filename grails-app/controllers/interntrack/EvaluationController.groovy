//// File: grails-app/controllers/intern/track/EvaluationController.groovy
//package interntrack
//
//import grails.plugin.springsecurity.SpringSecurityService
//import grails.converters.JSON
//import interntrack.EvaluationService
//import interntrack.NotificationService
//class EvaluationController {
//
//    SpringSecurityService springSecurityService
//    EvaluationService evaluationService
//    NotificationService notificationService
//
//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
//
//    def index() {
//        def currentUser = springSecurityService.currentUser
//        def role = getCurrentUserRole()
//
//        def evaluationList = []
//
//        switch(role) {
//            case 'ROLE_SUPERVISOR':
//                def supervisor = Supervisor.findByUser(currentUser)
//                if (supervisor) {
//                    def interns = Intern.findAllBySupervisor(supervisor)
//                    evaluationList = Evaluation.createCriteria().list {
//                        intern {
//                            inList('id', interns*.id)
//                        }
//                        order('evaluationDate', 'desc')
//                    }
//                }
//                break
//            case 'ROLE_ADMIN':
//                evaluationList = Evaluation.list([sort: 'evaluationDate', order: 'desc'])
//                break
//            default:
//                flash.error = "Access denied"
//                redirect(controller: 'dashboard', action: 'index')
//                return
//        }
//
//        render(view: 'index', model: [evaluationList: evaluationList])
//    }
//
//    def show(Long id) {
//        def evaluation = Evaluation.get(id)
//
//        if (!evaluation) {
//            flash.error = "Evaluation not found"
//            redirect(action: 'index')
//            return
//        }
//
//        if (!hasAccessToEvaluation(evaluation)) {
//            flash.error = "Access denied"
//            redirect(action: 'index')
//            return
//        }
//
//        render(view: 'show', model: [evaluation: evaluation])
//    }
//
//    def create() {
//        def currentUser = springSecurityService.currentUser
//        def supervisor = Supervisor.findByUser(currentUser)
//
//        if (!supervisor) {
//            flash.error = "Supervisor profile not found"
//            redirect(action: 'index')
//            return
//        }
//
//        def interns = Intern.findAllBySupervisor(supervisor)
//
//        render(view: 'create', model: [
//                evaluation: new Evaluation(),
//                interns: interns,
//                evaluatorName: supervisor.user.fullName
//        ])
//    }
//
//    def save() {
//        try {
//            def currentUser = springSecurityService.currentUser
//            def supervisor = Supervisor.findByUser(currentUser)
//
//            if (!supervisor) {
//                flash.error = "Supervisor profile not found"
//                redirect(action: 'create')
//                return
//            }
//
//            def intern = Intern.get(params.internId)
//
//            if (!intern) {
//                flash.error = "Intern not found"
//                redirect(action: 'create')
//                return
//            }
//
//            if (intern.supervisor != supervisor) {
//                flash.error = "Access denied"
//                redirect(action: 'create')
//                return
//            }
//
//            def evaluation = evaluationService.createEvaluation(params, intern, supervisor.user.fullName)
//
//            // Send notification
//            notificationService.sendEvaluationNotification(evaluation)
//
//            flash.message = "Evaluation created successfully"
//            redirect(action: 'show', id: evaluation.id)
//
//        } catch (Exception e) {
//            flash.error = "Error creating evaluation: ${e.message}"
//            redirect(action: 'create')
//        }
//    }
//
//    def edit(Long id) {
//        def evaluation = Evaluation.get(id)
//
//        if (!evaluation) {
//            flash.error = "Evaluation not found"
//            redirect(action: 'index')
//            return
//        }
//
//        if (!hasAccessToEvaluation(evaluation)) {
//            flash.error = "Access denied"
//            redirect(action: 'index')
//            return
//        }
//
//        def currentUser = springSecurityService.currentUser
//        def supervisor = Supervisor.findByUser(currentUser)
//        def interns = Intern.findAllBySupervisor(supervisor)
//
//        render(view: 'edit', model: [
//                evaluation: evaluation,
//                interns: interns
//        ])
//    }
//
//    def update(Long id) {
//        def evaluation = Evaluation.get(id)
//
//        if (!evaluation) {
//            flash.error = "Evaluation not found"
//            redirect(action: 'index')
//            return
//        }
//
//        if (!hasAccessToEvaluation(evaluation)) {
//            flash.error = "Access denied"
//            redirect(action: 'index')
//            return
//        }
//
//        try {
//            evaluation.properties = params
//
//            if (!evaluation.save(flush: true)) {
//                throw new RuntimeException("Failed to update evaluation: ${evaluation.errors}")
//            }
//
//            flash.message = "Evaluation updated successfully"
//            redirect(action: 'show', id: evaluation.id)
//
//        } catch (Exception e) {
//            flash.error = "Error updating evaluation: ${e.message}"
//            redirect(action: 'edit', id: id)
//        }
//    }
//
//    def delete(Long id) {
//        def evaluation = Evaluation.get(id)
//
//        if (!evaluation) {
//            flash.error = "Evaluation not found"
//            redirect(action: 'index')
//            return
//        }
//
//        if (!hasAccessToEvaluation(evaluation)) {
//            flash.error = "Access denied"
//            redirect(action: 'index')
//            return
//        }
//
//        try {
//            evaluation.delete(flush: true)
//            flash.message = "Evaluation deleted successfully"
//
//        } catch (Exception e) {
//            flash.error = "Error deleting evaluation: ${e.message}"
//        }
//
//        redirect(action: 'index')
//    }
//
//    def internEvaluations(Long internId) {
//        def intern = Intern.get(internId)
//
//        if (!intern) {
//            flash.error = "Intern not found"
//            redirect(action: 'index')
//            return
//        }
//
//        if (!hasAccessToIntern(intern)) {
//            flash.error = "Access denied"
//            redirect(action: 'index')
//            return
//        }
//
//        def evaluations = Evaluation.findAllByIntern(intern, [sort: 'evaluationDate', order: 'desc'])
//        def evalStats = evaluationService.getEvaluationStatistics(intern)
//
//        render(view: 'internEvaluations', model: [
//                intern: intern,
//                evaluations: evaluations,
//                evalStats: evalStats
//        ])
//    }
//
//    // API endpoints
//    def apiEvaluations() {
//        def currentUser = springSecurityService.currentUser
//        def role = getCurrentUserRole()
//
//        def evaluations = []
//
//        switch(role) {
//            case 'ROLE_SUPERVISOR':
//                def supervisor = Supervisor.findByUser(currentUser)
//                if (supervisor) {
//                    def interns = Intern.findAllBySupervisor(supervisor)
//                    evaluations = Evaluation.createCriteria().list {
//                        intern {
//                            inList('id', interns*.id)
//                        }
//                    }
//                }
//                break
//            case 'ROLE_ADMIN':
//                evaluations = Evaluation.list(params)
//                break
//        }
//
//        render evaluations as JSON
//    }
//
//    private boolean hasAccessToEvaluation(Evaluation evaluation) {
//        def currentUser = springSecurityService.currentUser
//        def role = getCurrentUserRole()
//
//        switch(role) {
//            case 'ROLE_ADMIN':
//                return true
//            case 'ROLE_SUPERVISOR':
//                def supervisor = Supervisor.findByUser(currentUser)
//                return evaluation.intern.supervisor == supervisor
//            default:
//                return false
//        }
//    }
//
//    private boolean hasAccessToIntern(Intern intern) {
//        def currentUser = springSecurityService.currentUser
//        def role = getCurrentUserRole()
//
//        switch(role) {
//            case 'ROLE_ADMIN':
//                return true
//            case 'ROLE_SUPERVISOR':
//                def supervisor = Supervisor.findByUser(currentUser)
//                return intern.supervisor == supervisor
//            default:
//                return false
//        }
//    }
//
//    private String getCurrentUserRole() {
//        def authorities = springSecurityService.authentication.authorities
//        return authorities?.find()?.authority
//    }
//}
// File: grails-app/controllers/interntrack/EvaluationController.groovy
package interntrack

import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.JSON
import grails.gorm.transactions.Transactional
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
                    if (interns) {
                        evaluationList = Evaluation.createCriteria().list {
                            intern {
                                inList('id', interns*.id)
                            }
                            order('evaluationDate', 'desc')
                        }
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

        render(view: 'index', model: [
                evaluationList: evaluationList,
                role: role
        ])
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

        render(view: 'show', model: [
                evaluation: evaluation,
                role: getCurrentUserRole()
        ])
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

        println "Found ${interns.size()} interns for supervisor ${supervisor.user?.fullName}"

        if (!interns) {
            flash.warning = "You don't have any interns assigned yet"
        }

        Intern selectedIntern = null
        if (params.internId) {
            selectedIntern = Intern.get(params.long('internId'))
            if (selectedIntern && selectedIntern.supervisor?.id != supervisor.id) {
                selectedIntern = null
                flash.error = "Access denied - This intern is not under your supervision"
            }
        }

        Map reportStats = [:]
        if (selectedIntern) {
            reportStats = [
                    total: WeeklyReport.countByIntern(selectedIntern) ?: 0,
                    approved: WeeklyReport.countByInternAndStatus(selectedIntern, 'APPROVED') ?: 0
            ]
        }

        render(view: 'create', model: [
                evaluation: new Evaluation(),
                interns: interns,
                intern: selectedIntern,
                reportStats: reportStats,
                evaluatorName: supervisor.user?.fullName ?: 'Supervisor',
                evaluatorTitle: supervisor.position ?: 'Supervisor'
        ])
    }

    @Transactional
    def save() {
        try {
            def currentUser = springSecurityService.currentUser
            def supervisor = Supervisor.findByUser(currentUser)

            if (!supervisor) {
                flash.error = "Supervisor profile not found"
                redirect(action: 'create')
                return
            }

            def intern = Intern.get(params.long('internId'))

            if (!intern) {
                flash.error = "Intern not found"
                redirect(action: 'create')
                return
            }

            if (intern.supervisor?.id != supervisor.id) {
                flash.error = "Access denied - This intern is not under your supervision"
                redirect(action: 'create')
                return
            }

            println "Creating evaluation for intern: ${intern.user?.fullName}"
            println "Params: ${params}"

            def evaluation = evaluationService.createEvaluation(params, intern, supervisor.user?.fullName ?: 'Supervisor')

            try {
                notificationService?.sendEvaluationNotification(evaluation)
            } catch (Exception e) {
                println "Error sending notification: ${e.message}"
            }

            flash.message = "Evaluation created successfully for ${intern.user?.fullName}"
            redirect(action: 'show', id: evaluation.id)

        } catch (IllegalArgumentException e) {
            println "IllegalArgumentException: ${e.message}"
            flash.error = e.message
            redirect(action: 'create', params: [internId: params.internId])
        } catch (Exception e) {
            println "Error creating evaluation: ${e.message}"
            e.printStackTrace()
            flash.error = "Error creating evaluation: ${e.message}"
            redirect(action: 'create', params: [internId: params.internId])
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
                interns: interns,
                role: getCurrentUserRole()
        ])
    }

    @Transactional
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
            evaluation.strengths = params.strengths
            evaluation.improvements = params.improvements
            evaluation.generalComments = params.generalComments
            evaluation.overallRating = params.overallRating
            evaluation.recommendation = params.recommendation
            evaluation.technicalSkills = params.int('technicalSkills')
            evaluation.communicationSkills = params.int('communicationSkills')
            evaluation.problemSolving = params.int('problemSolving')
            evaluation.initiative = params.int('initiative')
            evaluation.teamwork = params.int('teamwork')

            if (!evaluation.save(flush: true)) {
                throw new RuntimeException("Failed to update evaluation: ${evaluation.errors}")
            }

            flash.message = "Evaluation updated successfully"
            redirect(action: 'show', id: evaluation.id)

        } catch (Exception e) {
            log.error "Error updating evaluation: ${e.message}", e
            flash.error = "Error updating evaluation: ${e.message}"
            redirect(action: 'edit', id: id)
        }
    }

    @Transactional
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
            def internName = evaluation.intern?.user?.fullName
            evaluation.delete(flush: true)
            flash.message = "Evaluation for ${internName} deleted successfully"

        } catch (Exception e) {
            log.error "Error deleting evaluation: ${e.message}", e
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
                evalStats: evalStats,
                role: getCurrentUserRole()
        ])
    }

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
                        if (params.max) max = params.int('max')
                        if (params.offset) firstResult = params.int('offset')
                        order('evaluationDate', 'desc')
                    }
                }
                break
            case 'ROLE_ADMIN':
                evaluations = Evaluation.list(params)
                break
            default:
                render([] as JSON)
                return
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
                return evaluation.intern?.supervisor?.id == supervisor?.id
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
                return intern?.supervisor?.id == supervisor?.id
            default:
                return false
        }
    }

    private String getCurrentUserRole() {
        try {
            def authorities = springSecurityService.authentication?.authorities
            return authorities?.find()?.authority
        } catch (Exception e) {
            return null
        }
    }
}