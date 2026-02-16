package interntrack

import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
 import interntrack.ReportService
import interntrack.FileUploadService
import interntrack.NotificationService
class WeeklyReportController {

    SpringSecurityService springSecurityService
    ReportService reportService
    FileUploadService fileUploadService
    NotificationService notificationService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    /* ===== SECURITY HELPERS ===== */
//    private boolean hasRole(String role) {
//        springSecurityService.authentication.authorities*.authority.contains(role)
//    }

    /* ===== INDEX ===== */
//    def index() {
//        def currentUser = springSecurityService.currentUser
//        def reportList = []
//
//        if (hasRole('ROLE_INTERN')) {
//            def intern = Intern.findByUser(currentUser)
//            if (intern) {
//                reportList = WeeklyReport.findAllByIntern(intern, [sort: 'reportDate', order: 'desc'])
//            }
//
//        } else if (hasRole('ROLE_SUPERVISOR')) {
//            def supervisor = Supervisor.findByUser(currentUser)
//            if (supervisor) {
//                def interns = Intern.findAllBySupervisor(supervisor)
//                if (interns) {
//                    reportList = WeeklyReport.createCriteria().list {
//                        intern { inList('id', interns*.id) }
//                        order('reportDate', 'desc')
//                    }
//                }
//            }
//
//        } else if (hasRole('ROLE_ADMIN')) {
//            reportList = WeeklyReport.list([sort: 'reportDate', order: 'desc'])
//        }
//
//        render(view: 'index', model: [
//                reportList: reportList,
//                statusList: ['SUBMITTED', 'UNDER_REVIEW', 'APPROVED', 'REJECTED']
//        ])
//    }
    def index() {
        def currentUser = springSecurityService.currentUser
        def reportList = []
        def hasInternRole = false
        def hasSupervisorRole = false
        def hasAdminRole = false

        // Check roles
        def authorities = springSecurityService.authentication.authorities*.authority
        hasAdminRole = authorities.contains('ROLE_ADMIN')
        hasSupervisorRole = authorities.contains('ROLE_SUPERVISOR')
        hasInternRole = authorities.contains('ROLE_INTERN')

        if (hasInternRole) {
            def intern = Intern.findByUser(currentUser)
            if (intern) {
                reportList = WeeklyReport.findAllByIntern(intern, [sort: 'reportDate', order: 'desc'])
            }

        } else if (hasSupervisorRole) {
            def supervisor = Supervisor.findByUser(currentUser)
            if (supervisor) {
                def interns = Intern.findAllBySupervisor(supervisor)
                if (interns) {
                    reportList = WeeklyReport.createCriteria().list {
                        intern { inList('id', interns*.id) }
                        order('reportDate', 'desc')
                    }
                }
            }

        } else if (hasAdminRole) {
            reportList = WeeklyReport.list([sort: 'reportDate', order: 'desc'])
        }

        render(view: 'index', model: [
                reportList: reportList,
                statusList: ['SUBMITTED', 'UNDER_REVIEW', 'APPROVED', 'REJECTED'],
                hasRole: { String role ->
                    if (role == 'ROLE_INTERN') return hasInternRole
                    if (role == 'ROLE_SUPERVISOR') return hasSupervisorRole
                    if (role == 'ROLE_ADMIN') return hasAdminRole
                    return false
                }
        ])
    }
    /* ===== SHOW ===== */
    def show(Long id) {
        def report = WeeklyReport.get(id)
        if (!report) { flash.error = "Report not found"; redirect(action:'index'); return }
        if (!hasAccessToReport(report)) { flash.error="Access denied"; redirect(action:'index'); return }
        render(view: 'show', model: [report: report])
    }

    /* ===== CREATE ===== */
    def create() {
        def intern = Intern.findByUser(springSecurityService.currentUser)
        if (!intern) { flash.error="Intern profile not found"; redirect(action:'index'); return }

        def currentWeek = reportService.getCurrentWeekNumber()
        def weekRange = reportService.getWeekRange(currentWeek)

        def existingReport = WeeklyReport.findByInternAndWeekNumber(intern, currentWeek)
        if (existingReport) {
            flash.message = "You already submitted week ${currentWeek}"
            redirect(action:'show', id: existingReport.id)
            return
        }

        render(view:'create', model:[
                report: new WeeklyReport(
                        weekNumber: currentWeek,
                        weekStartDate: weekRange.startDate,
                        weekEndDate: weekRange.endDate,
                        hoursWorked: 40
                ),
                currentWeek: currentWeek,
                weekRange: weekRange
        ])
    }

    /* ===== SAVE ===== */
    def save() {
        try {
            def intern = Intern.findByUser(springSecurityService.currentUser)
            if (!intern) { flash.error="Intern profile not found"; redirect(action:'create'); return }

            def report = reportService.submitWeeklyReport(params, intern)
            if (!report) throw new RuntimeException("Could not save report")

            if (request instanceof MultipartHttpServletRequest) {
                request.getFiles('attachments').each { MultipartFile file ->
                    if (!file.empty && file.size <= 5_000_000 && fileUploadService.isValidFileType(file)) {
                        def attachment = fileUploadService.uploadFile(file, "Weekly Report Week ${report.weekNumber}")
                        attachment.weeklyReport = report
                        attachment.save()
                    }
                }
            }

            flash.message = "Weekly report submitted"
            redirect(action:'show', id: report.id)

        } catch (Exception e) {
            flash.error = "Error: ${e.message}"
            redirect(action:'create')
        }
    }

    /* ===== EDIT ===== */
    def edit(Long id) {
        def report = WeeklyReport.get(id)
        if (!report || !hasAccessToReport(report) || !report.isSubmitted()) {
            flash.error="Access denied"
            redirect(action:'index'); return
        }
        render(view:'edit', model:[report:report])
    }

    /* ===== UPDATE ===== */
    def update(Long id) {
        def report = WeeklyReport.get(id)
        if (!report || !hasAccessToReport(report) || !report.isSubmitted()) {
            flash.error="Access denied"
            redirect(action:'index'); return
        }

        try {
            bindData(report, params, [include:[
                    'accomplishments','challenges','lessonsLearned',
                    'plansForNextWeek','hoursWorked'
            ]])

            report.save(flush:true)

            if (request instanceof MultipartHttpServletRequest) {
                request.getFiles('attachments').each { MultipartFile file ->
                    if (!file.empty && file.size <= 5_000_000 && fileUploadService.isValidFileType(file)) {
                        def attachment = fileUploadService.uploadFile(file, "Weekly Report Week ${report.weekNumber}")
                        attachment.weeklyReport = report
                        attachment.save()
                    }
                }
            }

            flash.message="Report updated"
            redirect(action:'show', id:report.id)

        } catch (Exception e) {
            flash.error="Error: ${e.message}"
            redirect(action:'edit', id:id)
        }
    }

    /* ===== DELETE ===== */
    def delete(Long id) {
        def report = WeeklyReport.get(id)
        if (!report || !hasAccessToReport(report) || !report.isSubmitted()) {
            flash.error="Access denied"; redirect(action:'index'); return
        }

        report.attachments?.each {
            fileUploadService.deleteFile(it)
            it.delete()
        }

        report.delete(flush:true)
        flash.message="Report deleted"
        redirect(action:'index')
    }

    /* ===== REVIEW ===== */
    def review() {
        def supervisor = Supervisor.findByUser(springSecurityService.currentUser)
        if (!supervisor) { flash.error="Supervisor profile not found"; redirect(action:'index'); return }

        render(view:'review', model:[
                pendingReports: reportService.getPendingReports(supervisor),
                statusList:['APPROVED','REJECTED','UNDER_REVIEW']
        ])
    }

    /* ===== UPDATE STATUS ===== */
//    def updateStatus() {
//            try {
//                def report = WeeklyReport.get(params.id)
//                def supervisor = Supervisor.findByUser(springSecurityService.currentUser)
//
//                if (!report || !supervisor || report.intern.supervisor != supervisor) {
//                    render([success:false,message:'Access denied'] as JSON); return
//                }
//
//                report = reportService.reviewReport(report.id, params.status, params.comments)
//                notificationService.sendReportStatusEmail(report)
//
//                render([success:true] as JSON)
//            } catch (Exception e) {
//                render([success:false,message:e.message] as JSON)
//            }
//    }

    /* ===== API ===== */
    def apiReports() {
        def currentUser = springSecurityService.currentUser
        def reports = []

        if (hasRole('ROLE_INTERN')) {
            def intern = Intern.findByUser(currentUser)
            if (intern) reports = WeeklyReport.findAllByIntern(intern)

        } else if (hasRole('ROLE_SUPERVISOR')) {
            def supervisor = Supervisor.findByUser(currentUser)
            if (supervisor) reports = reportService.getPendingReports(supervisor)

        } else if (hasRole('ROLE_ADMIN')) {
            reports = WeeklyReport.list(params)
        }

        render reports as JSON
    }

    /* ===== ACCESS CHECK ===== */
    private boolean hasAccessToReport(WeeklyReport report) {
        def currentUser = springSecurityService.currentUser

        if (hasRole('ROLE_ADMIN')) return true
        if (hasRole('ROLE_SUPERVISOR')) {
            def supervisor = Supervisor.findByUser(currentUser)
            return report.intern.supervisor == supervisor
        }
        if (hasRole('ROLE_INTERN')) {
            def intern = Intern.findByUser(currentUser)
            return report.intern == intern
        }
        return false
    }
    // أضف هذا الأكشن في WeeklyReportController.groovy
// ضعه بعد أكشن review() وقبل updateStatus()

/**
 * عرض صفحة مراجعة تفصيلية لتقرير محدد
 */
    def reviewReport(Long id) {
        def report = WeeklyReport.get(id)

        if (!report) {
            flash.error = "Report not found"
            redirect(action: 'index')
            return
        }

        // Check supervisor permission
        def supervisor = Supervisor.findByUser(springSecurityService.currentUser)
        if (!supervisor || report.intern.supervisor.id != supervisor.id) {
            flash.error = "You don't have permission to review this report"
            redirect(controller: 'dashboard', action: 'supervisor')
            return
        }

        // Get attachments for this report
        def attachments = Attachment.findAllByWeeklyReport(report, [sort: 'dateUploaded', order: 'desc'])

        render(view: 'reviewReport', model: [
                report: report,
                attachments: attachments,
                supervisor: supervisor
        ])
    }

/**
 * تحديث حالة التقرير (للـ AJAX)
 */
    def updateStatus() {
        try {
            def report = WeeklyReport.get(params.id)
            def supervisor = Supervisor.findByUser(springSecurityService.currentUser)

            if (!report) {
                render([success: false, message: 'Report not found'] as JSON)
                return
            }

            if (!supervisor || report.intern.supervisor != supervisor) {
                render([success: false, message: 'Access denied'] as JSON)
                return
            }

            // تحديث التقرير
            report.status = params.status
            if (params.comments) {
                report.supervisorComments = params.comments
            }
            report.reviewedDate = new Date()
            report.save(flush: true)

            // إرسال إيميل الإشعار
            try {
                notificationService.sendReportStatusEmail(report)
            } catch (Exception e) {
                log.error("Failed to send notification email: ${e.message}")
            }

            render([success: true, message: "Report ${params.status.toLowerCase()} successfully"] as JSON)
        } catch (Exception e) {
            log.error("Error updating report status: ${e.message}", e)
            render([success: false, message: e.message] as JSON)
        }
    }
    // أضف هذه الدالة المساعدة في WeeklyReportController.groovy
    private boolean hasRole(String role) {
        def authorities = springSecurityService.authentication.authorities*.authority
        return authorities.contains(role)
    }
}
