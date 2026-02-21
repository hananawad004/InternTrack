////// File: grails-app/controllers/intern/track/TaskController.groovy
////package interntrack
////
////import grails.plugin.springsecurity.SpringSecurityService
////import grails.converters.JSON
////import org.springframework.web.multipart.MultipartFile
////import org.springframework.web.multipart.MultipartHttpServletRequest
////import interntrack.TaskService
////import interntrack.FileUploadService
////import interntrack.NotificationService
////
////class TaskController {
////
////    SpringSecurityService springSecurityService
////    TaskService taskService
////    FileUploadService fileUploadService
////    NotificationService notificationService
////
////    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
////
//////    def index() {
//////        def currentUser = springSecurityService.currentUser
//////        def role = getCurrentUserRole()
//////
//////        def taskList = []
//////        def params = [max: Math.min(params.max ? params.int('max') : 20, 100)]
//////
//////        switch(role) {
//////            case 'ROLE_INTERN':
//////                def intern = Intern.findByUser(currentUser)
//////                if (intern) {
//////                    taskList = Task.findAllByIntern(intern, [sort: 'dueDate', order: 'asc'])
//////                }
//////                break
//////            case 'ROLE_SUPERVISOR':
//////                def supervisor = Supervisor.findByUser(currentUser)
//////                if (supervisor) {
//////                    taskList = taskService.getTasksBySupervisor(supervisor, params)
//////                }
//////                break
//////            case 'ROLE_ADMIN':
//////                taskList = Task.list(params)
//////                break
//////        }
//////
//////        render(view: 'index', model: [
//////                taskList: taskList,
//////                taskCount: taskList.size(),
//////                statusList: ['PENDING', 'IN_PROGRESS', 'COMPLETED', 'OVERDUE', 'REJECTED'],
//////                priorityList: ['LOW', 'MEDIUM', 'HIGH', 'URGENT']
//////        ])
//////    }
////    def index() {
////        def currentUser = springSecurityService.currentUser
////        def authorities = springSecurityService.authentication?.authorities*.authority
////        def taskList = []
////
////        try {
////            // ✅ معالجة الـ params بدون تكرار order
////            def searchParams = [:]
////
////            if (params.max) {
////                searchParams.max = params.int('max') ?: 10
////            }
////
////            if (params.offset) {
////                searchParams.offset = params.int('offset') ?: 0
////            }
////
////            // ✅ استخدام sort مرة واحدة
////            if (params.sort) {
////                searchParams.sort = params.sort
////                searchParams.order = params.order ?: 'asc'
////            } else {
////                searchParams.sort = 'dueDate'
////                searchParams.order = 'asc'
////            }
////
////            if (authorities?.contains('ROLE_INTERN')) {
////                def intern = Intern.findByUser(currentUser)
////                if (intern) {
////                    taskList = taskService.getTasksByIntern(intern, searchParams)
////                }
////
////            } else if (authorities?.contains('ROLE_SUPERVISOR')) {
////                def supervisor = Supervisor.findByUser(currentUser)
////                if (supervisor) {
////                    taskList = taskService.getTasksBySupervisor(supervisor, searchParams)
////                }
////
////            } else if (authorities?.contains('ROLE_ADMIN')) {
////                taskList = Task.list(searchParams)
////            }
////
////        } catch (Exception e) {
////            log.error "Error in task index: ${e.message}", e
////            flash.error = "Error loading tasks: ${e.message}"
////            taskList = []
////        }
////
////        render(view: 'index', model: [
////                taskList: taskList,
////                totalCount: taskList.totalCount ?: taskList.size(),
////                statusList: ['PENDING', 'IN_PROGRESS', 'COMPLETED', 'OVERDUE'],
////                priorityList: ['HIGH', 'MEDIUM', 'LOW']
////        ])
////    }
////    def show(Long id) {
////        def task = Task.get(id)
////
////        if (!task) {
////            flash.error = "Task not found"
////            redirect(action: 'index')
////            return
////        }
////
////        if (!hasAccessToTask(task)) {
////            flash.error = "Access denied"
////            redirect(action: 'index')
////            return
////        }
////
////        render(view: 'show', model: [task: task])
////    }
////
////    def create() {
////        def currentUser = springSecurityService.currentUser
////        def role = getCurrentUserRole()
////
////        def interns = []
////
////        if (role == 'ROLE_SUPERVISOR') {
////            def supervisor = Supervisor.findByUser(currentUser)
////            interns = Intern.findAllBySupervisor(supervisor)
////        } else if (role == 'ROLE_ADMIN') {
////            interns = Intern.list()
////        }
////
////        render(view: 'create', model: [
////                task: new Task(),
////                interns: interns,
////                priorityList: ['LOW', 'MEDIUM', 'HIGH', 'URGENT']
////        ])
////    }
//////
//////    def save() {
//////        try {
//////            def currentUser = springSecurityService.currentUser
//////            def role = getCurrentUserRole()
//////
//////            Intern intern
//////
//////            if (params.internId) {
//////                intern = Intern.get(params.internId)
//////                if (!intern) {
//////                    flash.error = "Intern not found"
//////                    redirect(action: 'create')
//////                    return
//////                }
//////
//////                if (role == 'ROLE_SUPERVISOR') {
//////                    def supervisor = Supervisor.findByUser(currentUser)
//////                    if (intern.supervisor != supervisor) {
//////                        flash.error = "Access denied"
//////                        redirect(action: 'create')
//////                        return
//////                    }
//////                }
//////
//////                if (role == 'ROLE_INTERN') {
//////                    flash.error = "You cannot assign tasks to others"
//////                    redirect(action: 'create')
//////                    return
//////                }
//////
//////            } else if (role == 'ROLE_INTERN') {
//////                intern = Intern.findByUser(currentUser)
//////                if (!intern) {
//////                    flash.error = "Intern profile not found"
//////                    redirect(action: 'create')
//////                    return
//////                }
//////            } else {
//////                flash.error = "Intern must be specified"
//////                redirect(action: 'create')
//////                return
//////            }
//////
//////            def task = taskService.createTask(params, intern)
//////
//////            if (request instanceof MultipartHttpServletRequest) {
//////                def files = request.getFiles('attachments')
//////                files.each { MultipartFile file ->
//////                    if (!file.empty && fileUploadService.isValidFileType(file)) {
//////                        def attachment = fileUploadService.uploadFile(file, "Task: ${task.title}")
//////                        attachment.task = task
//////                        attachment.save()
//////                    }
//////                }
//////            }
//////
//////            notificationService.sendTaskAssignmentEmail(task)
//////
//////            flash.message = "Task created successfully"
//////            redirect(action: 'show', id: task.id)
//////
//////        } catch (Exception e) {
//////            flash.error = "Error creating task: ${e.message}"
//////            redirect(action: 'create')
//////        }
//////    }
////    def save() {
////        try {
////            def currentUser = springSecurityService.currentUser
////            def role = getCurrentUserRole()
////            Intern intern = null
////
////            // ✅ التحقق من internId
////            if (params.internId) {
////                intern = Intern.get(params.internId)
////                if (!intern) {
////                    flash.error = "❌ Intern not found"
////                    redirect(action: 'create')
////                    return
////                }
////
////                if (role == 'ROLE_SUPERVISOR') {
////                    def supervisor = Supervisor.findByUser(currentUser)
////                    if (!supervisor || intern.supervisor?.id != supervisor.id) {
////                        flash.error = "❌ Access denied - You can only assign tasks to your own interns"
////                        redirect(action: 'create')
////                        return
////                    }
////                }
////
////                if (role == 'ROLE_INTERN') {
////                    flash.error = "❌ You cannot assign tasks to others"
////                    redirect(action: 'create')
////                    return
////                }
////
////            } else if (role == 'ROLE_INTERN') {
////                intern = Intern.findByUser(currentUser)
////                if (!intern) {
////                    flash.error = "❌ Intern profile not found"
////                    redirect(action: 'create')
////                    return
////                }
////            } else {
////                flash.error = "❌ Please select an intern"
////                redirect(action: 'create')
////                return
////            }
////
////            // ✅ إنشاء المهمة
////            def task = taskService.createTask(params, intern)
////
////            // ✅ حفظ المهمة أولاً
////            if (!task.save(flush: true)) {
////                throw new RuntimeException("Failed to save task: ${task.errors}")
////            }
////
////            // ✅ رفع المرفقات - مع التحسينات
////            if (request instanceof MultipartHttpServletRequest) {
////                def files = request.getFiles('attachments')
////                int uploadedCount = 0
////
////                files.each { MultipartFile file ->
////                    if (!file.empty) {
////                        // ✅ التحقق من حجم الملف
////                        if (file.size > fileUploadService.getFileSizeLimit()) {
////                            flash.warning = "${flash.warning ?: ''} File ${file.originalFilename} exceeds size limit (10MB). "
////                            return
////                        }
////
////                        // ✅ التحقق من نوع الملف
////                        if (!fileUploadService.isValidFileType(file)) {
////                            flash.warning = "${flash.warning ?: ''} File ${file.originalFilename} type not allowed. "
////                            return
////                        }
////
////                        try {
////                            def attachment = fileUploadService.uploadFile(file, "Task: ${task.title}")
////                            attachment.task = task  // ✅ هذا سيعمل الآن
////
////                            if (!attachment.save(flush: true)) {
////                                log.error "Failed to save attachment: ${attachment.errors}"
////                            } else {
////                                uploadedCount++
////                            }
////                        } catch (Exception e) {
////                            log.error "Failed to upload file ${file.originalFilename}: ${e.message}", e
////                            flash.warning = "${flash.warning ?: ''} Failed to upload ${file.originalFilename}. "
////                        }
////                    }
////                }
////
////                if (uploadedCount > 0) {
////                    flash.message = "✅ Task created successfully with ${uploadedCount} attachment(s)."
////                } else {
////                    flash.message = "✅ Task created successfully."
////                }
////            }
////
////            // ✅ إرسال إشعار
////            try {
////                notificationService.sendTaskAssignmentEmail(task)
////            } catch (Exception e) {
////                log.error "Failed to send notification: ${e.message}", e
////                flash.warning = "${flash.warning ?: ''} Note: Notification could not be sent."
////            }
////
////            redirect(action: 'show', id: task.id)
////
////        } catch (Exception e) {
////            log.error "❌ Error creating task: ${e.message}", e
////            flash.error = "❌ Error creating task: ${e.message}"
////            redirect(action: 'create')
////        }
////    }
////    def edit(Long id) {
////        def task = Task.get(id)
////
////        if (!task || !hasAccessToTask(task)) {
////            flash.error = "Access denied"
////            redirect(action: 'index')
////            return
////        }
////
////        def currentUser = springSecurityService.currentUser
////        def role = getCurrentUserRole()
////        def interns = []
////
////        if (role == 'ROLE_SUPERVISOR') {
////            def supervisor = Supervisor.findByUser(currentUser)
////            interns = Intern.findAllBySupervisor(supervisor)
////        } else if (role == 'ROLE_ADMIN') {
////            interns = Intern.list()
////        }
////
////        render(view: 'edit', model: [
////                task: task,
////                interns: interns,
////                priorityList: ['LOW', 'MEDIUM', 'HIGH', 'URGENT'],
////                statusList: ['PENDING', 'IN_PROGRESS', 'COMPLETED', 'OVERDUE', 'REJECTED']
////        ])
////    }
////
////    def update(Long id) {
////        def task = Task.get(id)
////
////        if (!task || !hasAccessToTask(task)) {
////            flash.error = "Access denied"
////            redirect(action: 'index')
////            return
////        }
////
////        try {
////            def oldStatus = task.status
////
////            task.title = params.title
////            task.description = params.description
////            task.dueDate = params.dueDate
////            task.priority = params.priority
////
////            if (getCurrentUserRole() in ['ROLE_ADMIN', 'ROLE_SUPERVISOR']) {
////                task.status = params.status
////            }
////
////            if (!task.save(flush: true)) {
////                throw new RuntimeException("Failed to update task: ${task.errors}")
////            }
////
////            if (request instanceof MultipartHttpServletRequest) {
////                def files = request.getFiles('attachments')
////                files.each { MultipartFile file ->
////                    if (!file.empty && fileUploadService.isValidFileType(file)) {
////                        def attachment = fileUploadService.uploadFile(file, "Task: ${task.title}")
////                        attachment.task = task
////                        attachment.save()
////                    }
////                }
////            }
////
////            if (oldStatus != 'COMPLETED' && task.status == 'COMPLETED') {
////                notificationService.sendTaskAssignmentEmail(task)
////            }
////
////            flash.message = "Task updated successfully"
////            redirect(action: 'show', id: task.id)
////
////        } catch (Exception e) {
////            flash.error = "Error updating task: ${e.message}"
////            redirect(action: 'edit', id: id)
////        }
////    }
////
////    def delete(Long id) {
////        def task = Task.get(id)
////
////        if (!task || !hasAccessToTask(task)) {
////            flash.error = "Access denied"
////            redirect(action: 'index')
////            return
////        }
////
////        try {
////            task.attachments?.each { attachment ->
////                fileUploadService.deleteFile(attachment)
////            }
////
////            task.delete(flush: true)
////            flash.message = "Task deleted successfully"
////
////        } catch (Exception e) {
////            flash.error = "Error deleting task: ${e.message}"
////        }
////
////        redirect(action: 'index')
////    }
////
////    def updateStatus() {
////        try {
////            def task = Task.get(params.id)
////
////            if (!task || !hasAccessToTask(task)) {
////                render([success: false, message: 'Access denied'] as JSON)
////                return
////            }
////
////            if (!(getCurrentUserRole() in ['ROLE_ADMIN', 'ROLE_SUPERVISOR'])) {
////                render([success: false, message: 'Not allowed'] as JSON)
////                return
////            }
////
////            task = taskService.updateTaskStatus(task.id, params.status, params.feedback)
////            render([success: true, task: task] as JSON)
////
////        } catch (Exception e) {
////            render([success: false, message: e.message] as JSON)
////        }
////    }
////
////    def apiTasks() {
////        def currentUser = springSecurityService.currentUser
////        def role = getCurrentUserRole()
////        def tasks = []
////
////        switch(role) {
////            case 'ROLE_INTERN':
////                def intern = Intern.findByUser(currentUser)
////                if (intern) tasks = Task.findAllByIntern(intern)
////                break
////            case 'ROLE_SUPERVISOR':
////                def supervisor = Supervisor.findByUser(currentUser)
////                if (supervisor) tasks = taskService.getTasksBySupervisor(supervisor, params)
////                break
////            case 'ROLE_ADMIN':
////                tasks = Task.list(params)
////                break
////        }
////
////        render tasks as JSON
////    }
////
////    private boolean hasAccessToTask(Task task) {
////        def currentUser = springSecurityService.currentUser
////        def role = getCurrentUserRole()
////
////        switch(role) {
////            case 'ROLE_ADMIN': return true
////            case 'ROLE_SUPERVISOR':
////                def supervisor = Supervisor.findByUser(currentUser)
////                return task.intern.supervisor == supervisor
////            case 'ROLE_INTERN':
////                def intern = Intern.findByUser(currentUser)
////                return task.intern == intern
////            default: return false
////        }
////    }
////
////    private String getCurrentUserRole() {
////        def roles = springSecurityService.authentication.authorities*.authority
////        if (roles.contains('ROLE_ADMIN')) return 'ROLE_ADMIN'
////        if (roles.contains('ROLE_SUPERVISOR')) return 'ROLE_SUPERVISOR'
////        if (roles.contains('ROLE_INTERN')) return 'ROLE_INTERN'
////        return null
////    }
////}
//package interntrack
//
//import grails.plugin.springsecurity.SpringSecurityService
//import grails.converters.JSON
//import org.springframework.web.multipart.MultipartFile
//import org.springframework.web.multipart.MultipartHttpServletRequest
//
//class TaskController {
//
//    SpringSecurityService springSecurityService
//
//    // ✅ استخدم def لجميع الـ Services
//    def taskService
//    def fileUploadService
//    def notificationService
//
//    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
//
//    def index() {
//        def currentUser = springSecurityService.currentUser
//        def authorities = springSecurityService.authentication?.authorities*.authority
//        def taskList = []
//
//        try {
//            def searchParams = [:]
//
//            if (params.max) {
//                searchParams.max = params.int('max') ?: 10
//            }
//
//            if (params.offset) {
//                searchParams.offset = params.int('offset') ?: 0
//            }
//
//            if (params.sort) {
//                searchParams.sort = params.sort
//                searchParams.order = params.order ?: 'asc'
//            } else {
//                searchParams.sort = 'dueDate'
//                searchParams.order = 'asc'
//            }
//
//            if (authorities?.contains('ROLE_INTERN')) {
//                def intern = Intern.findByUser(currentUser)
//                if (intern) {
//                    taskList = taskService.getTasksByIntern(intern, searchParams)
//                }
//
//            } else if (authorities?.contains('ROLE_SUPERVISOR')) {
//                def supervisor = Supervisor.findByUser(currentUser)
//                if (supervisor) {
//                    taskList = taskService.getTasksBySupervisor(supervisor, searchParams)
//                }
//
//            } else if (authorities?.contains('ROLE_ADMIN')) {
//                taskList = Task.list(searchParams)
//            }
//
//        } catch (Exception e) {
//            log.error "Error in task index: ${e.message}", e
//            flash.error = "Error loading tasks: ${e.message}"
//            taskList = []
//        }
//
//        render(view: 'index', model: [
//                taskList: taskList,
//                totalCount: taskList.totalCount ?: taskList.size(),
//                statusList: ['PENDING', 'IN_PROGRESS', 'COMPLETED', 'OVERDUE'],
//                priorityList: ['HIGH', 'MEDIUM', 'LOW']
//        ])
//    }
//
//    def show(Long id) {
//        def task = Task.get(id)
//
//        if (!task) {
//            flash.error = "Task not found"
//            redirect(action: 'index')
//            return
//        }
//
//        if (!hasAccessToTask(task)) {
//            flash.error = "Access denied"
//            redirect(action: 'index')
//            return
//        }
//
//        render(view: 'show', model: [task: task])
//    }
//
//    def create() {
//        def currentUser = springSecurityService.currentUser
//        def role = getCurrentUserRole()
//        def interns = []
//
//        if (role == 'ROLE_SUPERVISOR') {
//            def supervisor = Supervisor.findByUser(currentUser)
//            interns = Intern.findAllBySupervisor(supervisor)
//        } else if (role == 'ROLE_ADMIN') {
//            interns = Intern.list()
//        }
//
//        render(view: 'create', model: [
//                task: new Task(),
//                interns: interns,
//                priorityList: ['LOW', 'MEDIUM', 'HIGH', 'URGENT']
//        ])
//    }
//
////    def save() {
////        try {
////            def currentUser = springSecurityService.currentUser
////            def role = getCurrentUserRole()
////            Intern intern = null
////
////            if (params.internId) {
////                intern = Intern.get(params.internId)
////                if (!intern) {
////                    flash.error = "Intern not found"
////                    redirect(action: 'create')
////                    return
////                }
////
////                if (role == 'ROLE_SUPERVISOR') {
////                    def supervisor = Supervisor.findByUser(currentUser)
////                    if (intern.supervisor != supervisor) {
////                        flash.error = "Access denied"
////                        redirect(action: 'create')
////                        return
////                    }
////                }
////
////                if (role == 'ROLE_INTERN') {
////                    flash.error = "You cannot assign tasks to others"
////                    redirect(action: 'create')
////                    return
////                }
////
////            } else if (role == 'ROLE_INTERN') {
////                intern = Intern.findByUser(currentUser)
////                if (!intern) {
////                    flash.error = "Intern profile not found"
////                    redirect(action: 'create')
////                    return
////                }
////            } else {
////                flash.error = "Intern must be specified"
////                redirect(action: 'create')
////                return
////            }
////
////            def task = taskService.createTask(params, intern)
////
////            if (request instanceof MultipartHttpServletRequest) {
////                def files = request.getFiles('attachments')
////                files.each { MultipartFile file ->
////                    if (!file.empty && fileUploadService.isValidFileType(file)) {
////                        def attachment = fileUploadService.uploadFile(file, "Task: ${task.title}")
////                        attachment.task = task
////                        attachment.save()
////                    }
////                }
////            }
////
////            notificationService.sendTaskAssignmentEmail(task)
////
////            flash.message = "Task created successfully"
////            redirect(action: 'show', id: task.id)
////
////        } catch (Exception e) {
////            log.error "Error creating task: ${e.message}", e
////            flash.error = "Error creating task: ${e.message}"
////            redirect(action: 'create')
////        }
////    }
//    def save() {
//        try {
//            def currentUser = springSecurityService.currentUser
//            def role = getCurrentUserRole()
//            Intern intern = null
//
//            if (params.internId) {
//                intern = Intern.get(params.internId)
//                if (!intern) {
//                    flash.error = "Intern not found"
//                    redirect(action: 'create')
//                    return
//                }
//
//                if (role == 'ROLE_SUPERVISOR') {
//                    def supervisor = Supervisor.findByUser(currentUser)
//                    if (intern.supervisor != supervisor) {
//                        flash.error = "Access denied"
//                        redirect(action: 'create')
//                        return
//                    }
//                }
//
//                if (role == 'ROLE_INTERN') {
//                    flash.error = "You cannot assign tasks to others"
//                    redirect(action: 'create')
//                    return
//                }
//
//            } else if (role == 'ROLE_INTERN') {
//                intern = Intern.findByUser(currentUser)
//                if (!intern) {
//                    flash.error = "Intern profile not found"
//                    redirect(action: 'create')
//                    return
//                }
//            } else {
//                flash.error = "Intern must be specified"
//                redirect(action: 'create')
//                return
//            }
//
//            // ✅ تحويل params إلى Map
//            Map taskParams = [
//                    title: params.title,
//                    description: params.description,
//                    dueDate: params.date('dueDate', 'yyyy-MM-dd'),
//                    priority: params.priority
//            ]
//
//            def task = taskService.createTask(taskParams, intern)
//
//            if (request instanceof MultipartHttpServletRequest) {
//                def files = request.getFiles('attachments')
//                files.each { MultipartFile file ->
//                    if (!file.empty && fileUploadService.isValidFileType(file)) {
//                        def attachment = fileUploadService.uploadFile(file, "Task: ${task.title}")
//                        attachment.task = task
//                        attachment.save()
//                    }
//                }
//            }
//
//            notificationService.sendTaskAssignmentEmail(task)
//
//            flash.message = "Task created successfully"
//            redirect(action: 'show', id: task.id)
//
//        } catch (Exception e) {
//            log.error "Error creating task: ${e.message}", e
//            flash.error = "Error creating task: ${e.message}"
//            redirect(action: 'create')
//        }
//    }
//    def edit(Long id) {
//        def task = Task.get(id)
//
//        if (!task || !hasAccessToTask(task)) {
//            flash.error = "Access denied"
//            redirect(action: 'index')
//            return
//        }
//
//        def currentUser = springSecurityService.currentUser
//        def role = getCurrentUserRole()
//        def interns = []
//
//        if (role == 'ROLE_SUPERVISOR') {
//            def supervisor = Supervisor.findByUser(currentUser)
//            interns = Intern.findAllBySupervisor(supervisor)
//        } else if (role == 'ROLE_ADMIN') {
//            interns = Intern.list()
//        }
//
//        render(view: 'edit', model: [
//                task: task,
//                interns: interns,
//                priorityList: ['LOW', 'MEDIUM', 'HIGH', 'URGENT'],
//                statusList: ['PENDING', 'IN_PROGRESS', 'COMPLETED', 'OVERDUE', 'REJECTED']
//        ])
//    }
//
//    def update(Long id) {
//        def task = Task.get(id)
//
//        if (!task || !hasAccessToTask(task)) {
//            flash.error = "Access denied"
//            redirect(action: 'index')
//            return
//        }
//
//        try {
//            def oldStatus = task.status
//
//            task.title = params.title
//            task.description = params.description
//            task.dueDate = params.dueDate
//            task.priority = params.priority
//
//            if (getCurrentUserRole() in ['ROLE_ADMIN', 'ROLE_SUPERVISOR']) {
//                task.status = params.status
//            }
//
//            if (!task.save(flush: true)) {
//                throw new RuntimeException("Failed to update task: ${task.errors}")
//            }
//
//            if (request instanceof MultipartHttpServletRequest) {
//                def files = request.getFiles('attachments')
//                files.each { MultipartFile file ->
//                    if (!file.empty && fileUploadService.isValidFileType(file)) {
//                        def attachment = fileUploadService.uploadFile(file, "Task: ${task.title}")
//                        attachment.task = task
//                        attachment.save()
//                    }
//                }
//            }
//
//            if (oldStatus != 'COMPLETED' && task.status == 'COMPLETED') {
//                notificationService.sendTaskAssignmentEmail(task)
//            }
//
//            flash.message = "Task updated successfully"
//            redirect(action: 'show', id: task.id)
//
//        } catch (Exception e) {
//            flash.error = "Error updating task: ${e.message}"
//            redirect(action: 'edit', id: id)
//        }
//    }
//
//    def delete(Long id) {
//        def task = Task.get(id)
//
//        if (!task || !hasAccessToTask(task)) {
//            flash.error = "Access denied"
//            redirect(action: 'index')
//            return
//        }
//
//        try {
//            task.attachments?.each { attachment ->
//                fileUploadService.deleteFile(attachment)
//            }
//
//            task.delete(flush: true)
//            flash.message = "Task deleted successfully"
//
//        } catch (Exception e) {
//            flash.error = "Error deleting task: ${e.message}"
//        }
//
//        redirect(action: 'index')
//    }
//
//    def updateStatus() {
//        try {
//            def task = Task.get(params.id)
//
//            if (!task || !hasAccessToTask(task)) {
//                render([success: false, message: 'Access denied'] as JSON)
//                return
//            }
//
//            if (!(getCurrentUserRole() in ['ROLE_ADMIN', 'ROLE_SUPERVISOR'])) {
//                render([success: false, message: 'Not allowed'] as JSON)
//                return
//            }
//
//            task = taskService.updateTaskStatus(task.id, params.status, params.feedback)
//            render([success: true, task: task] as JSON)
//
//        } catch (Exception e) {
//            render([success: false, message: e.message] as JSON)
//        }
//    }
//
//    def apiTasks() {
//        def currentUser = springSecurityService.currentUser
//        def role = getCurrentUserRole()
//        def tasks = []
//
//        switch(role) {
//            case 'ROLE_INTERN':
//                def intern = Intern.findByUser(currentUser)
//                if (intern) tasks = Task.findAllByIntern(intern)
//                break
//            case 'ROLE_SUPERVISOR':
//                def supervisor = Supervisor.findByUser(currentUser)
//                if (supervisor) tasks = taskService.getTasksBySupervisor(supervisor, params)
//                break
//            case 'ROLE_ADMIN':
//                tasks = Task.list(params)
//                break
//        }
//
//        render tasks as JSON
//    }
//
//    private boolean hasAccessToTask(Task task) {
//        def currentUser = springSecurityService.currentUser
//        def role = getCurrentUserRole()
//
//        switch(role) {
//            case 'ROLE_ADMIN': return true
//            case 'ROLE_SUPERVISOR':
//                def supervisor = Supervisor.findByUser(currentUser)
//                return task.intern.supervisor == supervisor
//            case 'ROLE_INTERN':
//                def intern = Intern.findByUser(currentUser)
//                return task.intern == intern
//            default: return false
//        }
//    }
//
//    private String getCurrentUserRole() {
//        def roles = springSecurityService.authentication.authorities*.authority
//        if (roles.contains('ROLE_ADMIN')) return 'ROLE_ADMIN'
//        if (roles.contains('ROLE_SUPERVISOR')) return 'ROLE_SUPERVISOR'
//        if (roles.contains('ROLE_INTERN')) return 'ROLE_INTERN'
//        return null
//    }
//}
package interntrack

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

class TaskController {

    SpringSecurityService springSecurityService
    def taskService
    def fileUploadService
    def notificationService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
//    def index() {
//        def currentUser = springSecurityService.currentUser
//        def authorities = springSecurityService.authentication?.authorities*.authority
//        def taskList = []
//        def totalCount = 0
//
//        try {
//
//            def searchParams = [:]
//            searchParams.max = Math.min(params.int('max') ?: 10, 100)
//            searchParams.offset = params.int('offset') ?: 0
//
//            // هنا فقط نضع الترتيب الافتراضي
//            searchParams.sort = params.sort ?: 'dueDate'
//            searchParams.order = params.order ?: 'asc'
//
//            if (params.status) {
//                searchParams.status = params.status
//            }
//
//            if (params.priority) {
//                searchParams.priority = params.priority
//            }
//
//            if (authorities?.contains('ROLE_INTERN')) {
//
//                def intern = Intern.findByUser(currentUser)
//                if (intern) {
//                    taskList = taskService.getTasksByIntern(intern, searchParams)
//                    totalCount = taskList.totalCount
//                }
//
//            } else if (authorities?.contains('ROLE_SUPERVISOR')) {
//
//                def supervisor = Supervisor.findByUser(currentUser)
//                if (supervisor) {
//                    taskList = taskService.getTasksBySupervisor(supervisor, searchParams)
//                    totalCount = taskList.totalCount
//                }
//
//            } else if (authorities?.contains('ROLE_ADMIN')) {
//
//                taskList = taskService.getAllTasks(searchParams)
//                totalCount = taskList.totalCount
//            }
//
//        } catch (Exception e) {
//            log.error "Error in task index: ${e.message}", e
//            flash.error = "Error loading tasks"
//        }
//
//        render(view: 'index', model: [
//                taskList: taskList,
//                totalCount: totalCount ?: 0,
//                statusList: ['PENDING', 'IN_PROGRESS', 'COMPLETED', 'OVERDUE'],
//                priorityList: ['HIGH', 'MEDIUM', 'LOW']
//        ])
//    }
    def index() {
        def currentUser = springSecurityService.currentUser
        def authorities = springSecurityService.authentication?.authorities*.authority
        def taskList = []
        def totalCount = 0

        try {
            def searchParams = [:]
            searchParams.max = Math.min(params.int('max') ?: 10, 100)
            searchParams.offset = params.int('offset') ?: 0

            // ✅ لا نضيف sort و order إلى searchParams
            // لأنها قد تسبب مشكلة في Criteria

            if (params.status) {
                searchParams.status = params.status
            }

            if (params.priority) {
                searchParams.priority = params.priority
            }

            if (authorities?.contains('ROLE_INTERN')) {
                def intern = Intern.findByUser(currentUser)
                if (intern) {
                    // ✅ استخدام findAllByIntern مباشرة مع الترتيب
                    taskList = Task.findAllByIntern(intern, [
                            max: searchParams.max,
                            offset: searchParams.offset,
                            sort: params.sort ?: 'dueDate',
                            order: params.order ?: 'asc'
                    ])
                    totalCount = Task.countByIntern(intern)
                }

            } else if (authorities?.contains('ROLE_SUPERVISOR')) {
                def supervisor = Supervisor.findByUser(currentUser)
                if (supervisor) {
                    taskList = taskService.getTasksBySupervisor(supervisor, searchParams)
                    totalCount = taskList.totalCount ?: taskList.size()
                }

            } else if (authorities?.contains('ROLE_ADMIN')) {
                taskList = Task.list(searchParams)
                totalCount = Task.count()
            }

        } catch (Exception e) {
            log.error "Error in task index: ${e.message}", e
            flash.error = "Error loading tasks"
            taskList = []
        }

        render(view: 'index', model: [
                taskList: taskList,
                totalCount: totalCount ?: 0,
                statusList: ['PENDING', 'IN_PROGRESS', 'COMPLETED', 'OVERDUE'],
                priorityList: ['HIGH', 'MEDIUM', 'LOW']
        ])
    }

    def show(Long id) {
        def task = Task.get(id)

        if (!task) {
            flash.error = "Task not found"
            redirect(action: 'index')
            return
        }

        if (!hasAccessToTask(task)) {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        def attachments = Attachment.findAllByTask(task)

        render(view: 'show', model: [
                task: task,
                attachments: attachments,
                canEdit: canEditTask(task),
                canDelete: canDeleteTask(task)
        ])
    }

    def create() {
        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()
        def interns = []

        if (role == 'ROLE_SUPERVISOR') {
            def supervisor = Supervisor.findByUser(currentUser)
            interns = Intern.findAllBySupervisor(supervisor)
        } else if (role == 'ROLE_ADMIN') {
            interns = Intern.list()
        } else if (role == 'ROLE_INTERN') {
            def intern = Intern.findByUser(currentUser)
            if (intern) {
                interns = [intern]
            }
        }

        render(view: 'create', model: [
                task: new Task(),
                interns: interns,
                priorityList: ['HIGH', 'MEDIUM', 'LOW']
        ])
    }

    def save() {
        try {
            def currentUser = springSecurityService.currentUser
            def role = getCurrentUserRole()
            Intern intern = null

            // التحقق من internId
            if (params.internId) {
                intern = Intern.get(params.internId)
                if (!intern) {
                    flash.error = "Intern not found"
                    redirect(action: 'create')
                    return
                }

                if (role == 'ROLE_SUPERVISOR') {
                    def supervisor = Supervisor.findByUser(currentUser)
                    if (intern.supervisor != supervisor) {
                        flash.error = "Access denied - You can only assign tasks to your own interns"
                        redirect(action: 'create')
                        return
                    }
                }

                if (role == 'ROLE_INTERN') {
                    flash.error = "You cannot assign tasks to others"
                    redirect(action: 'create')
                    return
                }

            } else if (role == 'ROLE_INTERN') {
                intern = Intern.findByUser(currentUser)
                if (!intern) {
                    flash.error = "Intern profile not found"
                    redirect(action: 'create')
                    return
                }
            } else {
                flash.error = "Please select an intern"
                redirect(action: 'create')
                return
            }

            // تحويل params إلى Map
            Map taskParams = [
                    title: params.title,
                    description: params.description,
                    dueDate: params.date('dueDate', 'yyyy-MM-dd'),
                    priority: params.priority ?: 'MEDIUM',
                    status: 'PENDING'
            ]

//            def task = taskService.createTask(taskParams, intern, currentUser)
            def task = taskService.createTask(taskParams, intern)
            // رفع المرفقات
            if (request instanceof MultipartHttpServletRequest) {
                def files = request.getFiles('attachments')
                files.each { MultipartFile file ->
                    if (!file.empty && fileUploadService.isValidFileType(file)) {
                        def attachment = fileUploadService.uploadFile(file, "Task: ${task.title}")
                        attachment.task = task
                        attachment.uploadedBy = currentUser
                        attachment.save()
                    }
                }
            }

            // إرسال إشعار
            try {
                notificationService?.sendTaskAssignmentEmail(task)
            } catch (Exception e) {
                log.error "Failed to send notification: ${e.message}", e
            }

            flash.message = "Task created successfully"
            redirect(action: 'show', id: task.id)

        } catch (Exception e) {
            log.error "Error creating task: ${e.message}", e
            flash.error = "Error creating task: ${e.message}"
            redirect(action: 'create')
        }
    }

    def edit(Long id) {
        def task = Task.get(id)

        if (!task || !hasAccessToTask(task)) {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        if (!canEditTask(task)) {
            flash.error = "You don't have permission to edit this task"
            redirect(action: 'show', id: id)
            return
        }

        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()
        def interns = []

        if (role == 'ROLE_SUPERVISOR') {
            def supervisor = Supervisor.findByUser(currentUser)
            interns = Intern.findAllBySupervisor(supervisor)
        } else if (role == 'ROLE_ADMIN') {
            interns = Intern.list()
        }

        render(view: 'edit', model: [
                task: task,
                interns: interns,
                priorityList: ['HIGH', 'MEDIUM', 'LOW'],
                statusList: ['PENDING', 'IN_PROGRESS', 'COMPLETED', 'OVERDUE']
        ])
    }

//    def update(Long id) {
//        def task = Task.get(id)
//        if (!task || !hasAccessToTask(task)) {
//            flash.error = "Access denied"
//            redirect(action: 'index')
//            return
//        }
//
//        if (!canEditTask(task)) {
//            flash.error = "You don't have permission to edit this task"
//            redirect(action: 'show', id: id)
//            return
//        }
//
//        try {
//            def oldStatus = task.status
//
//            // تحديث البيانات الأساسية
//            task.title = params.title
//            task.description = params.description
//            task.dueDate = params.date('dueDate', 'yyyy-MM-dd')
//            task.priority = params.priority
//
//            if (getCurrentUserRole() in ['ROLE_ADMIN', 'ROLE_SUPERVISOR']) {
//                task.status = params.status
//            }
//
//            // ✅ معالجة المرفقات الجديدة
//            if (request instanceof MultipartHttpServletRequest) {
//                def files = request.getFiles('attachments')
//                files.each { MultipartFile file ->
//                    if (!file.empty && fileUploadService.isValidFileType(file)) {
//                        def attachment = fileUploadService.uploadFile(file, "Task: ${task.title}")
//                        attachment.task = task
//                        attachment.uploadedBy = springSecurityService.currentUser
//                        attachment.save()
//                    }
//                }
//            }
//
//            if (!task.save(flush: true)) {
//                flash.error = "Failed to update task"
//                redirect(action: 'edit', id: id)
//                return
//            }
//
//            // إرسال إشعار إذا تغيرت الحالة إلى COMPLETED
//            if (oldStatus != 'COMPLETED' && task.status == 'COMPLETED') {
//                try {
//                    notificationService?.sendTaskCompletedEmail(task)
//                } catch (Exception e) {
//                    log.error "Failed to send completion notification: ${e.message}", e
//                }
//            }
//
//            flash.message = "Task updated successfully"
//            redirect(action: 'show', id: task.id)
//
//        } catch (Exception e) {
//            log.error "Error updating task: ${e.message}", e
//            flash.error = "Error updating task: ${e.message}"
//            redirect(action: 'edit', id: id)
//        }
//    }
    @Transactional
    def update(Long id) {
        def task = Task.get(id)

        println "=== بداية التحديث ==="
        println "ID: ${id}"
        println "Title from form: ${params.title}"
        println "DueDate from form: ${params.dueDate}"
        println "Task before update: ${task.title} - ${task.dueDate}"

        // تحديث البيانات
        task.title = params.title
        task.description = params.description
        task.dueDate = params.date('dueDate', 'yyyy-MM-dd')
        task.priority = params.priority

        println "Task after update: ${task.title} - ${task.dueDate}"

        if (!task.save(flush: true)) {
            println "خطأ في الحفظ: ${task.errors}"
            flash.error = "Failed to update task"
            redirect(action: 'edit', id: id)
            return
        }

        println "تم الحفظ بنجاح"
        println "=== نهاية التحديث ==="

        flash.message = "Task updated successfully"
        redirect(action: 'show', id: task.id)
    }

    def delete(Long id) {
        def task = Task.get(id)

        if (!task || !hasAccessToTask(task)) {
            flash.error = "Access denied"
            redirect(action: 'index')
            return
        }

        if (!canDeleteTask(task)) {
            flash.error = "You don't have permission to delete this task"
            redirect(action: 'show', id: id)
            return
        }

        try {
            // حذف المرفقات أولاً
            task.attachments?.each { attachment ->
                fileUploadService.deleteFile(attachment)
            }

            task.delete(flush: true)
            flash.message = "Task deleted successfully"

        } catch (Exception e) {
            log.error "Error deleting task: ${e.message}", e
            flash.error = "Error deleting task: ${e.message}"
        }

        redirect(action: 'index')
    }

    def updateStatus() {
        try {
            def task = Task.get(params.id)

            if (!task || !hasAccessToTask(task)) {
                render([success: false, message: 'Access denied'] as JSON)
                return
            }

            if (!(getCurrentUserRole() in ['ROLE_ADMIN', 'ROLE_SUPERVISOR'])) {
                render([success: false, message: 'Not allowed'] as JSON)
                return
            }

            task = taskService.updateTaskStatus(task.id, params.status, params.feedback)
            render([success: true, task: task] as JSON)

        } catch (Exception e) {
            log.error "Error updating status: ${e.message}", e
            render([success: false, message: e.message] as JSON)
        }
    }

    // دوال المساعدة الخاصة بالصلاحيات
    private boolean hasAccessToTask(Task task) {
        def currentUser = springSecurityService.currentUser
        def role = getCurrentUserRole()

        switch(role) {
            case 'ROLE_ADMIN':
                return true
            case 'ROLE_SUPERVISOR':
                def supervisor = Supervisor.findByUser(currentUser)
                return task.intern?.supervisor == supervisor
            case 'ROLE_INTERN':
                def intern = Intern.findByUser(currentUser)
                return task.intern == intern
            default:
                return false
        }
    }

    private boolean canEditTask(Task task) {
        def role = getCurrentUserRole()
        return role in ['ROLE_ADMIN', 'ROLE_SUPERVISOR']
    }

    private boolean canDeleteTask(Task task) {
        def role = getCurrentUserRole()
        return role == 'ROLE_ADMIN'
    }

    private String getCurrentUserRole() {
        def roles = springSecurityService.authentication?.authorities*.authority
        if (roles?.contains('ROLE_ADMIN')) return 'ROLE_ADMIN'
        if (roles?.contains('ROLE_SUPERVISOR')) return 'ROLE_SUPERVISOR'
        if (roles?.contains('ROLE_INTERN')) return 'ROLE_INTERN'
        return null
    }
}