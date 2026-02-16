// File: grails-app/controllers/interntrack/InternController.groovy
package interntrack

import grails.gorm.transactions.Transactional
import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

@Secured(['ROLE_SUPERVISOR', 'ROLE_ADMIN'])
@Transactional
class InternController {

    SpringSecurityService springSecurityService

    // ============== Index / List ==============
    def index() {
        def currentUser = springSecurityService.currentUser
        def role = currentUser.authorities*.authority[0]

        def internList = []

        if (role == 'ROLE_ADMIN') {
            internList = Intern.list(sort: 'startDate', order: 'desc')
        } else if (role == 'ROLE_SUPERVISOR') {
            def supervisor = Supervisor.findByUser(currentUser)
            internList = Intern.findAllBySupervisor(supervisor, [sort: 'startDate', order: 'desc'])
        }

        [internList: internList, internCount: internList.size()]
    }

    // ============== Show ==============
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

        [intern: intern]
    }

    // ============== Create ==============
//    def create() {
//        render(view: 'create', model: getCreateModel())
//    }
//    def create() {
//
//        def calendar = Calendar.getInstance()
//        calendar.add(Calendar.DAY_OF_MONTH, 90)
//
//        [
//                intern: new Intern(),
//                supervisors: Supervisor.list(),
//                yearOfStudyList: ['1','2','3','4'],
//                defaultEndDate: calendar.time
//        ]
//    }
    def create() {
        println "=== Create Intern ==="

        try {
            // ✅ جلب قائمة المشرفين مع التأكد من عدم وجود null
            def supervisors = Supervisor.list().findAll { it != null && it.user != null }

            // ✅ قائمة سنوات الدراسة
            def yearOfStudyList = ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate']

            // ✅ تاريخ انتهاء افتراضي (90 يوم من اليوم)
            def calendar = Calendar.getInstance()
            calendar.add(Calendar.DAY_OF_MONTH, 90)
            def defaultEndDate = calendar.time

            println "Found ${supervisors?.size() ?: 0} supervisors"

            if (supervisors) {
                println "First supervisor: ${supervisors[0]?.user?.fullName} - ID: ${supervisors[0]?.id}"
            }

            render(view: 'create', model: [
                    intern: new Intern(),
                    supervisors: supervisors ?: [],
                    yearOfStudyList: yearOfStudyList,
                    defaultEndDate: defaultEndDate
            ])

        } catch (Exception e) {
            println "Error in create: ${e.message}"
            e.printStackTrace()

            // ✅ Model آمن
            def calendar = Calendar.getInstance()
            calendar.add(Calendar.DAY_OF_MONTH, 90)

            render(view: 'create', model: [
                    intern: new Intern(),
                    supervisors: [],
                    yearOfStudyList: ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate'],
                    defaultEndDate: calendar.time
            ])
        }
    }
    // ============== Save ==============
    @Transactional
    def save() {
        def intern = new Intern()

        // Bind data from form
        bindData(intern, params, [
                include: [
                        'studentId', 'university', 'major', 'department',
                        'yearOfStudy', 'startDate', 'endDate', 'status',
                        'notes', 'emergencyContact', 'emergencyPhone'
                ]
        ])

        // ✅ إنشاء User جديد - استخدم إيميل حقيقي
        def encoder = new BCryptPasswordEncoder()

        // استخدام نطاق إيميل حقيقي
        String baseUsername = params.studentId + "@student.university.edu"
        String username = baseUsername
        int counter = 1

        while (User.findByUsername(username)) {
            username = params.studentId + "+" + counter++ + "@student.university.edu"
        }

        String fullName = params.fullName ?: "Intern " + params.studentId

        def user = new User(
                username: username,
                password: encoder.encode('intern123'),
                email: username,  // نفس الإيميل
                fullName: fullName,
                enabled: true
        )

        // ✅ حفظ User
        if (!user.save(flush: true)) {
            def errors = user.errors.allErrors.collect {
                def field = it.arguments?.find { arg -> arg instanceof org.springframework.validation.FieldError }?.field
                field ? "${field}: ${it.defaultMessage}" : it.defaultMessage
            }.join(', ')

            flash.error = "❌ Could not create user account: ${errors ?: 'Unknown error'}"
            render(view: 'create', model: getCreateModel())
            return
        }

        // Assign ROLE_INTERN
        def role = Role.findByAuthority('ROLE_INTERN')
        if (role && !UserRole.exists(user.id, role.id)) {
            new UserRole(user: user, role: role).save(flush: true)
        }

        intern.user = user
        flash.message = "✅ User account created: ${username} / intern123"

        // ✅ باقي الكود...
        // تعيين المشرف، التحقق من Student ID، إلخ

        // ✅ تعيين المشرف
        if (!params.supervisorId) {
            flash.error = "❌ Please select a supervisor"
            render(view: 'create', model: getCreateModel())
            return
        }

        def supervisor = Supervisor.get(params.supervisorId)
        if (!supervisor) {
            flash.error = "❌ Supervisor not found"
            render(view: 'create', model: getCreateModel())
            return
        }
        intern.supervisor = supervisor

        // ✅ التأكد من Student ID فريد
        def existingIntern = Intern.findByStudentId(intern.studentId)
        if (existingIntern) {
            intern.studentId = intern.studentId + "-" + System.currentTimeMillis().toString().takeRight(3)
            flash.warning = "⚠️ Student ID was changed to: ${intern.studentId}"
        }

        // ✅ القيم الافتراضية
        intern.totalHours = 0.0G
        intern.status = intern.status ?: 'ACTIVE'

        // ✅ حفظ Intern
        if (intern.save(flush: true)) {
            flash.message = "✅ Intern created successfully. ${flash.message}"
            redirect(action: 'show', id: intern.id)
        } else {
            def errors = intern.errors.allErrors.collect {
                def field = it.arguments?.find { arg -> arg instanceof org.springframework.validation.FieldError }?.field
                field ? "${field}: ${it.defaultMessage}" : it.defaultMessage
            }.join(', ')

            flash.error = "❌ Error creating intern: ${errors}"
            render(view: 'create', model: getCreateModel())
        }
    }
//   ===== Edit ==============
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

        def currentUser = springSecurityService.currentUser
        def role = currentUser.authorities*.authority[0]
        def supervisors = []

        if (role == 'ROLE_ADMIN') {
            supervisors = Supervisor.list()
        } else if (role == 'ROLE_SUPERVISOR') {
            def supervisor = Supervisor.findByUser(currentUser)
            supervisors = [supervisor]
        }

        [
                intern: intern,
                supervisors: supervisors,
                yearOfStudyList: ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate']
        ]
    }

    // ============== Update ==============
    @Transactional
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

        bindData(intern, params, [
                include: [
                        'studentId', 'university', 'major', 'department',
                        'yearOfStudy', 'startDate', 'endDate', 'status',
                        'notes', 'emergencyContact', 'emergencyPhone', 'totalHours'
                ]
        ])

        if (params.supervisorId) {
            def supervisor = Supervisor.get(params.supervisorId)
            if (supervisor) {
                intern.supervisor = supervisor
            }
        }

        if (intern.save(flush: true)) {
            flash.message = "✅ Intern updated successfully"
            redirect(action: 'show', id: intern.id)
        } else {
            flash.error = "❌ Error updating intern"
            render(view: 'edit', model: [
                    intern: intern,
                    supervisors: Supervisor.list(),
                    yearOfStudyList: ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate']
            ])
        }
    }

    // ============== Delete ==============
    @Transactional
    def delete(Long id) {
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
            intern.delete(flush: true)
            flash.message = "✅ Intern deleted successfully"
        } catch (Exception e) {
            flash.error = "❌ Error deleting intern: ${e.message}"
        }

        redirect(action: 'index')
    }

    // ============== Helper Methods ==============
    private def getCreateModel() {
        def currentUser = springSecurityService.currentUser
        def role = currentUser.authorities*.authority[0]
        def supervisors = []

        if (role == 'ROLE_ADMIN') {
            supervisors = Supervisor.list()
        } else if (role == 'ROLE_SUPERVISOR') {
            def supervisor = Supervisor.findByUser(currentUser)
            supervisors = [supervisor]
        }

        Calendar cal = Calendar.getInstance()
        cal.add(Calendar.DAY_OF_MONTH, 90)
        Date defaultEndDate = cal.time

        return [
                intern: new Intern(),
                supervisors: supervisors,
                yearOfStudyList: ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate'],
                defaultEndDate: defaultEndDate
        ]
    }

    private boolean hasAccessToIntern(Intern intern) {
        def currentUser = springSecurityService.currentUser
        def role = currentUser.authorities*.authority[0]

        if (role == 'ROLE_ADMIN') {
            return true
        } else if (role == 'ROLE_SUPERVISOR') {
            def supervisor = Supervisor.findByUser(currentUser)
            return intern.supervisor == supervisor
        }
        return false
    }
}