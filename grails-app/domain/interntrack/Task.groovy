//// File: grails-app/domain/intern/track/Task.groovy
//package interntrack
//
//class Task {
//
//    String title
//    String description
//    Date assignedDate = new Date()
//    Date dueDate
//    String status = 'PENDING' // PENDING, IN_PROGRESS, COMPLETED, OVERDUE, REJECTED
//    String priority = 'MEDIUM' // LOW, MEDIUM, HIGH, URGENT
//    Integer estimatedHours
//    Integer actualHours
//    String feedback
//    Boolean requiresApproval = true
//    Date completedDate
//
//
//    // Relationships
//    static belongsTo = [intern: Intern]
//    static hasMany = [attachments: Attachment]
//
//    static constraints = {
//        title blank: false
//        description blank: false, maxSize: 5000
//        dueDate nullable: false
//        status inList: ['PENDING', 'IN_PROGRESS', 'COMPLETED', 'OVERDUE', 'REJECTED']
//        priority inList: ['LOW', 'MEDIUM', 'HIGH', 'URGENT']
//        estimatedHours nullable: true, min: 1
//        actualHours nullable: true, min: 0
//        feedback nullable: true, maxSize: 2000
//        requiresApproval nullable: true
//        completedDate nullable: true
//    }
//
//    static mapping = {
//        attachments cascade: 'all-delete-orphan'
//        sort dueDate: 'asc'
//    }
//
//    String toString() {
//        return title
//    }
//
//    Boolean isOverdue() {
//        return status == 'OVERDUE' || (status == 'PENDING' && dueDate < new Date())
//    }
//
//    Integer getDaysRemaining() {
//        if (dueDate && status in ['PENDING', 'IN_PROGRESS']) {
//            return (dueDate - new Date()).intValue()
//        }
//        return 0
//    }
//
//    def beforeUpdate() {
//        if (status == 'COMPLETED' && !completedDate) {
//            completedDate = new Date()
//        }
//    }
//}
// File: grails-app/domain/interntrack/Task.groovy
package interntrack

class Task {

    String title
    String description
    Date assignedDate = new Date()
    Date dueDate
    String status = 'PENDING' // PENDING, IN_PROGRESS, COMPLETED, OVERDUE, REJECTED
    String priority = 'MEDIUM' // LOW, MEDIUM, HIGH, URGENT
    Integer estimatedHours
    Integer actualHours
    String feedback
    Boolean requiresApproval = true
    Date completedDate

    // Relationships
    static belongsTo = [intern: Intern]
    static hasMany = [attachments: Attachment]

    static constraints = {
        title blank: false
        description blank: false, maxSize: 5000
        dueDate nullable: false
        status inList: ['PENDING', 'IN_PROGRESS', 'COMPLETED', 'OVERDUE', 'REJECTED']
        priority inList: ['LOW', 'MEDIUM', 'HIGH', 'URGENT']
        estimatedHours nullable: true, min: 1
        actualHours nullable: true, min: 0
        feedback nullable: true, maxSize: 2000
        requiresApproval nullable: true
        completedDate nullable: true
        // ✅ لا يوجد dateCreated/lastUpdated
    }

    static mapping = {
        attachments cascade: 'all-delete-orphan'
        sort dueDate: 'asc'
        // ✅ لا يوجد autoTimestamp
    }

    String toString() {
        return title
    }

    Boolean isOverdue() {
        return status == 'OVERDUE' || (status == 'PENDING' && dueDate < new Date())
    }

    Integer getDaysRemaining() {
        if (dueDate && status in ['PENDING', 'IN_PROGRESS']) {
            return (dueDate - new Date()).intValue()
        }
        return 0
    }

    def beforeUpdate() {
        if (status == 'COMPLETED' && !completedDate) {
            completedDate = new Date()
        }
    }
}