
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <meta name="active-tasks" content="true"/>
  <title>Task Details - ${task.title} - InternTrack</title>

  <!-- Bootstrap & Font Awesome (مباشرة) -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
  /* Import Bootstrap classes manually if needed */
  .bg-success { background-color: #28a745 !important; }
  .bg-danger { background-color: #dc3545 !important; }
  .bg-info { background-color: #17a2b8 !important; }
  .bg-warning { background-color: #ffc107 !important; color: #212529 !important; }

  .badge {
    display: inline-block;
    padding: 0.35em 0.65em;
    font-size: 0.75em;
    font-weight: 700;
    line-height: 1;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: 0.375rem;
    color: #fff;
  }

  .btn {
    display: inline-block;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    text-align: center;
    text-decoration: none;
    border-radius: 0.375rem;
    transition: all 0.3s;
  }

  .btn-warning {
    background-color: #ffc107;
    border-color: #ffc107;
    color: #212529;
  }

  .btn-danger {
    background-color: #dc3545;
    border-color: #dc3545;
    color: white;
  }

  .btn-outline-secondary {
    border: 1px solid #6c757d;
    color: #6c757d;
    background: transparent;
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

  /* باقي الـ CSS حقك */
  .detail-card {
    background: white;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    padding: 25px;
    margin-bottom: 25px;
  }

  .status-OVERDUE { color: #dc3545; }
  .status-COMPLETED { color: #28a745; }
  .status-IN_PROGRESS { color: #17a2b8; }
  .status-PENDING { color: #ffc107; }

  .priority-HIGH { color: #dc3545; }
  .priority-MEDIUM { color: #ffc107; }
  .priority-LOW { color: #28a745; }

  .attachment-item {
    padding: 10px;
    border: 1px solid #eaeaea;
    border-radius: 8px;
    margin-bottom: 10px;
    transition: all 0.3s;
  }

  .attachment-item:hover {
    background-color: #f8f9fa;
    border-color: #667eea;
  }

  .feedback-box {
    background-color: #f8f9fa;
    border-left: 4px solid #667eea;
    padding: 15px;
    border-radius: 5px;
    margin-top: 15px;
  }
  </style>
</head>

<div class="container-fluid">
  <!-- Breadcrumb -->
  <div class="mb-3">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><g:link controller="dashboard" action="index">Dashboard</g:link></li>
        <li class="breadcrumb-item"><g:link controller="task" action="index">Tasks</g:link></li>
        <li class="breadcrumb-item active">${task.title}</li>
      </ol>
    </nav>
  </div>

  <div class="row">
    <!-- Main Details -->
    <div class="col-lg-8">
      <div class="detail-card">
        <div class="d-flex justify-content-between align-items-start mb-4">
          <div>
            <h2 class="mb-2">${task.title}</h2>
            <p class="text-muted mb-0">
              <i class="fas fa-calendar me-2"></i>
              Due: <g:formatDate date="${task.dueDate}" format="dd MMMM yyyy"/>
            </p>
          </div>
          <div>
            <span class="badge fs-6 p-3 bg-${task.status == 'COMPLETED' ? 'success' :
                    task.status == 'OVERDUE' ? 'danger' :
                            task.status == 'IN_PROGRESS' ? 'info' : 'warning'}">
              ${task.status}
            </span>
          </div>
        </div>

        <hr>

        <div class="mt-4">
          <h5 class="mb-3">Description</h5>
          <p class="text-muted">${task.description ?: 'No description provided.'}</p>
        </div>

        <div class="row mt-4">
          <div class="col-md-6">
            <h6 class="text-muted mb-2">Priority</h6>
            <p class="priority-${task.priority} fw-bold">
              <i class="fas fa-flag"></i>
              ${task.priority ?: 'MEDIUM'}
            </p>
          </div>
          <div class="col-md-6">
            <h6 class="text-muted mb-2">Assigned To</h6>
            <div class="d-flex align-items-center">
              <div class="avatar me-2">
                ${task.intern?.user?.initials ?: 'U'}
              </div>
              <div>
                <p class="mb-0 fw-bold">${task.intern?.user?.fullName ?: 'Unassigned'}</p>
                <small class="text-muted">${task.intern?.studentId ?: ''}</small>
              </div>
            </div>
          </div>
        </div>

      <!-- Feedback Section -->
        <g:if test="${task.feedback}">
          <div class="feedback-box mt-4">
            <h6 class="mb-2">
              <i class="fas fa-comment-dots me-2"></i>
              Feedback
            </h6>
            <p class="mb-0">${task.feedback}</p>
          </div>
        </g:if>
      </div>

      <!-- Attachments -->
      <div class="detail-card">
        <h5 class="mb-3">
          <i class="fas fa-paperclip me-2"></i>
          Attachments
        </h5>
        <g:if test="${attachments}">
          <div class="mt-3">
            <g:each in="${attachments}" var="attachment">
              <div class="attachment-item d-flex justify-content-between align-items-center">
                <div>
                  <i class="${attachment.iconClass} me-2"></i>
                  <span>${attachment.originalFilename}</span>
                  <small class="text-muted ms-2">
                    (${Math.round(attachment.fileSize / 1024)} KB)
                    - <g:formatDate date="${attachment.dateUploaded}" format="dd/MM/yyyy"/>
                  </small>
                </div>
                <a href="${createLink(controller: 'attachment', action: 'download', id: attachment.id)}"
                   class="btn btn-sm btn-outline-primary" target="_blank">
                  <i class="fas fa-download"></i>
                </a>
              </div>
            </g:each>
          </div>
        </g:if>
        <g:else>
          <p class="text-muted text-center py-3 mb-0">No attachments</p>
        </g:else>
      </div>
    </div>

    <!-- Sidebar -->
    <div class="col-lg-4">
      <div class="detail-card">
        <h5 class="mb-3">Actions</h5>
        <div class="d-grid gap-2">
          <g:if test="${canEdit}">
            <g:link controller="task" action="edit" id="${task.id}" class="btn btn-warning">
              <i class="fas fa-edit me-2"></i>
              Edit Task
            </g:link>
          </g:if>
          <g:if test="${canDelete}">
            <g:link controller="task" action="delete" id="${task.id}" class="btn btn-danger"
                    onclick="return confirm('Are you sure you want to delete this task?\n\nThis action cannot be undone!');">
              <i class="fas fa-trash me-2"></i>
              Delete Task
            </g:link>
          </g:if>
          <g:link controller="task" action="index" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left me-2"></i>
            Back to Tasks
          </g:link>
        </div>
      </div>

      <div class="detail-card">
        <h5 class="mb-3">Task Details</h5>
        <table class="table table-sm">
          <tr>
            <td class="text-muted">Task ID:</td>
            <td><strong>#${task.id}</strong></td>
          </tr>
          <tr>
            <td class="text-muted">Status:</td>
            <td>
              <span class="badge bg-${task.status == 'COMPLETED' ? 'success' :
                      task.status == 'OVERDUE' ? 'danger' :
                              task.status == 'IN_PROGRESS' ? 'info' : 'warning'}">
                ${task.status}
              </span>
            </td>
          </tr>
          <tr>
            <td class="text-muted">Priority:</td>
            <td class="priority-${task.priority} fw-bold">${task.priority ?: 'MEDIUM'}</td>
          </tr>
          <tr>
            <td class="text-muted">Due Date:</td>
            <td><g:formatDate date="${task.dueDate}" format="dd/MM/yyyy"/></td>
          </tr>
          <tr>
            <td class="text-muted">Assigned To:</td>
            <td>${task.intern?.user?.fullName ?: 'Unassigned'}</td>
          </tr>
        </table>
      </div>

    <!-- Intern Info Card -->
      <g:if test="${task.intern}">
        <div class="detail-card">
          <h5 class="mb-3">Intern Information</h5>
          <div class="d-flex align-items-center mb-3">
            <div class="avatar me-3" style="width: 50px; height: 50px; font-size: 1.2rem;">
              ${task.intern.user?.initials ?: 'I'}
            </div>
            <div>
              <h6 class="mb-1">${task.intern.user?.fullName}</h6>
              <small class="text-muted">${task.intern.university}</small>
            </div>
          </div>
          <table class="table table-sm">
            <tr>
              <td class="text-muted">Student ID:</td>
              <td>${task.intern.studentId}</td>
            </tr>
            <tr>
              <td class="text-muted">Major:</td>
              <td>${task.intern.major}</td>
            </tr>
          </table>
        </div>
      </g:if>
    </div>
  </div>
</div>

</html>