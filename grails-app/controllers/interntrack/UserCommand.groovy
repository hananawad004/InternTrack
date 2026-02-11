//package interntrack
//
//import grails.validation.Validateable
//
//class UserCommand implements Validateable {
//    Long id
//    String username
//    String password
//    String email
//    String fullName
//    String phone
//    Boolean enabled = true
//    List<Long> selectedRoles
//
//    static constraints = {
//        id nullable: true
//        username blank: false, email: true
//        password blank: false, password: true, minSize: 6
//        email blank: false, email: true
//        fullName blank: false
//        phone nullable: true, matches: /[0-9+\-\s()]+/
//        enabled nullable: true
//        selectedRoles nullable: true
//    }
//}
// File: grails-app/commands/interntrack/UserCommand.groovy
package interntrack

import grails.validation.Validateable

class UserCommand implements Validateable {
    Long id
    String username
    String password
    String email
    String fullName
    String phone
    Boolean enabled = true
    List<Long> selectedRoles

    static constraints = {
        id nullable: true
        username blank: false, email: true
        password blank: false, password: true, minSize: 6
        email blank: false, email: true
        fullName blank: false
        phone nullable: true, matches: /[0-9+\-\s()]+/
        enabled nullable: true
        selectedRoles nullable: true
    }
}