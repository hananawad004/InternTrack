//// File: grails-app/domain/intern/track/Supervisor.groovy
//package interntrack
//
//class Supervisor {
//
//    String employeeId
//    String department
//    String position
//    Integer maxInterns = 5
//    String officeLocation
//    String phoneExtension
//    String qualifications
//
//
//    // Relationships
//    static belongsTo = [user: User]
//    static hasMany = [interns: Intern]
//
//    static constraints = {
//        employeeId blank: false, unique: true
//        department blank: false
//        position blank: false
//        maxInterns min: 1, max: 20
//        officeLocation nullable: true
//        phoneExtension nullable: true
//        qualifications nullable: true, maxSize: 1000
//        user unique: true
//    }
//
//    static mapping = {
//        interns cascade: 'all-delete-orphan'
//    }
//
//    String toString() {
//        return "${user?.fullName} - ${position}"
//    }
//
//    Integer getCurrentInternCount() {
//        return interns?.size() ?: 0
//    }
//
//    Boolean canAcceptMoreInterns() {
//        return currentInternCount < maxInterns
//    }
//}
// File: grails-app/domain/interntrack/Supervisor.groovy
package interntrack

class Supervisor {

    String employeeId
    String department
    String position
    Integer maxInterns = 5
    String officeLocation
    String phoneExtension
    String qualifications

    // Relationships
    static belongsTo = [user: User]
    static hasMany = [interns: Intern]

    static constraints = {
        employeeId blank: false, unique: true
        department blank: false
        position blank: false
        maxInterns min: 1, max: 20
        officeLocation nullable: true
        phoneExtension nullable: true
        qualifications nullable: true, maxSize: 1000
        user unique: true
        // ✅ لا يوجد dateCreated/lastUpdated
    }

    static mapping = {
        interns cascade: 'all-delete-orphan'
        // ✅ لا يوجد autoTimestamp
    }

    String toString() {
        return "${user?.fullName} - ${position}"
    }

    Integer getCurrentInternCount() {
        return interns?.size() ?: 0
    }

    Boolean canAcceptMoreInterns() {
        return currentInternCount < maxInterns
    }
}