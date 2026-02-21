%{--<%----}%
%{--  Created by IntelliJ IDEA.--}%
%{--  User: Eng.Hanan Awad--}%
%{--  Date: 2/12/2026--}%
%{--  Time: 11:38 AM--}%
%{----%>--}%

%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <meta name="active-tasks" content="true"/>--}%
%{--    <title>Tasks - InternTrack</title>--}%

%{--    <style>--}%
%{--    .task-card {--}%
%{--        background: white;--}%
%{--        border-radius: 10px;--}%
%{--        box-shadow: 0 2px 10px rgba(0,0,0,0.08);--}%
%{--        margin-bottom: 20px;--}%
%{--        padding: 20px;--}%
%{--        border-left: 4px solid #667eea;--}%
%{--        transition: all 0.3s;--}%
%{--    }--}%

%{--    .task-card:hover {--}%
%{--        transform: translateY(-3px);--}%
%{--        box-shadow: 0 5px 20px rgba(0,0,0,0.12);--}%
%{--    }--}%

%{--    .priority-high {--}%
%{--        border-left-color: #dc3545;--}%
%{--    }--}%

%{--    .priority-medium {--}%
%{--        border-left-color: #ffc107;--}%
%{--    }--}%

%{--    .priority-low {--}%
%{--        border-left-color: #28a745;--}%
%{--    }--}%

%{--    .status-badge {--}%
%{--        padding: 5px 12px;--}%
%{--        border-radius: 20px;--}%
%{--        font-size: 0.85rem;--}%
%{--        font-weight: 600;--}%
%{--    }--}%

%{--    .status-PENDING { background-color: #ffc107; color: #212529; }--}%
%{--    .status-IN_PROGRESS { background-color: #17a2b8; color: white; }--}%
%{--    .status-COMPLETED { background-color: #28a745; color: white; }--}%
%{--    .status-OVERDUE { background-color: #dc3545; color: white; }--}%
%{--    </style>--}%
%{--</head>--}%

%{--<div class="container-fluid">--}%
%{--    <!-- Page Header -->--}%
%{--    <div class="d-flex justify-content-between align-items-center mb-4">--}%
%{--        <div>--}%
%{--            <h1 class="h3 mb-0">--}%
%{--                <i class="fas fa-tasks me-2 text-primary"></i>--}%
%{--                Tasks--}%
%{--            </h1>--}%
%{--            <p class="text-muted mb-0">Manage and track all tasks</p>--}%
%{--        </div>--}%
%{--        <div>--}%
%{--            <g:link controller="task" action="create" class="btn btn-primary">--}%
%{--                <i class="fas fa-plus-circle me-2"></i>--}%
%{--                New Task--}%
%{--            </g:link>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <!-- Filters -->--}%
%{--    <div class="card mb-4">--}%
%{--        <div class="card-body">--}%
%{--            <div class="row">--}%
%{--                <div class="col-md-3">--}%
%{--                    <label class="form-label small text-muted">Status</label>--}%
%{--                    <select class="form-select" id="statusFilter">--}%
%{--                        <option value="">All Status</option>--}%
%{--                        <option value="PENDING">Pending</option>--}%
%{--                        <option value="IN_PROGRESS">In Progress</option>--}%
%{--                        <option value="COMPLETED">Completed</option>--}%
%{--                        <option value="OVERDUE">Overdue</option>--}%
%{--                    </select>--}%
%{--                </div>--}%
%{--                <div class="col-md-3">--}%
%{--                    <label class="form-label small text-muted">Priority</label>--}%
%{--                    <select class="form-select" id="priorityFilter">--}%
%{--                        <option value="">All Priority</option>--}%
%{--                        <option value="HIGH">High</option>--}%
%{--                        <option value="MEDIUM">Medium</option>--}%
%{--                        <option value="LOW">Low</option>--}%
%{--                    </select>--}%
%{--                </div>--}%
%{--                <div class="col-md-3 d-flex align-items-end">--}%
%{--                    <button class="btn btn-outline-primary w-100" onclick="applyFilters()">--}%
%{--                        <i class="fas fa-filter me-2"></i>--}%
%{--                        Apply Filters--}%
%{--                    </button>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--<!-- Tasks List -->--}%
%{--    <g:if test="${taskList}">--}%
%{--        <div class="row">--}%
%{--            <g:each in="${taskList}" var="task">--}%
%{--                <div class="col-md-6 col-lg-4">--}%
%{--                    <div class="task-card priority-${task.priority?.toLowerCase() ?: 'medium'}">--}%
%{--                        <div class="d-flex justify-content-between align-items-start mb-3">--}%
%{--                            <h5 class="mb-0">--}%
%{--                                <g:link controller="task" action="show" id="${task.id}" class="text-decoration-none">--}%
%{--                                    ${task.title}--}%
%{--                                </g:link>--}%
%{--                            </h5>--}%
%{--                            <span class="status-badge status-${task.status}">--}%
%{--                                ${task.status ?: 'PENDING'}--}%
%{--                            </span>--}%
%{--                        </div>--}%

%{--                        <p class="text-muted small mb-3">--}%
%{--                            ${task.description?.truncate(100) ?: 'No description'}--}%
%{--                        </p>--}%

%{--                        <div class="d-flex justify-content-between align-items-center">--}%
%{--                            <div>--}%
%{--                                <i class="fas fa-user me-1 text-muted"></i>--}%
%{--                                <span class="small">${task.intern?.user?.fullName ?: 'Unassigned'}</span>--}%
%{--                            </div>--}%
%{--                            <div class="text-end">--}%
%{--                                <small class="text-muted">--}%
%{--                                    <i class="fas fa-calendar me-1"></i>--}%
%{--                                    Due: <g:formatDate date="${task.dueDate}" format="dd/MM/yyyy"/>--}%
%{--                                </small>--}%
%{--                            </div>--}%
%{--                        </div>--}%

%{--                        <div class="mt-3 pt-2 border-top">--}%
%{--                            <div class="btn-group btn-group-sm w-100">--}%
%{--                                <g:link controller="task" action="show" id="${task.id}" class="btn btn-outline-primary">--}%
%{--                                    <i class="fas fa-eye"></i> View--}%
%{--                                </g:link>--}%
%{--                                <g:link controller="task" action="edit" id="${task.id}" class="btn btn-outline-warning">--}%
%{--                                    <i class="fas fa-edit"></i> Edit--}%
%{--                                </g:link>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </g:each>--}%
%{--        </div>--}%
%{--    </g:if>--}%
%{--    <g:else>--}%
%{--        <div class="text-center py-5">--}%
%{--            <i class="fas fa-tasks fa-4x text-muted mb-3"></i>--}%
%{--            <h5 class="text-muted">No tasks found</h5>--}%
%{--            <p class="text-muted mb-3">There are no tasks available.</p>--}%
%{--            <g:link controller="task" action="create" class="btn btn-primary">--}%
%{--                <i class="fas fa-plus-circle me-2"></i>--}%
%{--                Create First Task--}%
%{--            </g:link>--}%
%{--        </div>--}%
%{--    </g:else>--}%
%{--</div>--}%

%{--<script>--}%
%{--    function applyFilters() {--}%
%{--        // TODO: Implement filter logic--}%
%{--        console.log('Applying filters...');--}%
%{--    }--}%
%{--</script>--}%

%{--</html>--}%
%{--</html>--}%
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <meta name="active-tasks" content="true"/>
    <title>Tasks - InternTrack</title>

    <style>
    .task-card {
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        margin-bottom: 20px;
        padding: 20px;
        border-left: 4px solid #667eea;
        transition: all 0.3s;
    }

    .task-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 5px 20px rgba(0,0,0,0.12);
    }

    .priority-high { border-left-color: #dc3545; }
    .priority-medium { border-left-color: #ffc107; }
    .priority-low { border-left-color: #28a745; }
    .priority-urgent { border-left-color: #6f42c1; }

    .status-badge {
        padding: 5px 12px;
        border-radius: 20px;
        font-size: 0.85rem;
        font-weight: 600;
    }

    .status-PENDING { background-color: #ffc107; color: #212529; }
    .status-IN_PROGRESS { background-color: #17a2b8; color: white; }
    .status-COMPLETED { background-color: #28a745; color: white; }
    .status-OVERDUE { background-color: #dc3545; color: white; }
    .status-REJECTED { background-color: #6c757d; color: white; }
    </style>
</head>




<div class="container-fluid">

    <!-- Page Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="h3 mb-0">
                <i class="fas fa-tasks me-2 text-primary"></i>
                Tasks
            </h1>
            <p class="text-muted mb-0">Manage and track all tasks</p>
        </div>
        <div>
            <g:link controller="task" action="create" class="btn btn-primary">
                <i class="fas fa-plus-circle me-2"></i>
                New Task
            </g:link>
        </div>
    </div>

    <!-- Filters -->
    <div class="card mb-4">
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <label class="form-label small text-muted">Status</label>
                    <select class="form-select" id="statusFilter">
                        <option value="">All Status</option>
                        <option value="PENDING" ${params.status == 'PENDING' ? 'selected' : ''}>Pending</option>
                        <option value="IN_PROGRESS" ${params.status == 'IN_PROGRESS' ? 'selected' : ''}>In Progress</option>
                        <option value="COMPLETED" ${params.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
                        <option value="OVERDUE" ${params.status == 'OVERDUE' ? 'selected' : ''}>Overdue</option>
                        <option value="REJECTED" ${params.status == 'REJECTED' ? 'selected' : ''}>Rejected</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <label class="form-label small text-muted">Priority</label>
                    <select class="form-select" id="priorityFilter">
                        <option value="">All Priority</option>
                        <option value="LOW" ${params.priority == 'LOW' ? 'selected' : ''}>Low</option>
                        <option value="MEDIUM" ${params.priority == 'MEDIUM' ? 'selected' : ''}>Medium</option>
                        <option value="HIGH" ${params.priority == 'HIGH' ? 'selected' : ''}>High</option>
                        <option value="URGENT" ${params.priority == 'URGENT' ? 'selected' : ''}>Urgent</option>
                    </select>
                </div>

                <div class="col-md-3 d-flex align-items-end">
                    <button class="btn btn-outline-primary w-100" onclick="applyFilters()">
                        <i class="fas fa-filter me-2"></i>
                        Apply Filters
                    </button>
                </div>

                <div class="col-md-3 d-flex align-items-end">
                    <g:link controller="task" action="index" class="btn btn-outline-secondary w-100">
                        <i class="fas fa-times me-2"></i>
                        Clear Filters
                    </g:link>
                </div>
            </div>
        </div>
    </div>

<!-- Tasks List -->
    <g:if test="${taskList}">
        <div class="row">
            <g:each in="${taskList}" var="task">
                <div class="col-md-6 col-lg-4">
                    <div class="task-card priority-${task.priority?.toLowerCase() ?: 'medium'}">

                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <h5 class="mb-0">
                                <g:link controller="task" action="show" id="${task.id}" class="text-decoration-none">
                                    ${task.title}
                                </g:link>
                            </h5>
                            <span class="status-badge status-${task.status}">
                                ${task.status ?: 'PENDING'}
                            </span>
                        </div>

                        <!-- ✅ FIXED DESCRIPTION -->
                        <p class="text-muted small mb-3">
                            ${task.description ?
                                    (task.description.size() > 100 ?
                                            task.description.take(100) + '...' :
                                            task.description)
                                    : 'No description'}
                        </p>

                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <i class="fas fa-user me-1 text-muted"></i>
                                <span class="small">
                                    ${task.intern?.user?.fullName ?: 'Unassigned'}
                                </span>
                            </div>
                            <div class="text-end">
                                <small class="text-muted">
                                    <i class="fas fa-calendar me-1"></i>
                                    Due:
                                    <g:formatDate date="${task.dueDate}" format="dd/MM/yyyy"/>
                                </small>
                            </div>
                        </div>

                        <div class="mt-3 pt-2 border-top">
                            <div class="btn-group btn-group-sm w-100">
                                <g:link controller="task" action="show" id="${task.id}" class="btn btn-outline-primary">
                                    <i class="fas fa-eye"></i> View
                                </g:link>
                                <g:link controller="task" action="edit" id="${task.id}" class="btn btn-outline-warning">
                                    <i class="fas fa-edit"></i> Edit
                                </g:link>
                            </div>
                        </div>

                    </div>
                </div>
            </g:each>
        </div>

        <!-- Pagination Info -->
        <div class="row mt-4">
            <div class="col-12 text-center text-muted">
                <small>Showing ${taskList.size()} of ${totalCount} tasks</small>
            </div>
        </div>

    </g:if>

    <g:else>
        <div class="text-center py-5">
            <i class="fas fa-tasks fa-4x text-muted mb-3"></i>
            <h5 class="text-muted">No tasks found</h5>
            <p class="text-muted mb-3">
                <g:if test="${params.status || params.priority}">
                    No tasks match selected filters.
                </g:if>
                <g:else>
                    There are no tasks available.
                </g:else>
            </p>

            <g:link controller="task" action="create" class="btn btn-primary">
                <i class="fas fa-plus-circle me-2"></i>
                Create Task
            </g:link>
        </div>
    </g:else>

</div>

<script>
    function applyFilters() {
        var status = document.getElementById('statusFilter').value;
        var priority = document.getElementById('priorityFilter').value;

        var url = '${createLink(action: 'index')}';
        var params = [];

        if (status) params.push('status=' + encodeURIComponent(status));
        if (priority) params.push('priority=' + encodeURIComponent(priority));

        if (params.length > 0) {
            url += '?' + params.join('&');
        }

        window.location.href = url;
    }
</script>


</html>