//////package interntrack
//////
//////import interntrack.Intern
//////import interntrack.Role
//////import interntrack.User
//////import interntrack.UserRole
//////import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
//////
//////class BootStrap {
//////
//////    def init = { servletContext ->
//////        println "=== STARTING BOOTSTRAP ==="
//////
//////        User.withTransaction {
//////            createRoles()
//////            createSampleData()
//////        }
//////
//////        println "=== BOOTSTRAP COMPLETE ==="
//////    }
//////
//////    private void createRoles() {
//////        ['ROLE_ADMIN', 'ROLE_SUPERVISOR', 'ROLE_INTERN'].each { authority ->
//////            if (!Role.findByAuthority(authority)) {
//////                new Role(authority: authority).save()
//////                println "✓ Created role: ${authority}"
//////            }
//////        }
//////    }
//////
//////    private void createSampleData() {
//////        println "=== CREATING SAMPLE DATA ==="
//////
//////        def encoder = new BCryptPasswordEncoder()
//////
//////        // التواريخ باستخدام Calendar
//////        Calendar cal = Calendar.getInstance()
//////        cal.add(Calendar.DAY_OF_MONTH, -30)
//////        Date startDate = cal.time
//////
//////        cal = Calendar.getInstance()
//////        cal.add(Calendar.DAY_OF_MONTH, 60)
//////        Date endDate = cal.time
//////
//////        // 1. ADMIN - بدون role في الكونستركتر
//////        def adminUser = User.findByUsername('admin@intern.com')
//////        if (!adminUser) {
//////            adminUser = new User(
//////                    username: 'admin@intern.com',
//////                    password: encoder.encode('admin123'),
//////                    email: 'admin@intern.com',
//////                    fullName: 'System Administrator',
//////                    enabled: true
//////            )
//////            adminUser.save()
//////            println "✓ Created admin user"
//////        }
//////        assignRole(adminUser, 'ROLE_ADMIN')
//////
//////        // 2. SUPERVISOR - بدون role في الكونستركتر
//////        def supervisorUser = User.findByUsername('ahmed.supervisor@company.com')
//////        if (!supervisorUser) {
//////            supervisorUser = new User(
//////                    username: 'ahmed.supervisor@company.com',
//////                    password: encoder.encode('super123'),
//////                    email: 'ahmed.supervisor@company.com',
//////                    fullName: 'Ahmed Mohammed',
//////                    enabled: true
//////            )
//////            supervisorUser.save()
//////            println "✓ Created supervisor user"
//////        }
//////        assignRole(supervisorUser, 'ROLE_SUPERVISOR')
//////
//////        // 3. SUPERVISOR PROFILE
//////        def supervisor = Supervisor.findByUser(supervisorUser)
//////        if (!supervisor) {
//////            supervisor = new Supervisor(
//////                    user: supervisorUser,
//////                    employeeId: 'EMP001',
//////                    department: 'IT Department',
//////                    position: 'Senior Software Engineer',
//////                    maxInterns: 3
//////            )
//////            supervisor.save()
//////            println "✓ Created supervisor profile"
//////        }
//////
//////        // 4. INTERN - بدون role في الكونستركتر
//////        def internUser = User.findByUsername('mohammed.student@university.edu')
//////        if (!internUser) {
//////            internUser = new User(
//////                    username: 'mohammed.student@university.edu',
//////                    password: encoder.encode('intern123'),
//////                    email: 'mohammed.student@university.edu',
//////                    fullName: 'Mohammed Hassan',
//////                    enabled: true
//////            )
//////            internUser.save()
//////            println "✓ Created intern user"
//////        }
//////        assignRole(internUser, 'ROLE_INTERN')
//////
//////        // 5. INTERN PROFILE
//////        def intern = Intern.findByUser(internUser)
//////        if (!intern) {
//////            intern = new Intern(
//////                    user: internUser,
//////                    studentId: '20231001',
//////                    university: 'King Saud University',
//////                    major: 'Computer Science',
//////                    startDate: startDate,
//////                    endDate: endDate,
//////                    status: 'ACTIVE',
//////                    supervisor: supervisor
//////            )
//////            intern.save()
//////            println "✓ Created intern profile"
//////        }
//////
//////        println "=== SAMPLE DATA READY ==="
//////        println "Admin: admin@intern.com / admin123"
//////        println "Supervisor: ahmed.supervisor@company.com / super123"
//////        println "Intern: mohammed.student@university.edu / intern123"
//////    }
//////
//////    private void assignRole(User user, String roleName) {
//////        def role = Role.findByAuthority(roleName)
//////        if (role && user && !UserRole.exists(user.id, role.id)) {
//////            new UserRole(user: user, role: role).save()
//////            println "✓ Assigned role ${roleName} to ${user.username}"
//////        }
//////    }
//////
//////    def destroy = {
//////        println "=== APPLICATION SHUTTING DOWN ==="
//////    }
//////}
////
//////this i use
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
//                '/favicon.ico': 'permitAll',          // ✅ ADD THIS
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
//                '/intern/create/**': 'ROLE_SUPERVISOR,ROLE_ADMIN',
//                '/intern/save/**': 'ROLE_SUPERVISOR,ROLE_ADMIN',
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
//package interntrack
//
//class BootStrap {
//
//    def init = { servletContext ->
//
//        Requestmap.withTransaction {
//
//            // حذف الـ requestmaps القديمة
//            Requestmap.executeUpdate("delete from Requestmap")
//
//            def rules = [
//
//                    // ===== PUBLIC =====
//                    [url: '/',                       role: 'permitAll'],
//                    [url: '/index',                  role: 'permitAll'],
//                    [url: '/assets/**',              role: 'permitAll'],
//                    [url: '/**/js/**',               role: 'permitAll'],
//                    [url: '/**/css/**',              role: 'permitAll'],
//                    [url: '/**/images/**',           role: 'permitAll'],
//                    [url: '/login/**',               role: 'permitAll'],
//                    [url: '/logout/**',              role: 'permitAll'],
//                    [url: '/error',                  role: 'permitAll'],
//                    [url: '/notFound',               role: 'permitAll'],
//                    [url: '/favicon.ico',            role: 'permitAll'],
//
//                    // ===== DASHBOARD =====
//                    [url: '/dashboard/admin/**',      role: 'ROLE_ADMIN'],
//                    [url: '/dashboard/supervisor/**', role: 'ROLE_SUPERVISOR'],
//                    [url: '/dashboard/intern/**',     role: 'ROLE_INTERN'],
//                    [url: '/dashboard/index/**',      role: 'ROLE_ADMIN,ROLE_SUPERVISOR,ROLE_INTERN'],
//
//                    // ===== ADMIN =====
//                    [url: '/admin/**',               role: 'ROLE_ADMIN'],
//                    [url: '/user/**',                role: 'ROLE_ADMIN'],
//                    [url: '/role/**',                role: 'ROLE_ADMIN'],
//                    [url: '/supervisor/**',          role: 'ROLE_ADMIN'],
//
//                    // ===== SUPERVISOR =====
//                    [url: '/intern/**',              role: 'ROLE_SUPERVISOR,ROLE_ADMIN'],
//                    [url: '/evaluation/**',          role: 'ROLE_SUPERVISOR,ROLE_ADMIN'],
//
//                    // ===== INTERN =====
//                    [url: '/task/**',                role: 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN'],
//                    [url: '/weeklyReport/**',        role: 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN'],
//                    [url: '/profile/**',             role: 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN'],
//            ]
//
//            rules.each {
//                new Requestmap(
//                        url: it.url,
//                        configAttribute: it.role
//                ).save(flush: true)
//            }
//        }
//    }
//
//    def destroy = {
//    }
//}
package interntrack

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

class BootStrap {

    def init = { servletContext ->
        println "=== STARTING BOOTSTRAP ==="

        User.withTransaction {
            createRoles()
            createUsersAndProfiles() // ✅ دالة جديدة تجمع كل شيء
            createRequestmaps()
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

    private void createRequestmaps() {
        println "=== CREATING REQUESTMAPS ==="

        // حذف القديمة
        Requestmap.executeUpdate("delete from Requestmap")

        def rules = [
                // Public
                [url: '/',                       role: 'permitAll'],
                [url: '/index',                  role: 'permitAll'],
                [url: '/assets/**',              role: 'permitAll'],
                [url: '/**/js/**',               role: 'permitAll'],
                [url: '/**/css/**',              role: 'permitAll'],
                [url: '/**/images/**',           role: 'permitAll'],
                [url: '/login/**',               role: 'permitAll'],
                [url: '/logout/**',              role: 'permitAll'],
                [url: '/error',                   role: 'permitAll'],
                [url: '/notFound',                role: 'permitAll'],
                [url: '/favicon.ico',             role: 'permitAll'],

                // Dashboard
                [url: '/dashboard/admin/**',      role: 'ROLE_ADMIN'],
                [url: '/dashboard/supervisor/**', role: 'ROLE_SUPERVISOR'],
                [url: '/dashboard/intern/**',     role: 'ROLE_INTERN'],
                [url: '/dashboard/index/**',      role: 'ROLE_ADMIN,ROLE_SUPERVISOR,ROLE_INTERN'],

                // Admin
                [url: '/admin/**',                role: 'ROLE_ADMIN'],
                [url: '/user/**',                 role: 'ROLE_ADMIN'],
                [url: '/role/**',                 role: 'ROLE_ADMIN'],
                [url: '/supervisor/**',           role: 'ROLE_ADMIN'],

                // Supervisor
                [url: '/intern/**',               role: 'ROLE_SUPERVISOR,ROLE_ADMIN'],
                [url: '/evaluation/**',           role: 'ROLE_SUPERVISOR,ROLE_ADMIN'],

                // Intern
                [url: '/task/**',                 role: 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN'],
                [url: '/weeklyReport/**',         role: 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN'],
                [url: '/profile/**',               role: 'ROLE_INTERN,ROLE_SUPERVISOR,ROLE_ADMIN'],
        ]

        rules.each { rule ->
            if (!Requestmap.findByUrl(rule.url)) {
                new Requestmap(
                        url: rule.url,
                        configAttribute: rule.role
                ).save()
                println "  ✓ Created requestmap: ${rule.url}"
            }
        }
    }

    private void createUsersAndProfiles() {
        println "=== CREATING USERS AND PROFILES ==="

        def encoder = new BCryptPasswordEncoder()

        // ===== 1. ADMIN =====
        def adminUser = createUser(
                username: 'admin@intern.com',
                password: encoder.encode('admin123'),
                email: 'admin@intern.com',
                fullName: 'System Administrator'
        )
        assignRole(adminUser, 'ROLE_ADMIN')

        // ===== 2. SUPERVISOR USER =====
        def supervisorUser = createUser(
                username: 'ahmed.supervisor@company.com',
                password: encoder.encode('super123'),
                email: 'ahmed.supervisor@company.com',
                fullName: 'Ahmed Mohammed'
        )
        assignRole(supervisorUser, 'ROLE_SUPERVISOR')

        // ===== 3. SUPERVISOR PROFILE =====
        def supervisor = Supervisor.findByUser(supervisorUser)
        if (!supervisor) {
            supervisor = new Supervisor(
                    user: supervisorUser,
                    employeeId: 'EMP001',
                    department: 'IT Department',
                    position: 'Senior Software Engineer',
                    maxInterns: 5,
                    officeLocation: 'Floor 3, Room 305',
                    phoneExtension: '1234',
                    qualifications: 'PhD in Computer Science, 10 years experience'
            ).save()
            println "✓ Created supervisor profile for ${supervisorUser.fullName}"
        }

        // ===== 4. INTERN USER =====
        def internUser = createUser(
                username: 'mohammed.student@university.edu',
                password: encoder.encode('intern123'),
                email: 'mohammed.student@university.edu',
                fullName: 'Mohammed Hassan'
        )
        assignRole(internUser, 'ROLE_INTERN')

        // ===== 5. INTERN PROFILE =====
        def intern = Intern.findByUser(internUser)
        if (!intern) {
            // حساب التواريخ بشكل صحيح
            Calendar cal = Calendar.getInstance()
            cal.set(Calendar.HOUR_OF_DAY, 0)
            cal.set(Calendar.MINUTE, 0)
            cal.set(Calendar.SECOND, 0)
            cal.set(Calendar.MILLISECOND, 0)

            Date startDate = cal.time

            cal.add(Calendar.DAY_OF_MONTH, 180) // 6 أشهر
            Date endDate = cal.time

            intern = new Intern(
                    user: internUser,
                    studentId: '20231001',
                    university: 'King Saud University',
                    major: 'Computer Science',
                    startDate: startDate,
                    endDate: endDate,
                    status: 'ACTIVE',
                    supervisor: supervisor,
                    totalHours: 0.0G
            ).save()
            println "✓ Created intern profile for ${internUser.fullName}"
            println "  - Student ID: 20231001"
            println "  - University: King Saud University"
            println "  - Major: Computer Science"
            println "  - Start Date: ${startDate.format('yyyy-MM-dd')}"
            println "  - End Date: ${endDate.format('yyyy-MM-dd')}"
            println "  - Supervisor: ${supervisor.user.fullName}"
        }

        // ===== 6. إنشاء بعض المهام للعرض =====
        createSampleTasks(intern)

        println "=== SAMPLE DATA READY ==="
        println "Admin:    admin@intern.com / admin123"
        println "Supervisor: ahmed.supervisor@company.com / super123"
        println "Intern:   mohammed.student@university.edu / intern123"
    }

    private User createUser(Map params) {
        def user = User.findByUsername(params.username)
        if (!user) {
            user = new User(
                    username: params.username,
                    password: params.password,
                    email: params.email,
                    fullName: params.fullName,
                    enabled: true
            )
            if (user.save()) {
                println "✓ Created user: ${params.fullName} (${params.username})"
            } else {
                println "✗ Failed to create user: ${params.username} - ${user.errors}"
            }
        }
        return user
    }

    private void assignRole(User user, String roleName) {
        if (!user) return

        def role = Role.findByAuthority(roleName)
        if (role && !UserRole.findByUserAndRole(user, role)) {
            new UserRole(user: user, role: role).save()
            println "✓ Assigned role ${roleName} to ${user.username}"
        }
    }

    private void createSampleTasks(Intern intern) {
        if (!intern) return

        println "=== CREATING SAMPLE TASKS ==="

        Calendar cal = Calendar.getInstance()

        // مهمة 1: مستحقة قريباً
        cal.setTime(new Date())
        cal.add(Calendar.DAY_OF_MONTH, 2)
        def task1 = Task.findByTitleAndIntern('Complete project documentation', intern)
        if (!task1) {
            task1 = new Task(
                    title: 'Complete project documentation',
                    description: 'Write comprehensive documentation for the internship project including setup guide, API documentation, and user manual.',
                    dueDate: cal.time,
                    priority: 'HIGH',
                    status: 'IN_PROGRESS',
                    intern: intern,
                    estimatedHours: 8
            ).save()
            println "✓ Created task: Complete project documentation"
        }

        // مهمة 2: مستحقة الأسبوع القادم
        cal.setTime(new Date())
        cal.add(Calendar.DAY_OF_MONTH, 5)
        def task2 = Task.findByTitleAndIntern('Prepare presentation slides', intern)
        if (!task2) {
            task2 = new Task(
                    title: 'Prepare presentation slides',
                    description: 'Create slides for the final presentation covering project overview, achievements, and lessons learned.',
                    dueDate: cal.time,
                    priority: 'MEDIUM',
                    status: 'PENDING',
                    intern: intern,
                    estimatedHours: 4
            ).save()
            println "✓ Created task: Prepare presentation slides"
        }

        // مهمة 3: مهمة مكتملة
        cal.setTime(new Date())
        cal.add(Calendar.DAY_OF_MONTH, -10)
        def task3 = Task.findByTitleAndIntern('Setup development environment', intern)
        if (!task3) {
            task3 = new Task(
                    title: 'Setup development environment',
                    description: 'Install and configure IDE, databases, and required tools for the project.',
                    dueDate: cal.time,
                    priority: 'HIGH',
                    status: 'COMPLETED',
                    intern: intern,
                    estimatedHours: 3,
                    actualHours: 2,
                    completedDate: new Date()
            ).save()
            println "✓ Created task: Setup development environment"
        }
    }

    def destroy = {
        println "=== APPLICATION SHUTTING DOWN ==="
    }
}