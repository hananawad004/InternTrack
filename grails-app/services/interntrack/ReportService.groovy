//// File: grails-app/services/intern/track/ReportService.groovy
//package interntrack
//
//import grails.gorm.transactions.Transactional
//import  interntrack.FileUploadService
//@Transactional
//class ReportService {
//
//    FileUploadService fileUploadService
//
////    WeeklyReport submitWeeklyReport(Map params, Intern intern) {
////        // Check for duplicate week report
////        def existingReport = WeeklyReport.createCriteria().get {
////            eq('intern', intern)
////            eq('weekNumber', params.weekNumber as Integer)
////        }
////
////        if (existingReport) {
////            throw new IllegalArgumentException("Weekly report for week ${params.weekNumber} already exists")
////        }
////
////        WeeklyReport report = new WeeklyReport(params)
////        report.intern = intern
////        report.status = 'SUBMITTED'
////        report.reportDate = new Date()
////
////        if (!report.save(flush: true)) {
////            throw new RuntimeException("Failed to save weekly report: ${report.errors}")
////        }
////
////        return report
////    }
//    WeeklyReport submitWeeklyReport(Map params, Intern intern) {
//        // Check for duplicate week report
//        def existingReport = WeeklyReport.findByInternAndWeekNumber(intern, params.weekNumber)
//
//        if (existingReport) {
//            throw new IllegalArgumentException("Weekly report for week ${params.weekNumber} already exists")
//        }
//
//        WeeklyReport report = new WeeklyReport(params)
//        report.intern = intern
//        report.status = 'SUBMITTED'
//        report.reportDate = new Date()
//
//        if (!report.save(flush: true)) {
//            throw new RuntimeException("Failed to save weekly report: ${report.errors}")
//        }
//
//        return report
//    }
//    WeeklyReport reviewReport(Long reportId, String status, String comments = null) {
//        WeeklyReport report = WeeklyReport.get(reportId)
//        if (!report) {
//            throw new IllegalArgumentException("Report not found")
//        }
//
//        report.status = status
//        if (comments) {
//            report.supervisorComments = comments
//        }
//
//        if (!report.save(flush: true)) {
//            throw new RuntimeException("Failed to update report: ${report.errors}")
//        }
//
//        return report
//    }
//
//    Map getReportStatistics(Intern intern) {
//        def criteria = WeeklyReport.createCriteria()
//
//        def total = criteria.count {
//            eq('intern', intern)
//        }
//
//        def approved = criteria.count {
//            eq('intern', intern)
//            eq('status', 'APPROVED')
//        }
//
//        def submitted = criteria.count {
//            eq('intern', intern)
//            eq('status', 'SUBMITTED')
//        }
//
//        def underReview = criteria.count {
//            eq('intern', intern)
//            eq('status', 'UNDER_REVIEW')
//        }
//
//        def totalHours = WeeklyReport.executeQuery("""
//            SELECT COALESCE(SUM(hoursWorked), 0)
//            FROM WeeklyReport
//            WHERE intern = :intern
//        """, [intern: intern])[0] ?: 0
//
//        def avgHours = total > 0 ? (totalHours / total).round(2) : 0
//
//        return [
//                total: total,
//                approved: approved,
//                submitted: submitted,
//                underReview: underReview,
//                totalHours: totalHours,
//                avgHours: avgHours
//        ]
//    }
//
//    List<WeeklyReport> getPendingReports(Supervisor supervisor) {
//        return WeeklyReport.createCriteria().list {
//            intern {
//                eq('supervisor', supervisor)
//            }
//            eq('status', 'SUBMITTED')
//            order('reportDate', 'desc')
//        }
//    }
//
//    Integer getCurrentWeekNumber() {
//        Calendar calendar = Calendar.instance
//        calendar.setMinimalDaysInFirstWeek(4)
//        calendar.setFirstDayOfWeek(Calendar.MONDAY)
//        return calendar.get(Calendar.WEEK_OF_YEAR)
//    }
//
//    Map getWeekRange(Integer weekNumber, Integer year = null) {
//        if (!year) {
//            year = Calendar.instance.get(Calendar.YEAR)
//        }
//
//        Calendar calendar = Calendar.instance
//        calendar.clear()
//        calendar.set(Calendar.YEAR, year)
//        calendar.set(Calendar.WEEK_OF_YEAR, weekNumber)
//        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY)
//
//        Date startDate = calendar.time
//
//        calendar.add(Calendar.DAY_OF_WEEK, 6)
//        Date endDate = calendar.time
//
//        return [startDate: startDate, endDate: endDate]
//    }
//}
package interntrack

import grails.gorm.transactions.Transactional

@Transactional
class ReportService {

    WeeklyReport submitWeeklyReport(Map params, Intern intern) {
        println "=== ReportService.submitWeeklyReport ==="
        println "Params: ${params}"
        println "Intern: ${intern?.id} - ${intern?.user?.fullName}"

        // التحقق من وجود البيانات المطلوبة
        if (!params.weekNumber) {
            throw new IllegalArgumentException("Week number is required")
        }

        if (!params.weekStartDate) {
            throw new IllegalArgumentException("Week start date is required")
        }

        if (!params.weekEndDate) {
            throw new IllegalArgumentException("Week end date is required")
        }

        if (!params.accomplishments) {
            throw new IllegalArgumentException("Accomplishments are required")
        }

        // Check for duplicate week report
        def existingReport = WeeklyReport.findByInternAndWeekNumber(intern, params.weekNumber)

        if (existingReport) {
            throw new IllegalArgumentException("Weekly report for week ${params.weekNumber} already exists")
        }

        // إنشاء التقرير
        WeeklyReport report = new WeeklyReport()
        report.weekNumber = params.weekNumber as Integer
        report.weekStartDate = params.weekStartDate as Date
        report.weekEndDate = params.weekEndDate as Date
        report.accomplishments = params.accomplishments
        report.challenges = params.challenges
        report.lessonsLearned = params.lessonsLearned
        report.plansForNextWeek = params.plansForNextWeek
        report.hoursWorked = params.hoursWorked ?: 40
        report.status = 'SUBMITTED'
        report.reportDate = new Date()
        report.intern = intern

        println "Report before save: ${report.dump()}"

        if (!report.save(flush: true)) {
            println "Validation errors: ${report.errors}"
            throw new RuntimeException("Failed to save weekly report: ${report.errors}")
        }

        println "Report saved successfully with ID: ${report.id}"
        return report
    }

    WeeklyReport reviewReport(Long reportId, String status, String comments = null) {
        WeeklyReport report = WeeklyReport.get(reportId)
        if (!report) {
            throw new IllegalArgumentException("Report not found")
        }

        report.status = status
        if (comments) {
            report.supervisorComments = comments
        }
        report.reviewedDate = new Date()

        if (!report.save(flush: true)) {
            throw new RuntimeException("Failed to update report: ${report.errors}")
        }

        return report
    }

    Map getReportStatistics(Intern intern) {
        def total = WeeklyReport.countByIntern(intern) ?: 0
        def approved = WeeklyReport.countByInternAndStatus(intern, 'APPROVED') ?: 0
        def submitted = WeeklyReport.countByInternAndStatus(intern, 'SUBMITTED') ?: 0
        def underReview = WeeklyReport.countByInternAndStatus(intern, 'UNDER_REVIEW') ?: 0

        def totalHours = 0
        try {
            totalHours = WeeklyReport.executeQuery("""
                SELECT COALESCE(SUM(hoursWorked), 0) 
                FROM WeeklyReport 
                WHERE intern = :intern
            """, [intern: intern])[0] ?: 0
        } catch (Exception e) {
            println "Error calculating total hours: ${e.message}"
        }

        def avgHours = total > 0 ? (totalHours / total).round(2) : 0

        return [
                total: total,
                approved: approved,
                submitted: submitted,
                underReview: underReview,
                totalHours: totalHours,
                avgHours: avgHours
        ]
    }

    List<WeeklyReport> getPendingReports(Supervisor supervisor) {
        if (!supervisor) return []

        return WeeklyReport.createCriteria().list {
            intern {
                eq('supervisor', supervisor)
            }
            eq('status', 'SUBMITTED')
            order('reportDate', 'desc')
        }
    }

    Integer getCurrentWeekNumber() {
        Calendar calendar = Calendar.getInstance()
        calendar.setMinimalDaysInFirstWeek(4)
        calendar.setFirstDayOfWeek(Calendar.MONDAY)
        return calendar.get(Calendar.WEEK_OF_YEAR)
    }

    Map getWeekRange(Integer weekNumber, Integer year = null) {
        if (!year) {
            year = Calendar.getInstance().get(Calendar.YEAR)
        }

        Calendar calendar = Calendar.getInstance()
        calendar.clear()
        calendar.set(Calendar.YEAR, year)
        calendar.set(Calendar.WEEK_OF_YEAR, weekNumber)
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY)

        Date startDate = calendar.time

        calendar.add(Calendar.DAY_OF_WEEK, 6)
        Date endDate = calendar.time

        return [startDate: startDate, endDate: endDate]
    }
}