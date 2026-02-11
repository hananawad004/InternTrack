////////// File: grails-app/domain/intern/track/User.groovy
////////package interntrack
////////
////////import grails.plugin.springsecurity.SpringSecurityService
////////import groovy.transform.EqualsAndHashCode
////////import groovy.transform.ToString
////////
////////@EqualsAndHashCode(includes='username')
////////@ToString(includes='username', includeNames=true, includePackage=false)
////////class User implements Serializable {
////////
////////    private static final long serialVersionUID = 1
////////
////////    transient springSecurityService
////////
////////    String username
////////    String password
////////    String email
////////    String fullName
////////    String phone
////////    String profileImage
////////    boolean enabled = true
////////    boolean accountExpired
////////    boolean accountLocked
////////    boolean passwordExpired
////////
////////    Date dateCreated
////////    Date lastUpdated
////////
////////    static hasOne = [intern: Intern, supervisor: Supervisor]
////////   static belongsTo = [supervisor: Supervisor]
////////
////////    static constraints = {
////////        username blank: false, unique: true, email: true
////////        password blank: false, password: true
////////        email blank: false, email: true, unique: true
////////        fullName blank: false
////////        phone nullable: true, matches: /[0-9+\-\s()]+/
////////        profileImage nullable: true
////////    }
////////
////////    static mapping = {
////////        password column: '`password`'
////////        table '`user`'
////////    }
////////
////////    Set<Role> getAuthorities() {
////////        UserRole.findAllByUser(this)*.role
////////    }
////////
////////    def beforeInsert() {
////////        encodePassword()
////////    }
////////
////////    def beforeUpdate() {
////////        if (isDirty('password')) {
////////            encodePassword()
////////        }
////////    }
////////
////////    protected void encodePassword() {
////////        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
////////    }
////////
////////    String getInitials() {
////////        fullName?.split(' ')?.collect { it[0] }?.join()?.toUpperCase() ?: 'U'
////////    }
////////}
//////package interntrack
//////
//////import grails.plugin.springsecurity.SpringSecurityService
//////import groovy.transform.EqualsAndHashCode
//////import groovy.transform.ToString
//////
//////@EqualsAndHashCode(includes='username')
//////@ToString(includes='username', includeNames=true, includePackage=false)
//////class User implements Serializable {
//////
//////    private static final long serialVersionUID = 1
//////
//////    transient springSecurityService
//////
//////    String username
//////    String password
//////    String email
//////    String fullName
//////    String phone
//////    String profileImage
//////    boolean enabled = true
//////    boolean accountExpired
//////    boolean accountLocked
//////    boolean passwordExpired
//////
//////    Date dateCreated
//////    Date lastUpdated
//////
//////    static constraints = {
//////        username blank: false, unique: true, email: true
//////        password blank: false, password: true
//////        email blank: false, email: true, unique: true
//////        fullName blank: false
//////        phone nullable: true, matches: /[0-9+\-\s()]+/
//////        profileImage nullable: true
//////    }
//////
//////    static mapping = {
//////        password column: '`password`'
//////        table '`user`'
//////    }
//////
//////    Set<Role> getAuthorities() {
//////        UserRole.findAllByUser(this)*.role
//////    }
//////
//////    def beforeInsert() {
//////        encodePassword()
//////    }
//////
//////    def beforeUpdate() {
//////        if (isDirty('password')) {
//////            encodePassword()
//////        }
//////    }
//////
//////    protected void encodePassword() {
//////        password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
//////    }
//////
//////    String getInitials() {
//////        fullName?.split(' ')?.collect { it[0] }?.join()?.toUpperCase() ?: 'U'
//////    }
//////}
////package interntrack
////
////import grails.plugin.springsecurity.SpringSecurityService
////import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
////import groovy.transform.EqualsAndHashCode
////import groovy.transform.ToString
////
////@EqualsAndHashCode(includes='username')
////@ToString(includes='username', includeNames=true, includePackage=false)
////class User implements Serializable {
////
////    private static final long serialVersionUID = 1
////
////    transient springSecurityService
////
////    String username
////    String password
////    String email
////    String fullName
////    String phone
////    String profileImage
////    boolean enabled = true
////    boolean accountExpired
////    boolean accountLocked
////    boolean passwordExpired
////
////    Date dateCreated
////    Date lastUpdated
////
////    static constraints = {
////        username blank: false, unique: true, email: true
////        password blank: false, password: true
////        email blank: false, email: true, unique: true
////        fullName blank: false
////        phone nullable: true, matches: /[0-9+\-\s()]+/
////        profileImage nullable: true
////    }
////
////    static mapping = {
////        password column: '`password`'
////        table '`user`'
////    }
////
////    Set<Role> getAuthorities() {
////        UserRole.findAllByUser(this)*.role
////    }
////
////    def beforeInsert() {
////        encodePassword()
////    }
////
////    def beforeUpdate() {
////        if (isDirty('password')) {
////            encodePassword()
////        }
////    }
////
////    protected void encodePassword() {
////        if (password && !password.startsWith('$2a$')) {
////            try {
////                // محاولة استخدام SpringSecurityService أولاً
////                if (springSecurityService?.passwordEncoder) {
////                    password = springSecurityService.encodePassword(password)
////                } else {
////                    // استخدام BCrypt مباشرة
////                    def encoder = new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder()
////                    password = encoder.encode(password)
////                }
////            } catch (Exception e) {
////                println "Error encoding password: ${e.message}"
////                // استخدام BCrypt مباشرة في حالة الخطأ
////                def encoder = new org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder()
////                password = encoder.encode(password)
////            }
////        }
////    }
////
////    String getInitials() {
////        fullName?.split(' ')?.collect { it[0] }?.join()?.toUpperCase() ?: 'U'
////    }
////}
//// File: grails-app/domain/interntrack/User.groovy
//package interntrack
//
//import grails.plugin.springsecurity.SpringSecurityService
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
//import groovy.transform.EqualsAndHashCode
//import groovy.transform.ToString
//
//@EqualsAndHashCode(includes='username')
//@ToString(includes='username', includeNames=true, includePackage=false)
//class User implements Serializable {
//
//    private static final long serialVersionUID = 1
//
//    transient springSecurityService
//
//    String username
//    String password
//    String email
//    String fullName
//    String phone
//    String profileImage
//    boolean enabled = true
//    boolean accountExpired = false
//    boolean accountLocked = false
//    boolean passwordExpired = false
//
//    Date dateCreated
//    Date lastUpdated
//
//    static constraints = {
//        username blank: false, unique: true, email: true
//        password blank: false, password: true
//        email blank: false, email: true, unique: true
//        fullName blank: false
//        phone nullable: true, matches: /[0-9+\-\s()]+/
//        profileImage nullable: true
//    }
//
//    static mapping = {
//        password column: '`password`'
//        table '`user`'
//    }
//
//    Set<Role> getAuthorities() {
//        UserRole.findAllByUser(this)*.role as Set
//    }
//
//    def beforeInsert() {
//        encodePassword()
//        dateCreated = new Date()
//        lastUpdated = new Date()
//    }
//
//    def beforeUpdate() {
//        if (isDirty('password')) {
//            encodePassword()
//        }
//        lastUpdated = new Date()
//    }
//
//    protected void encodePassword() {
//        if (password && !password.startsWith('$2a$')) {
//            try {
//                if (springSecurityService?.passwordEncoder) {
//                    password = springSecurityService.encodePassword(password)
//                } else {
//                    def encoder = new BCryptPasswordEncoder()
//                    password = encoder.encode(password)
//                }
//            } catch (Exception e) {
//                println "Error encoding password: ${e.message}"
//                def encoder = new BCryptPasswordEncoder()
//                password = encoder.encode(password)
//            }
//        }
//    }
//
//    String getInitials() {
//        if (fullName) {
//            def parts = fullName.split(' ').findAll { it }
//            if (parts.size() >= 2) {
//                return "${parts[0][0]}${parts[-1][0]}".toUpperCase()
//            } else if (parts.size() == 1) {
//                return parts[0][0].toUpperCase()
//            }
//        }
//        return 'U'
//    }
//}
package interntrack

import grails.plugin.springsecurity.SpringSecurityService
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import groovy.transform.EqualsAndHashCode
import groovy.transform.ToString

@EqualsAndHashCode(includes='username')
@ToString(includes='username', includeNames=true, includePackage=false)
class User implements Serializable {

    private static final long serialVersionUID = 1

    transient springSecurityService

    String username
    String password
    String email
    String fullName
    String phone
    String profileImage
    boolean enabled = true
    boolean accountExpired = false
    boolean accountLocked = false
    boolean passwordExpired = false

    Date dateCreated
    Date lastUpdated

    static transients = ['springSecurityService']

    static constraints = {
        username blank: false, unique: true, email: true
        password blank: false, password: true
        email blank: false, email: true, unique: true
        fullName blank: false
        phone nullable: true, matches: /[0-9+\-\s()]+/
        profileImage nullable: true
    }

    static mapping = {
        password column: '`password`'
        table '`user`'
    }

    Set<Role> getAuthorities() {
        (UserRole.findAllByUser(this)*.role as Set) ?: [] as Set
    }

    def beforeInsert() {
        encodePassword()
        dateCreated = new Date()
        lastUpdated = new Date()
    }

    def beforeUpdate() {
        if (isDirty('password')) {
            encodePassword()
        }
        lastUpdated = new Date()
    }

    protected void encodePassword() {
        if (password && !password.startsWith('$2a$')) {
            println "Encoding password for user: ${username}"
            try {
                if (springSecurityService?.passwordEncoder) {
                    password = springSecurityService.encodePassword(password)
                } else {
                    def encoder = new BCryptPasswordEncoder()
                    password = encoder.encode(password)
                }
                println "Password encoded successfully"
            } catch (Exception e) {
                println "Error encoding password: ${e.message}"
                def encoder = new BCryptPasswordEncoder()
                password = encoder.encode(password)
            }
        }
    }

    String getInitials() {
        if (fullName) {
            def parts = fullName.split(' ').findAll { it }
            if (parts.size() >= 2) {
                return "${parts[0][0]}${parts[-1][0]}".toUpperCase()
            } else if (parts.size() == 1) {
                return parts[0][0].toUpperCase()
            }
        }
        return 'U'
    }
}