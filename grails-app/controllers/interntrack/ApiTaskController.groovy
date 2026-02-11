// File: grails-app/controllers/interntrack/ApiTaskController.groovy
package interntrack

import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.JSON
import grails.rest.RestfulController

import interntrack.TaskService
import interntrack.FileUploadService
class ApiTaskController extends RestfulController<Task> {

    static responseFormats = ['json', 'xml']

    SpringSecurityService springSecurityService
    TaskService taskService
    FileUploadService fileUploadService

    ApiTaskController() {
        super(Task)
    }

    def index() {
        def currentUser = springSecurityService.currentUser
        def role = springSecurityService.getAuthentication().authorities*.authority[0]

        def taskList = []

        switch(role) {
            case 'ROLE_ADMIN':
                taskList = Task.list(params)
                break
            case 'ROLE_SUPERVISOR':
                def supervisor = Supervisor.findByUser(currentUser)
                def interns = Intern.findAllBySupervisor(supervisor)
                taskList = Task.createCriteria().list(params) {
                    intern {
                        inList('supervisor', supervisor)
                    }
                }
                break
            case 'ROLE_INTERN':
                def intern = Intern.findByUser(currentUser)
                taskList = Task.findAllByIntern(intern, params)
                break
        }

        respond(taskList)
    }

    def show(Long id) {
        def task = Task.get(id)

        if (!task) {
            respond([error: "Task not found"], status: 404)
            return
        }

        if (!hasAccessToTask(task)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        respond(task)
    }

    def save() {
        def taskData = request.JSON

        try {
            // Get intern
            Intern intern
            if (taskData.internId) {
                intern = Intern.get(taskData.internId)
            } else {
                // For interns, use their own profile
                def currentUser = springSecurityService.currentUser
                intern = Intern.findByUser(currentUser)
            }

            if (!intern) {
                respond([error: "Intern not found"], status: 404)
                return
            }

            // Create task
            def task = taskService.createTask(taskData, intern)
            respond(task, status: 201)

        } catch (Exception e) {
            respond([error: e.message], status: 400)
        }
    }

    def update(Long id) {
        def task = Task.get(id)

        if (!task) {
            respond([error: "Task not found"], status: 404)
            return
        }

        if (!hasAccessToTask(task)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        try {
            task.properties = request.JSON

            if (task.save()) {
                respond(task)
            } else {
                respond([error: task.errors], status: 400)
            }

        } catch (Exception e) {
            respond([error: e.message], status: 500)
        }
    }

    def delete(Long id) {
        def task = Task.get(id)

        if (!task) {
            respond([error: "Task not found"], status: 404)
            return
        }

        if (!hasAccessToTask(task)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        try {
            task.delete()
            respond([message: "Task deleted successfully"])
        } catch (Exception e) {
            respond([error: e.message], status: 500)
        }
    }

    def updateStatus(Long id) {
        def task = Task.get(id)

        if (!task) {
            respond([error: "Task not found"], status: 404)
            return
        }

        if (!hasAccessToTask(task)) {
            respond([error: "Access denied"], status: 403)
            return
        }

        try {
            def updatedTask = taskService.updateTaskStatus(id, params.status, params.feedback)
            respond(updatedTask)
        } catch (Exception e) {
            respond([error: e.message], status: 400)
        }
    }

    def getOverdue() {
        def overdueTasks = taskService.getOverdueTasks()
        respond(overdueTasks)
    }

    // ✅ Modified getStats without default parameter
    def getStats() {
        Long internId = params.internId ? params.long('internId') : null
        def stats = [:]

        if (internId) {
            def intern = Intern.get(internId)
            if (!intern) {
                respond([error: "Intern not found"], status: 404)
                return
            }

            if (!hasAccessToIntern(intern)) {
                respond([error: "Access denied"], status: 403)
                return
            }

            stats = taskService.calculateTaskStats(intern)
        } else {
            def currentUser = springSecurityService.currentUser
            def role = springSecurityService.getAuthentication().authorities*.authority[0]

            if (role == 'ROLE_SUPERVISOR') {
                def supervisor = Supervisor.findByUser(currentUser)
                def interns = Intern.findAllBySupervisor(supervisor)

                def totalTasks = 0
                def completedTasks = 0

                interns.each { intern ->
                    def internStats = taskService.calculateTaskStats(intern)
                    totalTasks += internStats.totalTasks
                    completedTasks += internStats.completedTasks
                }

                stats = [
                        totalTasks: totalTasks,
                        completedTasks: completedTasks,
                        completionRate: totalTasks > 0 ? (completedTasks / totalTasks) * 100 : 0
                ]
            }
        }

        respond(stats)
    }

    private boolean hasAccessToTask(Task task) {
        def currentUser = springSecurityService.currentUser
        def role = springSecurityService.getAuthentication().authorities*.authority[0]

        switch(role) {
            case 'ROLE_ADMIN':
                return true
            case 'ROLE_SUPERVISOR':
                def supervisor = Supervisor.findByUser(currentUser)
                return task.intern.supervisor == supervisor
            case 'ROLE_INTERN':
                def intern = Intern.findByUser(currentUser)
                return task.intern == intern
            default:
                return false
        }
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
            case 'ROLE_INTERN':
                def userIntern = Intern.findByUser(currentUser)
                return intern == userIntern
            default:
                return false
        }
    }
}
