%{--<%@ page import="grails.plugin.springsecurity.SpringSecurityService" %>--}%
%{--<g:set var="springSecurityService" bean="springSecurityService"/>--}%
%{--<g:set var="currentUser" value="${springSecurityService?.currentUser}"/>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title><g:layoutTitle default="InternTrack"/></title>--}%
%{--    <g:layoutHead/>--}%

%{--    <!-- Bootstrap CSS -->--}%
%{--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--}%
%{--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--}%

%{--    <!-- Custom Styles -->--}%
%{--    <style>--}%
%{--    :root {--}%
%{--        --primary-color: #2C3E50;--}%
%{--        --secondary-color: #1ABC9C;--}%
%{--        --accent-color: #E67E22;--}%
%{--        --light-bg: #F8F9FA;--}%
%{--        --dark-text: #34495E;--}%
%{--    }--}%

%{--    body {--}%
%{--        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--}%
%{--        background-color: var(--light-bg);--}%
%{--        color: var(--dark-text);--}%
%{--        padding-top: 60px;--}%
%{--    }--}%

%{--    .navbar {--}%
%{--        background-color: var(--primary-color);--}%
%{--        box-shadow: 0 2px 4px rgba(0,0,0,0.1);--}%
%{--        position: fixed;--}%
%{--        top: 0;--}%
%{--        width: 100%;--}%
%{--        z-index: 1000;--}%
%{--    }--}%

%{--    .navbar-brand {--}%
%{--        font-weight: 600;--}%
%{--    }--}%

%{--    .avatar {--}%
%{--        width: 32px;--}%
%{--        height: 32px;--}%
%{--        border-radius: 50%;--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--        font-weight: bold;--}%
%{--    }--}%

%{--    .footer {--}%
%{--        margin-top: 2rem;--}%
%{--        padding: 1rem 0;--}%
%{--        background-color: white;--}%
%{--        border-top: 1px solid #dee2e6;--}%
%{--    }--}%

%{--    .alert {--}%
%{--        border-radius: 8px;--}%
%{--        border: none;--}%
%{--    }--}%

%{--    .alert-success {--}%
%{--        background-color: #d4edda;--}%
%{--        color: #155724;--}%
%{--    }--}%

%{--    .alert-danger {--}%
%{--        background-color: #f8d7da;--}%
%{--        color: #721c24;--}%
%{--    }--}%

%{--    .alert-warning {--}%
%{--        background-color: #fff3cd;--}%
%{--        color: #856404;--}%
%{--    }--}%

%{--    @media (max-width: 768px) {--}%
%{--        body {--}%
%{--            padding-top: 56px;--}%
%{--        }--}%
%{--    }--}%
%{--    </style>--}%
%{--</head>--}%
%{--<body>--}%

%{--<nav class="navbar navbar-expand-lg navbar-dark">--}%
%{--    <div class="container-fluid">--}%
%{--        <a class="navbar-brand" href="${createLink(uri: '/')}">--}%
%{--            <i class="fas fa-briefcase me-2"></i>InternTrack--}%
%{--        </a>--}%

%{--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">--}%
%{--            <span class="navbar-toggler-icon"></span>--}%
%{--        </button>--}%

%{--        <div class="collapse navbar-collapse" id="navbarNav">--}%
%{--            <ul class="navbar-nav me-auto">--}%
%{--                <sec:ifLoggedIn>--}%
%{--                    <sec:ifAnyGranted roles="ROLE_ADMIN">--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="dashboard" action="admin">--}%
%{--                                <i class="fas fa-tachometer-alt me-1"></i> Dashboard--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="user" action="index">--}%
%{--                                <i class="fas fa-users-cog me-1"></i> Users--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                    </sec:ifAnyGranted>--}%

%{--                    <sec:ifAnyGranted roles="ROLE_SUPERVISOR">--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="dashboard" action="supervisor">--}%
%{--                                <i class="fas fa-tachometer-alt me-1"></i> Dashboard--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="intern" action="index">--}%
%{--                                <i class="fas fa-users me-1"></i> My Interns--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                    </sec:ifAnyGranted>--}%

%{--                    <sec:ifAnyGranted roles="ROLE_INTERN">--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="dashboard" action="intern">--}%
%{--                                <i class="fas fa-tachometer-alt me-1"></i> Dashboard--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="task" action="index">--}%
%{--                                <i class="fas fa-tasks me-1"></i> My Tasks--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                    </sec:ifAnyGranted>--}%
%{--                </sec:ifLoggedIn>--}%
%{--            </ul>--}%

%{--            <ul class="navbar-nav ms-auto">--}%
%{--                <sec:ifLoggedIn>--}%
%{--                    <li class="nav-item dropdown">--}%
%{--                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">--}%
%{--                            <div class="avatar me-2 bg-primary text-white" style="background-color: #1ABC9C !important;">--}%
%{--                                ${currentUser?.fullName?.substring(0,1)?.toUpperCase() ?: 'U'}--}%
%{--                            </div>--}%
%{--                            <span>${currentUser?.fullName ?: ''}</span>--}%
%{--                        </a>--}%
%{--                        <ul class="dropdown-menu dropdown-menu-end">--}%
%{--                            <li>--}%
%{--                                <g:link class="dropdown-item" controller="profile" action="index">--}%
%{--                                    <i class="fas fa-user me-2"></i> Profile--}%
%{--                                </g:link>--}%
%{--                            </li>--}%
%{--                            <li><hr class="dropdown-divider"></li>--}%
%{--                            <li>--}%
%{--                                <g:link uri="/logout" class="dropdown-item text-danger">--}%
%{--                                    <i class="fas fa-sign-out-alt me-2"></i> Logout--}%
%{--                                </g:link>--}%

%{--                            </li>--}%
%{--                        </ul>--}%
%{--                    </li>--}%
%{--                </sec:ifLoggedIn>--}%

%{--                <sec:ifNotLoggedIn>--}%
%{--                    <li class="nav-item">--}%
%{--                        <g:link class="nav-link" controller="login" action="auth">--}%
%{--                            <i class="fas fa-sign-in-alt me-1"></i> Login--}%
%{--                        </g:link>--}%
%{--                    </li>--}%
%{--                </sec:ifNotLoggedIn>--}%
%{--            </ul>--}%
%{--        </div>--}%


%{--    </div>--}%
%{--</nav>--}%

%{--<!-- Flash Messages -->--}%
%{--<div class="container-fluid mt-3">--}%
%{--    <g:if test="${flash.message}">--}%
%{--        <div class="alert alert-success alert-dismissible fade show" role="alert">--}%
%{--            <i class="fas fa-check-circle me-2"></i>--}%
%{--            ${flash.message}--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>--}%
%{--        </div>--}%
%{--    </g:if>--}%

%{--    <g:if test="${flash.error}">--}%
%{--        <div class="alert alert-danger alert-dismissible fade show" role="alert">--}%
%{--            <i class="fas fa-exclamation-circle me-2"></i>--}%
%{--            ${flash.error}--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>--}%
%{--        </div>--}%
%{--    </g:if>--}%

%{--    <g:if test="${flash.warning}">--}%
%{--        <div class="alert alert-warning alert-dismissible fade show" role="alert">--}%
%{--            <i class="fas fa-exclamation-triangle me-2"></i>--}%
%{--            ${flash.warning}--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>--}%
%{--        </div>--}%
%{--    </g:if>--}%
%{--</div>--}%

%{--<!-- Main Content -->--}%
%{--<div class="container-fluid mt-3">--}%
%{--    <g:layoutBody/>--}%
%{--</div>--}%

%{--<!-- Footer -->--}%
%{--<footer class="footer mt-5 py-3 bg-light">--}%
%{--    <div class="container text-center">--}%
%{--        <span class="text-muted">--}%
%{--            <i class="fas fa-briefcase me-1"></i>--}%
%{--            InternTrack System &copy;--}%
%{--            <g:formatDate date="${new Date()}" format="yyyy"/>--}%
%{--            - v1.0.0--}%
%{--        </span>--}%
%{--    </div>--}%
%{--</footer>--}%

%{--<!-- JavaScript -->--}%
%{--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--}%
%{--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--}%

%{--<script>--}%
%{--    $(document).ready(function() {--}%
%{--        // Auto dismiss alerts after 5 seconds--}%
%{--        setTimeout(function() {--}%
%{--            $('.alert').alert('close');--}%
%{--        }, 5000);--}%

%{--        // Confirm logout--}%
%{--        $('a[href*="logout"]').on('click', function(e) {--}%
%{--            if (!confirm('Are you sure you want to logout?')) {--}%
%{--                e.preventDefault();--}%
%{--                return false;--}%
%{--            }--}%
%{--        });--}%
%{--    });--}%
%{--</script>--}%

%{--<%-- ✅ هذا هو السطر المعدل - استبدل g:layoutScripts بـ asset:deferredScripts --%>--}%
%{--<asset:deferredScripts/>--}%

%{--</body>--}%
%{--</html>--}%
%{--<%@ page import="grails.plugin.springsecurity.SpringSecurityService" %>--}%
%{--<g:set var="springSecurityService" bean="springSecurityService"/>--}%
%{--<g:set var="currentUser" value="${springSecurityService?.currentUser}"/>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title><g:layoutTitle default="InternTrack"/></title>--}%
%{--    <g:layoutHead/>--}%

%{--    <!-- Bootstrap CSS -->--}%
%{--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--}%
%{--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--}%

%{--    <style>--}%
%{--    :root {--}%
%{--        --primary-color: #2C3E50;--}%
%{--        --secondary-color: #1ABC9C;--}%
%{--        --accent-color: #E67E22;--}%
%{--        --light-bg: #F8F9FA;--}%
%{--        --dark-text: #34495E;--}%
%{--    }--}%

%{--    body {--}%
%{--        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--}%
%{--        background-color: var(--light-bg);--}%
%{--        color: var(--dark-text);--}%
%{--        padding-top: 60px;--}%
%{--    }--}%

%{--    .navbar {--}%
%{--        background-color: var(--primary-color);--}%
%{--        box-shadow: 0 2px 4px rgba(0,0,0,0.1);--}%
%{--        position: fixed;--}%
%{--        top: 0;--}%
%{--        width: 100%;--}%
%{--        z-index: 1000;--}%
%{--    }--}%

%{--    .navbar-brand { font-weight: 600; }--}%

%{--    .avatar {--}%
%{--        width: 32px;--}%
%{--        height: 32px;--}%
%{--        border-radius: 50%;--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--        font-weight: bold;--}%
%{--        color: #fff;--}%
%{--        background-color: var(--secondary-color);--}%
%{--    }--}%

%{--    .footer {--}%
%{--        margin-top: 2rem;--}%
%{--        padding: 1rem 0;--}%
%{--        background-color: white;--}%
%{--        border-top: 1px solid #dee2e6;--}%
%{--    }--}%

%{--    .alert { border-radius: 8px; border: none; }--}%
%{--    .alert-success { background-color: #d4edda; color: #155724; }--}%
%{--    .alert-danger { background-color: #f8d7da; color: #721c24; }--}%
%{--    .alert-warning { background-color: #fff3cd; color: #856404; }--}%

%{--    @media (max-width: 768px) { body { padding-top: 56px; } }--}%
%{--    </style>--}%
%{--</head>--}%
%{--<body>--}%

%{--<nav class="navbar navbar-expand-lg navbar-dark">--}%
%{--    <div class="container-fluid">--}%
%{--        <a class="navbar-brand" href="${createLink(uri: '/')}">--}%
%{--            <i class="fas fa-briefcase me-2"></i>InternTrack--}%
%{--        </a>--}%

%{--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">--}%
%{--            <span class="navbar-toggler-icon"></span>--}%
%{--        </button>--}%

%{--        <div class="collapse navbar-collapse" id="navbarNav">--}%
%{--            <ul class="navbar-nav me-auto">--}%
%{--                <sec:ifLoggedIn>--}%
%{--                    <sec:ifAnyGranted roles="ROLE_ADMIN">--}%
%{--                        <li class="nav-item"><g:link class="nav-link" controller="dashboard" action="admin"><i class="fas fa-tachometer-alt me-1"></i> Dashboard</g:link></li>--}%
%{--                        <li class="nav-item"><g:link class="nav-link" controller="user" action="index"><i class="fas fa-users-cog me-1"></i> Users</g:link></li>--}%
%{--                    </sec:ifAnyGranted>--}%
%{--                    <sec:ifAnyGranted roles="ROLE_SUPERVISOR">--}%
%{--                        <li class="nav-item"><g:link class="nav-link" controller="dashboard" action="supervisor"><i class="fas fa-tachometer-alt me-1"></i> Dashboard</g:link></li>--}%
%{--                        <li class="nav-item"><g:link class="nav-link" controller="intern" action="index"><i class="fas fa-users me-1"></i> My Interns</g:link></li>--}%
%{--                    </sec:ifAnyGranted>--}%
%{--                    <sec:ifAnyGranted roles="ROLE_INTERN">--}%
%{--                        <li class="nav-item"><g:link class="nav-link" controller="dashboard" action="intern"><i class="fas fa-tachometer-alt me-1"></i> Dashboard</g:link></li>--}%
%{--                        <li class="nav-item"><g:link class="nav-link" controller="task" action="index"><i class="fas fa-tasks me-1"></i> My Tasks</g:link></li>--}%
%{--                    </sec:ifAnyGranted>--}%
%{--                </sec:ifLoggedIn>--}%
%{--            </ul>--}%

%{--            <ul class="navbar-nav ms-auto">--}%
%{--                <sec:ifLoggedIn>--}%
%{--                    <li class="nav-item dropdown">--}%
%{--                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">--}%
%{--                            <div class="avatar me-2">--}%
%{--                                ${currentUser?.fullName?.substring(0,1)?.toUpperCase() ?: 'U'}--}%
%{--                            </div>--}%
%{--                            <span>${currentUser?.fullName ?: 'User'}</span>--}%
%{--                        </a>--}%
%{--                        <ul class="dropdown-menu dropdown-menu-end">--}%
%{--                            <li><g:link class="dropdown-item" controller="profile" action="index"><i class="fas fa-user me-2"></i> Profile</g:link></li>--}%
%{--                            <li><hr class="dropdown-divider"></li>--}%
%{--                            <li><g:link class="dropdown-item text-danger" controller="logout" action="index"><i class="fas fa-sign-out-alt me-2"></i> Logout</g:link></li>--}%
%{--                        </ul>--}%
%{--                    </li>--}%
%{--                </sec:ifLoggedIn>--}%

%{--                <sec:ifNotLoggedIn>--}%
%{--                    <li class="nav-item"><g:link class="nav-link" controller="login" action="auth"><i class="fas fa-sign-in-alt me-1"></i> Login</g:link></li>--}%
%{--                </sec:ifNotLoggedIn>--}%
%{--            </ul>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</nav>--}%

%{--<!-- Flash Messages -->--}%
%{--<div class="container-fluid mt-3">--}%
%{--    <g:if test="${flash.message}"><div class="alert alert-success alert-dismissible fade show" role="alert"><i class="fas fa-check-circle me-2"></i>${flash.message}<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div></g:if>--}%
%{--    <g:if test="${flash.error}"><div class="alert alert-danger alert-dismissible fade show" role="alert"><i class="fas fa-exclamation-circle me-2"></i>${flash.error}<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div></g:if>--}%
%{--    <g:if test="${flash.warning}"><div class="alert alert-warning alert-dismissible fade show" role="alert"><i class="fas fa-exclamation-triangle me-2"></i>${flash.warning}<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div></g:if>--}%
%{--</div>--}%

%{--<!-- Main Content -->--}%
%{--<div class="container-fluid mt-3">--}%
%{--    <g:layoutBody/>--}%
%{--</div>--}%

%{--<!-- Footer -->--}%
%{--<footer class="footer mt-5 py-3 bg-light">--}%
%{--    <div class="container text-center">--}%
%{--        <span class="text-muted"><i class="fas fa-briefcase me-1"></i>InternTrack System &copy;<g:formatDate date="${new Date()}" format="yyyy"/> - v1.0.0</span>--}%
%{--    </div>--}%
%{--</footer>--}%

%{--<!-- JavaScript -->--}%
%{--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--}%
%{--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--}%
%{--<script>--}%
%{--    $(document).ready(function() {--}%
%{--        setTimeout(function() { $('.alert').alert('close'); }, 5000);--}%
%{--        $('a[href*="logout"]').on('click', function(e) {--}%
%{--            if (!confirm('Are you sure you want to logout?')) { e.preventDefault(); return false; }--}%
%{--        });--}%
%{--    });--}%
%{--</script>--}%

%{--<asset:deferredScripts/>--}%

%{--</body>--}%
%{--</html>--}%


<%@ page import="grails.plugin.springsecurity.SpringSecurityService" %>
<g:set var="springSecurityService" bean="springSecurityService"/>
<g:set var="currentUser" value="${springSecurityService?.currentUser}"/>
<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="InternTrack"/></title>
    <g:layoutHead/>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Custom Styles -->
    <style>
    :root {
        --primary-color: #2C3E50;
        --secondary-color: #1ABC9C;
        --accent-color: #E67E22;
        --light-bg: #F8F9FA;
        --dark-text: #34495E;
    }

    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: var(--light-bg);
        color: var(--dark-text);
        padding-top: 60px;
    }

    .navbar {
        background-color: var(--primary-color);
        box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        position: fixed;
        top: 0;
        width: 100%;
        z-index: 1000;
    }

    .navbar-brand {
        font-weight: 600;
    }

    .avatar {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
    }

    .footer {
        margin-top: 2rem;
        padding: 1rem 0;
        background-color: white;
        border-top: 1px solid #dee2e6;
    }

    .alert {
        border-radius: 8px;
        border: none;
    }

    .alert-success {
        background-color: #d4edda;
        color: #155724;
    }

    .alert-danger {
        background-color: #f8d7da;
        color: #721c24;
    }

    .alert-warning {
        background-color: #fff3cd;
        color: #856404;
    }

    @media (max-width: 768px) {
        body {
            padding-top: 56px;
        }
    }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="${createLink(uri: '/')}">
            <i class="fas fa-briefcase me-2"></i>InternTrack
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <sec:ifLoggedIn>
                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <li class="nav-item">
                            <g:link class="nav-link" controller="dashboard" action="admin">
                                <i class="fas fa-tachometer-alt me-1"></i> Dashboard
                            </g:link>
                        </li>
                        <li class="nav-item">
                            <g:link class="nav-link" controller="user" action="index">
                                <i class="fas fa-users-cog me-1"></i> Users
                            </g:link>
                        </li>
                    </sec:ifAnyGranted>

                    <sec:ifAnyGranted roles="ROLE_SUPERVISOR">
                        <li class="nav-item">
                            <g:link class="nav-link" controller="dashboard" action="supervisor">
                                <i class="fas fa-tachometer-alt me-1"></i> Dashboard
                            </g:link>
                        </li>
                        <li class="nav-item">
                            <g:link class="nav-link" controller="intern" action="index">
                                <i class="fas fa-users me-1"></i> My Interns
                            </g:link>
                        </li>
                    </sec:ifAnyGranted>

                    <sec:ifAnyGranted roles="ROLE_INTERN">
                        <li class="nav-item">
                            <g:link class="nav-link" controller="dashboard" action="intern">
                                <i class="fas fa-tachometer-alt me-1"></i> Dashboard
                            </g:link>
                        </li>
                        <li class="nav-item">
                            <g:link class="nav-link" controller="task" action="index">
                                <i class="fas fa-tasks me-1"></i> My Tasks
                            </g:link>
                        </li>
                    </sec:ifAnyGranted>
                </sec:ifLoggedIn>
            </ul>

            <ul class="navbar-nav ms-auto">
                <sec:ifLoggedIn>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
                            <div class="avatar me-2 bg-primary text-white" style="background-color: #1ABC9C !important;">
                                ${currentUser?.fullName?.substring(0,1)?.toUpperCase() ?: 'U'}
                            </div>
                            <span>${currentUser?.fullName ?: ''}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li>
                                <g:link class="dropdown-item" controller="profile" action="index">
                                    <i class="fas fa-user me-2"></i> Profile
                                </g:link>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <g:link uri="/logout" class="dropdown-item text-danger">
                                    <i class="fas fa-sign-out-alt me-2"></i> Logout
                                </g:link>

                            </li>
                        </ul>
                    </li>
                </sec:ifLoggedIn>

                <sec:ifNotLoggedIn>
                    <li class="nav-item">
                        <g:link class="nav-link" controller="login" action="auth">
                            <i class="fas fa-sign-in-alt me-1"></i> Login
                        </g:link>
                    </li>
                </sec:ifNotLoggedIn>
            </ul>
        </div>


    </div>
</nav>

<!-- Flash Messages -->
<div class="container-fluid mt-3">
    <g:if test="${flash.message}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="fas fa-check-circle me-2"></i>
            ${flash.message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>

    <g:if test="${flash.error}">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-circle me-2"></i>
            ${flash.error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>

    <g:if test="${flash.warning}">
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i>
            ${flash.warning}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>
</div>

<!-- Main Content -->
<div class="container-fluid mt-3">
    <g:layoutBody/>
</div>

<!-- Footer -->
<footer class="footer mt-5 py-3 bg-light">
    <div class="container text-center">
        <span class="text-muted">
            <i class="fas fa-briefcase me-1"></i>
            InternTrack System &copy;
            <g:formatDate date="${new Date()}" format="yyyy"/>
            - v1.0.0
        </span>
    </div>
</footer>

<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function() {
        // Auto dismiss alerts after 5 seconds
        setTimeout(function() {
            $('.alert').alert('close');
        }, 5000);

        // Confirm logout
        $('a[href*="logout"]').on('click', function(e) {
            if (!confirm('Are you sure you want to logout?')) {
                e.preventDefault();
                return false;
            }
        });
    });
</script>

<%-- ✅ هذا هو السطر المعدل - استبدل g:layoutScripts بـ asset:deferredScripts --%>
<asset:deferredScripts/>

</body>
</html>