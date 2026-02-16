//// File: grails-app/services/intern/track/NotificationService.groovy
//package interntrack
//
//import grails.plugins.mail.MailService
//import interntrack.TaskService
//import interntrack.ReportService
//import org.springframework.mail.*
//
//import grails.gorm.transactions.Transactional
//
//
//@Transactional
//class NotificationService {
//
//    MailService mailService
//    TaskService taskService
//    ReportService reportService
//
//    void sendTaskAssignmentEmail(Task task) {
//        try {
//            def subject = "New Task Assigned: ${task.title}"
//            def body = """
//                <h3>New Task Assigned</h3>
//                <p>Dear ${task.intern.user.fullName},</p>
//                <p>A new task has been assigned to you:</p>
//                <ul>
//                    <li><strong>Task:</strong> ${task.title}</li>
//                    <li><strong>Description:</strong> ${task.description}</li>
//                    <li><strong>Due Date:</strong> ${task.dueDate.format('dd/MM/yyyy')}</li>
//                    <li><strong>Priority:</strong> ${task.priority}</li>
//                </ul>
//                <p>Please check your task list in the InternTrack system.</p>
//                <p>Best regards,<br>InternTrack System</p>
//            """
//
//            mailService.sendMail {
//                to task.intern.user.email
//                subject subject
//                html body
//            }
//
//            log.info("Task assignment email sent to ${task.intern.user.email}")
//        } catch (Exception e) {
//            log.error("Failed to send task assignment email: ${e.message}", e)
//        }
//    }
//
//    void sendReportStatusEmail(WeeklyReport report) {
//        try {
//            def subject = "Weekly Report Status Update"
//            def body = """
//                <h3>Report Status Update</h3>
//                <p>Dear ${report.intern.user.fullName},</p>
//                <p>Your weekly report for week ${report.weekNumber} has been ${report.status.toLowerCase()}.</p>
//                ${report.supervisorComments ? "<p><strong>Supervisor Comments:</strong> ${report.supervisorComments}</p>" : ""}
//                <p>Best regards,<br>InternTrack System</p>
//            """
//
//            mailService.sendMail {
//                to report.intern.user.email
//                subject subject
//                html body
//            }
//
//            log.info("Report status email sent to ${report.intern.user.email}")
//        } catch (Exception e) {
//            log.error("Failed to send report status email: ${e.message}", e)
//        }
//    }
//
//    void sendEvaluationNotification(Evaluation evaluation) {
//        try {
//            def subject = "New Evaluation Received"
//            def body = """
//                <h3>Evaluation Received</h3>
//                <p>Dear ${evaluation.intern.user.fullName},</p>
//                <p>A new evaluation has been submitted for you.</p>
//                <p><strong>Overall Score:</strong> ${evaluation.overallScore}/100</p>
//                <p><strong>Evaluator:</strong> ${evaluation.evaluatorName}</p>
//                <p>Please check your profile in the InternTrack system for details.</p>
//                <p>Best regards,<br>InternTrack System</p>
//            """
//
//            mailService.sendMail {
//                to evaluation.intern.user.email
//                subject subject
//                html body
//            }
//
//            log.info("Evaluation notification sent to ${evaluation.intern.user.email}")
//        } catch (Exception e) {
//            log.error("Failed to send evaluation notification: ${e.message}", e)
//        }
//    }
//
//    void sendDailyReminders() {
//        try {
//            def today = new Date()
//
//            // Check for overdue tasks
//            taskService.updateOverdueTasks()
//
//            // Check for missing weekly reports
//            def interns = Intern.findAllByStatus('ACTIVE')
//            def currentWeek = reportService.getCurrentWeekNumber()
//
//            interns.each { intern ->
//                def lastReport = WeeklyReport.findByIntern(intern, [sort: 'weekNumber', order: 'desc'])
//                if (!lastReport || lastReport.weekNumber < currentWeek) {
//                    sendMissingReportReminder(intern, currentWeek)
//                }
//            }
//
//            log.info("Daily reminders sent successfully")
//        } catch (Exception e) {
//            log.error("Failed to send daily reminders: ${e.message}", e)
//        }
//    }
//
//    private void sendMissingReportReminder(Intern intern, Integer currentWeek) {
//        try {
//            def subject = "Reminder: Missing Weekly Report"
//            def body = """
//                <h3>Weekly Report Reminder</h3>
//                <p>Dear ${intern.user.fullName},</p>
//                <p>This is a reminder to submit your weekly report for week ${currentWeek}.</p>
//                <p>Please submit your report through the InternTrack system as soon as possible.</p>
//                <p>Best regards,<br>InternTrack System</p>
//            """
//
//            mailService.sendMail {
//                to intern.user.email
//                subject subject
//                html body
//            }
//        } catch (Exception e) {
//            log.error("Failed to send missing report reminder: ${e.message}", e)
//        }
//    }
//}
package interntrack

import grails.plugins.mail.MailService
import grails.gorm.transactions.Transactional

@Transactional
class NotificationService {

    MailService mailService

    // ✅ استخدم def بدلاً من TaskService
    def taskService
    def reportService

    void sendTaskAssignmentEmail(Task task) {
        try {
            def subject = "New Task Assigned: ${task.title}"
            def body = """
                <h3>New Task Assigned</h3>
                <p>Dear ${task.intern.user.fullName},</p>
                <p>A new task has been assigned to you:</p>
                <ul>
                    <li><strong>Task:</strong> ${task.title}</li>
                    <li><strong>Description:</strong> ${task.description}</li>
                    <li><strong>Due Date:</strong> ${task.dueDate.format('dd/MM/yyyy')}</li>
                    <li><strong>Priority:</strong> ${task.priority}</li>
                </ul>
                <p>Please check your task list in the InternTrack system.</p>
                <p>Best regards,<br>InternTrack System</p>
            """

            mailService.sendMail {
                to task.intern.user.email
                subject subject
                html body
            }

            log.info("Task assignment email sent to ${task.intern.user.email}")
        } catch (Exception e) {
            log.error("Failed to send task assignment email: ${e.message}", e)
        }
    }

    void sendReportStatusEmail(WeeklyReport report) {
        try {
            def subject = "Weekly Report Status Update"
            def body = """
                <h3>Report Status Update</h3>
                <p>Dear ${report.intern.user.fullName},</p>
                <p>Your weekly report for week ${report.weekNumber} has been ${report.status.toLowerCase()}.</p>
                ${report.supervisorComments ? "<p><strong>Supervisor Comments:</strong> ${report.supervisorComments}</p>" : ""}
                <p>Best regards,<br>InternTrack System</p>
            """

            mailService.sendMail {
                to report.intern.user.email
                subject subject
                html body
            }

            log.info("Report status email sent to ${report.intern.user.email}")
        } catch (Exception e) {
            log.error("Failed to send report status email: ${e.message}", e)
        }
    }

    void sendEvaluationNotification(Evaluation evaluation) {
        try {
            def subject = "New Evaluation Received"
            def body = """
                <h3>Evaluation Received</h3>
                <p>Dear ${evaluation.intern.user.fullName},</p>
                <p>A new evaluation has been submitted for you.</p>
                <p><strong>Overall Score:</strong> ${evaluation.overallScore}/100</p>
                <p><strong>Evaluator:</strong> ${evaluation.evaluatorName}</p>
                <p>Please check your profile in the InternTrack system for details.</p>
                <p>Best regards,<br>InternTrack System</p>
            """

            mailService.sendMail {
                to evaluation.intern.user.email
                subject subject
                html body
            }

            log.info("Evaluation notification sent to ${evaluation.intern.user.email}")
        } catch (Exception e) {
            log.error("Failed to send evaluation notification: ${e.message}", e)
        }
    }

    void sendDailyReminders() {
        try {
            def today = new Date()

            // Check for overdue tasks
            taskService.updateOverdueTasks()

            // Check for missing weekly reports
            def interns = Intern.findAllByStatus('ACTIVE')
            def currentWeek = reportService.getCurrentWeekNumber()

            interns.each { intern ->
                def lastReport = WeeklyReport.findByIntern(intern, [sort: 'weekNumber', order: 'desc'])
                if (!lastReport || lastReport.weekNumber < currentWeek) {
                    sendMissingReportReminder(intern, currentWeek)
                }
            }

            log.info("Daily reminders sent successfully")
        } catch (Exception e) {
            log.error("Failed to send daily reminders: ${e.message}", e)
        }
    }

    private void sendMissingReportReminder(Intern intern, Integer currentWeek) {
        try {
            def subject = "Reminder: Missing Weekly Report"
            def body = """
                <h3>Weekly Report Reminder</h3>
                <p>Dear ${intern.user.fullName},</p>
                <p>This is a reminder to submit your weekly report for week ${currentWeek}.</p>
                <p>Please submit your report through the InternTrack system as soon as possible.</p>
                <p>Best regards,<br>InternTrack System</p>
            """

            mailService.sendMail {
                to intern.user.email
                subject subject
                html body
            }
        } catch (Exception e) {
            log.error("Failed to send missing report reminder: ${e.message}", e)
        }
    }
}