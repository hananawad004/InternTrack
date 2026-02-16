// grails-app/controllers/interntrack/AttachmentController.groovy
package interntrack

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

@Secured(['ROLE_SUPERVISOR', 'ROLE_INTERN', 'ROLE_ADMIN'])
class AttachmentController {

    def fileUploadService
    def springSecurityService

    @Secured(['ROLE_SUPERVISOR', 'ROLE_INTERN', 'ROLE_ADMIN'])
    def download() {
        Attachment attachment = Attachment.get(params.id)

        if (!attachment) {
            response.sendError(404, "File not found")
            return
        }

        // Check permission
        if (!hasAccessToAttachment(attachment)) {
            response.sendError(403, "Access denied")
            return
        }

        byte[] fileData = fileUploadService.getFileBytes(attachment)

        if (fileData) {
            response.setContentType(attachment.contentType ?: 'application/octet-stream')
            response.setHeader("Content-Disposition", "attachment; filename=\"${attachment.originalFilename}\"")
            response.outputStream << fileData
        } else {
            response.sendError(404, "File data not found")
        }
    }

    @Secured(['ROLE_SUPERVISOR', 'ROLE_ADMIN'])
    def preview() {
        Attachment attachment = Attachment.get(params.id)

        if (!attachment) {
            render "File not found"
            return
        }

        if (!hasAccessToAttachment(attachment)) {
            render "Access denied"
            return
        }

        byte[] fileData = fileUploadService.getFileBytes(attachment)

        if (!fileData) {
            render "File data not found"
            return
        }

        // Preview images directly
        if (attachment.contentType?.startsWith('image/')) {
            response.setContentType(attachment.contentType)
            response.outputStream << fileData
        }
        // Preview PDF
        else if (attachment.contentType == 'application/pdf') {
            response.setContentType('application/pdf')
            response.setHeader("Content-Disposition", "inline; filename=\"${attachment.originalFilename}\"")
            response.outputStream << fileData
        }
        // For other files, show info
        else {
            render """
                <div class="text-center p-4">
                    <i class="${attachment.iconClass} fa-4x text-primary mb-3"></i>
                    <h5>${attachment.originalFilename}</h5>
                    <p class="text-muted">${attachment.fileSize} bytes</p>
                    <a href="${createLink(action: 'download', id: attachment.id)}" class="btn btn-primary mt-2">
                        <i class="fas fa-download me-2"></i>Download File
                    </a>
                </div>
            """
        }
    }

    @Secured(['ROLE_SUPERVISOR', 'ROLE_ADMIN'])
    def upload() {
        if (!(request instanceof MultipartHttpServletRequest)) {
            render([success: false, message: "No file uploaded"] as JSON)
            return
        }

        try {
            Long reportId = params.long('reportId')
            WeeklyReport report = WeeklyReport.get(reportId)

            if (!report) {
                render([success: false, message: "Report not found"] as JSON)
                return
            }

            // Check permission
            if (!hasAccessToReport(report)) {
                render([success: false, message: "Access denied"] as JSON)
                return
            }

            def files = request.getFiles('file')
            def uploadedFiles = []

            files.each { MultipartFile file ->
                if (!file.empty && file.size <= fileUploadService.getFileSizeLimit()) {
                    if (fileUploadService.isValidFileType(file)) {
                        Attachment attachment = fileUploadService.uploadFile(file, "Weekly Report Week ${report.weekNumber}")
                        attachment.weeklyReport = report
                        attachment.save(flush: true)

                        uploadedFiles << [
                                id: attachment.id,
                                name: attachment.originalFilename,
                                size: attachment.fileSize,
                                icon: attachment.iconClass
                        ]
                    }
                }
            }

            render([success: true, files: uploadedFiles] as JSON)

        } catch (Exception e) {
            render([success: false, message: e.message] as JSON)
        }
    }

    @Secured(['ROLE_SUPERVISOR', 'ROLE_ADMIN'])
    def delete() {
        Attachment attachment = Attachment.get(params.id)

        if (!attachment) {
            render([success: false, message: "File not found"] as JSON)
            return
        }

        if (!hasAccessToAttachment(attachment)) {
            render([success: false, message: "Access denied"] as JSON)
            return
        }

        try {
            fileUploadService.deleteFile(attachment)
            render([success: true] as JSON)
        } catch (Exception e) {
            render([success: false, message: e.message] as JSON)
        }
    }

    private boolean hasAccessToAttachment(Attachment attachment) {
        def currentUser = springSecurityService.currentUser
        def authorities = springSecurityService.authentication.authorities*.authority

        if (authorities.contains('ROLE_ADMIN')) {
            return true
        }

        if (authorities.contains('ROLE_SUPERVISOR')) {
            def supervisor = Supervisor.findByUser(currentUser)
            return attachment.weeklyReport?.intern?.supervisor == supervisor
        }

        if (authorities.contains('ROLE_INTERN')) {
            def intern = Intern.findByUser(currentUser)
            return attachment.weeklyReport?.intern == intern
        }

        return false
    }

    private boolean hasAccessToReport(WeeklyReport report) {
        def currentUser = springSecurityService.currentUser
        def authorities = springSecurityService.authentication.authorities*.authority

        if (authorities.contains('ROLE_ADMIN')) {
            return true
        }

        if (authorities.contains('ROLE_SUPERVISOR')) {
            def supervisor = Supervisor.findByUser(currentUser)
            return report.intern?.supervisor == supervisor
        }

        return false
    }
}