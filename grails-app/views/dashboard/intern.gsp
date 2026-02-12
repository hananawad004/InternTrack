
<!DOCTYPE html>
<html>
<head>
    <meta name="layouts" content="main"/>
    <title>Intern Dashboard - InternTrack</title>

    <style>
    /* Reset and Base Styles */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, sans-serif;
        background-color: #f8fafc;
        color: #334155;
        line-height: 1.5;
    }

    .container-fluid {
        padding: 24px;
        max-width: 1400px;
        margin: 0 auto;
    }

    /* Welcome Section - Clean Design */
    .welcome-section {
        background: white;
        border-radius: 16px;
        padding: 32px;
        margin-bottom: 32px;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        border: 1px solid #e2e8f0;
    }

    .welcome-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 24px;
    }

    .welcome-title h1 {
        font-size: 28px;
        font-weight: 600;
        color: #1e293b;
        margin-bottom: 8px;
    }

    .welcome-title p {
        color: #64748b;
        font-size: 15px;
    }

    .avatar {
        width: 72px;
        height: 72px;
        border-radius: 50%;
        background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 24px;
        font-weight: 600;
    }

    .info-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 24px;
        margin-top: 24px;
    }

    .info-item {
        padding: 20px;
        background: #f8fafc;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
    }

    .info-item strong {
        display: block;
        color: #64748b;
        font-size: 14px;
        margin-bottom: 8px;
        font-weight: 500;
    }

    .info-item span {
        color: #1e293b;
        font-size: 16px;
        font-weight: 500;
    }

    /* Stat Cards - Minimal Design */
    .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
        gap: 20px;
        margin-bottom: 32px;
    }

    .stat-card {
        background: white;
        border-radius: 12px;
        padding: 24px;
        text-align: center;
        border: 1px solid #e2e8f0;
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .stat-card:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
    }

    .stat-number {
        font-size: 36px;
        font-weight: 700;
        color: #1e293b;
        margin-bottom: 8px;
        line-height: 1;
    }

    .stat-label {
        color: #64748b;
        font-size: 14px;
        font-weight: 500;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    /* Content Grid */
    .content-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 24px;
        margin-bottom: 32px;
    }

    @media (max-width: 1024px) {
        .content-grid {
            grid-template-columns: 1fr;
        }
    }

    /* Cards */
    .card {
        background: white;
        border-radius: 16px;
        border: 1px solid #e2e8f0;
        overflow: hidden;
    }

    .card-header {
        padding: 24px 24px 16px;
        border-bottom: 1px solid #e2e8f0;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .card-header h3 {
        font-size: 18px;
        font-weight: 600;
        color: #1e293b;
        margin: 0;
    }

    .card-body {
        padding: 24px;
    }

    .card-footer {
        padding: 20px 24px;
        border-top: 1px solid #e2e8f0;
        text-align: center;
    }

    /* Task List */
    .task-list {
        display: flex;
        flex-direction: column;
        gap: 16px;
    }

    .task-item {
        padding: 20px;
        background: #f8fafc;
        border-radius: 12px;
        border: 1px solid #e2e8f0;
    }

    .task-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 12px;
    }

    .task-title {
        font-weight: 600;
        color: #1e293b;
        font-size: 16px;
        margin-bottom: 8px;
    }

    .task-meta {
        color: #64748b;
        font-size: 14px;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .task-description {
        color: #64748b;
        font-size: 14px;
        line-height: 1.5;
        margin-bottom: 16px;
    }

    .task-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    /* Badges */
    .badge {
        display: inline-block;
        padding: 4px 12px;
        border-radius: 20px;
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .badge-success {
        background: #d1fae5;
        color: #065f46;
    }

    .badge-warning {
        background: #fef3c7;
        color: #92400e;
    }

    .badge-danger {
        background: #fee2e2;
        color: #991b1b;
    }

    .badge-secondary {
        background: #e5e7eb;
        color: #374151;
    }

    .badge-primary {
        background: #dbeafe;
        color: #1e40af;
    }

    /* Status Badges */
    .status-badge {
        padding: 4px 12px;
        border-radius: 6px;
        font-size: 12px;
        font-weight: 600;
    }

    .status-completed {
        background: #d1fae5;
        color: #065f46;
    }

    .status-in-progress {
        background: #dbeafe;
        color: #1e40af;
    }

    .status-pending {
        background: #fef3c7;
        color: #92400e;
    }

    .status-overdue {
        background: #fee2e2;
        color: #991b1b;
    }

    /* Table */
    .table-responsive {
        overflow-x: auto;
    }

    .table {
        width: 100%;
        border-collapse: collapse;
    }

    .table th {
        text-align: left;
        padding: 12px 16px;
        color: #64748b;
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        border-bottom: 1px solid #e2e8f0;
    }

    .table td {
        padding: 16px;
        border-bottom: 1px solid #f1f5f9;
        color: #475569;
    }

    .table tr:hover {
        background: #f8fafc;
    }

    /* Progress Bars */
    .progress-container {
        margin-top: 24px;
    }

    .progress-label {
        display: flex;
        justify-content: space-between;
        margin-bottom: 8px;
        font-size: 14px;
        color: #64748b;
    }

    .progress-bar {
        height: 8px;
        background: #e2e8f0;
        border-radius: 4px;
        overflow: hidden;
    }

    .progress-fill {
        height: 100%;
        background: linear-gradient(90deg, #4f46e5, #7c3aed);
        border-radius: 4px;
        transition: width 0.3s ease;
    }

    /* Buttons */
    .btn {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        padding: 10px 20px;
        border-radius: 8px;
        font-size: 14px;
        font-weight: 500;
        border: none;
        cursor: pointer;
        transition: all 0.2s;
        text-decoration: none;
        gap: 8px;
    }

    .btn-primary {
        background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
        color: white;
    }

    .btn-primary:hover {
        opacity: 0.9;
        transform: translateY(-1px);
    }

    .btn-outline {
        background: transparent;
        border: 1px solid #4f46e5;
        color: #4f46e5;
    }

    .btn-outline:hover {
        background: #4f46e5;
        color: white;
    }

    .btn-sm {
        padding: 8px 16px;
        font-size: 13px;
    }

    /* Empty States */
    .empty-state {
        text-align: center;
        padding: 48px 24px;
        color: #94a3b8;
    }

    .empty-state i {
        font-size: 48px;
        margin-bottom: 16px;
        opacity: 0.5;
    }

    /* Icons */
    .fas, .fab {
        font-family: "Font Awesome 6 Free";
    }

    /* Utility Classes */
    .mb-4 {
        margin-bottom: 16px;
    }

    .mt-2 {
        margin-top: 8px;
    }

    .mt-4 {
        margin-top: 16px;
    }

    .text-muted {
        color: #94a3b8;
    }

    .text-center {
        text-align: center;
    }

    .d-flex {
        display: flex;
    }

    .justify-between {
        justify-content: space-between;
    }

    .align-center {
        align-items: center;
    }

    .gap-2 {
        gap: 8px;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .container-fluid {
            padding: 16px;
        }

        .welcome-section {
            padding: 24px;
        }

        .welcome-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 16px;
        }

        .avatar {
            align-self: flex-end;
            width: 56px;
            height: 56px;
            font-size: 20px;
        }

        .stats-grid {
            grid-template-columns: repeat(2, 1fr);
        }

        .card-header {
            flex-direction: column;
            gap: 12px;
            align-items: flex-start;
        }

        .task-header {
            flex-direction: column;
            gap: 8px;
        }

        .task-footer {
            flex-direction: column;
            gap: 12px;
            align-items: flex-start;
        }
    }

    @media (max-width: 480px) {
        .stats-grid {
            grid-template-columns: 1fr;
        }

        .info-grid {
            grid-template-columns: 1fr;
        }
    }
    </style>
</head>
<body>
<div class="container-fluid">
    <!-- Welcome Section -->
    <section class="welcome-section">
        <div class="welcome-header">
            <div class="welcome-title">
                <h1>Welcome, ${intern?.user?.fullName ?: 'Intern'}!</h1>
                <p>${intern?.university ?: 'University'} - ${intern?.major ?: 'Major'}</p>
            </div>
            <div class="avatar">
                ${intern?.user?.fullName?.split(' ')?.collect{it[0]}?.join()?.toUpperCase() ?: 'IN'}
            </div>
        </div>

        <div class="info-grid">
            <div class="info-item">
                <strong>Student ID</strong>
                <span>${intern?.studentId ?: 'N/A'}</span>
            </div>
            <div class="info-item">
                <strong>Supervisor</strong>
                <span>${intern?.supervisor?.user?.fullName ?: 'Not Assigned'}</span>
            </div>
            <div class="info-item">
                <strong>Status</strong>
                <span class="badge ${intern?.status == 'ACTIVE' ? 'badge-success' : 'badge-secondary'}">
                    ${intern?.status ?: 'INACTIVE'}
                </span>
            </div>
            <div class="info-item">
                <strong>Start Date</strong>
                <span><g:formatDate date="${intern?.startDate}" format="MMM dd, yyyy"/></span>
            </div>
            <div class="info-item">
                <strong>End Date</strong>
                <span><g:formatDate date="${intern?.endDate}" format="MMM dd, yyyy"/></span>
            </div>
            <div class="info-item">
                <strong>Days Remaining</strong>
                <span class="badge ${remainingDays > 30 ? 'badge-success' : remainingDays > 7 ? 'badge-warning' : 'badge-danger'}">
                    ${remainingDays} days
                </span>
            </div>
        </div>
    </section>

    <!-- Statistics Cards -->
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-number">${taskStats?.total ?: 0}</div>
            <div class="stat-label">Total Tasks</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">${taskStats?.completionRate ?: 0}%</div>
            <div class="stat-label">Completion Rate</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">${reportStats?.total ?: 0}</div>
            <div class="stat-label">Reports Submitted</div>
        </div>
        <div class="stat-card">
            <div class="stat-number">${evalStats?.averageScore ?: 0}</div>
            <div class="stat-label">Average Score</div>
        </div>
    </div>

    <!-- Main Content Grid -->
    <div class="content-grid">
        <!-- Upcoming Tasks -->
        <div class="card">
            <div class="card-header">
                <h3>Upcoming Tasks</h3>
                <a href="/task/create" class="btn btn-primary btn-sm">
                    <i class="fas fa-plus"></i> New Task
                </a>
            </div>
            <div class="card-body">
                <g:if test="${upcomingTasks}">
                    <div class="task-list">
                        <g:each in="${upcomingTasks}" var="task">
                            <div class="task-item">
                                <div class="task-header">
                                    <div>
                                        <div class="task-title">${task.title}</div>
                                        <div class="task-meta">
                                            <span>Due: <g:formatDate date="${task.dueDate}" format="MMM dd"/></span>
                                            <span class="badge badge-primary">${task.priority}</span>
                                        </div>
                                    </div>
                                    <span class="status-badge status-${task.status?.toLowerCase() ?: 'pending'}">
                                        ${task.status}
                                    </span>
                                </div>
                                <div class="task-description">
                                    ${task.description?.truncate(120)}
                                </div>
                                <div class="task-footer">
                                    <div>
                                        <a href="/task/show/${task.id}" class="btn btn-outline btn-sm">
                                            <i class="fas fa-eye"></i> View Details
                                        </a>
                                    </div>
                                    <div class="text-muted">
                                        <i class="far fa-calendar"></i> ${task.dueDate?.format('MMM dd')}
                                    </div>
                                </div>
                            </div>
                        </g:each>
                    </div>
                </g:if>
                <g:else>
                    <div class="empty-state">
                        <i class="fas fa-tasks"></i>
                        <p>No upcoming tasks</p>
                    </div>
                </g:else>
            </div>
            <div class="card-footer">
                <a href="/task" class="btn btn-outline">View All Tasks</a>
            </div>
        </div>

        <!-- Recent Reports -->
        <div class="card">
            <div class="card-header">
                <h3>Recent Reports</h3>
                <a href="/weeklyReport/create" class="btn btn-primary btn-sm">
                    <i class="fas fa-plus"></i> New Report
                </a>
            </div>
            <div class="card-body">
                <g:if test="${recentReports}">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>Week</th>
                                <th>Date</th>
                                <th>Hours</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${recentReports}" var="report">
                                <tr>
                                    <td>Week ${report.weekNumber}</td>
                                    <td><g:formatDate date="${report.reportDate}" format="MMM dd"/></td>
                                    <td>${report.hoursWorked} hrs</td>
                                    <td>
                                        <span class="badge ${report.status == 'APPROVED' ? 'badge-success' : report.status == 'REJECTED' ? 'badge-danger' : 'badge-warning'}">
                                            ${report.status}
                                        </span>
                                    </td>
                                    <td>
                                        <a href="/weeklyReport/show/${report.id}" class="btn btn-outline btn-sm">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                    </td>
                                </tr>
                            </g:each>
                            </tbody>
                        </table>
                    </div>
                </g:if>
                <g:else>
                    <div class="empty-state">
                        <i class="fas fa-file-alt"></i>
                        <p>No reports submitted yet</p>
                    </div>
                </g:else>
            </div>
            <div class="card-footer">
                <a href="/weeklyReport" class="btn btn-outline">View All Reports</a>
            </div>
        </div>

        <!-- Task Statistics -->
        <div class="card">
            <div class="card-header">
                <h3>Task Statistics</h3>
            </div>
            <div class="card-body">
                <div class="stats-grid" style="margin-bottom: 24px;">
                    <div class="stat-card">
                        <div class="stat-number">${taskStats?.completed ?: 0}</div>
                        <div class="stat-label">Completed</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">${taskStats?.pending ?: 0}</div>
                        <div class="stat-label">Pending</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">${taskStats?.inProgress ?: 0}</div>
                        <div class="stat-label">In Progress</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">${taskStats?.overdue ?: 0}</div>
                        <div class="stat-label">Overdue</div>
                    </div>
                </div>

                <div class="progress-container">
                    <div class="progress-label">
                        <span>Completion Progress</span>
                        <span>${taskStats?.completionRate ?: 0}%</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: ${taskStats?.completionRate ?: 0}%"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Report Statistics -->
        <div class="card">
            <div class="card-header">
                <h3>Report Statistics</h3>
            </div>
            <div class="card-body">
                <div class="stats-grid" style="margin-bottom: 24px;">
                    <div class="stat-card">
                        <div class="stat-number">${reportStats?.total ?: 0}</div>
                        <div class="stat-label">Total</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">${reportStats?.approved ?: 0}</div>
                        <div class="stat-label">Approved</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number">${reportStats?.totalHours ?: 0}</div>
                        <div class="stat-label">Total Hours</div>
                    </div>
                </div>

                <div class="progress-container">
                    <div class="progress-label">
                        <span>Average Hours per Week</span>
                        <span>${reportStats?.avgHours ?: 0} hours</span>
                    </div>
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: ${Math.min(reportStats?.avgHours ?: 0, 100)}%"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Simple animations and interactions
    document.addEventListener('DOMContentLoaded', function() {
        // Animate stat numbers
        const statNumbers = document.querySelectorAll('.stat-number');
        statNumbers.forEach(stat => {
            const originalText = stat.textContent;
            const num = parseInt(originalText.replace('%', ''));
            if (!isNaN(num)) {
                stat.textContent = '0' + (originalText.includes('%') ? '%' : '');
                let counter = 0;
                const increment = num / 50;
                const timer = setInterval(() => {
                    counter += increment;
                    if (counter >= num) {
                        counter = num;
                        clearInterval(timer);
                    }
                    stat.textContent = Math.round(counter) + (originalText.includes('%') ? '%' : '');
                }, 30);
            }
        });

        // Add hover effects to cards
        const cards = document.querySelectorAll('.card, .stat-card');
        cards.forEach(card => {
            card.addEventListener('mouseenter', () => {
                card.style.transform = 'translateY(-4px)';
                card.style.boxShadow = '0 8px 25px rgba(0, 0, 0, 0.08)';
            });

            card.addEventListener('mouseleave', () => {
                card.style.transform = '';
                card.style.boxShadow = '';
            });
        });

        // Update days remaining badge color
        const remainingDays = ${remainingDays ?: 45};
        const daysBadge = document.querySelector('.badge:contains("days")');
        if (daysBadge) {
            if (remainingDays > 30) {
                daysBadge.className = 'badge badge-success';
            } else if (remainingDays > 7) {
                daysBadge.className = 'badge badge-warning';
            } else {
                daysBadge.className = 'badge badge-danger';
            }
        }
    });

    // AJAX for stats update
    function updateStats() {
        fetch('${createLink(controller: "dashboard", action: "apiStats")}')
            .then(response => response.json())
            .then(data => {
                if (data.taskStats) {
                    // Update task stats
                    document.querySelectorAll('.stat-number')[0].textContent = data.taskStats.total;
                    document.querySelectorAll('.stat-number')[1].textContent = data.taskStats.completionRate + '%';
                    document.querySelector('.progress-fill').style.width = data.taskStats.completionRate + '%';
                }
            })
            .catch(error => console.error('Error updating stats:', error));
    }

    // Update stats every 30 seconds
    setInterval(updateStats, 30000);
</script>
</body>
</html>