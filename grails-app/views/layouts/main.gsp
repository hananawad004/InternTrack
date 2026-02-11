%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <title><g:layoutTitle default="InternTrack"/></title>--}%
%{--    <g:layoutHead/>--}%

%{--    <asset:stylesheet src="application.css"/>--}%
%{--    <asset:javascript src="application.js"/>--}%
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
%{--            <ul class="navbar-nav ms-auto">--}%
%{--                <sec:ifLoggedIn>--}%
%{--                    <li class="nav-item dropdown">--}%
%{--                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">--}%
%{--                            <div class="avatar avatar-sm me-2">--}%
%{--                                ${springSecurityService.currentUser?.fullName?.substring(0,1)}--}%
%{--                            </div>--}%
%{--                            ${springSecurityService.currentUser?.fullName}--}%
%{--                        </a>--}%
%{--                        <ul class="dropdown-menu dropdown-menu-end">--}%
%{--                            <li>--}%
%{--                                <g:link class="dropdown-item" controller="profile" action="index">--}%
%{--                                    <i class="fas fa-user me-2"></i>Profile--}%
%{--                                </g:link>--}%
%{--                            </li>--}%
%{--                            <li>--}%
%{--                                <g:link class="dropdown-item" controller="dashboard" action="index">--}%
%{--                                    <i class="fas fa-tachometer-alt me-2"></i>Dashboard--}%
%{--                                </g:link>--}%
%{--                            </li>--}%
%{--                            <li><hr class="dropdown-divider"></li>--}%
%{--                            <li>--}%
%{--                                <g:link class="dropdown-item" controller="logout">--}%
%{--                                    <i class="fas fa-sign-out-alt me-2"></i>Logout--}%
%{--                                </g:link>--}%
%{--                            </li>--}%
%{--                        </ul>--}%
%{--                    </li>--}%
%{--                </sec:ifLoggedIn>--}%

%{--                <sec:ifNotLoggedIn>--}%
%{--                    <li class="nav-item">--}%
%{--                        <g:link class="nav-link" controller="login" action="auth">Login</g:link>--}%
%{--                    </li>--}%
%{--                </sec:ifNotLoggedIn>--}%
%{--            </ul>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</nav>--}%

%{--<div class="container-fluid flex-grow-1">--}%
%{--    <div class="row h-100">--}%

%{--        <sec:ifLoggedIn>--}%
%{--            <div class="col-lg-2 sidebar">--}%
%{--                <nav class="nav flex-column pt-3">--}%
%{--                    <g:link class="nav-link" controller="dashboard" action="index">--}%
%{--                        <i class="fas fa-home"></i> Dashboard--}%
%{--                    </g:link>--}%

%{--                    <sec:ifAnyGranted roles="ROLE_INTERN">--}%
%{--                        <g:link class="nav-link" controller="task" action="index">--}%
%{--                            <i class="fas fa-tasks"></i> My Tasks--}%
%{--                        </g:link>--}%
%{--                        <g:link class="nav-link" controller="weeklyReport" action="index">--}%
%{--                            <i class="fas fa-file-alt"></i> Weekly Reports--}%
%{--                        </g:link>--}%
%{--                    </sec:ifAnyGranted>--}%

%{--                    <sec:ifAnyGranted roles="ROLE_SUPERVISOR">--}%
%{--                        <g:link class="nav-link" controller="intern" action="index">--}%
%{--                            <i class="fas fa-users"></i> My Interns--}%
%{--                        </g:link>--}%
%{--                    </sec:ifAnyGranted>--}%

%{--                    <sec:ifAnyGranted roles="ROLE_ADMIN">--}%
%{--                        <g:link class="nav-link" controller="user" action="index">--}%
%{--                            <i class="fas fa-users-cog"></i> Users--}%
%{--                        </g:link>--}%
%{--                    </sec:ifAnyGranted>--}%
%{--                </nav>--}%
%{--            </div>--}%
%{--        </sec:ifLoggedIn>--}%

%{--        <div class="${sec.ifLoggedIn() ? 'col-lg-10' : 'col-12'} p-4">--}%
%{--            <g:layoutBody/>--}%
%{--        </div>--}%

%{--    </div>--}%
%{--</div>--}%

%{--<footer class="footer mt-auto">--}%
%{--    <div class="container text-center">--}%
%{--        <span class="text-muted">--}%
%{--            InternTrack System &copy;--}%
%{--            <g:formatDate date="${new Date()}" format="yyyy"/>--}%
%{--            - v1.0.0--}%
%{--        </span>--}%
%{--    </div>--}%
%{--</footer>--}%

%{--<asset:deferredScripts/>--}%
%{--</body>--}%
%{--</html>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <title><g:layoutTitle default="InternTrack"/></title>--}%
%{--    <g:layoutHead/>--}%

%{--    <asset:stylesheet src="application.css"/>--}%
%{--    <asset:javascript src="application.js"/>--}%
%{--</head>--}%

%{--<body>--}%

%{--<nav class="navbar navbar-expand-lg navbar-dark bg-dark">--}%
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
%{--                    <!-- روابط القائمة حسب الدور -->--}%
%{--                    <sec:ifAnyGranted roles="ROLE_ADMIN">--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="dashboard" action="admin">--}%
%{--                                <i class="fas fa-tachometer-alt"></i> Dashboard--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="user" action="index">--}%
%{--                                <i class="fas fa-users-cog"></i> Users--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                    </sec:ifAnyGranted>--}%

%{--                    <sec:ifAnyGranted roles="ROLE_SUPERVISOR">--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="dashboard" action="supervisor">--}%
%{--                                <i class="fas fa-tachometer-alt"></i> Dashboard--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="intern" action="index">--}%
%{--                                <i class="fas fa-users"></i> My Interns--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                    </sec:ifAnyGranted>--}%

%{--                    <sec:ifAnyGranted roles="ROLE_INTERN">--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="dashboard" action="intern">--}%
%{--                                <i class="fas fa-tachometer-alt"></i> Dashboard--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                        <li class="nav-item">--}%
%{--                            <g:link class="nav-link" controller="task" action="index">--}%
%{--                                <i class="fas fa-tasks"></i> My Tasks--}%
%{--                            </g:link>--}%
%{--                        </li>--}%
%{--                    </sec:ifAnyGranted>--}%
%{--                </sec:ifLoggedIn>--}%
%{--            </ul>--}%

%{--            <ul class="navbar-nav ms-auto">--}%
%{--                <sec:ifLoggedIn>--}%
%{--                    <!-- قائمة المستخدم -->--}%
%{--                    <li class="nav-item dropdown">--}%
%{--                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">--}%
%{--                            <div class="avatar avatar-sm me-2 bg-primary text-white rounded-circle d-flex align-items-center justify-content-center" style="width: 32px; height: 32px;">--}%
%{--                                ${springSecurityService.currentUser?.fullName?.substring(0,1)?.toUpperCase() ?: 'U'}--}%
%{--                            </div>--}%
%{--                            ${springSecurityService.currentUser?.fullName}--}%
%{--                        </a>--}%
%{--                        <ul class="dropdown-menu dropdown-menu-end">--}%
%{--                            <li>--}%
%{--                                <g:link class="dropdown-item" controller="profile" action="index">--}%
%{--                                    <i class="fas fa-user me-2"></i>Profile--}%
%{--                                </g:link>--}%
%{--                            </li>--}%
%{--                            <li>--}%
%{--                                <g:link class="dropdown-item" controller="dashboard" action="index">--}%
%{--                                    <i class="fas fa-tachometer-alt me-2"></i>Dashboard--}%
%{--                                </g:link>--}%
%{--                            </li>--}%
%{--                            <li><hr class="dropdown-divider"></li>--}%
%{--                            <li>--}%
%{--                            <!-- رابط تسجيل الخروج -->--}%
%{--                                <g:link class="dropdown-item text-danger" controller="logout" action="index"--}%
%{--                                        onclick="return confirm('Are you sure you want to logout?');">--}%
%{--                                    <i class="fas fa-sign-out-alt me-2"></i>Logout--}%
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

%{--<div class="container-fluid flex-grow-1">--}%
%{--    <div class="row h-100">--}%
%{--        <!-- المحتوى الرئيسي -->--}%
%{--        <div class="col-12 p-4">--}%
%{--        <!-- عرض رسائل الفلاش -->--}%
%{--            <g:if test="${flash.message}">--}%
%{--                <div class="alert alert-success alert-dismissible fade show" role="alert">--}%
%{--                    ${flash.message}--}%
%{--                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>--}%
%{--                </div>--}%
%{--            </g:if>--}%

%{--            <g:if test="${flash.error}">--}%
%{--                <div class="alert alert-danger alert-dismissible fade show" role="alert">--}%
%{--                    ${flash.error}--}%
%{--                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>--}%
%{--                </div>--}%
%{--            </g:if>--}%

%{--            <g:layoutBody/>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%

%{--<footer class="footer mt-auto py-3 bg-light">--}%
%{--    <div class="container text-center">--}%
%{--        <span class="text-muted">--}%
%{--            InternTrack System &copy;--}%
%{--            <g:formatDate date="${new Date()}" format="yyyy"/>--}%
%{--            - v1.0.0--}%
%{--        </span>--}%
%{--    </div>--}%
%{--</footer>--}%

%{--<!-- jQuery للتعامل مع التأكيد قبل تسجيل الخروج -->--}%
%{--<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--}%
%{--<script>--}%
%{--    $(document).ready(function() {--}%
%{--        // تأكيد تسجيل الخروج--}%
%{--        $('a[href*="logout"]').on('click', function(e) {--}%
%{--            if (!confirm('Are you sure you want to logout?')) {--}%
%{--                e.preventDefault();--}%
%{--                return false;--}%
%{--            }--}%
%{--        });--}%

%{--        // إغلاق رسائل التنبيه بعد 5 ثوانٍ--}%
%{--        setTimeout(function() {--}%
%{--            $('.alert').alert('close');--}%
%{--        }, 5000);--}%
%{--    });--}%
%{--</script>--}%

%{--<asset:deferredScripts/>--}%
%{--</body>--}%
%{--</html>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <title><g:layoutTitle default="InternTrack"/></title>--}%
%{--    <g:layoutHead/>--}%
%{--</head>--}%

%{--<body>--}%

%{--<nav class="navbar navbar-expand-lg navbar-dark bg-dark">--}%
%{--    <div class="container-fluid">--}%
%{--        <a class="navbar-brand" href="${createLink(uri: '/')}">--}%
%{--            <i class="fas fa-briefcase me-2"></i>InternTrack--}%
%{--        </a>--}%

%{--        <div class="collapse navbar-collapse" id="navbarNav">--}%
%{--            <ul class="navbar-nav ms-auto">--}%
%{--                <sec:ifLoggedIn>--}%
%{--                    <li class="nav-item dropdown">--}%
%{--                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">--}%
%{--                            <sec:loggedInUserInfo field="username"/>--}%
%{--                        </a>--}%
%{--                        <ul class="dropdown-menu dropdown-menu-end">--}%
%{--                            <li>--}%
%{--                                <g:link class="dropdown-item" controller="dashboard">--}%
%{--                                    <i class="fas fa-tachometer-alt me-2"></i>Dashboard--}%
%{--                                </g:link>--}%
%{--                            </li>--}%
%{--                            <li><hr class="dropdown-divider"></li>--}%
%{--                            <li>--}%
%{--                                <g:link class="dropdown-item text-danger" controller="logout">--}%
%{--                                    <i class="fas fa-sign-out-alt me-2"></i>Logout--}%
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

%{--<g:layoutBody/>--}%

%{--</body>--}%
%{--</html>--}%
<%@ page import="grails.plugin.springsecurity.SpringSecurityService" %>
<g:set var="springSecurityService" bean="springSecurityService"/>
<g:set var="currentUser" value="${springSecurityService?.currentUser}"/>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title><g:layoutTitle default="InternTrack"/></title>
    <g:layoutHead/>

    <!-- Bootstrap CSS -->
    <asset:stylesheet src="bootstrap.css"/>
    <asset:stylesheet src="font-awesome.css"/>

    <!-- DataTables CSS -->
    <asset:stylesheet src="dataTables.bootstrap5.css"/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
                    <!-- Main Navigation -->
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
                    <!-- User Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown">
                            <div class="avatar avatar-sm me-2 bg-primary text-white rounded-circle d-flex align-items-center justify-content-center"
                                 style="width: 32px; height: 32px; font-size: 14px;">
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
                                <g:link class="dropdown-item text-danger" controller="logout" action="index"
                                        onclick="return confirm('Are you sure you want to logout?');">
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

<!-- JavaScript Libraries -->
<asset:javascript src="jquery.js"/>
<asset:javascript src="bootstrap.bundle.js"/>
<asset:javascript src="jquery.dataTables.js"/>
<asset:javascript src="dataTables.bootstrap5.js"/>
<asset:javascript src="font-awesome.js"/>

<!-- Auto-dismiss alerts after 5 seconds -->
<script>
    $(document).ready(function() {
        // Auto dismiss alerts
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

        // Initialize DataTables
        if ($.fn.DataTable) {
            $('table.datatable').DataTable({
                pageLength: 10,
                responsive: true,
                language: {
                    search: "Search:",
                    lengthMenu: "Show _MENU_ entries",
                    info: "Showing _START_ to _END_ of _TOTAL_ entries",
                    paginate: {
                        first: "First",
                        last: "Last",
                        next: "Next",
                        previous: "Previous"
                    }
                }
            });
        }
    });
</script>

<asset:deferredScripts/>
</body>
</html>