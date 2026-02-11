<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Select Role - InternTrack</title>

    <style>
    body {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .role-container {
        background: white;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        padding: 40px;
        max-width: 800px;
        width: 100%;
    }

    .welcome-header {
        text-align: center;
        margin-bottom: 40px;
    }

    .welcome-header h1 {
        color: #333;
        font-size: 32px;
        margin-bottom: 10px;
    }

    .welcome-header p {
        color: #666;
        font-size: 16px;
    }

    .user-info {
        background: #f8f9fa;
        border-radius: 10px;
        padding: 15px;
        margin-bottom: 30px;
        display: flex;
        align-items: center;
    }

    .user-avatar {
        width: 50px;
        height: 50px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 20px;
        font-weight: bold;
        margin-right: 15px;
    }

    .user-details h3 {
        margin: 0;
        color: #333;
    }

    .user-details p {
        margin: 5px 0 0;
        color: #666;
        font-size: 14px;
    }

    .roles-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        margin-bottom: 30px;
    }

    .role-card {
        border: 2px solid #e9ecef;
        border-radius: 15px;
        padding: 25px;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s ease;
        position: relative;
    }

    .role-card:hover {
        transform: translateY(-5px);
        border-color: #667eea;
        box-shadow: 0 10px 30px rgba(102, 126, 234, 0.2);
    }

    .role-card.selected {
        border-color: #667eea;
        background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
    }

    .role-icon {
        font-size: 48px;
        margin-bottom: 20px;
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .admin-icon {
        color: #dc3545;
    }

    .supervisor-icon {
        color: #ffc107;
    }

    .intern-icon {
        color: #0d6efd;
    }

    .role-title {
        font-size: 20px;
        font-weight: 600;
        color: #333;
        margin-bottom: 10px;
    }

    .role-desc {
        color: #666;
        font-size: 14px;
        line-height: 1.5;
        margin-bottom: 15px;
    }

    .role-badge {
        display: inline-block;
        padding: 5px 15px;
        background: #e9ecef;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 600;
        color: #495057;
    }

    .selected-indicator {
        position: absolute;
        top: 15px;
        right: 15px;
        width: 25px;
        height: 25px;
        background: #667eea;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 12px;
        opacity: 0;
        transition: opacity 0.3s;
    }

    .selected .selected-indicator {
        opacity: 1;
    }

    .continue-btn {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        padding: 15px 40px;
        font-size: 18px;
        font-weight: 600;
        border-radius: 10px;
        cursor: pointer;
        transition: all 0.3s;
        display: block;
        margin: 0 auto;
        min-width: 200px;
    }

    .continue-btn:disabled {
        opacity: 0.5;
        cursor: not-allowed;
    }

    .continue-btn:hover:not(:disabled) {
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
    }

    .btn-container {
        text-align: center;
    }

    .logout-link {
        display: inline-block;
        margin-top: 20px;
        color: #666;
        text-decoration: none;
        font-size: 14px;
    }

    .logout-link:hover {
        color: #dc3545;
    }
    </style>
</head>

<body>

<div class="role-container">
    <div class="welcome-header">
        <h1>Welcome to InternTrack! 🎓</h1>
        <p>You have access to multiple roles. Please select the role you want to use:</p>
    </div>

    <div class="user-info">
        <div class="user-avatar">
            ${springSecurityService.currentUser?.fullName?.substring(0,1)?.toUpperCase() ?: 'U'}
        </div>
        <div class="user-details">
            <h3>${springSecurityService.currentUser?.fullName}</h3>
            <p>${springSecurityService.currentUser?.email}</p>
        </div>
    </div>

    <form id="roleForm" action="${createLink(controller: 'login', action: 'updateRole')}" method="POST">
        <input type="hidden" name="role" id="selectedRole">

        <div class="roles-grid">
            <!-- Admin Role Card -->
            <div class="role-card" onclick="selectRole('admin')">
                <div class="selected-indicator">
                    <i class="fas fa-check"></i>
                </div>
                <div class="role-icon admin-icon">
                    <i class="fas fa-user-shield"></i>
                </div>
                <div class="role-title">Administrator</div>
                <div class="role-desc">
                    Full system access including user management, system configuration, and monitoring all activities.
                </div>
                <div class="role-badge">System Management</div>
            </div>

            <!-- Supervisor Role Card -->
            <div class="role-card" onclick="selectRole('supervisor')">
                <div class="selected-indicator">
                    <i class="fas fa-check"></i>
                </div>
                <div class="role-icon supervisor-icon">
                    <i class="fas fa-user-tie"></i>
                </div>
                <div class="role-title">Supervisor</div>
                <div class="role-desc">
                    Manage interns, review weekly reports, assign tasks, and evaluate performance.
                </div>
                <div class="role-badge">Team Management</div>
            </div>

            <!-- Intern Role Card -->
            <div class="role-card" onclick="selectRole('intern')">
                <div class="selected-indicator">
                    <i class="fas fa-check"></i>
                </div>
                <div class="role-icon intern-icon">
                    <i class="fas fa-user-graduate"></i>
                </div>
                <div class="role-title">Intern</div>
                <div class="role-desc">
                    Submit weekly reports, track assigned tasks, view evaluations, and manage your internship progress.
                </div>
                <div class="role-badge">Learning & Development</div>
            </div>
        </div>

        <div class="btn-container">
            <button type="submit" class="continue-btn" id="continueBtn" disabled>
                <i class="fas fa-arrow-right me-2"></i> Continue to Dashboard
            </button>

            <a href="${createLink(controller: 'logout')}" class="logout-link">
                <i class="fas fa-sign-out-alt me-1"></i> Not you? Logout
            </a>
        </div>
    </form>
</div>

<script>
    let selectedRole = '';

    function selectRole(role) {
        selectedRole = role;

        // Remove selection from all cards
        document.querySelectorAll('.role-card').forEach(card => {
            card.classList.remove('selected');
        });

        // Add selection to clicked card
        event.currentTarget.classList.add('selected');

        // Update hidden input
        document.getElementById('selectedRole').value = role;

        // Enable continue button
        document.getElementById('continueBtn').disabled = false;
        document.getElementById('continueBtn').innerHTML = `
            <i class="fas fa-arrow-right me-2"></i> Continue as ${getRoleName(role)}
        `;
    }

    function getRoleName(role) {
        switch(role) {
            case 'admin': return 'Administrator';
            case 'supervisor': return 'Supervisor';
            case 'intern': return 'Intern';
            default: return 'User';
        }
    }

    // Auto-select based on user's roles (if only one role)
    <sec:ifLoggedIn>
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SUPERVISOR,ROLE_INTERN">
    // Count user's roles
    const userRoles = [];
    <sec:ifAnyGranted roles="ROLE_ADMIN">userRoles.push('admin');</sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_SUPERVISOR">userRoles.push('supervisor');</sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_INTERN">userRoles.push('intern');</sec:ifAnyGranted>

    // If only one role, auto-select it
    if (userRoles.length === 1) {
        setTimeout(() => {
            selectRole(userRoles[0]);
            // Auto-submit after 1 second
            setTimeout(() => {
                document.getElementById('roleForm').submit();
            }, 1000);
        }, 500);
    }
    </sec:ifAnyGranted>
    </sec:ifLoggedIn>

    // Add keyboard navigation
    document.addEventListener('keydown', function(e) {
        if (!selectedRole) return;

        if (e.key === 'Enter' && !document.getElementById('continueBtn').disabled) {
            document.getElementById('roleForm').submit();
        }

        if (e.key === '1') selectRole('admin');
        if (e.key === '2') selectRole('supervisor');
        if (e.key === '3') selectRole('intern');
    });

    // Focus the first role card
    document.addEventListener('DOMContentLoaded', function() {
        const firstCard = document.querySelector('.role-card');
        if (firstCard) {
            firstCard.focus();
        }
    });
</script>

</body>
</html><!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Select Role - InternTrack</title>

    <style>
    body {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .role-container {
        background: white;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        padding: 40px;
        max-width: 800px;
        width: 100%;
    }

    .welcome-header {
        text-align: center;
        margin-bottom: 40px;
    }

    .welcome-header h1 {
        color: #333;
        font-size: 32px;
        margin-bottom: 10px;
    }

    .welcome-header p {
        color: #666;
        font-size: 16px;
    }

    .user-info {
        background: #f8f9fa;
        border-radius: 10px;
        padding: 15px;
        margin-bottom: 30px;
        display: flex;
        align-items: center;
    }

    .user-avatar {
        width: 50px;
        height: 50px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 20px;
        font-weight: bold;
        margin-right: 15px;
    }

    .user-details h3 {
        margin: 0;
        color: #333;
    }

    .user-details p {
        margin: 5px 0 0;
        color: #666;
        font-size: 14px;
    }

    .roles-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
        margin-bottom: 30px;
    }

    .role-card {
        border: 2px solid #e9ecef;
        border-radius: 15px;
        padding: 25px;
        text-align: center;
        cursor: pointer;
        transition: all 0.3s ease;
        position: relative;
    }

    .role-card:hover {
        transform: translateY(-5px);
        border-color: #667eea;
        box-shadow: 0 10px 30px rgba(102, 126, 234, 0.2);
    }

    .role-card.selected {
        border-color: #667eea;
        background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
    }

    .role-icon {
        font-size: 48px;
        margin-bottom: 20px;
        height: 80px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .admin-icon {
        color: #dc3545;
    }

    .supervisor-icon {
        color: #ffc107;
    }

    .intern-icon {
        color: #0d6efd;
    }

    .role-title {
        font-size: 20px;
        font-weight: 600;
        color: #333;
        margin-bottom: 10px;
    }

    .role-desc {
        color: #666;
        font-size: 14px;
        line-height: 1.5;
        margin-bottom: 15px;
    }

    .role-badge {
        display: inline-block;
        padding: 5px 15px;
        background: #e9ecef;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 600;
        color: #495057;
    }

    .selected-indicator {
        position: absolute;
        top: 15px;
        right: 15px;
        width: 25px;
        height: 25px;
        background: #667eea;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 12px;
        opacity: 0;
        transition: opacity 0.3s;
    }

    .selected .selected-indicator {
        opacity: 1;
    }

    .continue-btn {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border: none;
        padding: 15px 40px;
        font-size: 18px;
        font-weight: 600;
        border-radius: 10px;
        cursor: pointer;
        transition: all 0.3s;
        display: block;
        margin: 0 auto;
        min-width: 200px;
    }

    .continue-btn:disabled {
        opacity: 0.5;
        cursor: not-allowed;
    }

    .continue-btn:hover:not(:disabled) {
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
    }

    .btn-container {
        text-align: center;
    }

    .logout-link {
        display: inline-block;
        margin-top: 20px;
        color: #666;
        text-decoration: none;
        font-size: 14px;
    }

    .logout-link:hover {
        color: #dc3545;
    }
    </style>
</head>

<body>

<div class="role-container">
    <div class="welcome-header">
        <h1>Welcome to InternTrack! 🎓</h1>
        <p>You have access to multiple roles. Please select the role you want to use:</p>
    </div>

    <div class="user-info">
        <div class="user-avatar">
            ${springSecurityService.currentUser?.fullName?.substring(0,1)?.toUpperCase() ?: 'U'}
        </div>
        <div class="user-details">
            <h3>${springSecurityService.currentUser?.fullName}</h3>
            <p>${springSecurityService.currentUser?.email}</p>
        </div>
    </div>

    <form id="roleForm" action="${createLink(controller: 'login', action: 'updateRole')}" method="POST">
        <input type="hidden" name="role" id="selectedRole">

        <div class="roles-grid">
            <!-- Admin Role Card -->
            <div class="role-card" onclick="selectRole('admin')">
                <div class="selected-indicator">
                    <i class="fas fa-check"></i>
                </div>
                <div class="role-icon admin-icon">
                    <i class="fas fa-user-shield"></i>
                </div>
                <div class="role-title">Administrator</div>
                <div class="role-desc">
                    Full system access including user management, system configuration, and monitoring all activities.
                </div>
                <div class="role-badge">System Management</div>
            </div>

            <!-- Supervisor Role Card -->
            <div class="role-card" onclick="selectRole('supervisor')">
                <div class="selected-indicator">
                    <i class="fas fa-check"></i>
                </div>
                <div class="role-icon supervisor-icon">
                    <i class="fas fa-user-tie"></i>
                </div>
                <div class="role-title">Supervisor</div>
                <div class="role-desc">
                    Manage interns, review weekly reports, assign tasks, and evaluate performance.
                </div>
                <div class="role-badge">Team Management</div>
            </div>

            <!-- Intern Role Card -->
            <div class="role-card" onclick="selectRole('intern')">
                <div class="selected-indicator">
                    <i class="fas fa-check"></i>
                </div>
                <div class="role-icon intern-icon">
                    <i class="fas fa-user-graduate"></i>
                </div>
                <div class="role-title">Intern</div>
                <div class="role-desc">
                    Submit weekly reports, track assigned tasks, view evaluations, and manage your internship progress.
                </div>
                <div class="role-badge">Learning & Development</div>
            </div>
        </div>

        <div class="btn-container">
            <button type="submit" class="continue-btn" id="continueBtn" disabled>
                <i class="fas fa-arrow-right me-2"></i> Continue to Dashboard
            </button>

            <a href="${createLink(controller: 'logout')}" class="logout-link">
                <i class="fas fa-sign-out-alt me-1"></i> Not you? Logout
            </a>
        </div>
    </form>
</div>

<script>
    let selectedRole = '';

    function selectRole(role) {
        selectedRole = role;

        // Remove selection from all cards
        document.querySelectorAll('.role-card').forEach(card => {
            card.classList.remove('selected');
        });

        // Add selection to clicked card
        event.currentTarget.classList.add('selected');

        // Update hidden input
        document.getElementById('selectedRole').value = role;

        // Enable continue button
        document.getElementById('continueBtn').disabled = false;
        document.getElementById('continueBtn').innerHTML = `
            <i class="fas fa-arrow-right me-2"></i> Continue as ${getRoleName(role)}
        `;
    }

    function getRoleName(role) {
        switch(role) {
            case 'admin': return 'Administrator';
            case 'supervisor': return 'Supervisor';
            case 'intern': return 'Intern';
            default: return 'User';
        }
    }

    // Auto-select based on user's roles (if only one role)
    <sec:ifLoggedIn>
    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SUPERVISOR,ROLE_INTERN">
    // Count user's roles
    const userRoles = [];
    <sec:ifAnyGranted roles="ROLE_ADMIN">userRoles.push('admin');</sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_SUPERVISOR">userRoles.push('supervisor');</sec:ifAnyGranted>
    <sec:ifAnyGranted roles="ROLE_INTERN">userRoles.push('intern');</sec:ifAnyGranted>

    // If only one role, auto-select it
    if (userRoles.length === 1) {
        setTimeout(() => {
            selectRole(userRoles[0]);
            // Auto-submit after 1 second
            setTimeout(() => {
                document.getElementById('roleForm').submit();
            }, 1000);
        }, 500);
    }
    </sec:ifAnyGranted>
    </sec:ifLoggedIn>

    // Add keyboard navigation
    document.addEventListener('keydown', function(e) {
        if (!selectedRole) return;

        if (e.key === 'Enter' && !document.getElementById('continueBtn').disabled) {
            document.getElementById('roleForm').submit();
        }

        if (e.key === '1') selectRole('admin');
        if (e.key === '2') selectRole('supervisor');
        if (e.key === '3') selectRole('intern');
    });

    // Focus the first role card
    document.addEventListener('DOMContentLoaded', function() {
        const firstCard = document.querySelector('.role-card');
        if (firstCard) {
            firstCard.focus();
        }
    });
</script>

</body>
</html>