
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Admin Dashboard - InternTrack</title>

    <!-- CDN للـ Bootstrap و Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
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

    .stat-card:nth-child(5) {
        background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
    }

    .stat-card:nth-child(6) {
        background: linear-gradient(135deg, #30cfd0 0%, #330867 100%);
    }

    .stat-card:nth-child(7) {
        background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
    }

    .stat-card:nth-child(8) {
        background: linear-gradient(135deg, #5ee7df 0%, #b490ca 100%);
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

    .bg-info {
        background-color: #17a2b8 !important;
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

    .progress-bar-striped {
        background-image: linear-gradient(
                45deg,
                rgba(255, 255, 255, 0.15) 25%,
                transparent 25%,
                transparent 50%,
                rgba(255, 255, 255, 0.15) 50%,
                rgba(255, 255, 255, 0.15) 75%,
                transparent 75%,
                transparent
        );
        background-size: 1rem 1rem;
    }

    .progress-bar-animated {
        animation: progress-bar-stripes 1s linear infinite;
    }

    @keyframes progress-bar-stripes {
        from { background-position: 1rem 0; }
        to { background-position: 0 0; }
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

    h6 {
        color: #495057;
    }

    /* Form controls */
    .form-control:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
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

    .btn-group {
        border-radius: 6px;
        overflow: hidden;
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

    .mt-3 {
        margin-top: 1rem !important;
    }

    .mt-1 {
        margin-top: 0.25rem !important;
    }

    .d-block {
        display: block !important;
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

    .col-12, .col-md-3, .col-md-4, .col-lg-6, .col-lg-12 {
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
        .col-lg-12 {
            flex: 0 0 100%;
            max-width: 100%;
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
    .d-inline-block { display: inline-block !important; }

    /* List unstyled */
    .list-unstyled {
        padding-left: 0;
        list-style: none;
    }

    /* Modal styles */
    .modal-content {
        border: none;
        border-radius: 10px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.2);
    }

    .modal-header {
        border-bottom: 1px solid #eaeaea;
        background-color: #f8f9fa;
        border-radius: 10px 10px 0 0;
    }

    .modal-title {
        font-weight: 600;
        color: #2c3e50;
    }

    .modal-body {
        padding: 25px;
    }

    .modal-footer {
        border-top: 1px solid #eaeaea;
        padding: 15px 25px;
    }

    .btn-close:focus {
        box-shadow: none;
    }

    /* Card with light background */
    .card.bg-light {
        background-color: #f8f9fa !important;
        border: 1px solid #eaeaea;
    }

    .card.bg-light .card-body {
        padding: 1.25rem;
    }

    .card.bg-light .card-title {
        color: #495057;
        font-size: 0.95rem;
        margin-bottom: 0.5rem;
    }

    .card.bg-light .card-text {
        color: #6c757d;
        font-size: 0.9rem;
    }

    /* Quick actions buttons */
    .btn-group[role="group"] {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }

    .btn-group[role="group"] .btn {
        flex: 1;
        min-width: 150px;
        margin: 5px 0;
    }

    /* System info cards */
    .card.bg-light .fas {
        color: #6c757d;
        font-size: 1.2rem;
    }

    /* Footer in cards */
    .card-footer {
        background-color: #f8f9fa;
        border-top: 1px solid #eaeaea;
        padding: 15px 20px;
    }

    /* Badge colors for roles */
    .badge.bg-info {
        margin-right: 5px;
        margin-bottom: 5px;
    }

    /* Strong text */
    strong {
        color: #495057;
        font-weight: 600;
    }

    /* Hover effects for tables */
    .table-hover tbody tr {
        transition: all 0.3s;
    }

    .table-hover tbody tr:hover {
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    /* Avatar for admin */
    .avatar-lg i.fas.fa-cog {
        font-size: 1.5rem;
        color: white;
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
                            <h4 class="mb-1">System Administrator Dashboard</h4>
                            <p class="text-muted mb-0">Complete system overview and management</p>
                        </div>
                        <div class="text-end">
                            <div class="avatar avatar-lg">
                                <i class="fas fa-cog"></i>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-md-3">
                            <p><strong>System Version:</strong> 1.0.0</p>
                        </div>
                        <div class="col-md-3">
                            <p><strong>Database:</strong> PostgreSQL</p>
                        </div>
                        <div class="col-md-3">
                            <p><strong>Environment:</strong> ${grails.util.Environment.current.name}</p>
                        </div>
                        <div class="col-md-3">
                            <p><strong>Last Updated:</strong> <g:formatDate date="${new Date()}" format="dd/MM/yyyy HH:mm"/></p>
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
                <div class="stat-number">${totalUsers}</div>
                <div class="stat-label">Total Users</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">${totalInterns}</div>
                <div class="stat-label">Total Interns</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">${activeInterns}</div>
                <div class="stat-label">Active Interns</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">${totalSupervisors}</div>
                <div class="stat-label">Supervisors</div>
            </div>
        </div>
    </div>

    <!-- System Status -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">${pendingReports}</div>
                <div class="stat-label">Pending Reports</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">${overdueTasks}</div>
                <div class="stat-label">Overdue Tasks</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">0</div>
                <div class="stat-label">System Errors</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card stat-card">
                <div class="stat-number">100%</div>
                <div class="stat-label">System Uptime</div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Recent Users -->
        <div class="col-lg-6 mb-4">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Recent Users</h5>
                    <g:link controller="user" action="create" class="btn btn-sm btn-primary">
                        <i class="fas fa-plus"></i> Add User
                    </g:link>
                </div>
                <div class="card-body">
                    <g:if test="${recentUsers}">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>User</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Joined</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${recentUsers}" var="user">
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="avatar avatar-sm me-2">
                                                    ${user?.initials}
                                                </div>
                                                <div>
                                                    <div class="fw-bold">${user?.fullName}</div>
                                                    <div class="small text-muted">${user?.username}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>${user?.email}</td>
                                        <td>
                                            <g:each in="${user.authorities}" var="role">
                                                <span class="badge bg-info">${role.authority.replace('ROLE_', '')}</span>
                                            </g:each>
                                        </td>
                                        <td><g:formatDate date="${user?.dateCreated}" format="dd/MM/yyyy"/></td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </g:if>
                    <g:else>
                        <p class="text-muted text-center py-3">No users found</p>
                    </g:else>
                </div>
                <div class="card-footer text-center">
                    <g:link controller="user" action="index" class="btn btn-sm btn-outline-primary">View All Users</g:link>
                </div>
            </div>
        </div>

        <!-- Recent Interns -->
        <div class="col-lg-6 mb-4">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Recent Interns</h5>
                    <g:link controller="intern" action="create" class="btn btn-sm btn-primary">
                        <i class="fas fa-plus"></i> Add Intern
                    </g:link>
                </div>
                <div class="card-body">
                    <g:if test="${recentInterns}">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Intern</th>
                                    <th>University</th>
                                    <th>Supervisor</th>
                                    <th>Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${recentInterns}" var="intern">
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
                                        <td>${intern?.supervisor?.user?.fullName ?: 'Unassigned'}</td>
                                        <td>
                                            <span class="badge ${intern?.status == 'ACTIVE' ? 'bg-success' : 'bg-secondary'}">
                                                ${intern?.status}
                                            </span>
                                        </td>
                                    </tr>
                                </g:each>
                                </tbody>
                            </table>
                        </div>
                    </g:if>
                    <g:else>
                        <p class="text-muted text-center py-3">No interns found</p>
                    </g:else>
                </div>
                <div class="card-footer text-center">
                    <g:link controller="intern" action="index" class="btn btn-sm btn-outline-primary">View All Interns</g:link>
                </div>
            </div>
        </div>

        <!-- System Information -->
        <div class="col-lg-12 mb-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">System Information</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card bg-light mb-3">
                                <div class="card-body">
                                    <h6 class="card-title"><i class="fas fa-database me-2"></i>Database Status</h6>
                                    <p class="card-text">
                                        <span class="badge bg-success">Connected</span>
                                        <span class="text-muted small d-block mt-1">PostgreSQL 14+</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-light mb-3">
                                <div class="card-body">
                                    <h6 class="card-title"><i class="fas fa-server me-2"></i>Server Status</h6>
                                    <p class="card-text">
                                        <span class="badge bg-success">Running</span>
                                        <span class="text-muted small d-block mt-1">Grails 5.3.2</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-light mb-3">
                                <div class="card-body">
                                    <h6 class="card-title"><i class="fas fa-envelope me-2"></i>Email Service</h6>
                                    <p class="card-text">
                                        <span class="badge bg-success">Active</span>
                                        <span class="text-muted small d-block mt-1">SMTP configured</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-3">
                        <div class="col-12">
                            <h6>Quick Actions</h6>
                            <div class="btn-group" role="group">
                                <g:link controller="user" action="index" class="btn btn-outline-primary">
                                    <i class="fas fa-users-cog"></i> Manage Users
                                </g:link>
                                <g:link controller="intern" action="index" class="btn btn-outline-primary">
                                    <i class="fas fa-user-graduate"></i> Manage Interns
                                </g:link>
                                <g:link controller="system" action="settings" class="btn btn-outline-primary">
                                    <i class="fas fa-cogs"></i> System Settings
                                </g:link>
                                <button class="btn btn-outline-success" onclick="runSystemCheck()">
                                    <i class="fas fa-sync"></i> Run System Check
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function runSystemCheck() {
        $('#systemCheckModal').modal('show');

        // Simulate system check
        let progress = 0;
        const interval = setInterval(function() {
            progress += 20;
            $('#systemCheckProgress').css('width', progress + '%');

            if (progress >= 100) {
                clearInterval(interval);
                $('#systemCheckResult').html(`
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle"></i> System check completed successfully!
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <ul class="list-unstyled">
                                <li><i class="fas fa-check text-success"></i> Database connection OK</li>
                                <li><i class="fas fa-check text-success"></i> File system OK</li>
                                <li><i class="fas fa-check text-success"></i> Email service OK</li>
                            </ul>
                        </div>
                        <div class="col-6">
                            <ul class="list-unstyled">
                                <li><i class="fas fa-check text-success"></i> Security system OK</li>
                                <li><i class="fas fa-check text-success"></i> Scheduled jobs OK</li>
                                <li><i class="fas fa-check text-success"></i> All services running</li>
                            </ul>
                        </div>
                    </div>
                `);
            }
        }, 300);
    }

    // Update stats every 30 seconds
    setInterval(function() {
        $.ajax({
            url: '${createLink(controller: "dashboard", action: "apiStats")}',
            success: function(data) {
                // Update statistics
                $('.stat-number').eq(0).text(data.totalUsers);
                $('.stat-number').eq(1).text(data.totalInterns);
                $('.stat-number').eq(2).text(data.activeInterns);
                $('.stat-number').eq(3).text(data.totalSupervisors);
            }
        });
    }, 30000);

    // إضافة تأثيرات عند التحميل
    $(document).ready(function() {
        $('.stat-card').each(function(i) {
            $(this).delay(i * 200).animate({opacity: 1, translateY: 0}, 500);
        });

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

        // إغلاق التنبيهات تلقائياً بعد 5 ثوان
        setTimeout(function() {
            $('.alert').alert('close');
        }, 5000);
    });
</script>

<!-- System Check Modal -->
<div class="modal fade" id="systemCheckModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">System Check</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <p>Running system diagnostics...</p>
                <div class="progress mb-3">
                    <div id="systemCheckProgress" class="progress-bar progress-bar-striped progress-bar-animated" style="width: 0%"></div>
                </div>
                <div id="systemCheckResult"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

</html>