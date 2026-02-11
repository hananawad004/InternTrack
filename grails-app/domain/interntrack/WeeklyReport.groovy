//// File: grails-app/domain/intern/track/WeeklyReport.groovy
//package interntrack
//
//class WeeklyReport {
//
//    Integer weekNumber
//    Date reportDate = new Date()
//    Date weekStartDate
//    Date weekEndDate
//    String accomplishments
//    String challenges
//    String lessonsLearned
//    String plansForNextWeek
//    Integer hoursWorked
//    String status = 'SUBMITTED' // SUBMITTED, UNDER_REVIEW, APPROVED, REJECTED
//    String supervisorComments
//    Date reviewedDate
//
//
//    // Relationships
//    static belongsTo = [intern: Intern]
//    static hasMany = [attachments: Attachment]
//
//    static constraints = {
//        weekNumber min: 1, max: 52
//        weekStartDate nullable: false
//        weekEndDate nullable: false
//        accomplishments blank: false, maxSize: 5000
//        challenges nullable: true, maxSize: 2000
//        lessonsLearned nullable: true, maxSize: 2000
//        plansForNextWeek nullable: true, maxSize: 2000
//        hoursWorked min: 0, max: 100
//        status inList: ['SUBMITTED', 'UNDER_REVIEW', 'APPROVED', 'REJECTED']
//        supervisorComments nullable: true, maxSize: 2000
//        reviewedDate nullable: true
//    }
//
//    static mapping = {
//        attachments cascade: 'all-delete-orphan'
//        sort reportDate: 'desc'
//    }
//
//    String toString() {
//        return "Week ${weekNumber} - ${intern?.user?.fullName}"
//    }
//
//    Boolean isSubmitted() {
//        return status == 'SUBMITTED'
//    }
//
//    Boolean isApproved() {
//        return status == 'APPROVED'
//    }
//
//    def beforeUpdate() {
//        if (status in ['APPROVED', 'REJECTED'] && !reviewedDate) {
//            reviewedDate = new Date()
//        }
//    }
//}
// File: grails-app/domain/interntrack/WeeklyReport.groovy
package interntrack

class WeeklyReport {

    Integer weekNumber
    Date reportDate = new Date()
    Date weekStartDate
    Date weekEndDate
    String accomplishments
    String challenges
    String lessonsLearned
    String plansForNextWeek
    Integer hoursWorked
    String status = 'SUBMITTED' // SUBMITTED, UNDER_REVIEW, APPROVED, REJECTED
    String supervisorComments
    Date reviewedDate

    // Relationships
    static belongsTo = [intern: Intern]
    static hasMany = [attachments: Attachment]

    static constraints = {
        weekNumber min: 1, max: 52
        weekStartDate nullable: false
        weekEndDate nullable: false
        accomplishments blank: false, maxSize: 5000
        challenges nullable: true, maxSize: 2000
        lessonsLearned nullable: true, maxSize: 2000
        plansForNextWeek nullable: true, maxSize: 2000
        hoursWorked min: 0, max: 100
        status inList: ['SUBMITTED', 'UNDER_REVIEW', 'APPROVED', 'REJECTED']
        supervisorComments nullable: true, maxSize: 2000
        reviewedDate nullable: true
        // ✅ لا يوجد dateCreated/lastUpdated
    }

    static mapping = {
        attachments cascade: 'all-delete-orphan'
        sort reportDate: 'desc'
        // ✅ لا يوجد autoTimestamp
    }

    String toString() {
        return "Week ${weekNumber} - ${intern?.user?.fullName}"
    }

    Boolean isSubmitted() {
        return status == 'SUBMITTED'
    }

    Boolean isApproved() {
        return status == 'APPROVED'
    }

    def beforeUpdate() {
        if (status in ['APPROVED', 'REJECTED'] && !reviewedDate) {
            reviewedDate = new Date()
        }
    }
}