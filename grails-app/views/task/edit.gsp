<%--
  Created by IntelliJ IDEA.
  User: Eng.Hanan Awad
  Date: 2/12/2026
  Time: 11:51 AM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <meta name="active-tasks" content="true"/>
    <title>Edit Task - ${task.title} - InternTrack</title>

    <style>
    .form-card {
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        padding: 25px;
        margin-bottom: 25px;
    }

    .form-label {
        font-weight: 600;
        color: #495057;
        margin-bottom: 8px;
        font-size: 0.95rem;
    }

    .form-control, .form-select {
        border: 1.5px solid #e0e0e0;
        border-radius: 8px;
        padding: 10px 15px;
        transition: all 0.3s;
    }

    .form-control:focus, .form-select:focus {
        border-color: #667eea;
        box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.1);
    }

    .required-field::after {
        content: " *";
        color: #dc3545;
        font-weight: bold;
    }

    .btn-primary {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border: none;
        padding: 12px 30px;
        font-weight: 600;
        border-radius: 8px;
        transition: all 0.3s;
    }

    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
    }

    .btn-secondary {
        background: #6c757d;
        border: none;
        padding: 12px 30px;
        font-weight: 600;
        border-radius: 8px;
    }

    .btn-danger {
        background: #dc3545;
        border: none;
        padding: 12px 30px;
        font-weight: 600;
        border-radius: 8px;
    }

    .avatar-sm {
        width: 32px;
        height: 32px;
        border-radius: 50%;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        font-size: 14px;
    }

    .status-badge {
        display: inline-block;
        padding: 5px 12px;
        border-radius: 20px;
        font-size: 0.85rem;
        font-weight: 600;
    }

    .status-PENDING { background-color: #ffc107; color: #212529; }
    .status-IN_PROGRESS { background-color: #17a2b8; color: white; }
    .status-COMPLETED { background-color: #28a745; color: white; }
    .status-OVERDUE { background-color: #dc3545; color: white; }

    .attachment-item {
        padding: 10px;
        border: 1px solid #eaeaea;
        border-radius: 8px;
        margin-bottom: 10px;
        transition: all 0.3s;
        background: #f8f9fa;
    }

    .attachment-item:hover {
        background-color: #fff;
        border-color: #667eea;
    }

    .file-info {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .file-icon {
        font-size: 24px;
        color: #667eea;
    }
    </style>
</head>


<div class="container-fluid">
    <!-- Breadcrumb -->
    <div class="mb-4">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <g:link controller="dashboard" action="index">
                        <i class="fas fa-home me-1"></i>Dashboard
                    </g:link>
                </li>
                <li class="breadcrumb-item">
                    <g:link controller="task" action="index">
                        <i class="fas fa-tasks me-1"></i>Tasks
                    </g:link>
                </li>
                <li class="breadcrumb-item">
                    <g:link controller="task" action="show" id="${task.id}">
                        ${task.title}
                    </g:link>
                </li>
                <li class="breadcrumb-item active">Edit</li>
            </ol>
        </nav>
    </div>

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="h3 mb-0">
                <i class="fas fa-edit me-2 text-primary"></i>
                Edit Task
            </h1>
            <p class="text-muted mb-0">Update task information</p>
        </div>
        <div>
            <span class="status-badge status-${task.status}">
                ${task.status}
            </span>
        </div>
    </div>

<!-- Edit Form -->
    <g:form controller="task" action="update" id="${task.id}" method="POST" enctype="multipart/form-data">
        <div class="row">
            <!-- Main Form Column -->
            <div class="col-lg-8">
                <!-- Basic Information Card -->
                <div class="form-card">
                    <h5 class="mb-4">
                        <i class="fas fa-info-circle me-2 text-primary"></i>
                        Basic Information
                    </h5>

                    <!-- Title -->
                    <div class="mb-4">
                        <label class="form-label required-field">Task Title</label>
                        <g:textField name="title" value="${task.title}"
                                     class="form-control ${hasErrors(bean: task, field: 'title', 'is-invalid')}"
                                     placeholder="Enter task title" required="true"/>
                        <g:hasErrors bean="${task}" field="title">
                            <div class="invalid-feedback">
                                <g:eachError bean="${task}" field="title">
                                    <g:message error="${it}"/>
                                </g:eachError>
                            </div>
                        </g:hasErrors>
                    </div>

                    <!-- Description -->
                    <div class="mb-4">
                        <label class="form-label required-field">Description</label>
                        <g:textArea name="description" value="${task.description}"
                                    rows="5"
                                    class="form-control ${hasErrors(bean: task, field: 'description', 'is-invalid')}"
                                    placeholder="Enter detailed task description" required="true"/>
                        <small class="text-muted">Maximum 5000 characters</small>
                        <g:hasErrors bean="${task}" field="description">
                            <div class="invalid-feedback">
                                <g:eachError bean="${task}" field="description">
                                    <g:message error="${it}"/>
                                </g:eachError>
                            </div>
                        </g:hasErrors>
                    </div>

                    <!-- Due Date and Priority Row -->
                    <!-- Due Date and Priority Row - المعدل -->
            <div class="row">
                <div class="col-md-6 mb-4">
                    <label class="form-label required-field">Due Date</label>
                    <!-- استخدم input type="date" بدل datePicker -->
                    <input type="date"
                           name="dueDate"
                           value="<g:formatDate date="${task.dueDate}" format="yyyy-MM-dd"/>"
                           class="form-control"
                           required="true"/>
                    <small class="text-muted">Select due date</small>
                </div>
                <div class="col-md-6 mb-4">
                    <label class="form-label required-field">Priority</label>
                    <g:select name="priority"
                              from="${priorityList}"
                              value="${task.priority}"
                              class="form-select"/>
                </div>
            </div>

                <!-- Status (for Admin/Supervisor only) -->
                    <g:if test="${session.role in ['ROLE_ADMIN', 'ROLE_SUPERVISOR']}">
                        <div class="mb-4">
                            <label class="form-label">Status</label>
                            <g:select name="status"
                                      from="${statusList}"
                                      value="${task.status}"
                                      class="form-select"/>
                        </div>
                    </g:if>
                </div>

            <!-- Assignment Information Card (ظهر بس للمشرف والأدمن) -->
                <g:if test="${session.role in ['ROLE_ADMIN', 'ROLE_SUPERVISOR']}">
                    <div class="form-card">
                        <h5 class="mb-4">
                            <i class="fas fa-user me-2 text-primary"></i>
                            Assignment
                        </h5>

                        <!-- Assigned Intern -->
                        <div class="mb-4">
                            <label class="form-label required-field">Assigned To</label>
                            <g:select name="internId"
                                      from="${interns}"
                                      value="${task.intern?.id}"
                                      optionKey="id"
                                      optionValue="${{ it.user?.fullName + ' - ' + it.studentId }}"
                                      class="form-select"
                                      noSelection="['': '-- Select Intern --']"/>
                            <small class="text-muted">Select the intern this task is assigned to</small>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <!-- Hidden field للمتدرب عشان ما يغير assignment -->
                    <g:hiddenField name="internId" value="${task.intern?.id}"/>
                </g:else>

            <!-- Attachments Card -->
                <div class="form-card">
                    <h5 class="mb-4">
                        <i class="fas fa-paperclip me-2 text-primary"></i>
                        Attachments
                    </h5>

                <!-- Current Attachments -->
                    <g:if test="${task.attachments}">
                        <label class="form-label mb-3">Current Attachments</label>
                        <div class="mb-4">
                            <g:each in="${task.attachments}" var="attachment">
                                <div class="attachment-item d-flex justify-content-between align-items-center">
                                    <div class="file-info">
                                        <i class="fas fa-file-alt file-icon"></i>
                                        <div>
                                            <div class="fw-bold">${attachment.originalFilename}</div>
                                            <small class="text-muted">
                                                Uploaded: <g:formatDate date="${attachment.dateUploaded}" format="dd/MM/yyyy HH:mm"/>
                                                (${Math.round(attachment.fileSize / 1024)} KB)
                                            </small>
                                        </div>
                                    </div>
                                    <a href="${createLink(controller: 'attachment', action: 'download', id: attachment.id)}"
                                       class="btn btn-sm btn-outline-primary" target="_blank">
                                        <i class="fas fa-download"></i>
                                    </a>
                                </div>
                            </g:each>
                        </div>
                    </g:if>

                <!-- Upload New Attachments -->
                    <div>
                        <label class="form-label">Add New Attachments</label>
                        <div class="mb-3">
                            <input type="file" name="attachments" multiple
                                   class="form-control" accept=".pdf,.doc,.docx,.jpg,.jpeg,.png,.zip"/>
                            <small class="text-muted">
                                Allowed types: PDF, DOC, DOCX, JPG, PNG, ZIP (Max size: 10MB)
                            </small>
                        </div>

                        <!-- Preview selected files (اختياري) -->
                        <div id="filePreview" class="mt-2" style="display: none;">
                            <label class="form-label">Selected Files:</label>
                            <div id="fileList" class="small"></div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Sidebar Column -->
            <div class="col-lg-4">
                <!-- Task Info Card -->
                <div class="form-card">
                    <h5 class="mb-3">
                        <i class="fas fa-clock me-2 text-primary"></i>
                        Task Information
                    </h5>
                    <table class="table table-sm">
                        <tr>
                            <td class="text-muted">Task ID:</td>
                            <td><strong>#${task.id}</strong></td>
                        </tr>
                        <tr>
                            <td class="text-muted">Created:</td>
                            <td><g:formatDate date="${task.assignedDate}" format="dd/MM/yyyy"/></td>
                        </tr>
                        <tr>
                            <td class="text-muted">Current Status:</td>
                            <td>
                                <span class="status-badge status-${task.status}">
                                    ${task.status}
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-muted">Assigned To:</td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="avatar-sm me-2">
                                        ${task.intern?.user?.initials ?: 'U'}
                                    </div>
                                    <span>${task.intern?.user?.fullName ?: 'Unassigned'}</span>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>

                <!-- Action Buttons Card -->
                <div class="form-card">
                    <h5 class="mb-3">
                        <i class="fas fa-cog me-2 text-primary"></i>
                        Actions
                    </h5>

                    <!-- Update Button -->
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save me-2"></i>
                            Update Task
                        </button>

                    <!-- Cancel Button -->
                        <g:link controller="task" action="show" id="${task.id}"
                                class="btn btn-secondary">
                            <i class="fas fa-times me-2"></i>
                            Cancel
                        </g:link>
                    </div>
                </div>

            <!-- Status Update Card (Quick Status Change) -->
                <g:if test="${session.role in ['ROLE_ADMIN', 'ROLE_SUPERVISOR']}">
                    <div class="form-card">
                        <h5 class="mb-3">
                            <i class="fas fa-sync-alt me-2 text-primary"></i>
                            Quick Status Update
                        </h5>
                        <div class="d-grid gap-2">
                            <g:each in="${['PENDING', 'IN_PROGRESS', 'COMPLETED']}" var="statusOption">
                                <g:if test="${statusOption != task.status}">
                                    <g:link controller="task" action="updateStatus" id="${task.id}"
                                            params="[status: statusOption]"
                                            class="btn btn-outline-${statusOption == 'COMPLETED' ? 'success' : statusOption == 'IN_PROGRESS' ? 'info' : 'warning'}"
                                            onclick="return confirm('Change status to ${statusOption}?');">
                                        <i class="fas fa-arrow-right me-2"></i>
                                        Mark as ${statusOption}
                                    </g:link>
                                </g:if>
                            </g:each>
                        </div>
                    </div>
                </g:if>
            </div>
        </div>
    </g:form>
</div>

<!-- JavaScript for file preview -->
<script>
    document.querySelector('input[name="attachments"]').addEventListener('change', function(e) {
        var preview = document.getElementById('filePreview');
        var fileList = document.getElementById('fileList');
        var files = e.target.files;

        if (files.length > 0) {
            var html = '<ul class="list-unstyled mb-0">';
            for (var i = 0; i < files.length; i++) {
                html += '<li><i class="fas fa-file me-2 text-primary"></i>' +
                    files[i].name + ' (' + Math.round(files[i].size / 1024) + ' KB)</li>';
            }
            html += '</ul>';
            fileList.innerHTML = html;
            preview.style.display = 'block';
        } else {
            preview.style.display = 'none';
        }
    });
</script>


</html>