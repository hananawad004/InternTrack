//// File: grails-app/domain/intern/track/Intern.groovy
//package interntrack
//
//class Intern {
//
//    String studentId
//    String university
//    String major
//    String department
//    String yearOfStudy
//    Date startDate
//    Date endDate
//    String status = 'ACTIVE' // ACTIVE, COMPLETED, TERMINATED
//    BigDecimal totalHours = 0.0G
//    String notes
//    String emergencyContact
//    String emergencyPhone
//
//    // Relationships
//    static belongsTo = [user: User, supervisor: Supervisor]
//    static hasMany = [tasks: Task, weeklyReports: WeeklyReport, evaluations: Evaluation]
//
//    static constraints = {
//        studentId blank: false, unique: true
//        university blank: false
//        major blank: false
//        department nullable: true
//        yearOfStudy inList: ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate']
//        startDate nullable: false
//        endDate nullable: false
//        status inList: ['ACTIVE', 'COMPLETED', 'TERMINATED']
//        totalHours min: 0.0G
//        notes nullable: true, maxSize: 2000
//        emergencyContact nullable: true
//        emergencyPhone nullable: true, matches: /[0-9+\-\s()]+/
//        user unique: true
//    }
//
//    static mapping = {
//        tasks cascade: 'all-delete-orphan'
//        weeklyReports cascade: 'all-delete-orphan'
//        evaluations cascade: 'all-delete-orphan'
//        sort startDate: 'desc'
//    }
//
//    String toString() {
//        return "${user?.fullName} - ${studentId}"
//    }
//
////    Integer getRemainingDays() {
////        if (endDate && status == 'ACTIVE') {
////            return (endDate - new Date()).intValue()
////        }
////        return 0
////    }
//    Integer getRemainingDays() {
//        if (endDate && status == 'ACTIVE') {
//            return Math.max((endDate - new Date()).intValue(), 0)
//        }
//        return 0
//    }
//
//    Boolean isActive() {
//        status == 'ACTIVE'
//    }
//}
// File: grails-app/domain/interntrack/Intern.groovy
//package interntrack
//
//class Intern {
//
//    String studentId
//    String university
//    String major
//    String department
//    String yearOfStudy
//    Date startDate
//    Date endDate
//    String status = 'ACTIVE' // ACTIVE, COMPLETED, TERMINATED
//    BigDecimal totalHours = 0.0G
//    String notes
//    String emergencyContact
//    String emergencyPhone
//
//
//
//    // Relationships
//    static belongsTo = [user: User, supervisor: Supervisor]
//    static hasMany = [tasks: Task, weeklyReports: WeeklyReport, evaluations: Evaluation]
//
//    static constraints = {
//        studentId blank: false, unique: true
//        university blank: false
//        major blank: false
//        department nullable: true
//        yearOfStudy inList: ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate']
//        startDate nullable: false
//        endDate nullable: false
//        status inList: ['ACTIVE', 'COMPLETED', 'TERMINATED']
//        totalHours min: 0.0G
//        notes nullable: true, maxSize: 2000
//        emergencyContact nullable: true
//        emergencyPhone nullable: true, matches: /[0-9+\-\s()]+/
//        user unique: true
//        dateCreated nullable: true
//        lastUpdated nullable: true
//    }
//
//    static mapping = {
//        tasks cascade: 'all-delete-orphan'
//        weeklyReports cascade: 'all-delete-orphan'
//        evaluations cascade: 'all-delete-orphan'
//        sort startDate: 'desc'
//        autoTimestamp: true // لتحديث dateCreated و lastUpdated تلقائياً
//    }
//
//    String toString() {
//        return "${user?.fullName ?: 'Unknown'} - ${studentId}"
//    }
//
//    Integer getRemainingDays() {
//        if (endDate && status == 'ACTIVE') {
//            return (endDate - new Date()).intValue()
//        }
//        return 0
//    }
//
//    Boolean isActive() {
//        status == 'ACTIVE'
//    }
//}
// File: grails-app/domain/interntrack/Intern.groovy
// File: grails-app/domain/interntrack/Intern.groovy
package interntrack

class Intern {

    String studentId
    String university
    String major
    String department
    String yearOfStudy
    Date startDate
    Date endDate
    String status = 'ACTIVE' // ACTIVE, COMPLETED, TERMINATED
    BigDecimal totalHours = 0.0G
    String notes
    String emergencyContact
    String emergencyPhone

    // Relationships
    static belongsTo = [user: User, supervisor: Supervisor]
    static hasMany = [tasks: Task, weeklyReports: WeeklyReport, evaluations: Evaluation]

    static constraints = {
        studentId blank: false, unique: true
        university blank: false
        major blank: false
        department nullable: true
        yearOfStudy inList: ['Freshman', 'Sophomore', 'Junior', 'Senior', 'Graduate']
        startDate nullable: false
        endDate nullable: false
        status inList: ['ACTIVE', 'COMPLETED', 'TERMINATED']
        totalHours min: 0.0G
        notes nullable: true, maxSize: 2000
        emergencyContact nullable: true
        emergencyPhone nullable: true, matches: /[0-9+\-\s()]+/
        user unique: true
    }

    static mapping = {
        tasks cascade: 'all-delete-orphan'
        weeklyReports cascade: 'all-delete-orphan'
        evaluations cascade: 'all-delete-orphan'
        sort startDate: 'desc'
    }

    String toString() {
        return "${user?.fullName ?: 'Unknown'} - ${studentId}"
    }

    Integer getRemainingDays() {
        if (endDate && status == 'ACTIVE') {
            try {
                Calendar calEnd = Calendar.getInstance()
                calEnd.setTime(endDate)

                Calendar calNow = Calendar.getInstance()
                calNow.setTime(new Date())

                calEnd.set(Calendar.HOUR_OF_DAY, 0)
                calEnd.set(Calendar.MINUTE, 0)
                calEnd.set(Calendar.SECOND, 0)
                calEnd.set(Calendar.MILLISECOND, 0)

                calNow.set(Calendar.HOUR_OF_DAY, 0)
                calNow.set(Calendar.MINUTE, 0)
                calNow.set(Calendar.SECOND, 0)
                calNow.set(Calendar.MILLISECOND, 0)

                // حساب الفرق بالأيام
                long diffInMillis = calEnd.getTimeInMillis() - calNow.getTimeInMillis()
                return (diffInMillis / (1000 * 60 * 60 * 24)).intValue()
            } catch (Exception e) {
                log.error "Error calculating remaining days: ${e.message}"
                return 0
            }
        }
        return 0
    }

    Boolean isActive() {
        status == 'ACTIVE'
    }
}