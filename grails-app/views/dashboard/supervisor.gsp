%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <title>Supervisor Dashboard - InternTrack</title>--}%
%{--</head>--}%
%{--<body>--}%
%{--<div class="container-fluid">--}%
%{--    <!-- Welcome Section -->--}%
%{--    <div class="row mb-4">--}%
%{--        <div class="col-12">--}%
%{--            <div class="card">--}%
%{--                <div class="card-body">--}%
%{--                    <div class="d-flex justify-content-between align-items-center">--}%
%{--                        <div>--}%
%{--                            <h4 class="mb-1">Welcome, ${supervisor?.user?.fullName}!</h4>--}%
%{--                            <p class="text-muted mb-0">${supervisor?.position} - ${supervisor?.department}</p>--}%
%{--                        </div>--}%
%{--                        <div class="text-end">--}%
%{--                            <div class="avatar avatar-lg">--}%
%{--                                ${supervisor?.user?.initials}--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                    <hr>--}%
%{--                    <div class="row">--}%
%{--                        <div class="col-md-3">--}%
%{--                            <p><strong>Employee ID:</strong> ${supervisor?.employeeId}</p>--}%
%{--                        </div>--}%
%{--                        <div class="col-md-3">--}%
%{--                            <p><strong>Interns Assigned:</strong> ${currentInternCount}/${maxInterns}</p>--}%
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
%{--                <div class="stat-number">${currentInternCount}</div>--}%
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
%{--                <div class="stat-number">${maxInterns - currentInternCount}</div>--}%
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
%{--                        <span class="badge bg-success">${maxInterns - currentInternCount} slots available</span>--}%
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
%{--                                                    ${intern?.user?.initials}--}%
%{--                                                </div>--}%
%{--                                                <div>--}%
%{--                                                    <div class="fw-bold">${intern?.user?.fullName}</div>--}%
%{--                                                    <div class="small text-muted">${intern?.studentId}</div>--}%
%{--                                                </div>--}%
%{--                                            </div>--}%
%{--                                        </td>--}%
%{--                                        <td>${intern?.university}</td>--}%
%{--                                        <td>--}%
%{--                                            <g:set var="stats" value="${internStats.find { it.intern.id == intern.id }?.taskStats}"/>--}%
%{--                                            <div class="small">--}%
%{--                                                <span class="badge bg-success">${stats?.completed ?: 0}</span>--}%
%{--                                                <span class="badge bg-warning">${stats?.pending ?: 0}</span>--}%
%{--                                                <span class="badge bg-danger">${stats?.overdue ?: 0}</span>--}%
%{--                                            </div>--}%
%{--                                        </td>--}%
%{--                                        <td>--}%
%{--                                            <g:set var="rStats" value="${internStats.find { it.intern.id == intern.id }?.reportStats}"/>--}%
%{--                                            <div class="small">--}%
%{--                                                <span class="badge bg-success">${rStats?.approved ?: 0}</span>--}%
%{--                                                <span class="badge bg-warning">${rStats?.submitted ?: 0}</span>--}%
%{--                                            </div>--}%
%{--                                        </td>--}%
%{--                                        <td>--}%
%{--                                            <span class="badge ${intern?.status == 'ACTIVE' ? 'bg-success' : 'bg-secondary'}">--}%
%{--                                                ${intern?.status}--}%
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
%{--                                            <h6 class="mb-1">${report.intern.user.fullName}</h6>--}%
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
%{--                                                <button class="btn btn-outline-success" onclick="reviewReport(${report.id}, 'APPROVED')">--}%
%{--                                                    <i class="fas fa-check"></i>--}%
%{--                                                </button>--}%
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
%{--                                        <td>${task.intern.user.fullName}</td>--}%
%{--                                        <td><g:formatDate date="${task.dueDate}" format="dd/MM/yyyy"/></td>--}%
%{--                                        <td>--}%
%{--                                            <span class="badge ${task.status == 'COMPLETED' ? 'bg-success' : task.status == 'OVERDUE' ? 'bg-danger' : 'bg-warning'}">--}%
%{--                                                ${task.status}--}%
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
%{--                                        <td>${stat.intern.user.fullName}</td>--}%
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
%{--    function reviewReport(reportId, status) {--}%
%{--        if (confirm('Are you sure you want to ' + status.toLowerCase() + ' this report?')) {--}%
%{--            $.ajax({--}%
%{--                url: '${createLink(controller: "weeklyReport", action: "updateStatus")}',--}%
%{--                type: 'POST',--}%
%{--                data: {--}%
%{--                    id: reportId,--}%
%{--                    status: status,--}%
%{--                    comments: prompt('Enter comments (optional):')--}%
%{--                },--}%
%{--                success: function(response) {--}%
%{--                    if (response.success) {--}%
%{--                        location.reload();--}%
%{--                    } else {--}%
%{--                        alert('Error: ' + response.message);--}%
%{--                    }--}%
%{--                }--}%
%{--            });--}%
%{--        }--}%
%{--    }--}%

%{--    $(document).ready(function() {--}%
%{--        // Update stats every minute--}%
%{--        setInterval(function() {--}%
%{--            $.ajax({--}%
%{--                url: '${createLink(controller: "dashboard", action: "apiStats")}',--}%
%{--                success: function(data) {--}%
%{--                    if (data.pendingReports) {--}%
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
    <meta name="layout" content="main"/>
    <title>Supervisor Dashboard - InternTrack</title>

    <!-- CDN للـ Bootstrap و Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- الستايل الكامل داخل الملف -->
    <style>
    /* أنماط عامة */
    body {
        background-color: #f8f9fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        padding-top: 20px;
    }

    /* Navigation */
    .navbar {
        box-shadow: 0 2px 4px rgba(0,0,0,.1);
        margin-bottom: 30px;
    }

    /* Cards */
    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
        margin-bottom: 25px;
        transition: transform 0.3s;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .card-header {
        background-color: #ffffff;
        border-bottom: 1px solid #eaeaea;
        font-weight: 600;
        padding: 15px 20px;
        border-radius: 10px 10px 0 0 !important;
    }

    .card-body {
        padding: 20px;
    }

    /* Stat Cards */
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

    /* Avatars */
    .avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: #3498db;
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
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }

    .avatar-sm {
        width: 36px;
        height: 36px;
        font-size: 0.9rem;
    }

    /* Tables */
    .table {
        margin-bottom: 0;
    }

    .table-hover tbody tr:hover {
        background-color: rgba(52, 152, 219, 0.08);
    }

    .table th {
        border-top: none;
        font-weight: 600;
        color: #495057;
        background-color: #f8f9fa;
    }

    /* Badges */
    .badge {
        font-weight: 500;
        padding: 0.4em 0.8em;
        border-radius: 20px;
    }

    .bg-success {
        background-color: #28a745 !important;
    }

    .bg-warning {
        background-color: #ffc107 !important;
        color: #212529;
    }

    .bg-danger {
        background-color: #dc3545 !important;
    }

    .bg-secondary {
        background-color: #6c757d !important;
    }

    .bg-primary {
        background-color: #007bff !important;
    }

    /* Buttons */
    .btn {
        border-radius: 6px;
        font-weight: 500;
    }

    .btn-outline-primary {
        border-color: #007bff;
        color: #007bff;
    }

    .btn-outline-primary:hover {
        background-color: #007bff;
        color: white;
    }

    .btn-outline-success {
        border-color: #28a745;
        color: #28a745;
    }

    .btn-outline-success:hover {
        background-color: #28a745;
        color: white;
    }

    /* Timeline */
    .timeline {
        position: relative;
        padding-left: 0;
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
        background-color: #007bff;
    }

    /* Progress bars */
    .progress {
        height: 20px;
        border-radius: 10px;
        background-color: #e9ecef;
    }

    .progress-bar {
        border-radius: 10px;
        background-color: #007bff;
    }

    .progress-bar.bg-success {
        background-color: #28a745 !important;
    }

    /* Text utilities */
    .text-muted {
        color: #6c757d !important;
    }

    .fw-bold {
        font-weight: 600 !important;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .stat-number {
            font-size: 2rem;
        }

        .avatar-lg {
            width: 50px;
            height: 50px;
            font-size: 1.3rem;
        }
    }

    /* Custom animations */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .row > div {
        animation: fadeIn 0.5s ease-out;
    }

    /* Welcome section */
    .welcome-section {
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        border-radius: 10px;
        padding: 25px;
    }

    /* Section titles */
    h4, h5, h6 {
        color: #2c3e50;
        font-weight: 600;
    }

    h4 {
        margin-bottom: 10px;
    }

    h5 {
        margin-bottom: 15px;
    }

    /* Form controls */
    .form-control:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
    }

    /* Pagination */
    .pagination .page-item.active .page-link {
        background-color: #007bff;
        border-color: #007bff;
    }

    /* Alerts */
    .alert {
        border-radius: 8px;
        border: none;
    }

    /* Container */
    .container-fluid {
        padding: 0 25px;
    }

    /* Buttons group */
    .btn-group-sm > .btn {
        padding: 0.25rem 0.5rem;
        font-size: 0.875rem;
    }

    /* Text truncate */
    .text-truncate {
        max-width: 200px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    /* Small text */
    .small {
        font-size: 0.875em;
    }

    /* Text colors */
    .text-primary {
        color: #007bff !important;
    }

    .text-success {
        color: #28a745 !important;
    }

    .text-danger {
        color: #dc3545 !important;
    }

    .text-warning {
        color: #ffc107 !important;
    }

    /* Background colors */
    .bg-light {
        background-color: #f8f9fa !important;
    }

    /* Spacing utilities */
    .mb-4 {
        margin-bottom: 1.5rem !important;
    }

    .mt-4 {
        margin-top: 1.5rem !important;
    }

    .py-3 {
        padding-top: 1rem !important;
        padding-bottom: 1rem !important;
    }

    /* Flex utilities */
    .d-flex {
        display: flex !important;
    }

    .justify-content-between {
        justify-content: space-between !important;
    }

    .align-items-center {
        align-items: center !important;
    }

    .align-items-start {
        align-items: flex-start !important;
    }

    /* Grid system */
    .row {
        display: flex;
        flex-wrap: wrap;
        margin-right: -15px;
        margin-left: -15px;
    }

    .col-12, .col-md-3, .col-md-4, .col-lg-6, .col-lg-8 {
        position: relative;
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
    }

    @media (min-width: 768px) {
        .col-md-3 {
            flex: 0 0 25%;
            max-width: 25%;
        }
        .col-md-4 {
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
        }
    }

    @media (min-width: 992px) {
        .col-lg-6 {
            flex: 0 0 50%;
            max-width: 50%;
        }
        .col-lg-8 {
            flex: 0 0 66.666667%;
            max-width: 66.666667%;
        }
    }

    /* Table responsive */
    .table-responsive {
        overflow-x: auto;
    }

    /* Text alignment */
    .text-center {
        text-align: center !important;
    }

    .text-end {
        text-align: right !important;
    }

    /* Borders */
    hr {
        margin: 1.5rem 0;
        border: 0;
        border-top: 1px solid rgba(0,0,0,.1);
    }

    /* Font sizes */
    .fs-1 { font-size: 2.5rem; }
    .fs-2 { font-size: 2rem; }
    .fs-3 { font-size: 1.75rem; }
    .fs-4 { font-size: 1.5rem; }
    .fs-5 { font-size: 1.25rem; }
    .fs-6 { font-size: 1rem; }

    /* Margins */
    .me-2 { margin-right: 0.5rem !important; }
    .ms-2 { margin-left: 0.5rem !important; }
    .mb-0 { margin-bottom: 0 !important; }
    .mb-1 { margin-bottom: 0.25rem !important; }
    .mt-2 { margin-top: 0.5rem !important; }
    .mt-3 { margin-top: 1rem !important; }
    .mt-5 { margin-top: 3rem !important; }

    /* Paddings */
    .p-3 { padding: 1rem !important; }
    .p-4 { padding: 1.5rem !important; }
    .px-3 { padding-left: 1rem !important; padding-right: 1rem !important; }
    .py-2 { padding-top: 0.5rem !important; padding-bottom: 0.5rem !important; }
    .py-4 { padding-top: 1.5rem !important; padding-bottom: 1.5rem !important; }

    /* Shadows */
    .shadow-sm { box-shadow: 0 .125rem .25rem rgba(0,0,0,.075) !important; }
    .shadow { box-shadow: 0 .5rem 1rem rgba(0,0,0,.15) !important; }

    /* Display */
    .d-none { display: none !important; }
    .d-block { display: block !important; }
    .d-inline-block { display: inline-block !important; }
    </style>
</head>
<body>
<div class="container-fluid">
    <!-- Welcome Section -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card welcome-section">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h4 class="mb-1">Welcome, ${supervisor?.user?.fullName}!</h4>
                            <p class="text-muted mb-0">${supervisor?.position} - ${supervisor?.department}</p>
                        </div>
                        <div class="text-end">
                            <div class="avatar avatar-lg">
                                ${supervisor?.user?.initials}
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                            <p><strong>Employee ID:</strong> ${supervisor?.employeeId}</p>
                        </div>
                        <div class="col-md-3">
                            <p><strong>Interns Assigned:</strong> ${currentInternCount}/${maxInterns}</p>
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
                <div class="stat-number">${currentInternCount}</div>
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
                <div class="stat-number">${maxInterns - currentInternCount}</div>
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
                        <span class="badge bg-success">${maxInterns - currentInternCount} slots available</span>
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
                                                    ${intern?.user?.initials}
                                                </div>
                                                <div>
                                                    <div class="fw-bold">${intern?.user?.fullName}</div>
                                                    <div class="small text-muted">${intern?.studentId}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${intern?.university}</td>
                                        <td>
                                            <g:set var="stats" value="${internStats.find { it.intern.id == intern.id }?.taskStats}"/>
                                            <div class="small">
                                                <span class="badge bg-success">${stats?.completed ?: 0}</span>
                                                <span class="badge bg-warning">${stats?.pending ?: 0}</span>
                                                <span class="badge bg-danger">${stats?.overdue ?: 0}</span>
                                            </div>
                                        </td>
                                        <td>
                                            <g:set var="rStats" value="${internStats.find { it.intern.id == intern.id }?.reportStats}"/>
                                            <div class="small">
                                                <span class="badge bg-success">${rStats?.approved ?: 0}</span>
                                                <span class="badge bg-warning">${rStats?.submitted ?: 0}</span>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge ${intern?.status == 'ACTIVE' ? 'bg-success' : 'bg-secondary'}">
                                                ${intern?.status}
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
                                            <h6 class="mb-1">${report.intern.user.fullName}</h6>
                                            <p class="text-muted small mb-1">
                                                Week ${report.weekNumber} -
                                                <g:formatDate date="${report.reportDate}" format="dd/MM/yyyy"/>
                                            </p>
                                            <p class="small mb-0 text-truncate">${report.accomplishments?.truncate(80)}</p>
                                        </div>
                                        <div class="text-end">
                                            <div class="btn-group btn-group-sm">
                                                <g:link controller="weeklyReport" action="show" id="${report.id}" class="btn btn-outline-primary">
                                                    <i class="fas fa-eye"></i>
                                                </g:link>
                                                <button class="btn btn-outline-success" onclick="reviewReport(${report.id}, 'APPROVED')">
                                                    <i class="fas fa-check"></i>
                                                </button>
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
                                        <td>${task.intern.user.fullName}</td>
                                        <td><g:formatDate date="${task.dueDate}" format="dd/MM/yyyy"/></td>
                                        <td>
                                            <span class="badge ${task.status == 'COMPLETED' ? 'bg-success' : task.status == 'OVERDUE' ? 'bg-danger' : 'bg-warning'}">
                                                ${task.status}
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
                                        <td>${stat.intern.user.fullName}</td>
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
    function reviewReport(reportId, status) {
        if (confirm('Are you sure you want to ' + status.toLowerCase() + ' this report?')) {
            $.ajax({
                url: '${createLink(controller: "weeklyReport", action: "updateStatus")}',
                type: 'POST',
                data: {
                    id: reportId,
                    status: status,
                    comments: prompt('Enter comments (optional):')
                },
                success: function(response) {
                    if (response.success) {
                        location.reload();
                    } else {
                        alert('Error: ' + response.message);
                    }
                }
            });
        }
    }

    $(document).ready(function() {
        // إضافة تأثيرات عند التحميل
        $('.stat-card').each(function(i) {
            $(this).delay(i * 200).animate({opacity: 1, translateY: 0}, 500);
        });

        // Update stats every minute
        setInterval(function() {
            $.ajax({
                url: '${createLink(controller: "dashboard", action: "apiStats")}',
                success: function(data) {
                    if (data.pendingReports) {
                        $('.stat-number').eq(1).text(data.pendingReports);
                    }
                }
            });
        }, 60000);

        // إضافة تأثير hover على الصفوف
        $('.table-hover tbody tr').hover(
            function() {
                $(this).css('transform', 'translateX(5px)');
            },
            function() {
                $(this).css('transform', 'translateX(0)');
            }
        );

        // تفعيل tooltips
        $('[data-bs-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>