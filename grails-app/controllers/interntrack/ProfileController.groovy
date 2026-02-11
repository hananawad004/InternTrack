// File: grails-app/controllers/intern/track/ProfileController.groovy
package interntrack

import grails.plugin.springsecurity.SpringSecurityService
import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile
import interntrack.FileUploadService
class ProfileController {

    SpringSecurityService springSecurityService
    FileUploadService fileUploadService

    def index() {
        def currentUser = springSecurityService.currentUser

        def intern = Intern.findByUser(currentUser)
        def supervisor = Supervisor.findByUser(currentUser)

        render(view: 'index', model: [
                user: currentUser,
                intern: intern,
                supervisor: supervisor,
                isAdmin: springSecurityService.isLoggedIn() &&
                        springSecurityService.authentication.authorities*.authority.contains('ROLE_ADMIN')
        ])
    }

    def edit() {
        def currentUser = springSecurityService.currentUser

        render(view: 'edit', model: [user: currentUser])
    }

    def update() {
        def currentUser = springSecurityService.currentUser

        try {
            // Handle profile image upload
            if (request instanceof org.springframework.web.multipart.MultipartHttpServletRequest) {
                def file = request.getFile('profileImage')
                if (file && !file.empty) {
                    if (fileUploadService.isValidFileType(file) && file.size <= fileUploadService.getFileSizeLimit()) {
                        // Delete old image if exists
                        if (currentUser.profileImage) {
                            def oldImage = new Attachment(filePath: currentUser.profileImage)
                            fileUploadService.deleteFile(oldImage)
                        }

                        def attachment = fileUploadService.uploadFile(file, "Profile Image")
                        currentUser.profileImage = attachment.filePath
                    } else {
                        flash.error = "Invalid file type or size too large"
                        redirect(action: 'edit')
                        return
                    }
                }
            }

            currentUser.properties = params

            if (params.password) {
                currentUser.password = params.password
            }

            if (!currentUser.save(flush: true)) {
                throw new RuntimeException("Failed to update profile: ${currentUser.errors}")
            }

            flash.message = "Profile updated successfully"
            redirect(action: 'index')

        } catch (Exception e) {
            flash.error = "Error updating profile: ${e.message}"
            redirect(action: 'edit')
        }
    }

    def updatePassword() {
        try {
            def currentUser = springSecurityService.currentUser

            if (!params.currentPassword || !params.newPassword || !params.confirmPassword) {
                render([success: false, message: 'All password fields are required'] as JSON)
                return
            }

            if (params.newPassword != params.confirmPassword) {
                render([success: false, message: 'New passwords do not match'] as JSON)
                return
            }

            if (!springSecurityService.passwordEncoder.matches(params.currentPassword, currentUser.password)) {
                render([success: false, message: 'Current password is incorrect'] as JSON)
                return
            }

            currentUser.password = params.newPassword

            if (!currentUser.save(flush: true)) {
                render([success: false, message: 'Failed to update password'] as JSON)
                return
            }

            render([success: true, message: 'Password updated successfully'] as JSON)

        } catch (Exception e) {
            render([success: false, message: e.message] as JSON)
        }
    }

    def apiProfile() {
        def currentUser = springSecurityService.currentUser

        def profile = [
                username: currentUser.username,
                email: currentUser.email,
                fullName: currentUser.fullName,
                phone: currentUser.phone,
                profileImage: currentUser.profileImage,
                roles: currentUser.authorities*.authority,
                dateCreated: currentUser.dateCreated
        ]

        def intern = Intern.findByUser(currentUser)
        if (intern) {
            profile.intern = [
                    studentId: intern.studentId,
                    university: intern.university,
                    major: intern.major,
                    status: intern.status,
                    startDate: intern.startDate,
                    endDate: intern.endDate,
                    supervisor: intern.supervisor?.user?.fullName
            ]
        }

        def supervisor = Supervisor.findByUser(currentUser)
        if (supervisor) {
            profile.supervisor = [
                    employeeId: supervisor.employeeId,
                    department: supervisor.department,
                    position: supervisor.position,
                    internCount: supervisor.currentInternCount
            ]
        }

        render profile as JSON
    }
}