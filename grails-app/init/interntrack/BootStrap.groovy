//package interntrack
//
//import interntrack.Intern
//import interntrack.Role
//import interntrack.User
//import interntrack.UserRole
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
//
//class BootStrap {
//
//    def init = { servletContext ->
//        println "=== STARTING BOOTSTRAP ==="
//
//        User.withTransaction {
//            createRoles()
//            createSampleData()
//        }
//
//        println "=== BOOTSTRAP COMPLETE ==="
//    }
//
//    private void createRoles() {
//        ['ROLE_ADMIN', 'ROLE_SUPERVISOR', 'ROLE_INTERN'].each { authority ->
//            if (!Role.findByAuthority(authority)) {
//                new Role(authority: authority).save()
//                println "✓ Created role: ${authority}"
//            }
//        }
//    }
//
//    private void createSampleData() {
//        println "=== CREATING SAMPLE DATA ==="
//
//        def encoder = new BCryptPasswordEncoder()
//
//        // التواريخ باستخدام Calendar
//        Calendar cal = Calendar.getInstance()
//        cal.add(Calendar.DAY_OF_MONTH, -30)
//        Date startDate = cal.time
//
//        cal = Calendar.getInstance()
//        cal.add(Calendar.DAY_OF_MONTH, 60)
//        Date endDate = cal.time
//
//        // 1. ADMIN - بدون role في الكونستركتر
//        def adminUser = User.findByUsername('admin@intern.com')
//        if (!adminUser) {
//            adminUser = new User(
//                    username: 'admin@intern.com',
//                    password: encoder.encode('admin123'),
//                    email: 'admin@intern.com',
//                    fullName: 'System Administrator',
//                    enabled: true
//            )
//            adminUser.save()
//            println "✓ Created admin user"
//        }
//        assignRole(adminUser, 'ROLE_ADMIN')
//
//        // 2. SUPERVISOR - بدون role في الكونستركتر
//        def supervisorUser = User.findByUsername('ahmed.supervisor@company.com')
//        if (!supervisorUser) {
//            supervisorUser = new User(
//                    username: 'ahmed.supervisor@company.com',
//                    password: encoder.encode('super123'),
//                    email: 'ahmed.supervisor@company.com',
//                    fullName: 'Ahmed Mohammed',
//                    enabled: true
//            )
//            supervisorUser.save()
//            println "✓ Created supervisor user"
//        }
//        assignRole(supervisorUser, 'ROLE_SUPERVISOR')
//
//        // 3. SUPERVISOR PROFILE
//        def supervisor = Supervisor.findByUser(supervisorUser)
//        if (!supervisor) {
//            supervisor = new Supervisor(
//                    user: supervisorUser,
//                    employeeId: 'EMP001',
//                    department: 'IT Department',
//                    position: 'Senior Software Engineer',
//                    maxInterns: 3
//            )
//            supervisor.save()
//            println "✓ Created supervisor profile"
//        }
//
//        // 4. INTERN - بدون role في الكونستركتر
//        def internUser = User.findByUsername('mohammed.student@university.edu')
//        if (!internUser) {
//            internUser = new User(
//                    username: 'mohammed.student@university.edu',
//                    password: encoder.encode('intern123'),
//                    email: 'mohammed.student@university.edu',
//                    fullName: 'Mohammed Hassan',
//                    enabled: true
//            )
//            internUser.save()
//            println "✓ Created intern user"
//        }
//        assignRole(internUser, 'ROLE_INTERN')
//
//        // 5. INTERN PROFILE
//        def intern = Intern.findByUser(internUser)
//        if (!intern) {
//            intern = new Intern(
//                    user: internUser,
//                    studentId: '20231001',
//                    university: 'King Saud University',
//                    major: 'Computer Science',
//                    startDate: startDate,
//                    endDate: endDate,
//                    status: 'ACTIVE',
//                    supervisor: supervisor
//            )
//            intern.save()
//            println "✓ Created intern profile"
//        }
//
//        println "=== SAMPLE DATA READY ==="
//        println "Admin: admin@intern.com / admin123"
//        println "Supervisor: ahmed.supervisor@company.com / super123"
//        println "Intern: mohammed.student@university.edu / intern123"
//    }
//
//    private void assignRole(User user, String roleName) {
//        def role = Role.findByAuthority(roleName)
//        if (role && user && !UserRole.exists(user.id, role.id)) {
//            new UserRole(user: user, role: role).save()
//            println "✓ Assigned role ${roleName} to ${user.username}"
//        }
//    }
//
//    def destroy = {
//        println "=== APPLICATION SHUTTING DOWN ==="
//    }
//}

//this i use
//package interntrack
//
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
//
//class BootStrap {
//
//    def init = { servletContext ->
//        println "=== STARTING BOOTSTRAP ==="
//
//        User.withTransaction {
//            createRoles()
//            createRequestmaps() // ✅ إضافة دالة جديدة
//            createSampleData()
//        }
//
//        println "=== BOOTSTRAP COMPLETE ==="
//    }
//
//    private void createRoles() {
//        ['ROLE_ADMIN', 'ROLE_SUPERVISOR', 'ROLE_INTERN'].each { authority ->
//            if (!Role.findByAuthority(authority)) {
//                new Role(authority: authority).save()
//                println "✓ Created role: ${authority}"
//            }
//        }
//    }
//
//    // ✅ دالة جديدة لإنشاء Requestmaps
//    private void createRequestmaps() {
//        println "=== CREATING REQUESTMAPS ==="
//
//        // 1. الصفحات العامة (الكل يشوفها)
//        def publicUrls = [
//                '/': 'permitAll',
//                '/index': 'permitAll',
//                '/assets/**': 'permitAll',
//                '/**/js/**': 'permitAll',
//                '/**/css/**': 'permitAll',
//                '/**/images/**': 'permitAll',
//                '/login/**': 'permitAll',
//                '/logout/**': 'permitAll',
//                '/error': 'permitAll',
//                '/notFound': 'permitAll',
//                '/login/auth': 'permitAll',              // ✅ ADD THIS
//                '/login/authenticate': 'permitAll',      // ✅ ADD THIS
//                '/login/success': 'permitAll',           // ✅ ADD THIS
//                '/login/authfail': 'permitAll',          // ✅ ADD THIS
//                '/login/testAuth': 'permitAll'
//        ]
//
//        // 2. صفحات Admin فقط
//        def adminUrls = [
//                '/admin/**': 'ROLE_ADMIN',
//                '/user/**': 'ROLE_ADMIN',
//                '/role/**': 'ROLE_ADMIN'
//        ]
//
//        // 3. صفحات Supervisor
//        def supervisorUrls = [
//                '/intern/**': 'ROLE_SUPERVISOR,ROLE_ADMIN',
//                '/evaluation/**': 'ROLE_SUPERVISOR,ROLE_ADMIN'
//        ]
//
//        // 4. صفحات Intern
//        def internUrls = [
//                '/task/**': 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN',
//                '/weeklyReport/**': 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN',
//                '/profile/**': 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN'
//        ]
//
//        // 5. صفحات Dashboard حسب الدور
//        def dashboardUrls = [
//                '/dashboard/admin': 'ROLE_ADMIN',
//                '/dashboard/supervisor': 'ROLE_SUPERVISOR',
//                '/dashboard/intern': 'ROLE_INTERN',
//                '/dashboard/index': 'ROLE_ADMIN,ROLE_SUPERVISOR,ROLE_INTERN'
////                '/login/success': 'permitAll'
//
//        ]
//
//        // حفظ كل الـ Requestmaps
//        [publicUrls, adminUrls, supervisorUrls, internUrls, dashboardUrls].each { map ->
//            map.each { url, role ->
//                if (!Requestmap.findByUrl(url)) {
//                    def requestmap = new Requestmap(url: url, configAttribute: role)
//                    if (requestmap.save()) {
//                        println "  ✓ Created requestmap: ${url} -> ${role}"
//                    } else {
//                        println "  ✗ Failed to create requestmap: ${url} - ${requestmap.errors}"
//                    }
//                }
//            }
//        }
//    }
//
//    private void createSampleData() {
//        println "=== CREATING SAMPLE DATA ==="
//
//        def encoder = new BCryptPasswordEncoder()
//
//        Calendar cal = Calendar.getInstance()
//        cal.add(Calendar.DAY_OF_MONTH, -30)
//        Date startDate = cal.time
//
//        cal = Calendar.getInstance()
//        cal.add(Calendar.DAY_OF_MONTH, 60)
//        Date endDate = cal.time
//
//        // 1. ADMIN
//        def adminUser = User.findByUsername('admin@intern.com')
//        if (!adminUser) {
//            adminUser = new User(
//                    username: 'admin@intern.com',
//                    password: encoder.encode('admin123'),
//                    email: 'admin@intern.com',
//                    fullName: 'System Administrator',
//                    enabled: true
//            )
//            adminUser.save()
//            println "✓ Created admin user"
//        }
//        assignRole(adminUser, 'ROLE_ADMIN')
//
//        // 2. SUPERVISOR
//        def supervisorUser = User.findByUsername('ahmed.supervisor@company.com')
//        if (!supervisorUser) {
//            supervisorUser = new User(
//                    username: 'ahmed.supervisor@company.com',
//                    password: encoder.encode('super123'),
//                    email: 'ahmed.supervisor@company.com',
//                    fullName: 'Ahmed Mohammed',
//                    enabled: true
//            )
//            supervisorUser.save()
//            println "✓ Created supervisor user"
//        }
//        assignRole(supervisorUser, 'ROLE_SUPERVISOR')
//
//        // 3. SUPERVISOR PROFILE
//        def supervisor = Supervisor.findByUser(supervisorUser)
//        if (!supervisor) {
//            supervisor = new Supervisor(
//                    user: supervisorUser,
//                    employeeId: 'EMP001',
//                    department: 'IT Department',
//                    position: 'Senior Software Engineer',
//                    maxInterns: 3
//            )
//            supervisor.save()
//            println "✓ Created supervisor profile"
//        }
//
//        // 4. INTERN
//        def internUser = User.findByUsername('mohammed.student@university.edu')
//        if (!internUser) {
//            internUser = new User(
//                    username: 'mohammed.student@university.edu',
//                    password: encoder.encode('intern123'),
//                    email: 'mohammed.student@university.edu',
//                    fullName: 'Mohammed Hassan',
//                    enabled: true
//            )
//            internUser.save()
//            println "✓ Created intern user"
//        }
//        assignRole(internUser, 'ROLE_INTERN')
//
//        // 5. INTERN PROFILE
//        def intern = Intern.findByUser(internUser)
//        if (!intern) {
//            intern = new Intern(
//                    user: internUser,
//                    studentId: '20231001',
//                    university: 'King Saud University',
//                    major: 'Computer Science',
//                    startDate: startDate,
//                    endDate: endDate,
//                    status: 'ACTIVE',
//                    supervisor: supervisor
//            )
//            intern.save()
//            println "✓ Created intern profile"
//        }
//
//        println "=== SAMPLE DATA READY ==="
//        println "Admin: admin@intern.com / admin123"
//        println "Supervisor: ahmed.supervisor@company.com / super123"
//        println "Intern: mohammed.student@university.edu / intern123"
//    }
//
//    private void assignRole(User user, String roleName) {
//        def role = Role.findByAuthority(roleName)
//        if (role && user && !UserRole.exists(user.id, role.id)) {
//            new UserRole(user: user, role: role).save()
//            println "✓ Assigned role ${roleName} to ${user.username}"
//        }
//    }
//
//    def destroy = {
//        println "=== APPLICATION SHUTTING DOWN ==="
//    }
//}
package interntrack

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

class BootStrap {

    def init = { servletContext ->
        println "=== STARTING BOOTSTRAP ==="

        User.withTransaction {
            createRoles()
            createRequestmaps()
            createSampleData()
        }

        println "=== BOOTSTRAP COMPLETE ==="
    }

    private void createRoles() {
        ['ROLE_ADMIN', 'ROLE_SUPERVISOR', 'ROLE_INTERN'].each { authority ->
            if (!Role.findByAuthority(authority)) {
                new Role(authority: authority)
                        .save(failOnError: true, flush: true)
                println "✓ Created role: ${authority}"
            }
        }
    }

    private void createRequestmaps() {
        println "=== CREATING REQUESTMAPS ==="

        def publicUrls = [
                '/': 'permitAll',
                '/index': 'permitAll',
                '/assets/**': 'permitAll',
                '/**/js/**': 'permitAll',
                '/**/css/**': 'permitAll',
                '/**/images/**': 'permitAll',
                '/login/**': 'permitAll',
                '/logout/**': 'permitAll',
                '/error': 'permitAll',
                '/notFound': 'permitAll',
                '/login/auth': 'permitAll',
                '/login/authenticate': 'permitAll',
                '/login/success': 'permitAll',
                '/login/authfail': 'permitAll'
        ]

        def adminUrls = [
                '/admin/**': 'ROLE_ADMIN',
                '/user/**': 'ROLE_ADMIN',
                '/role/**': 'ROLE_ADMIN'
        ]

        def supervisorUrls = [
                '/intern/**': 'ROLE_SUPERVISOR,ROLE_ADMIN',
                '/evaluation/**': 'ROLE_SUPERVISOR,ROLE_ADMIN'
        ]

        def internUrls = [
                '/task/**': 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN',
                '/weeklyReport/**': 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN',
                '/profile/**': 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN'
        ]

        def dashboardUrls = [
                '/dashboard/admin': 'ROLE_ADMIN',
                '/dashboard/supervisor': 'ROLE_SUPERVISOR',
                '/dashboard/intern': 'ROLE_INTERN',
                '/dashboard/index': 'ROLE_ADMIN,ROLE_SUPERVISOR,ROLE_INTERN'
        ]

        [publicUrls, adminUrls, supervisorUrls, internUrls, dashboardUrls].each { map ->
            map.each { url, role ->
                if (!Requestmap.findByUrl(url)) {
                    new Requestmap(url: url, configAttribute: role)
                            .save(failOnError: true, flush: true)
                    println "  ✓ ${url} -> ${role}"
                }
            }
        }
    }

    private void createSampleData() {
        println "=== CREATING SAMPLE DATA ==="

        def encoder = new BCryptPasswordEncoder()

        Calendar cal = Calendar.getInstance()
        cal.add(Calendar.DAY_OF_MONTH, -30)
        Date startDate = cal.time

        cal = Calendar.getInstance()
        cal.add(Calendar.DAY_OF_MONTH, 60)
        Date endDate = cal.time

        // ADMIN
        def adminUser = User.findByUsername('admin@intern.com')
        if (!adminUser) {
            adminUser = new User(
                    username: 'admin@intern.com',
                    password: encoder.encode('admin123'),
                    email: 'admin@intern.com',
                    fullName: 'System Administrator',
                    enabled: true
            ).save(failOnError: true, flush: true)
            println "✓ Created admin user"
        }
        assignRole(adminUser, 'ROLE_ADMIN')

        // SUPERVISOR
        def supervisorUser = User.findByUsername('ahmed.supervisor@company.com')
        if (!supervisorUser) {
            supervisorUser = new User(
                    username: 'ahmed.supervisor@company.com',
                    password: encoder.encode('super123'),
                    email: 'ahmed.supervisor@company.com',
                    fullName: 'Ahmed Mohammed',
                    enabled: true
            ).save(failOnError: true, flush: true)
            println "✓ Created supervisor user"
        }
        assignRole(supervisorUser, 'ROLE_SUPERVISOR')

        def supervisor = Supervisor.findByUser(supervisorUser)
        if (!supervisor) {
            supervisor = new Supervisor(
                    user: supervisorUser,
                    employeeId: 'EMP001',
                    department: 'IT Department',
                    position: 'Senior Software Engineer',
                    maxInterns: 3
            ).save(failOnError: true, flush: true)
            println "✓ Created supervisor profile"
        }

        // INTERN
        def internUser = User.findByUsername('mohammed.student@university.edu')
        if (!internUser) {
            internUser = new User(
                    username: 'mohammed.student@university.edu',
                    password: encoder.encode('intern123'),
                    email: 'mohammed.student@university.edu',
                    fullName: 'Mohammed Hassan',
                    enabled: true
            ).save(failOnError: true, flush: true)
            println "✓ Created intern user"
        }
        assignRole(internUser, 'ROLE_INTERN')

        def intern = Intern.findByUser(internUser)
        if (!intern) {
            intern = new Intern(
                    user: internUser,
                    studentId: '20231001',
                    university: 'King Saud University',
                    major: 'Computer Science',
                    department: 'IT',
                    yearOfStudy: '4',
                    startDate: startDate,
                    endDate: endDate,
                    status: 'ACTIVE',
                    totalHours: 0G,
                    notes: 'New intern',
                    emergencyContact: 'Father',
                    emergencyPhone: '0590000000',
                    supervisor: supervisor
            ).save(failOnError: true, flush: true)

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
            new UserRole(user: user, role: role)
                    .save(failOnError: true, flush: true)
            println "✓ Assigned role ${roleName} to ${user.username}"
        }
    }

    def destroy = {
        println "=== APPLICATION SHUTTING DOWN ==="
    }
}
