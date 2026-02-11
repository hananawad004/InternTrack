// File: grails-app/services/intern/track/ScheduledJobService.groovy
package interntrack
import interntrack.NotificationService
import interntrack.TaskService

import grails.gorm.transactions.Transactional
import org.quartz.*

@Transactional
class ScheduledJobService {

    NotificationService notificationService
    TaskService taskService

    void executeDailyJob() {
        log.info("Executing daily scheduled job at ${new Date()}")

        try {
            // Update overdue tasks
            def overdueCount = taskService.updateOverdueTasks()
            log.info("Updated ${overdueCount} overdue tasks")

            // Send daily reminders
            notificationService.sendDailyReminders()

            // Check for internships ending soon
            checkEndingInternships()

            log.info("Daily job completed successfully")
        } catch (Exception e) {
            log.error("Error in daily job: ${e.message}", e)
        }
    }

    void executeWeeklyJob() {
        log.info("Executing weekly scheduled job at ${new Date()}")

        try {
            generateWeeklyReports()
            sendWeeklySummaries()
            log.info("Weekly job completed successfully")
        } catch (Exception e) {
            log.error("Error in weekly job: ${e.message}", e)
        }
    }

    private void checkEndingInternships() {
        def warningDate = new Date() + 7 // 1 week warning

        def endingInterns = Intern.createCriteria().list {
            eq('status', 'ACTIVE')
            le('endDate', warningDate)
            ge('endDate', new Date())
        }

        endingInterns.each { intern ->
            sendInternshipEndingWarning(intern)
        }
    }

    private void sendInternshipEndingWarning(Intern intern) {
        try {
            def daysRemaining = intern.remainingDays
            def subject = "Internship Ending Soon"
            def body = """
                <h3>Internship Ending Reminder</h3>
                <p>Dear ${intern.user.fullName},</p>
                <p>Your internship is ending in ${daysRemaining} days (${intern.endDate.format('dd/MM/yyyy')}).</p>
                <p>Please ensure all tasks and reports are completed.</p>
                <p>Best regards,<br>InternTrack System</p>
            """

            mailService.sendMail {
                to intern.user.email
                cc intern.supervisor?.user?.email
                subject subject
                html body
            }
        } catch (Exception e) {
            log.error("Failed to send internship ending warning: ${e.message}", e)
        }
    }

    private void generateWeeklyReports() {
        // Generate system reports for the past week
        def reportData = [
                totalInterns: Intern.count(),
                activeInterns: Intern.countByStatus('ACTIVE'),
                completedTasks: Task.countByStatus('COMPLETED'),
                submittedReports: WeeklyReport.countByStatus('SUBMITTED'),
                date: new Date()
        ]

        log.info("Weekly report generated: ${reportData}")
    }

    private void sendWeeklySummaries() {
        def supervisors = Supervisor.list()

        supervisors.each { supervisor ->
            sendSupervisorWeeklySummary(supervisor)
        }
    }

    private void sendSupervisorWeeklySummary(Supervisor supervisor) {
        try {
            def interns = Intern.findAllBySupervisor(supervisor)

            def summary = """
                <h3>Weekly Summary for ${supervisor.user.fullName}</h3>
                <p><strong>Date:</strong> ${new Date().format('dd/MM/yyyy')}</p>
                <p><strong>Total Interns:</strong> ${interns.size()}</p>
                <hr>
            """

            interns.each { intern ->
                def taskStats = taskService.getTaskStatistics(intern)
                summary += """
                    <p><strong>${intern.user.fullName}</strong></p>
                    <ul>
                        <li>Tasks Completed: ${taskStats.completed}/${taskStats.total}</li>
                        <li>Completion Rate: ${taskStats.completionRate}%</li>
                        <li>Overdue Tasks: ${taskStats.overdue}</li>
                    </ul>
                """
            }

            mailService.sendMail {
                to supervisor.user.email
                subject "Weekly Internship Summary"
                html summary
            }
        } catch (Exception e) {
            log.error("Failed to send weekly summary: ${e.message}", e)
        }
    }
}