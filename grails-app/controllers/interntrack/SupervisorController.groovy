package interntrack

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

@Secured(['ROLE_ADMIN'])
@Transactional
class SupervisorController {

    SpringSecurityService springSecurityService

    // ============== Index / List ==============
    def index() {
        def supervisors = Supervisor.list()
        println "=== Supervisor List ==="
        println "Found ${supervisors.size()} supervisors"
        supervisors.each { s ->
            println "ID: ${s.id}, Name: ${s.user?.fullName}, Employee ID: ${s.employeeId}"
        }

        [supervisors: supervisors, supervisorCount: supervisors.size()]
    }

    // ============== Show ==============
    def show(Long id) {
        def supervisor = Supervisor.get(id)
        if (!supervisor) {
            flash.error = "Supervisor not found"
            redirect(action: 'index')
            return
        }
        [supervisor: supervisor]
    }

    // ============== Create ==============
    def create() {
        println "=== Create Supervisor ==="

        try {
            User selectedUser = null
            if (params.userId) {
                selectedUser = User.get(params.userId)
                println "Creating supervisor for user: ${selectedUser?.fullName} (ID: ${params.userId})"
            }

            render(view: 'create', model: [
                    supervisor: new Supervisor(),
                    maxInternsList: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20],
                    selectedUser: selectedUser
            ])
        } catch (Exception e) {
            println "Error in create: ${e.message}"
            e.printStackTrace()
            render(view: 'create', model: [
                    supervisor: new Supervisor(),
                    maxInternsList: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20]
            ])
        }
    }

    // ============== Save ==============
    def save() {
        println "=== Starting save() Supervisor ==="
        println "Params: ${params}"

        // التحقق من الحقول المطلوبة
        def missingFields = []
        if (!params.employeeId) missingFields << "Employee ID"
        if (!params.fullName) missingFields << "Full Name"
        if (!params.department) missingFields << "Department"
        if (!params.position) missingFields << "Position"

        if (missingFields) {
            flash.error = "Missing required fields: ${missingFields.join(', ')}"
            redirect(action: 'create')
            return
        }

        try {
            User user = null

            // 1. إذا تم تمرير userId، استخدم المستخدم الموجود
            if (params.userId) {
                user = User.get(params.userId)
                if (!user) {
                    flash.error = "User not found with ID: ${params.userId}"
                    redirect(action: 'create')
                    return
                }

                // تحديث بيانات المستخدم إذا لزم الأمر
                user.fullName = params.fullName
                if (params.email) user.email = params.email
                if (params.phone) user.phone = params.phone
                user.save(flush: true)
            } else {
                // 2. إذا لم يتم تمرير userId، أنشئ User جديد
                if (!params.email) {
                    flash.error = "Email is required"
                    redirect(action: 'create')
                    return
                }

                def encoder = new BCryptPasswordEncoder()

                String username = params.email
                String baseUsername = username
                int counter = 1

                while (User.findByUsername(username)) {
                    username = baseUsername.split('@')[0] + "+" + counter++ + "@" + baseUsername.split('@')[1]
                }

                user = new User(
                        username: username,
                        password: encoder.encode(params.password ?: 'super123'),
                        email: params.email,
                        fullName: params.fullName,
                        phone: params.phone ?: null,
                        enabled: true
                )

                if (!user.save(flush: true)) {
                    log.error "Failed to save user: ${user.errors}"
                    flash.error = "Failed to create user account: ${user.errors}"
                    redirect(action: 'create')
                    return
                }

                // إضافة Role SUPERVISOR
                def role = Role.findByAuthority('ROLE_SUPERVISOR')
                if (!role) {
                    role = new Role(authority: 'ROLE_SUPERVISOR').save(flush: true)
                }

                if (role && !UserRole.exists(user.id, role.id)) {
                    new UserRole(user: user, role: role).save(flush: true)
                }
            }

            // 3. إنشاء Supervisor جديد
            def supervisor = new Supervisor()
            supervisor.user = user
            supervisor.employeeId = params.employeeId
            supervisor.department = params.department
            supervisor.position = params.position
            supervisor.maxInterns = params.int('maxInterns') ?: 5
            supervisor.officeLocation = params.officeLocation ?: null
            supervisor.phoneExtension = params.phoneExtension ?: null
            supervisor.qualifications = params.qualifications ?: null

            // التحقق من عدم وجود Supervisor بنفس الـ Employee ID
            def existingSupervisor = Supervisor.findByEmployeeId(supervisor.employeeId)
            if (existingSupervisor) {
                if (!params.userId) { // فقط احذف المستخدم إذا تم إنشاؤه جديداً
                    user.delete()
                }
                flash.error = "Employee ID already exists: ${supervisor.employeeId}"
                redirect(action: 'create')
                return
            }

            // التحقق من عدم وجود Supervisor لهذا المستخدم
            def existingUserSupervisor = Supervisor.findByUser(user)
            if (existingUserSupervisor) {
                flash.error = "User already has a supervisor profile"
                redirect(action: 'create')
                return
            }

            // حفظ الـ Supervisor
            if (!supervisor.save(flush: true)) {
                log.error "Failed to save supervisor: ${supervisor.errors}"
                if (!params.userId) { // فقط احذف المستخدم إذا تم إنشاؤه جديداً
                    user.delete()
                }
                flash.error = "Failed to create supervisor: ${supervisor.errors}"
                redirect(action: 'create')
                return
            }

            flash.message = "✅ Supervisor created successfully for user: ${user.fullName}"
            redirect(action: 'show', id: supervisor.id)

        } catch (Exception e) {
            log.error "Error creating supervisor: ${e.message}", e
            flash.error = "Error creating supervisor: ${e.message}"
            redirect(action: 'create')
        }
    }

    // ============== Edit ==============
    def edit(Long id) {
        def supervisor = Supervisor.get(id)
        if (!supervisor) {
            flash.error = "Supervisor not found"
            redirect(action: 'index')
            return
        }

        [
                supervisor: supervisor,
                maxInternsList: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20]
        ]
    }

    // ============== Update ==============
    def update(Long id) {
        def supervisor = Supervisor.get(id)
        if (!supervisor) {
            flash.error = "Supervisor not found"
            redirect(action: 'index')
            return
        }

        // تحديث بيانات Supervisor
        supervisor.employeeId = params.employeeId
        supervisor.department = params.department
        supervisor.position = params.position
        supervisor.maxInterns = params.int('maxInterns') ?: 5
        supervisor.officeLocation = params.officeLocation
        supervisor.phoneExtension = params.phoneExtension
        supervisor.qualifications = params.qualifications

        // تحديث بيانات User المرتبط
        def user = supervisor.user
        if (user) {
            user.fullName = params.fullName
            user.email = params.email ?: user.email
            user.phone = params.phone ?: user.phone
            if (params.password) {
                def encoder = new BCryptPasswordEncoder()
                user.password = encoder.encode(params.password)
            }
            user.save(flush: true)
        }

        if (supervisor.save(flush: true)) {
            flash.message = "✅ Supervisor updated successfully"
            redirect(action: 'show', id: supervisor.id)
        } else {
            flash.error = "❌ Error updating supervisor"
            render(view: 'edit', model: [
                    supervisor: supervisor,
                    maxInternsList: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 20]
            ])
        }
    }

    // ============== Delete ==============
    def delete(Long id) {
        def supervisor = Supervisor.get(id)
        if (!supervisor) {
            flash.error = "Supervisor not found"
            redirect(action: 'index')
            return
        }

        try {
            def user = supervisor.user
            supervisor.delete(flush: true)
            flash.message = "✅ Supervisor deleted successfully"
        } catch (Exception e) {
            flash.error = "❌ Error deleting supervisor: ${e.message}"
        }

        redirect(action: 'index')
    }
    def debug() {
        println "=== DEBUG SUPERVISOR ==="
        println "Current User: ${springSecurityService.currentUser}"
        println "All Users in DB:"
        User.list().each { u ->
            println "ID: ${u.id}, Username: ${u.username}, FullName: ${u.fullName}"
        }
        println "All Supervisors in DB:"
        Supervisor.list().each { s ->
            println "ID: ${s.id}, User ID: ${s.user?.id}, Name: ${s.user?.fullName}"
        }
        render "Check console for debug info"
    }
}