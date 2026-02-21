
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%

%{--    <meta name="active-dashboard" content="true"/>--}%
%{--    <title>Supervisor Dashboard - InternTrack</title>--}%

%{--    <!-- Bootstrap & Font Awesome (just in case layout doesn't have them) -->--}%
%{--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--}%
%{--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--}%
%{--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--}%

%{--    <style>--}%
%{--    /* Custom styles only for supervisor dashboard */--}%
%{--    .stat-card {--}%
%{--        text-align: center;--}%
%{--        padding: 25px 15px;--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        color: white;--}%
%{--        border-radius: 10px;--}%
%{--    }--}%

%{--    .stat-card:nth-child(2) {--}%
%{--        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);--}%
%{--    }--}%

%{--    .stat-card:nth-child(3) {--}%
%{--        background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);--}%
%{--    }--}%

%{--    .stat-card:nth-child(4) {--}%
%{--        background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);--}%
%{--    }--}%

%{--    .stat-number {--}%
%{--        font-size: 2.8rem;--}%
%{--        font-weight: 700;--}%
%{--        margin-bottom: 5px;--}%
%{--    }--}%

%{--    .stat-label {--}%
%{--        font-size: 0.9rem;--}%
%{--        opacity: 0.9;--}%
%{--        text-transform: uppercase;--}%
%{--        letter-spacing: 1px;--}%
%{--    }--}%

%{--    .avatar {--}%
%{--        width: 40px;--}%
%{--        height: 40px;--}%
%{--        border-radius: 50%;--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        color: white;--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--        font-weight: bold;--}%
%{--    }--}%

%{--    .avatar-lg {--}%
%{--        width: 70px;--}%
%{--        height: 70px;--}%
%{--        font-size: 1.8rem;--}%
%{--    }--}%

%{--    .avatar-sm {--}%
%{--        width: 36px;--}%
%{--        height: 36px;--}%
%{--        font-size: 0.9rem;--}%
%{--    }--}%

%{--    .timeline-item {--}%
%{--        padding: 15px 0;--}%
%{--        border-bottom: 1px solid #eee;--}%
%{--        position: relative;--}%
%{--    }--}%

%{--    .timeline-item:last-child {--}%
%{--        border-bottom: none;--}%
%{--    }--}%

%{--    .timeline-item:before {--}%
%{--        content: '';--}%
%{--        position: absolute;--}%
%{--        left: 0;--}%
%{--        top: 20px;--}%
%{--        width: 12px;--}%
%{--        height: 12px;--}%
%{--        border-radius: 50%;--}%
%{--        background-color: #667eea;--}%
%{--    }--}%

%{--    .welcome-section {--}%
%{--        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);--}%
%{--        border-radius: 10px;--}%
%{--        padding: 25px;--}%
%{--    }--}%

%{--    @media (max-width: 768px) {--}%
%{--        .stat-number {--}%
%{--            font-size: 2rem;--}%
%{--        }--}%
%{--    }--}%
%{--    </style>--}%
%{--</head>--}%
%{--<body>--}%
%{--<div class="container-fluid">--}%
%{--    <!-- Welcome Section -->--}%
%{--    <div class="row mb-4">--}%
%{--        <div class="col-12">--}%
%{--            <div class="card welcome-section">--}%
%{--                <div class="card-body">--}%
%{--                    <div class="d-flex justify-content-between align-items-center">--}%
%{--                        <div>--}%
%{--                            <h4 class="mb-1">Welcome, ${supervisor?.user?.fullName ?: 'Supervisor'}!</h4>--}%
%{--                            <p class="text-muted mb-0">${supervisor?.position ?: ''} ${supervisor?.department ?: ''}</p>--}%
%{--                        </div>--}%
%{--                        <div class="text-end">--}%
%{--                            <div class="avatar avatar-lg">--}%
%{--                                ${supervisor?.user?.initials ?: 'SU'}--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                    <hr>--}%
%{--                    <div class="row">--}%
%{--                        <div class="col-md-3">--}%
%{--                            <p><strong>Employee ID:</strong> ${supervisor?.employeeId ?: 'N/A'}</p>--}%
%{--                        </div>--}%
%{--                        <div class="col-md-3">--}%
%{--                            <p><strong>Interns Assigned:</strong> ${currentInternCount ?: 0}/${maxInterns ?: 5}</p>--}%
%{--                        </div>--}%
%{--                        <div class="col-md-3">--}%
%{--                            <p><strong>Office:</strong> ${supervisor?.officeLocation ?: 'N/A'}</p>--}%
%{--                        </div>--}%
%{--                        <div class="col-md-3">--}%
%{--                            <p><strong>Phone:</strong> ${supervisor?.phoneExtension ?: 'N/A'}</p>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <!-- Statistics Row -->--}%
%{--    <div class="row mb-4">--}%
%{--        <div class="col-md-3">--}%
%{--            <div class="card stat-card">--}%
%{--                <div class="stat-number">${currentInternCount ?: 0}</div>--}%
%{--                <div class="stat-label">Active Interns</div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--        <div class="col-md-3">--}%
%{--            <div class="card stat-card">--}%
%{--                <div class="stat-number">${pendingReports?.size() ?: 0}</div>--}%
%{--                <div class="stat-label">Pending Reports</div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--        <div class="col-md-3">--}%
%{--            <div class="card stat-card">--}%
%{--                <div class="stat-number">${tasks?.size() ?: 0}</div>--}%
%{--                <div class="stat-label">Active Tasks</div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--        <div class="col-md-3">--}%
%{--            <div class="card stat-card">--}%
%{--                <div class="stat-number">${(maxInterns ?: 5) - (currentInternCount ?: 0)}</div>--}%
%{--                <div class="stat-label">Available Slots</div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <div class="row">--}%
%{--        <!-- My Interns -->--}%
%{--        <div class="col-lg-8 mb-4">--}%
%{--            <div class="card">--}%
%{--                <div class="card-header d-flex justify-content-between align-items-center">--}%
%{--                    <h5 class="mb-0">My Interns</h5>--}%
%{--                    <g:if test="${currentInternCount < maxInterns}">--}%
%{--                        <span class="badge bg-success">${(maxInterns ?: 5) - (currentInternCount ?: 0)} slots available</span>--}%
%{--                    </g:if>--}%
%{--                    <g:else>--}%
%{--                        <span class="badge bg-danger">No slots available</span>--}%
%{--                    </g:else>--}%
%{--                </div>--}%
%{--                <div class="card-body">--}%
%{--                    <g:if test="${interns}">--}%
%{--                        <div class="table-responsive">--}%
%{--                            <table class="table table-hover">--}%
%{--                                <thead>--}%
%{--                                <tr>--}%
%{--                                    <th>Intern</th>--}%
%{--                                    <th>University</th>--}%
%{--                                    <th>Tasks</th>--}%
%{--                                    <th>Reports</th>--}%
%{--                                    <th>Status</th>--}%
%{--                                    <th>Actions</th>--}%
%{--                                </tr>--}%
%{--                                </thead>--}%
%{--                                <tbody>--}%
%{--                                <g:each in="${interns}" var="intern">--}%
%{--                                    <tr>--}%
%{--                                        <td>--}%
%{--                                            <div class="d-flex align-items-center">--}%
%{--                                                <div class="avatar avatar-sm me-2">--}%
%{--                                                    ${intern?.user?.initials ?: 'U'}--}%
%{--                                                </div>--}%
%{--                                                <div>--}%
%{--                                                    <div class="fw-bold">${intern?.user?.fullName}</div>--}%
%{--                                                    <div class="small text-muted">${intern?.studentId}</div>--}%
%{--                                                </div>--}%
%{--                                            </div>--}%
%{--                                        </td>--}%
%{--                                        <td>${intern?.university}</td>--}%
%{--                                        <td>--}%
%{--                                            <g:set var="stats" value="${internStats?.find { it.intern.id == intern.id }?.taskStats}"/>--}%
%{--                                            <div class="small">--}%
%{--                                                <span class="badge bg-success">${stats?.completed ?: 0}</span>--}%
%{--                                                <span class="badge bg-warning">${stats?.pending ?: 0}</span>--}%
%{--                                                <span class="badge bg-danger">${stats?.overdue ?: 0}</span>--}%
%{--                                            </div>--}%
%{--                                        </td>--}%
%{--                                        <td>--}%
%{--                                            <g:set var="rStats" value="${internStats?.find { it.intern.id == intern.id }?.reportStats}"/>--}%
%{--                                            <div class="small">--}%
%{--                                                <span class="badge bg-success">${rStats?.approved ?: 0}</span>--}%
%{--                                                <span class="badge bg-warning">${rStats?.submitted ?: 0}</span>--}%
%{--                                            </div>--}%
%{--                                        </td>--}%
%{--                                        <td>--}%
%{--                                            <span class="badge ${intern?.status == 'ACTIVE' ? 'bg-success' : 'bg-secondary'}">--}%
%{--                                                ${intern?.status ?: 'ACTIVE'}--}%
%{--                                            </span>--}%
%{--                                        </td>--}%
%{--                                        <td>--}%
%{--                                            <div class="btn-group btn-group-sm">--}%
%{--                                                <g:link controller="intern" action="show" id="${intern.id}" class="btn btn-outline-primary">--}%
%{--                                                    <i class="fas fa-eye"></i>--}%
%{--                                                </g:link>--}%
%{--                                                <g:link controller="evaluation" action="create" params="[internId: intern.id]" class="btn btn-outline-success">--}%
%{--                                                    <i class="fas fa-chart-line"></i>--}%
%{--                                                </g:link>--}%
%{--                                            </div>--}%
%{--                                        </td>--}%
%{--                                    </tr>--}%
%{--                                </g:each>--}%
%{--                                </tbody>--}%
%{--                            </table>--}%
%{--                        </div>--}%
%{--                    </g:if>--}%
%{--                    <g:else>--}%
%{--                        <p class="text-muted text-center py-3">No interns assigned yet</p>--}%
%{--                    </g:else>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--        <!-- Pending Reports -->--}%
%{--        <div class="col-lg-4 mb-4">--}%
%{--            <div class="card">--}%
%{--                <div class="card-header d-flex justify-content-between align-items-center">--}%
%{--                    <h5 class="mb-0">Pending Reports</h5>--}%
%{--                    <g:link controller="weeklyReport" action="review" class="btn btn-sm btn-primary">--}%
%{--                        <i class="fas fa-list"></i> Review All--}%
%{--                    </g:link>--}%
%{--                </div>--}%
%{--                <div class="card-body">--}%
%{--                    <g:if test="${pendingReports}">--}%
%{--                        <div class="timeline">--}%
%{--                            <g:each in="${pendingReports.take(5)}" var="report">--}%
%{--                                <div class="timeline-item">--}%
%{--                                    <div class="d-flex justify-content-between align-items-start">--}%
%{--                                        <div>--}%
%{--                                            <h6 class="mb-1">${report.intern?.user?.fullName}</h6>--}%
%{--                                            <p class="text-muted small mb-1">--}%
%{--                                                Week ${report.weekNumber} ---}%
%{--                                                <g:formatDate date="${report.reportDate}" format="dd/MM/yyyy"/>--}%
%{--                                            </p>--}%
%{--                                            <p class="small mb-0 text-truncate">${report.accomplishments?.truncate(80)}</p>--}%
%{--                                        </div>--}%
%{--                                        <div class="text-end">--}%
%{--                                            <div class="btn-group btn-group-sm">--}%
%{--                                                <g:link controller="weeklyReport" action="show" id="${report.id}" class="btn btn-outline-primary">--}%
%{--                                                    <i class="fas fa-eye"></i>--}%
%{--                                                </g:link>--}%
%{--                                                <g:link controller="weeklyReport" action="reviewReport" id="${report.id}" class="btn btn-outline-success">--}%
%{--                                                    <i class="fas fa-check-circle"></i> Review--}%
%{--                                                </g:link>--}%
%{--                                            </div>--}%
%{--                                        </div>--}%
%{--                                    </div>--}%
%{--                                </div>--}%
%{--                            </g:each>--}%
%{--                        </div>--}%
%{--                    </g:if>--}%
%{--                    <g:else>--}%
%{--                        <p class="text-muted text-center py-3">No pending reports</p>--}%
%{--                    </g:else>--}%
%{--                </div>--}%
%{--                <div class="card-footer text-center">--}%
%{--                    <g:if test="${pendingReports?.size() > 5}">--}%
%{--                        <span class="text-muted small">+${pendingReports.size() - 5} more reports</span>--}%
%{--                    </g:if>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--        <!-- Recent Tasks -->--}%
%{--        <div class="col-lg-6 mb-4">--}%
%{--            <div class="card">--}%
%{--                <div class="card-header">--}%
%{--                    <h5 class="mb-0">Recent Tasks</h5>--}%
%{--                </div>--}%
%{--                <div class="card-body">--}%
%{--                    <g:if test="${tasks}">--}%
%{--                        <div class="table-responsive">--}%
%{--                            <table class="table table-sm table-hover">--}%
%{--                                <thead>--}%
%{--                                <tr>--}%
%{--                                    <th>Task</th>--}%
%{--                                    <th>Intern</th>--}%
%{--                                    <th>Due Date</th>--}%
%{--                                    <th>Status</th>--}%
%{--                                </tr>--}%
%{--                                </thead>--}%
%{--                                <tbody>--}%
%{--                                <g:each in="${tasks.take(5)}" var="task">--}%
%{--                                    <tr>--}%
%{--                                        <td class="text-truncate" style="max-width: 150px;">${task.title}</td>--}%
%{--                                        <td>${task.intern?.user?.fullName}</td>--}%
%{--                                        <td><g:formatDate date="${task.dueDate}" format="dd/MM/yyyy"/></td>--}%
%{--                                        <td>--}%
%{--                                            <span class="badge ${task.status == 'COMPLETED' ? 'bg-success' : task.status == 'OVERDUE' ? 'bg-danger' : 'bg-warning'}">--}%
%{--                                                ${task.status ?: 'PENDING'}--}%
%{--                                            </span>--}%
%{--                                        </td>--}%
%{--                                    </tr>--}%
%{--                                </g:each>--}%
%{--                                </tbody>--}%
%{--                            </table>--}%
%{--                        </div>--}%
%{--                    </g:if>--}%
%{--                    <g:else>--}%
%{--                        <p class="text-muted text-center py-3">No tasks assigned</p>--}%
%{--                    </g:else>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--        <!-- Intern Statistics -->--}%
%{--        <div class="col-lg-6 mb-4">--}%
%{--            <div class="card">--}%
%{--                <div class="card-header">--}%
%{--                    <h5 class="mb-0">Intern Performance</h5>--}%
%{--                </div>--}%
%{--                <div class="card-body">--}%
%{--                    <g:if test="${internStats}">--}%
%{--                        <div class="table-responsive">--}%
%{--                            <table class="table table-sm">--}%
%{--                                <thead>--}%
%{--                                <tr>--}%
%{--                                    <th>Intern</th>--}%
%{--                                    <th>Completion Rate</th>--}%
%{--                                    <th>Reports Approved</th>--}%
%{--                                </tr>--}%
%{--                                </thead>--}%
%{--                                <tbody>--}%
%{--                                <g:each in="${internStats}" var="stat">--}%
%{--                                    <tr>--}%
%{--                                        <td>${stat.intern?.user?.fullName}</td>--}%
%{--                                        <td>--}%
%{--                                            <div class="progress" style="height: 20px;">--}%
%{--                                                <div class="progress-bar" style="width: ${stat.taskStats?.completionRate ?: 0}%">--}%
%{--                                                    ${stat.taskStats?.completionRate ?: 0}%--}%
%{--                                                </div>--}%
%{--                                            </div>--}%
%{--                                        </td>--}%
%{--                                        <td>--}%
%{--                                            <div class="progress" style="height: 20px;">--}%
%{--                                                <div class="progress-bar bg-success" style="width: ${stat.reportStats?.total > 0 ? (stat.reportStats?.approved / stat.reportStats?.total * 100) : 0}%">--}%
%{--                                                    ${stat.reportStats?.approved ?: 0}/${stat.reportStats?.total ?: 0}--}%
%{--                                                </div>--}%
%{--                                            </div>--}%
%{--                                        </td>--}%
%{--                                    </tr>--}%
%{--                                </g:each>--}%
%{--                                </tbody>--}%
%{--                            </table>--}%
%{--                        </div>--}%
%{--                    </g:if>--}%
%{--                    <g:else>--}%
%{--                        <p class="text-muted text-center py-3">No performance data available</p>--}%
%{--                    </g:else>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%

%{--<script>--}%
%{--    $(document).ready(function() {--}%
%{--        // Update stats every minute--}%
%{--        setInterval(function() {--}%
%{--            $.ajax({--}%
%{--                url: '${createLink(controller: "dashboard", action: "apiStats")}',--}%
%{--                success: function(data) {--}%
%{--                    if (data.pendingReports !== undefined) {--}%
%{--                        $('.stat-number').eq(1).text(data.pendingReports);--}%
%{--                    }--}%
%{--                }--}%
%{--            });--}%
%{--        }, 60000);--}%
%{--    });--}%
%{--</script>--}%
%{--</body>--}%
%{--</html>--}%

<!DOCTYPE html>
<html>
<head>
    <title>Supervisor Dashboard - InternTrack</title>

    <!-- Bootstrap & Font Awesome (just in case layout doesn't have them) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <meta name="layout" content="main"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
    /* Custom styles only for supervisor dashboard */
    .stat-card {
        text-align: center;
        padding: 25px 15px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border-radius: 10px;
    }

    .stat-card:nth-child(2) {
        background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    }

    .stat-card:nth-child(3) {
        background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
    }

    .stat-card:nth-child(4) {
        background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
    }

    .stat-number {
        font-size: 2.8rem;
        font-weight: 700;
        margin-bottom: 5px;
    }

    .stat-label {
        font-size: 0.9rem;
        opacity: 0.9;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
    }

    .avatar-lg {
        width: 70px;
        height: 70px;
        font-size: 1.8rem;
    }

    .avatar-sm {
        width: 36px;
        height: 36px;
        font-size: 0.9rem;
    }

    .timeline-item {
        padding: 15px 0;
        border-bottom: 1px solid #eee;
        position: relative;
    }

    .timeline-item:last-child {
        border-bottom: none;
    }

    .timeline-item:before {
        content: '';
        position: absolute;
        left: 0;
        top: 20px;
        width: 12px;
        height: 12px;
        border-radius: 50%;
        background-color: #667eea;
    }

    .welcome-section {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        border-radius: 10px;
        padding: 25px;
    }

    @media (max-width: 768px) {
        .stat-number {
            font-size: 2rem;
        }
    }
    </style>
</head>

<div class="container-fluid">
    <!-- Welcome Section -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card welcome-section">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h4 class="mb-1">Welcome, ${supervisor?.user?.fullName ?: 'Supervisor'}!</h4>
                            <p class="text-muted mb-0">${supervisor?.position ?: ''} ${supervisor?.department ?: ''}</p>
                        </div>
                        <div class="text-end">
                            <div class="avatar avatar-lg">
                                ${supervisor?.user?.initials ?: 'SU'}
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                            <p><strong>Employee ID:</strong> ${supervisor?.employeeId ?: 'N/A'}</p>
                        </div>
                        <div class="col-md-3">
                            <p><strong>Interns Assigned:</strong> ${currentInternCount ?: 0}/${maxInterns ?: 5}</p>
                        </div>
                        <div class="col-md-3">
                            <p><strong>Office:</strong> ${supervisor?.officeLocation ?: 'N/A'}</p>
                        </div>
                        <div class="col-md-3">
                            <p><strong>Phone:</strong> ${supervisor?.phoneExtension ?: 'N/A'}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Statistics Row -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">${currentInternCount ?: 0}</div>
                <div class="stat-label">Active Interns</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">${pendingReports?.size() ?: 0}</div>
                <div class="stat-label">Pending Reports</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">${tasks?.size() ?: 0}</div>
                <div class="stat-label">Active Tasks</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">${(maxInterns ?: 5) - (currentInternCount ?: 0)}</div>
                <div class="stat-label">Available Slots</div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- My Interns -->
        <div class="col-lg-8 mb-4">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">My Interns</h5>
                    <g:if test="${currentInternCount < maxInterns}">
                        <span class="badge bg-success">${(maxInterns ?: 5) - (currentInternCount ?: 0)} slots available</span>
                    </g:if>
                    <g:else>
                        <span class="badge bg-danger">No slots available</span>
                    </g:else>
                </div>
                <div class="card-body">
                    <g:if test="${interns}">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Intern</th>
                                    <th>University</th>
                                    <th>Tasks</th>
                                    <th>Reports</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${interns}" var="intern">
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="avatar avatar-sm me-2">
                                                    ${intern?.user?.initials ?: 'U'}
                                                </div>
                                                <div>
                                                    <div class="fw-bold">${intern?.user?.fullName}</div>
                                                    <div class="small text-muted">${intern?.studentId}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${intern?.university}</td>
                                        <td>
                                            <g:set var="stats" value="${internStats?.find { it.intern.id == intern.id }?.taskStats}"/>
                                            <div class="small">
                                                <span class="badge bg-success">${stats?.completed ?: 0}</span>
                                                <span class="badge bg-warning">${stats?.pending ?: 0}</span>
                                                <span class="badge bg-danger">${stats?.overdue ?: 0}</span>
                                            </div>
                                        </td>
                                        <td>
                                            <g:set var="rStats" value="${internStats?.find { it.intern.id == intern.id }?.reportStats}"/>
                                            <div class="small">
                                                <span class="badge bg-success">${rStats?.approved ?: 0}</span>
                                                <span class="badge bg-warning">${rStats?.submitted ?: 0}</span>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge ${intern?.status == 'ACTIVE' ? 'bg-success' : 'bg-secondary'}">
                                                ${intern?.status ?: 'ACTIVE'}
                                            </span>
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <g:link controller="intern" action="show" id="${intern.id}" class="btn btn-outline-primary">
                                                    <i class="fas fa-eye"></i>
                                                </g:link>
                                                <g:link controller="evaluation" action="create" params="[internId: intern.id]" class="btn btn-outline-success">
                                                    <i class="fas fa-chart-line"></i>
                                                </g:link>
                                            </div>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </g:if>
                    <g:else>
                        <p class="text-muted text-center py-3">No interns assigned yet</p>
                    </g:else>
                </div>
            </div>
        </div>

        <!-- Pending Reports -->
        <div class="col-lg-4 mb-4">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Pending Reports</h5>
                    <g:link controller="weeklyReport" action="review" class="btn btn-sm btn-primary">
                        <i class="fas fa-list"></i> Review All
                    </g:link>
                </div>
                <div class="card-body">
                    <g:if test="${pendingReports}">
                        <div class="timeline">
                            <g:each in="${pendingReports.take(5)}" var="report">
                                <div class="timeline-item">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <h6 class="mb-1">${report.intern?.user?.fullName}</h6>
                                            <p class="text-muted small mb-1">
                                                Week ${report.weekNumber} -
                                                <g:formatDate date="${report.reportDate}" format="dd/MM/yyyy"/>
                                            </p>
                                            <p class="small mb-0">
                                                <g:if test="${report.accomplishments?.length() > 80}">
                                                    ${report.accomplishments?.substring(0, 80)}...
                                                </g:if>
                                                <g:else>
                                                    ${report.accomplishments}
                                                </g:else>
                                            </p>
                                        </div>
                                        <div class="text-end">
                                            <div class="btn-group btn-group-sm">
                                                <g:link controller="weeklyReport" action="show" id="${report.id}" class="btn btn-outline-primary">
                                                    <i class="fas fa-eye"></i>
                                                </g:link>
                                                <g:link controller="weeklyReport" action="reviewReport" id="${report.id}" class="btn btn-outline-success">
                                                    <i class="fas fa-check-circle"></i> Review
                                                </g:link>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </g:each>
                        </div>
                    </g:if>
                    <g:else>
                        <p class="text-muted text-center py-3">No pending reports</p>
                    </g:else>
                </div>
                <div class="card-footer text-center">
                    <g:if test="${pendingReports?.size() > 5}">
                        <span class="text-muted small">+${pendingReports.size() - 5} more reports</span>
                    </g:if>
                </div>
            </div>
        </div>

        <!-- Recent Tasks -->
        <div class="col-lg-6 mb-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">Recent Tasks</h5>
                </div>
                <div class="card-body">
                    <g:if test="${tasks}">
                        <div class="table-responsive">
                            <table class="table table-sm table-hover">
                                <thead>
                                <tr>
                                    <th>Task</th>
                                    <th>Intern</th>
                                    <th>Due Date</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${tasks.take(5)}" var="task">
                                    <tr>
                                        <td class="text-truncate" style="max-width: 150px;">${task.title}</td>
                                        <td>${task.intern?.user?.fullName}</td>
                                        <td><g:formatDate date="${task.dueDate}" format="dd/MM/yyyy"/></td>
                                        <td>
                                            <span class="badge ${task.status == 'COMPLETED' ? 'bg-success' : task.status == 'OVERDUE' ? 'bg-danger' : 'bg-warning'}">
                                                ${task.status ?: 'PENDING'}
                                            </span>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </g:if>
                    <g:else>
                        <p class="text-muted text-center py-3">No tasks assigned</p>
                    </g:else>
                </div>
            </div>
        </div>

        <!-- Intern Statistics -->
        <div class="col-lg-6 mb-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">Intern Performance</h5>
                </div>
                <div class="card-body">
                    <g:if test="${internStats}">
                        <div class="table-responsive">
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th>Intern</th>
                                    <th>Completion Rate</th>
                                    <th>Reports Approved</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${internStats}" var="stat">
                                    <tr>
                                        <td>${stat.intern?.user?.fullName}</td>
                                        <td>
                                            <div class="progress" style="height: 20px;">
                                                <div class="progress-bar" style="width: ${stat.taskStats?.completionRate ?: 0}%">
                                                    ${stat.taskStats?.completionRate ?: 0}%
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="progress" style="height: 20px;">
                                                <div class="progress-bar bg-success" style="width: ${stat.reportStats?.total > 0 ? (stat.reportStats?.approved / stat.reportStats?.total * 100) : 0}%">
                                                    ${stat.reportStats?.approved ?: 0}/${stat.reportStats?.total ?: 0}
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </g:if>
                    <g:else>
                        <p class="text-muted text-center py-3">No performance data available</p>
                    </g:else>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        // Update stats every minute
        setInterval(function() {
            $.ajax({
                url: '${createLink(controller: "dashboard", action: "apiStats")}',
                success: function(data) {
                    if (data.pendingReports !== undefined) {
                        $('.stat-number').eq(1).text(data.pendingReports);
                    }
                }
            });
        }, 60000);
    });
</script>

</html>
