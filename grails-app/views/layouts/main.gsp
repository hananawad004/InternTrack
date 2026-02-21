
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
%{--    <meta name="layout" content="main">--}%
    <title><g:layoutTitle default="InternTrack"/></title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
%{--    <g:layoutHead/>--}%
    <style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f8f9fa;
        padding-top: 80px;
    }

    /* Navbar Styles */
    .navbar {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        padding: 15px 0;
    }

    .navbar-brand {
        font-size: 1.5rem;
        font-weight: 700;
        color: white !important;
        display: flex;
        align-items: center;
    }

    .navbar-brand i {
        font-size: 1.8rem;
        margin-right: 10px;
    }

    .nav-link {
        color: rgba(255,255,255,0.9) !important;
        font-weight: 500;
        padding: 8px 15px !important;
        border-radius: 6px;
        transition: all 0.3s;
        margin: 0 3px;
    }

    .nav-link:hover {
        background-color: rgba(255,255,255,0.1);
        color: white !important;
    }

    .nav-link.active {
        background-color: rgba(255,255,255,0.2);
        color: white !important;
    }

    .nav-link i {
        margin-right: 8px;
        font-size: 1rem;
    }

    /* User Menu */
    .user-menu {
        display: flex;
        align-items: center;
        color: white;
        padding: 5px 15px;
        border-radius: 30px;
        background-color: rgba(255,255,255,0.1);
        cursor: pointer;
        transition: all 0.3s;
    }

    .user-menu:hover {
        background-color: rgba(255,255,255,0.2);
    }

    .user-avatar {
        width: 35px;
        height: 35px;
        border-radius: 50%;
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        color: white;
        margin-right: 10px;
    }

    .user-info {
        display: flex;
        flex-direction: column;
    }

    .user-name {
        font-size: 0.9rem;
        font-weight: 600;
    }

    .user-role {
        font-size: 0.7rem;
        opacity: 0.9;
    }

    /* Dropdown Menu */
    .dropdown-menu {
        border: none;
        box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        border-radius: 10px;
        padding: 10px 0;
        margin-top: 10px;
    }

    .dropdown-item {
        padding: 10px 20px;
        font-weight: 500;
        color: #2c3e50;
        transition: all 0.3s;
    }

    .dropdown-item:hover {
        background-color: #f8f9fa;
        color: #667eea;
    }

    .dropdown-item i {
        margin-right: 10px;
        width: 20px;
        color: #667eea;
    }

    .dropdown-divider {
        margin: 8px 0;
        border-top: 1px solid #eaeaea;
    }

    /* Main Content */
    .main-content {
        min-height: calc(100vh - 150px);
        padding: 20px 0;
    }

    /* Footer */
    .footer {
        background-color: white;
        padding: 20px 0;
        margin-top: 50px;
        border-top: 1px solid #eaeaea;
        color: #6c757d;
    }

    /* Notifications */
    .notification-badge {
        position: absolute;
        top: -5px;
        right: -5px;
        background-color: #dc3545;
        color: white;
        border-radius: 50%;
        padding: 3px 6px;
        font-size: 0.7rem;
        font-weight: 600;
    }

    /* Responsive */
    @media (max-width: 768px) {
        body {
            padding-top: 70px;
        }

        .navbar-brand {
            font-size: 1.2rem;
        }

        .navbar-brand i {
            font-size: 1.5rem;
        }

        .user-info {
            display: none;
        }
    }
    </style>

    <g:layoutHead/>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid px-4">
    <!-- Brand -->
        <g:link controller="dashboard" action="index" class="navbar-brand">
            <i class="fas fa-chart-line"></i>
            InternTrack
        </g:link>

    <!-- Mobile Toggle -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
            <span class="navbar-toggler-icon" style="filter: invert(1);"></span>
        </button>

        <!-- Navigation Links -->
        <div class="collapse navbar-collapse" id="navbarMain">
            <ul class="navbar-nav me-auto">
                <!-- Dashboard -->
                <li class="nav-item">
                    <g:link controller="dashboard" action="index" class="nav-link ${pageProperty(name: 'active-dashboard') ? 'active' : ''}">
                        <i class="fas fa-tachometer-alt"></i>
                        Dashboard
                    </g:link>
                </li>

                <!-- Tasks -->
                <li class="nav-item">
                    <g:link controller="task" action="index" class="nav-link ${pageProperty(name: 'active-tasks') ? 'active' : ''}">
                        <i class="fas fa-tasks"></i>
                        Tasks
                    </g:link>
                </li>

                <!-- Reports -->
                <li class="nav-item">
                    <g:link controller="weeklyReport" action="index" class="nav-link ${pageProperty(name: 'active-reports') ? 'active' : ''}">
                        <i class="fas fa-file-alt"></i>
                        Reports
                        <!-- Notification Badge (example) -->
                        <g:if test="${pendingReportsCount > 0}">
                            <span class="notification-badge">${pendingReportsCount}</span>
                        </g:if>
                    </g:link>
                </li>
%{--                "${session?.user}"--}%
%{--            "${session?.user?.authorities?.any { it.authority in ['ROLE_SUPERVISOR', 'ROLE_ADMIN'] }}"--}%
            <!-- Interns (Supervisor/Admin only) -->
                <g:if test="${session?.user?.authorities?.any { it.authority in ['ROLE_SUPERVISOR', 'ROLE_ADMIN'] }}">
                    <li class="nav-item">
                        <g:link controller="intern" action="index" class="nav-link ${pageProperty(name: 'active-interns') ? 'active' : ''}">
                            <i class="fas fa-users"></i>
                            Interns
                        </g:link>
                    </li>
                </g:if>

            <!-- Evaluations -->
                <g:if test="${session?.user?.authorities?.any { it.authority in ['ROLE_SUPERVISOR', 'ROLE_ADMIN'] }}">
                    <li class="nav-item">
                        <g:link controller="evaluation" action="index" class="nav-link ${pageProperty(name: 'active-evaluations') ? 'active' : ''}">
                            <i class="fas fa-star"></i>
                            Evaluations
                        </g:link>
                    </li>
                </g:if>

            <!-- Admin Menu -->
                <g:if test="${session?.user?.authorities?.any { it.authority == 'ROLE_ADMIN' }}">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-cog"></i>
                            Admin
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <g:link controller="user" action="index" class="dropdown-item">
                                    <i class="fas fa-users-cog"></i>
                                    Manage Users
                                </g:link>
                            </li>
                            <li>
                                <g:link controller="role" action="index" class="dropdown-item">
                                    <i class="fas fa-shield-alt"></i>
                                    Manage Roles
                                </g:link>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <g:link controller="system" action="settings" class="dropdown-item">
                                    <i class="fas fa-sliders-h"></i>
                                    System Settings
                                </g:link>
                            </li>
                        </ul>
                    </li>
                </g:if>
            </ul>

            <!-- User Menu / Logout -->
        <ul class="navbar-nav">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                    <div class="user-menu">
                        <div class="user-avatar">
                            ${session.initials ?: 'U'}
                        </div>
                        <div class="user-info">
                            <span class="user-name">${session.fullName ?: session.user?.fullName ?: 'User'}</span>
                            <span class="user-role">
                                <g:if test="${session.authorities?.contains('ROLE_ADMIN')}">Admin</g:if>
                                <g:elseif test="${session.authorities?.contains('ROLE_SUPERVISOR')}">Supervisor</g:elseif>
                                <g:elseif test="${session.authorities?.contains('ROLE_INTERN')}">Intern</g:elseif>
                                <g:else>Guest</g:else>
                            </span>
                        </div>
                    </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <!-- Profile -->
                    <li>
                        <g:link controller="profile" action="index" class="dropdown-item">
                            <i class="fas fa-user-circle"></i>
                            My Profile
                        </g:link>
                    </li>
                    <li><hr class="dropdown-divider"></li>
                    <!-- ✅ Logout Button -->
%{--                    <li>--}%
%{--                        <g:link controller="logout" action="index" class="dropdown-item text-danger">--}%
%{--                            <i class="fas fa-sign-out-alt"></i>--}%
%{--                            <strong>Sign Out</strong>--}%
%{--                        </g:link>--}%
%{--                    </li>--}%
                    <li>
                        <a href="${createLink(controller: 'logout', action: 'index')}"
                           class="dropdown-item text-danger"
                           onclick="return confirm('Are you sure you want to sign out?');">
                            <i class="fas fa-sign-out-alt"></i>
                            <strong>Sign Out</strong>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="main-content">
    <div class="container-fluid px-4">
    <!-- Flash Messages -->
        <g:if test="${flash.message}">
            <div class="alert alert-success alert-dismissible fade show mt-3" role="alert">
                <i class="fas fa-check-circle me-2"></i>
                ${flash.message}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </g:if>
        <g:if test="${flash.error}">
            <div class="alert alert-danger alert-dismissible fade show mt-3" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>
                ${flash.error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </g:if>

    <!-- Page Content -->
        <g:layoutBody/>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container-fluid px-4">
        <div class="row">
            <div class="col-md-6 text-muted small">
                &copy; ${new Date()} InternTrack - Internship Management System
            </div>
            <div class="col-md-6 text-end text-muted small">
                Version 1.0.0
            </div>
        </div>
    </div>
</footer>

<!-- Common Scripts -->
<script>
    $(document).ready(function() {
        // Auto-hide alerts after 5 seconds
        setTimeout(function() {
            $('.alert').fadeOut('slow');
        }, 5000);

        // Enable Bootstrap tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        });

        // Enable Bootstrap popovers
        var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
        var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl)
        });

        // Add active class to current navigation
        var currentPath = window.location.pathname;
        $('.nav-link').each(function() {
            var linkPath = $(this).attr('href');
            if (linkPath && currentPath.indexOf(linkPath) !== -1) {
                $(this).addClass('active');
            }
        });
    });

    // Global logout function
    function logout() {
        if (confirm('Are you sure you want to sign out?')) {
            window.location.href = '${createLink(controller: "logout", action: "index")}';
        }
    }
</script>


</body>
</html>