////package interntrack
////
////import grails.plugin.springsecurity.SpringSecurityService
////import grails.util.Environment
////import java.time.LocalDate
////import java.time.ZoneId
////
////class BootStrap {
////
////    SpringSecurityService springSecurityService
////
////    def init = { servletContext ->
////        createRoles()
////
////        if (Environment.current == Environment.DEVELOPMENT) {
////            User.withTransaction {
////                createSampleData()
////            }
////        }
////    }
////
////    private void createRoles() {
////        ['ROLE_ADMIN', 'ROLE_SUPERVISOR', 'ROLE_INTERN'].each { authority ->
////            Role.findOrSaveByAuthority(authority)
////        }
////        log.info "Roles ready"
////    }
////
////    private void createSampleData() {
////        log.info "Creating sample data..."
////
////        // ========= ADMIN =========
////        def adminUser = createUser(
////                username: 'admin@intern.com',
////                password: 'admin123',
////                email: 'admin@intern.com',
////                fullName: 'System Administrator',
////                role: 'ROLE_ADMIN'
////        )
////
////        // ========= SUPERVISORS =========
////        def supervisor1User = createUser(
////                username: 'ahmed.supervisor@company.com',
////                password: 'super123',
////                email: 'ahmed.supervisor@company.com',
////                fullName: 'Ahmed Mohammed',
////                role: 'ROLE_SUPERVISOR'
////        )
////
////        def supervisor2User = createUser(
////                username: 'sara.supervisor@company.com',
////                password: 'super123',
////                email: 'sara.supervisor@company.com',
////                fullName: 'Sara Ali',
////                role: 'ROLE_SUPERVISOR'
////        )
////
////        def supervisorProfile1 = Supervisor.findByUser(supervisor1User) ?: new Supervisor(
////                user: supervisor1User,
////                employeeId: 'EMP001',
////                department: 'IT Department',
////                position: 'Senior Software Engineer',
////                maxInterns: 3,
////                officeLocation: 'Building A, Room 301',
////                phoneExtension: '1201',
////                qualifications: 'MSc in Computer Science, PMP Certified'
////        ).save(flush: true, failOnError: true)
////
////        def supervisorProfile2 = Supervisor.findByUser(supervisor2User) ?: new Supervisor(
////                user: supervisor2User,
////                employeeId: 'EMP002',
////                department: 'Marketing Department',
////                position: 'Marketing Manager',
////                maxInterns: 2,
////                officeLocation: 'Building B, Room 205',
////                phoneExtension: '2205',
////                qualifications: 'MBA in Marketing, Digital Marketing Certified'
////        ).save(flush: true, failOnError: true)
////
////        // ========= INTERNS =========
////        def internUsers = [
////                [username: 'mohammed.student@university.edu', fullName: 'Mohammed Hassan', studentId: '20231001'],
////                [username: 'fatima.student@university.edu', fullName: 'Fatima Ahmed', studentId: '20231002'],
////                [username: 'omar.student@university.edu', fullName: 'Omar Khalid', studentId: '20231003'],
////                [username: 'noor.student@university.edu', fullName: 'Noor Mohammed', studentId: '20231004']
////        ]
////
////        internUsers.eachWithIndex { internData, index ->
////
////            def user = createUser(
////                    username: internData.username,
////                    password: 'intern123',
////                    email: internData.username,
////                    fullName: internData.fullName,
////                    role: 'ROLE_INTERN'
////            )
////
////            if (!Intern.findByUser(user)) {
////
////                Date startDate = Date.from(LocalDate.now().minusDays(30)
////                        .atStartOfDay(ZoneId.systemDefault()).toInstant())
////
////                Date endDate = Date.from(LocalDate.now().plusDays(60)
////                        .atStartOfDay(ZoneId.systemDefault()).toInstant())
////
////                new Intern(
////                        user: user,
////                        studentId: internData.studentId,
////                        university: 'King Saud University',
////                        major: index < 2 ? 'Computer Science' : 'Business Administration',
////                        department: index < 2 ? 'Software Development' : 'Marketing',
////                        yearOfStudy: 'Senior',
////                        startDate: startDate,
////                        endDate: endDate,
////                        status: 'ACTIVE',
////                        supervisor: index < 2 ? supervisorProfile1 : supervisorProfile2,
////                        emergencyContact: 'Parent',
////                        emergencyPhone: '+966501234567',
////                        totalHours: 0.0
////                ).save(flush: true, failOnError: true)
////            }
////        }
////
////        log.info "Sample data created successfully"
////    }
////
////    private User createUser(Map params) {
////
////        def user = User.findByUsername(params.username)
////        if (!user) {
////            user = new User(
////                    username: params.username,
////                    password: params.password,
////                    email: params.email,
////                    fullName: params.fullName,
////                    enabled: true
////            ).save(flush: true, failOnError: true)
////        }
////
////        def role = Role.findByAuthority(params.role)
////        if (!UserRole.exists(user.id, role.id)) {
////            new UserRole(user: user, role: role)
////                    .save(flush: true, failOnError: true)
////        }
////
////        return user
////    }
////
////    def destroy = {
////        log.info "Application shutting down..."
////    }
////}
////package interntrack
////
////import grails.plugin.springsecurity.SpringSecurityService
////import grails.util.Environment
////import java.time.LocalDate
////import java.time.ZoneId
////import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
////
////class BootStrap {
////
////    SpringSecurityService springSecurityService
////
////    def init = { servletContext ->
////        println "=== STARTING BOOTSTRAP ==="
////
////        createRoles()
////
////        if (Environment.current == Environment.DEVELOPMENT) {
////            User.withTransaction {
////                println "=== CREATING/USING SAMPLE DATA ==="
////                ensureAllUsersHaveBCryptPasswords()
////                createSampleData()
////            }
////        }
////
////        println "=== BOOTSTRAP COMPLETE ==="
////    }
////
////    private void createRoles() {
////        ['ROLE_ADMIN', 'ROLE_SUPERVISOR', 'ROLE_INTERN'].each { authority ->
////            def role = Role.findByAuthority(authority)
////            if (!role) {
////                role = new Role(authority: authority).save(flush: true)
////                println "✓ Created role: ${authority}"
////            } else {
////                println "✓ Role already exists: ${authority}"
////            }
////        }
////    }
////
////    private void ensureAllUsersHaveBCryptPasswords() {
////        println "=== ENSURING BCrypt PASSWORDS ==="
////
////        def encoder = new BCryptPasswordEncoder()
////        def users = User.list()
////
////        if (users.empty) {
////            println "No users found in database"
////            return
////        }
////
////        users.each { user ->
////            println "Checking user: ${user.username}"
////
////            if (user.password) {
////                // إذا كانت كلمة المرور موجودة ولكنها ليست BCrypt
////                if (!user.password.startsWith('$2a$')) {
////                    println "  Password is NOT BCrypt, updating..."
////
////                    // احصل على كلمة المرور الافتراضية لهذا المستخدم
////                    def defaultPassword = getDefaultPassword(user.username)
////
////                    if (defaultPassword) {
////                        // تشفير كلمة المرور
////                        user.password = encoder.encode(defaultPassword)
////
////                        if (user.save(flush: true)) {
////                            println "  ✓ Updated to BCrypt"
////                        } else {
////                            println "  ✗ Failed to save: ${user.errors}"
////                        }
////                    } else {
////                        println "  ⚠ No default password found for this user"
////                    }
////                } else {
////                    println "  ✓ Already BCrypt encoded"
////
////                    // تحقق من أن كلمة المرور صحيحة
////                    def testPassword = getDefaultPassword(user.username)
////                    if (testPassword) {
////                        boolean matches = encoder.matches(testPassword, user.password)
////                        println "  Test password matches: ${matches}"
////
////                        if (!matches) {
////                            println "  ⚠ Password doesn't match! Fixing..."
////                            user.password = encoder.encode(testPassword)
////                            user.save(flush: true)
////                        }
////                    }
////                }
////            } else {
////                println "  ⚠ No password found!"
////            }
////        }
////    }
////
////    private void createSampleData() {
////        println "=== ENSURING SAMPLE USERS EXIST ==="
////
////        // قائمة المستخدمين الافتراضيين
////        def sampleUsers = [
////                [username: 'admin@intern.com', password: 'admin123', email: 'admin@intern.com', fullName: 'System Administrator', role: 'ROLE_ADMIN'],
////                [username: 'ahmed.supervisor@company.com', password: 'super123', email: 'ahmed.supervisor@company.com', fullName: 'Ahmed Mohammed', role: 'ROLE_SUPERVISOR'],
////                [username: 'sara.supervisor@company.com', password: 'super123', email: 'sara.supervisor@company.com', fullName: 'Sara Ali', role: 'ROLE_SUPERVISOR'],
////                [username: 'mohammed.student@university.edu', password: 'intern123', email: 'mohammed.student@university.edu', fullName: 'Mohammed Hassan', role: 'ROLE_INTERN'],
////                [username: 'fatima.student@university.edu', password: 'intern123', email: 'fatima.student@university.edu', fullName: 'Fatima Ahmed', role: 'ROLE_INTERN'],
////                [username: 'omar.student@university.edu', password: 'intern123', email: 'omar.student@university.edu', fullName: 'Omar Khalid', role: 'ROLE_INTERN'],
////                [username: 'noor.student@university.edu', password: 'intern123', email: 'noor.student@university.edu', fullName: 'Noor Mohammed', role: 'ROLE_INTERN']
////        ]
////
////        sampleUsers.each { userData ->
////            println "Ensuring user: ${userData.username}"
////            ensureUserExists(userData)
////        }
////
////        println "=== SAMPLE DATA READY ==="
////    }
////
////    private void ensureUserExists(Map userData) {
////        def user = User.findByUsername(userData.username)
////        def encoder = new BCryptPasswordEncoder()
////
////        if (!user) {
////            // إنشاء مستخدم جديد
////            user = new User(
////                    username: userData.username,
////                    password: encoder.encode(userData.password),
////                    email: userData.email,
////                    fullName: userData.fullName,
////                    enabled: true
////            )
////
////            if (user.save(flush: true)) {
////                println "  ✓ Created new user"
////            } else {
////                println "  ✗ Failed to create: ${user.errors}"
////                return
////            }
////        } else {
////            // تحديث بيانات المستخدم الموجود
////            user.email = userData.email
////            user.fullName = userData.fullName
////
////            // تحديث كلمة المرور إذا لزم الأمر
////            if (!user.password.startsWith('$2a$')) {
////                user.password = encoder.encode(userData.password)
////                println "  ✓ Updated password to BCrypt"
////            }
////
////            user.save(flush: true)
////            println "  ✓ Updated existing user"
////        }
////
////        // إضافة الدور
////        def role = Role.findByAuthority(userData.role)
////        if (role && !UserRole.exists(user.id, role.id)) {
////            new UserRole(user: user, role: role).save(flush: true)
////            println "  ✓ Assigned role: ${userData.role}"
////        }
////    }
////
////    private String getDefaultPassword(String username) {
////        def passwordMap = [
////                'admin@intern.com': 'admin123',
////                'ahmed.supervisor@company.com': 'super123',
////                'sara.supervisor@company.com': 'super123',
////                'mohammed.student@university.edu': 'intern123',
////                'fatima.student@university.edu': 'intern123',
////                'omar.student@university.edu': 'intern123',
////                'noor.student@university.edu': 'intern123'
////        ]
////        return passwordMap[username]
////    }
////
////    def destroy = {
////        println "=== APPLICATION SHUTTING DOWN ==="
////    }
////}
//// File: grails-app/conf/BootStrap.groovy
//package interntrack
//
//import grails.plugin.springsecurity.SpringSecurityService
//import grails.util.Environment
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
//
//class BootStrap {
//
//    SpringSecurityService springSecurityService
//
//    def init = { servletContext ->
//        println "=== STARTING BOOTSTRAP ==="
//
//        createRoles()
//
//        if (Environment.current == Environment.DEVELOPMENT) {
//            println "=== CREATING/USING SAMPLE DATA ==="
//            ensureAllUsersHaveBCryptPasswords()
//            createSampleData()
//        }
//
//        println "=== BOOTSTRAP COMPLETE ==="
//    }
//
//    private void createRoles() {
//        ['ROLE_ADMIN', 'ROLE_SUPERVISOR', 'ROLE_INTERN'].each { authority ->
//            def role = Role.findByAuthority(authority)
//            if (!role) {
//                role = new Role(authority: authority)
//                if (role.save(flush: true)) {
//                    println "✓ Created role: ${authority}"
//                } else {
//                    println "✗ Failed to create role: ${authority} - ${role.errors}"
//                }
//            } else {
//                println "✓ Role already exists: ${authority}"
//            }
//        }
//    }
//
//    private void ensureAllUsersHaveBCryptPasswords() {
//        println "=== ENSURING BCrypt PASSWORDS ==="
//
//        def encoder = new BCryptPasswordEncoder()
//        def users = User.list()
//
//        if (users.empty) {
//            println "No users found in database"
//            return
//        }
//
//        users.each { user ->
//            println "Checking user: ${user.username}"
//
//            if (user.password) {
//                if (!user.password.startsWith('$2a$')) {
//                    println "  Password is NOT BCrypt, updating..."
//
//                    def defaultPassword = getDefaultPassword(user.username)
//
//                    if (defaultPassword) {
//                        user.password = encoder.encode(defaultPassword)
//
//                        if (user.save(flush: true)) {
//                            println "  ✓ Updated to BCrypt"
//                        } else {
//                            println "  ✗ Failed to save: ${user.errors}"
//                        }
//                    } else {
//                        println "  ⚠ No default password found for this user"
//                    }
//                } else {
//                    println "  ✓ Already BCrypt encoded"
//                }
//            } else {
//                println "  ⚠ No password found!"
//            }
//        }
//    }
//
//    private void createSampleData() {
//        println "=== ENSURING SAMPLE USERS EXIST ==="
//
//        def sampleUsers = [
//                [username: 'admin@intern.com', password: 'admin123', email: 'admin@intern.com', fullName: 'System Administrator', role: 'ROLE_ADMIN'],
//                [username: 'ahmed.supervisor@company.com', password: 'super123', email: 'ahmed.supervisor@company.com', fullName: 'Ahmed Mohammed', role: 'ROLE_SUPERVISOR'],
//                [username: 'sara.supervisor@company.com', password: 'super123', email: 'sara.supervisor@company.com', fullName: 'Sara Ali', role: 'ROLE_SUPERVISOR'],
//                [username: 'mohammed.student@university.edu', password: 'intern123', email: 'mohammed.student@university.edu', fullName: 'Mohammed Hassan', role: 'ROLE_INTERN'],
//                [username: 'fatima.student@university.edu', password: 'intern123', email: 'fatima.student@university.edu', fullName: 'Fatima Ahmed', role: 'ROLE_INTERN'],
//                [username: 'omar.student@university.edu', password: 'intern123', email: 'omar.student@university.edu', fullName: 'Omar Khalid', role: 'ROLE_INTERN'],
//                [username: 'noor.student@university.edu', password: 'intern123', email: 'noor.student@university.edu', fullName: 'Noor Mohammed', role: 'ROLE_INTERN']
//        ]
//
//        sampleUsers.each { userData ->
//            println "Ensuring user: ${userData.username}"
//            ensureUserExists(userData)
//        }
//
//        println "=== SAMPLE DATA READY ==="
//    }
//
//    private void ensureUserExists(Map userData) {
//        User.withNewTransaction { status ->
//            try {
//                def user = User.findByUsername(userData.username)
//                def encoder = new BCryptPasswordEncoder()
//
//                if (!user) {
//                    user = new User(
//                            username: userData.username,
//                            password: encoder.encode(userData.password),
//                            email: userData.email,
//                            fullName: userData.fullName,
//                            enabled: true
//                    )
//
//                    if (user.save(flush: true)) {
//                        println "  ✓ Created new user"
//                    } else {
//                        println "  ✗ Failed to create: ${user.errors}"
//                        return
//                    }
//                } else {
//                    user.email = userData.email
//                    user.fullName = userData.fullName
//
//                    if (!user.password.startsWith('$2a$')) {
//                        user.password = encoder.encode(userData.password)
//                        println "  ✓ Updated password to BCrypt"
//                    }
//
//                    user.save(flush: true)
//                    println "  ✓ Updated existing user"
//                }
//
//                def role = Role.findByAuthority(userData.role)
//                if (role && !UserRole.exists(user.id, role.id)) {
//                    new UserRole(user: user, role: role).save(flush: true)
//                    println "  ✓ Assigned role: ${userData.role}"
//                }
//
//                status.flush()
//            } catch (Exception e) {
//                println "  ✗ Error: ${e.message}"
//                status.setRollbackOnly()
//            }
//        }
//    }
//
//    private String getDefaultPassword(String username) {
//        def passwordMap = [
//                'admin@intern.com': 'admin123',
//                'ahmed.supervisor@company.com': 'super123',
//                'sara.supervisor@company.com': 'super123',
//                'mohammed.student@university.edu': 'intern123',
//                'fatima.student@university.edu': 'intern123',
//                'omar.student@university.edu': 'intern123',
//                'noor.student@university.edu': 'intern123'
//        ]
//        return passwordMap[username]
//    }
//
//    def destroy = {
//        println "=== APPLICATION SHUTTING DOWN ==="
//    }
//}
// File: grails-app/conf/BootStrap.groovy
package interntrack

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

class BootStrap {

    def init = { servletContext ->
        println "=== STARTING BOOTSTRAP ==="

        User.withTransaction {
            createRoles()
            createSampleData()
        }

        println "=== BOOTSTRAP COMPLETE ==="
    }

    private void createRoles() {
        ['ROLE_ADMIN', 'ROLE_SUPERVISOR', 'ROLE_INTERN'].each { authority ->
            if (!Role.findByAuthority(authority)) {
                new Role(authority: authority).save()
                println "✓ Created role: ${authority}"
            }
        }
    }

    private void createSampleData() {
        println "=== CREATING SAMPLE DATA ==="

        def encoder = new BCryptPasswordEncoder()

        // ✅ التواريخ باستخدام Calendar
        Calendar cal = Calendar.getInstance()
        cal.add(Calendar.DAY_OF_MONTH, -30)
        Date startDate = cal.time

        cal = Calendar.getInstance()
        cal.add(Calendar.DAY_OF_MONTH, 60)
        Date endDate = cal.time

        // 1. ADMIN
        def adminUser = User.findByUsername('admin@intern.com')
        if (!adminUser) {
            adminUser = new User(
                    username: 'admin@intern.com',
                    password: encoder.encode('admin123'),
                    email: 'admin@intern.com',
                    fullName: 'System Administrator',
                    enabled: true
            )
            adminUser.save()
            println "✓ Created admin user"
        }
        assignRole(adminUser, 'ROLE_ADMIN')

        // 2. SUPERVISOR
        def supervisorUser = User.findByUsername('ahmed.supervisor@company.com')
        if (!supervisorUser) {
            supervisorUser = new User(
                    username: 'ahmed.supervisor@company.com',
                    password: encoder.encode('super123'),
                    email: 'ahmed.supervisor@company.com',
                    fullName: 'Ahmed Mohammed',
                    enabled: true
            )
            supervisorUser.save()
            println "✓ Created supervisor user"
        }
        assignRole(supervisorUser, 'ROLE_SUPERVISOR')

        // 3. SUPERVISOR PROFILE
        def supervisor = Supervisor.findByUser(supervisorUser)
        if (!supervisor) {
            supervisor = new Supervisor(
                    user: supervisorUser,
                    employeeId: 'EMP001',
                    department: 'IT Department',
                    position: 'Senior Software Engineer',
                    maxInterns: 3
            )
            supervisor.save()
            println "✓ Created supervisor profile"
        }

        // 4. INTERN
        def internUser = User.findByUsername('mohammed.student@university.edu')
        if (!internUser) {
            internUser = new User(
                    username: 'mohammed.student@university.edu',
                    password: encoder.encode('intern123'),
                    email: 'mohammed.student@university.edu',
                    fullName: 'Mohammed Hassan',
                    enabled: true
            )
            internUser.save()
            println "✓ Created intern user"
        }
        assignRole(internUser, 'ROLE_INTERN')

        // 5. INTERN PROFILE
        def intern = Intern.findByUser(internUser)
        if (!intern) {
            intern = new Intern(
                    user: internUser,
                    studentId: '20231001',
                    university: 'King Saud University',
                    major: 'Computer Science',
                    startDate: startDate,
                    endDate: endDate,
                    status: 'ACTIVE',
                    supervisor: supervisor
            )
            intern.save()
            println "✓ Created intern profile"
        }

        println "=== SAMPLE DATA READY ==="
        println "Admin: admin@intern.com / admin123"
        println "Supervisor: ahmed.supervisor@company.com / super123"
        println "Intern: mohammed.student@university.edu / intern123"
    }

    private void assignRole(User user, String roleName) {
        def role = Role.findByAuthority(roleName)
        if (role && user && !UserRole.exists(user.id, role.id)) {
            new UserRole(user: user, role: role).save()
            println "✓ Assigned role ${roleName} to ${user.username}"
        }
    }

    def destroy = {
        println "=== APPLICATION SHUTTING DOWN ==="
    }
}