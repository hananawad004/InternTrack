<%--
  Created by IntelliJ IDEA.
  User: Eng.Hanan Awad
  Date: 2/12/2026
  Time: 11:40 AM
--%>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <meta name="active-tasks" content="true"/>
    <title>Create Task - InternTrack</title>
</head>

<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="h3 mb-0">
                <i class="fas fa-plus-circle me-2 text-primary"></i>
                Create New Task
            </h1>
            <p class="text-muted mb-0">Assign a new task to an intern</p>
        </div>
        <div>
            <g:link controller="task" action="index" class="btn btn-outline-secondary">
                <i class="fas fa-arrow-left me-2"></i>
                Back to Tasks
            </g:link>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <g:form controller="task" action="save" method="POST" class="needs-validation" enctype="multipart/form-data">
                <div class="row">
                    <div class="col-md-8">
                        <!-- Title -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Task Title <span class="text-danger">*</span></label>
                            <input type="text" name="title" class="form-control" required
                                   placeholder="Enter task title">
                        </div>

                        <!-- Description -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Description</label>
                            <textarea name="description" class="form-control" rows="5"
                                      placeholder="Enter task description"></textarea>
                        </div>

                        <div class="row">
                            <!-- Due Date -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Due Date <span class="text-danger">*</span></label>
                                <input type="date" name="dueDate" class="form-control" required
                                       value="${new Date()}">
                            </div>

                            <!-- Priority -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-bold">Priority</label>
                                <select name="priority" class="form-select">
                                    <option value="HIGH">High</option>
                                    <option value="MEDIUM" selected>Medium</option>
                                    <option value="LOW">Low</option>
                                </select>
                            </div>
                        </div>

                        <!-- Assign To -->
%{--                        <div class="mb-3">--}%
%{--                            <label class="form-label fw-bold">Assign To <span class="text-danger">*</span></label>--}%
%{--                            <select name="intern.id" class="form-select" required>--}%
%{--                                <option value="">Select Intern...</option>--}%
%{--                                <g:each in="${interns}" var="intern">--}%
%{--                                    <option value="${intern.id}">--}%
%{--                                        ${intern.user?.fullName} - ${intern.university}--}%
%{--                                    </option>--}%
%{--                                </g:each>--}%
%{--                            </select>--}%
%{--                        </div>--}%
                        <!-- Assign To -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Assign To <span class="text-danger">*</span></label>
                            <select name="internId" class="form-select" required>  <!-- ✅ غيّر من intern.id إلى internId -->
                                <option value="">Select Intern...</option>
                                <g:each in="${interns}" var="intern">
                                    <option value="${intern.id}">
                                        ${intern.user?.fullName} - ${intern.university}
                                    </option>
                                </g:each>
                            </select>
                        </div>

                        <!-- Attachments -->
                        <div class="mb-3">
                            <label class="form-label fw-bold">Attachments</label>
                            <input type="file" name="attachments" class="form-control" multiple>
                            <small class="text-muted">Allowed: PDF, Images, Word, Excel (Max 10MB)</small>
                        </div>
                    </div>
                </div>

                <hr>

                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-primary px-4">
                        <i class="fas fa-save me-2"></i>
                        Create Task
                    </button>
                    <g:link controller="task" action="index" class="btn btn-outline-secondary">
                        Cancel
                    </g:link>
                </div>
            </g:form>
        </div>
    </div>
</div>

</html>