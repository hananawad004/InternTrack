//////package interntrack
//////
//////import grails.gorm.transactions.Transactional
//////import grails.web.servlet.mvc.GrailsParameterMap
//////
//////@Transactional
//////class TaskService {
//////
//////    def updateOverdueTasks() {
//////        Date now = new Date()
//////        def overdueTasks = Task.createCriteria().list {
//////            eq('status', 'PENDING')
//////            lt('dueDate', now)
//////        }
//////
//////        overdueTasks.each { task ->
//////            task.status = 'OVERDUE'
//////            task.save(flush: true)
//////        }
//////
//////        return overdueTasks.size()
//////    }
//////
//////    Task createTask(Map params, Intern intern) {
//////        Task task = new Task(params)
//////        task.intern = intern
//////
//////        // Check for duplicate active task
//////        def existingTask = Task.createCriteria().get {
//////            eq('intern', intern)
//////            eq('title', task.title)
//////            ne('status', 'COMPLETED')
//////        }
//////
//////        if (existingTask) {
//////            throw new IllegalArgumentException("An active task with the same title already exists")
//////        }
//////
//////        if (!task.save(flush: true)) {
//////            throw new RuntimeException("Failed to save task: ${task.errors}")
//////        }
//////
//////        return task
//////    }
//////
//////    Task updateTaskStatus(Long taskId, String status, String feedback = null) {
//////        Task task = Task.get(taskId)
//////        if (!task) {
//////            throw new IllegalArgumentException("Task not found")
//////        }
//////
//////        task.status = status
//////        if (feedback) {
//////            task.feedback = feedback
//////        }
//////
//////        if (!task.save(flush: true)) {
//////            throw new RuntimeException("Failed to update task: ${task.errors}")
//////        }
//////
//////        return task
//////    }
//////
//////    Map getTaskStatistics(Intern intern) {
//////        def criteria = Task.createCriteria()
//////
//////        def total = criteria.count {
//////            eq('intern', intern)
//////        }
//////
//////        def completed = criteria.count {
//////            eq('intern', intern)
//////            eq('status', 'COMPLETED')
//////        }
//////
//////        def pending = criteria.count {
//////            eq('intern', intern)
//////            eq('status', 'PENDING')
//////        }
//////
//////        def inProgress = criteria.count {
//////            eq('intern', intern)
//////            eq('status', 'IN_PROGRESS')
//////        }
//////
//////        def overdue = criteria.count {
//////            eq('intern', intern)
//////            eq('status', 'OVERDUE')
//////        }
//////
//////        def completionRate = total > 0 ? (completed / total * 100).round(2) : 0
//////
//////        return [
//////                total: total,
//////                completed: completed,
//////                pending: pending,
//////                inProgress: inProgress,
//////                overdue: overdue,
//////                completionRate: completionRate
//////        ]
//////    }
//////
//////    List<Task> getUpcomingTasks(Intern intern, Integer days = 7) {
//////        Date startDate = new Date()
//////        Date endDate = startDate + days
//////
//////        return Task.createCriteria().list {
//////            eq('intern', intern)
//////            inList('status', ['PENDING', 'IN_PROGRESS'])
//////            between('dueDate', startDate, endDate)
//////            order('dueDate', 'asc')
//////            maxResults(10)
//////        }
//////    }
//////
//////    List<Task> getTasksBySupervisor(Supervisor supervisor, Map params = [:]) {
//////        return Task.createCriteria().list(params) {
//////            intern {
//////                eq('supervisor', supervisor)
//////            }
//////            if (params.status) {
//////                eq('status', params.status)
//////            }
//////            if (params.priority) {
//////                eq('priority', params.priority)
//////            }
//////            order('dueDate', 'asc')
//////        }
//////    }
//////}
////package interntrack
////
////import grails.gorm.transactions.Transactional
////import grails.web.servlet.mvc.GrailsParameterMap
////
////@Transactional
////class TaskService {
////
////    def updateOverdueTasks() {
////        Date now = new Date()
////        def overdueTasks = Task.createCriteria().list {
////            eq('status', 'PENDING')
////            lt('dueDate', now)
////        }
////
////        overdueTasks.each { task ->
////            task.status = 'OVERDUE'
////            task.save(flush: true)
////        }
////
////        return overdueTasks.size()
////    }
////
////    // ✅ دالة تقبل GrailsParameterMap
////    Task createTask(GrailsParameterMap params, Intern intern) {
////        return createTask(params as Map, intern)
////    }
////
////    // ✅ الدالة الأصلية تقبل Map
////    Task createTask(Map params, Intern intern) {
////        Task task = new Task(params)
////        task.intern = intern
////
////        // Check for duplicate active task
////        def existingTask = Task.createCriteria().get {
////            eq('intern', intern)
////            eq('title', task.title)
////            ne('status', 'COMPLETED')
////        }
////
////        if (existingTask) {
////            throw new IllegalArgumentException("An active task with the same title already exists")
////        }
////
////        if (!task.save(flush: true)) {
////            throw new RuntimeException("Failed to save task: ${task.errors}")
////        }
////
////        return task
////    }
////
////    Task updateTaskStatus(Long taskId, String status, String feedback = null) {
////        Task task = Task.get(taskId)
////        if (!task) {
////            throw new IllegalArgumentException("Task not found")
////        }
////
////        task.status = status
////        if (feedback) {
////            task.feedback = feedback
////        }
////
////        if (!task.save(flush: true)) {
////            throw new RuntimeException("Failed to update task: ${task.errors}")
////        }
////
////        return task
////    }
////
////    Map getTaskStatistics(Intern intern) {
////        def criteria = Task.createCriteria()
////
////        def total = criteria.count {
////            eq('intern', intern)
////        }
////
////        def completed = criteria.count {
////            eq('intern', intern)
////            eq('status', 'COMPLETED')
////        }
////
////        def pending = criteria.count {
////            eq('intern', intern)
////            eq('status', 'PENDING')
////        }
////
////        def inProgress = criteria.count {
////            eq('intern', intern)
////            eq('status', 'IN_PROGRESS')
////        }
////
////        def overdue = criteria.count {
////            eq('intern', intern)
////            eq('status', 'OVERDUE')
////        }
////
////        def completionRate = total > 0 ? (completed / total * 100).round(2) : 0
////
////        return [
////                total: total,
////                completed: completed,
////                pending: pending,
////                inProgress: inProgress,
////                overdue: overdue,
////                completionRate: completionRate
////        ]
////    }
////
////    List<Task> getUpcomingTasks(Intern intern, Integer days = 7) {
////        Date startDate = new Date()
////        Date endDate = startDate + days
////
////        return Task.createCriteria().list {
////            eq('intern', intern)
////            inList('status', ['PENDING', 'IN_PROGRESS'])
////            between('dueDate', startDate, endDate)
////            order('dueDate', 'asc')
////            maxResults(10)
////        }
////    }
////
////    List<Task> getTasksBySupervisor(Supervisor supervisor, Map params = [:]) {
////        return Task.createCriteria().list(params) {
////            intern {
////                eq('supervisor', supervisor)
////            }
////            if (params.status) {
////                eq('status', params.status)
////            }
////            if (params.priority) {
////                eq('priority', params.priority)
////            }
////            order('dueDate', 'asc')
////        }
////    }
////
////    List<Task> getTasksByIntern(Intern intern, Map params = [:]) {
////        return Task.createCriteria().list(params) {
////            eq('intern', intern)
////            if (params.status) {
////                eq('status', params.status)
////            }
////            if (params.priority) {
////                eq('priority', params.priority)
////            }
////            order('dueDate', 'asc')
////        }
////    }
////}
//package interntrack
//
//import grails.gorm.transactions.Transactional
//
//@Transactional
//class TaskService {
//
//    def updateOverdueTasks() {
//        Date now = new Date()
//
//        def overdueTasks = Task.createCriteria().list {
//            eq('status', 'PENDING')
//            lt('dueDate', now)
//        }
//
//        overdueTasks.each { task ->
//            task.status = 'OVERDUE'
//            task.save(flush: true)
//        }
//
//        return overdueTasks.size()
//    }
//
//    // =====================================
//    // CREATE
//    // =====================================
//    Task createTask(Map params, Intern intern, User createdBy = null) {
//
//        Task task = new Task(params)
//        task.intern = intern
//        task.createdBy = createdBy
//        task.status = 'PENDING'
//
//        def existingTask = Task.createCriteria().get {
//            eq('intern', intern)
//            eq('title', task.title)
//            ne('status', 'COMPLETED')
//        }
//
//        if (existingTask) {
//            throw new IllegalArgumentException("An active task with the same title already exists")
//        }
//
//        if (!task.save(flush: true)) {
//            throw new RuntimeException("Failed to save task: ${task.errors}")
//        }
//
//        return task
//    }
//
//    // =====================================
//    // UPDATE STATUS
//    // =====================================
//    Task updateTaskStatus(Long taskId, String status, String feedback = null) {
//
//        Task task = Task.get(taskId)
//        if (!task) {
//            throw new IllegalArgumentException("Task not found")
//        }
//
//        task.status = status
//
//        if (feedback) {
//            task.feedback = feedback
//        }
//
//        if (!task.save(flush: true)) {
//            throw new RuntimeException("Failed to update task: ${task.errors}")
//        }
//
//        return task
//    }
//
//    // =====================================
//    // STATISTICS
//    // =====================================
//    Map getTaskStatistics(Intern intern) {
//
//        def total = Task.countByIntern(intern)
//        def completed = Task.countByInternAndStatus(intern, 'COMPLETED')
//        def pending = Task.countByInternAndStatus(intern, 'PENDING')
//        def inProgress = Task.countByInternAndStatus(intern, 'IN_PROGRESS')
//        def overdue = Task.countByInternAndStatus(intern, 'OVERDUE')
//
//        def completionRate = total > 0 ?
//                ((completed / total) * 100).round(2) : 0
//
//        return [
//                total: total,
//                completed: completed,
//                pending: pending,
//                inProgress: inProgress,
//                overdue: overdue,
//                completionRate: completionRate
//        ]
//    }
//
//    // =====================================
//    // SUPERVISOR TASKS
//    // =====================================
//    List<Task> getTasksBySupervisor(Supervisor supervisor, Map params = [:]) {
//
//        Task.createCriteria().list(params) {
//
//            intern {
//                eq('supervisor', supervisor)
//            }
//
//            if (params.status) {
//                eq('status', params.status)
//            }
//
//            if (params.priority) {
//                eq('priority', params.priority)
//            }
//
//            // مهم: لا تضيف order هنا إطلاقاً
//        }
//    }
//
//    // =====================================
//    // INTERN TASKS
//    // =====================================
//    List<Task> getTasksByIntern(Intern intern, Map params = [:]) {
//
//        Task.createCriteria().list(params) {
//
//            eq('intern', intern)
//
//            if (params.status) {
//                eq('status', params.status)
//            }
//
//            if (params.priority) {
//                eq('priority', params.priority)
//            }
//
//            // لا order هنا
//        }
//    }
//
//    // =====================================
//    // ADMIN TASKS
//    // =====================================
//    List<Task> getAllTasks(Map params = [:]) {
//
//        Task.createCriteria().list(params) {
//
//            if (params.status) {
//                eq('status', params.status)
//            }
//
//            if (params.priority) {
//                eq('priority', params.priority)
//            }
//
//            // لا order هنا
//        }
//    }
//}
package interntrack

import grails.gorm.transactions.Transactional

@Transactional
class TaskService {

    def updateOverdueTasks() {
        Date now = new Date()

        def overdueTasks = Task.createCriteria().list {
            eq('status', 'PENDING')
            lt('dueDate', now)
        }

        overdueTasks.each { task ->
            task.status = 'OVERDUE'
            task.save(flush: true)
        }

        return overdueTasks.size()
    }

    // =====================================
    // CREATE - مع معالجة أفضل للـ params
    // =====================================
    Task createTask(Map params, Intern intern) {

        // تحويل التاريخ إذا كان String
        if (params.dueDate instanceof String) {
            try {
                params.dueDate = Date.parse('yyyy-MM-dd', params.dueDate)
            } catch (Exception e) {
                log.error "Error parsing date: ${e.message}"
            }
        }

        Task task = new Task()
        task.title = params.title
        task.description = params.description
        task.dueDate = params.dueDate
        task.priority = params.priority ?: 'MEDIUM'
        task.status = 'PENDING'
        task.intern = intern

        // التحقق من وجود مهمة مماثلة
        def existingTask = Task.createCriteria().get {
            eq('intern', intern)
            eq('title', task.title)
            ne('status', 'COMPLETED')
        }

        if (existingTask) {
            throw new IllegalArgumentException("An active task with the same title already exists")
        }

        if (!task.save(flush: true)) {
            throw new RuntimeException("Failed to save task: ${task.errors}")
        }

        return task
    }

    // =====================================
    // UPDATE STATUS
    // =====================================
    Task updateTaskStatus(Long taskId, String status, String feedback = null) {

        Task task = Task.get(taskId)
        if (!task) {
            throw new IllegalArgumentException("Task not found")
        }

        task.status = status

        if (feedback) {
            task.feedback = feedback
        }

        if (!task.save(flush: true)) {
            throw new RuntimeException("Failed to update task: ${task.errors}")
        }

        return task
    }

    // =====================================
    // STATISTICS
    // =====================================
    Map getTaskStatistics(Intern intern) {

        def total = Task.countByIntern(intern)
        def completed = Task.countByInternAndStatus(intern, 'COMPLETED')
        def pending = Task.countByInternAndStatus(intern, 'PENDING')
        def inProgress = Task.countByInternAndStatus(intern, 'IN_PROGRESS')
        def overdue = Task.countByInternAndStatus(intern, 'OVERDUE')

        def completionRate = total > 0 ?
                ((completed / total) * 100).round(2) : 0

        return [
                total: total,
                completed: completed,
                pending: pending,
                inProgress: inProgress,
                overdue: overdue,
                completionRate: completionRate
        ]
    }

    // =====================================
    // SUPERVISOR TASKS
    // =====================================
    List<Task> getTasksBySupervisor(Supervisor supervisor, Map params = [:]) {

        Task.createCriteria().list(params) {

            intern {
                eq('supervisor', supervisor)
            }

            if (params.status) {
                eq('status', params.status)
            }

            if (params.priority) {
                eq('priority', params.priority)
            }
        }
    }

    // =====================================
    // INTERN TASKS
    // =====================================
    List<Task> getTasksByIntern(Intern intern, Map params = [:]) {

        Task.createCriteria().list(params) {

            eq('intern', intern)

            if (params.status) {
                eq('status', params.status)
            }

            if (params.priority) {
                eq('priority', params.priority)
            }
        }
    }

    // =====================================
    // ADMIN TASKS
    // =====================================
    List<Task> getAllTasks(Map params = [:]) {

        Task.createCriteria().list(params) {

            if (params.status) {
                eq('status', params.status)
            }

            if (params.priority) {
                eq('priority', params.priority)
            }
        }
    }
}