<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>View Weekly Report - InternTrack</title>
    <style>
    .detail-card {
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        padding: 25px;
        margin-bottom: 25px;
        border: 1px solid #e2e8f0;
    }
    .status-badge {
        padding: 8px 16px;
        border-radius: 30px;
        font-size: 14px;
        font-weight: 600;
    }
    .status-SUBMITTED { background-color: #ffc107; color: #212529; }
    .status-UNDER_REVIEW { background-color: #17a2b8; color: white; }
    .status-APPROVED { background-color: #28a745; color: white; }
    .status-REJECTED { background-color: #dc3545; color: white; }
    .info-label {
        font-weight: 600;
        color: #4a5568;
        font-size: 14px;
        margin-bottom: 5px;
    }
    .info-value {
        background: #f8fafc;
        padding: 15px;
        border-radius: 8px;
        border-left: 4px solid #4f46e5;
        margin-bottom: 20px;
        white-space: pre-wrap;
    }
    .attachment-item {
        display: flex;
        align-items: center;
        padding: 12px;
        border: 1px solid #e2e8f0;
        border-radius: 8px;
        margin-bottom: 10px;
        transition: all 0.3s;
    }
    .attachment-item:hover {
        background: #f8fafc;
        border-color: #4f46e5;
    }
    </style>
</head>

<div class="container-fluid mt-4">
    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2>
                <i class="fas fa-file-alt me-2 text-primary"></i>
                Weekly Report - Week ${report?.weekNumber}
            </h2>
            <p class="text-muted">
                Submitted on <g:formatDate date="${report?.reportDate}" format="dd MMMM yyyy HH:mm"/>
            </p>
        </div>
        <div>
            <g:link controller="weeklyReport" action="index" class="btn btn-outline-secondary me-2">
                <i class="fas fa-arrow-left me-2"></i>Back to Reports
            </g:link>

            <sec:ifAnyGranted roles="ROLE_INTERN,ROLE_ADMIN">
                <g:if test="${report?.isSubmitted()}">
                    <g:link controller="weeklyReport" action="edit" id="${report?.id}" class="btn btn-warning me-2">
                        <i class="fas fa-edit me-2"></i>Edit
                    </g:link>
                </g:if>
            </sec:ifAnyGranted>

            <sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ADMIN">
                <g:if test="${report?.status == 'SUBMITTED'}">
                    <g:link controller="weeklyReport" action="reviewReport" id="${report?.id}" class="btn btn-success">
                        <i class="fas fa-check-circle me-2"></i>Review
                    </g:link>
                </g:if>
            </sec:ifAnyGranted>
        </div>
    </div>

<!-- Flash Messages -->
    <g:if test="${flash.message}">
        <div class="alert alert-success alert-dismissible fade show">
            <i class="fas fa-check-circle me-2"></i>${flash.message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>

    <g:if test="${flash.error}">
        <div class="alert alert-danger alert-dismissible fade show">
            <i class="fas fa-exclamation-circle me-2"></i>${flash.error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>

<!-- Main Content -->
    <div class="row">
        <!-- Left Column -->
        <div class="col-md-8">
            <!-- Status Card -->
            <div class="detail-card">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="mb-0">
                        <i class="fas fa-info-circle me-2 text-primary"></i>
                        Report Status
                    </h5>
                    <span class="status-badge status-${report?.status}">
                        ${report?.status}
                    </span>
                </div>

                <g:if test="${report?.reviewedDate}">
                    <div class="alert alert-info">
                        <i class="fas fa-calendar-check me-2"></i>
                        Reviewed on <g:formatDate date="${report?.reviewedDate}" format="dd MMMM yyyy HH:mm"/>
                    </div>
                </g:if>

                <g:if test="${report?.supervisorComments}">
                    <div class="mt-3">
                        <div class="info-label">
                            <i class="fas fa-comment me-2 text-primary"></i>Supervisor Comments
                        </div>
                        <div class="info-value">
                            ${report?.supervisorComments}
                        </div>
                    </div>
                </g:if>
            </div>

            <!-- Week Information -->
            <div class="detail-card">
                <h5 class="mb-4">
                    <i class="fas fa-calendar-alt me-2 text-primary"></i>
                    Week Information
                </h5>

                <div class="row">
                    <div class="col-md-4">
                        <div class="info-label">Week Number</div>
                        <p class="mb-3">${report?.weekNumber}</p>
                    </div>
                    <div class="col-md-4">
                        <div class="info-label">Start Date</div>
                        <p class="mb-3"><g:formatDate date="${report?.weekStartDate}" format="dd MMMM yyyy"/></p>
                    </div>
                    <div class="col-md-4">
                        <div class="info-label">End Date</div>
                        <p class="mb-3"><g:formatDate date="${report?.weekEndDate}" format="dd MMMM yyyy"/></p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="info-label">Hours Worked</div>
                        <p class="mb-3">${report?.hoursWorked ?: 0} hours</p>
                    </div>
                    <div class="col-md-4">
                        <div class="info-label">Intern</div>
                        <p class="mb-3">${report?.intern?.user?.fullName}</p>
                    </div>
                    <div class="col-md-4">
                        <div class="info-label">Supervisor</div>
                        <p class="mb-3">${report?.intern?.supervisor?.user?.fullName ?: 'Not Assigned'}</p>
                    </div>
                </div>
            </div>

            <!-- Accomplishments -->
            <div class="detail-card">
                <h5 class="mb-4">
                    <i class="fas fa-check-circle me-2 text-success"></i>
                    Accomplishments
                </h5>
                <div class="info-value">
                    ${report?.accomplishments ?: 'No accomplishments provided'}
                </div>
            </div>

        <!-- Challenges -->
            <g:if test="${report?.challenges}">
                <div class="detail-card">
                    <h5 class="mb-4">
                        <i class="fas fa-exclamation-triangle me-2 text-warning"></i>
                        Challenges Faced
                    </h5>
                    <div class="info-value">
                        ${report?.challenges}
                    </div>
                </div>
            </g:if>

        <!-- Lessons Learned -->
            <g:if test="${report?.lessonsLearned}">
                <div class="detail-card">
                    <h5 class="mb-4">
                        <i class="fas fa-graduation-cap me-2 text-info"></i>
                        Lessons Learned
                    </h5>
                    <div class="info-value">
                        ${report?.lessonsLearned}
                    </div>
                </div>
            </g:if>

        <!-- Plans for Next Week -->
            <g:if test="${report?.plansForNextWeek}">
                <div class="detail-card">
                    <h5 class="mb-4">
                        <i class="fas fa-calendar-week me-2 text-primary"></i>
                        Plans for Next Week
                    </h5>
                    <div class="info-value">
                        ${report?.plansForNextWeek}
                    </div>
                </div>
            </g:if>
        </div>

        <!-- Right Column -->
        <div class="col-md-4">
            <!-- Attachments -->
            <div class="detail-card">
                <h5 class="mb-4">
                    <i class="fas fa-paperclip me-2 text-primary"></i>
                    Attachments (${attachments?.size() ?: 0})
                </h5>

                <g:if test="${attachments}">
                    <div class="attachment-list">
                        <g:each in="${attachments}" var="attachment">
                            <div class="attachment-item">
                                <div class="flex-grow-1">
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-file-alt me-2 text-primary"></i>
                                        <strong>${attachment.fileName}</strong>
                                    </div>
                                    <small class="text-muted d-block mt-1">
                                        <i class="fas fa-clock me-1"></i>
                                        Uploaded: <g:formatDate date="${attachment.dateUploaded}" format="dd MMM yyyy HH:mm"/>
                                        <br>
                                        <i class="fas fa-weight me-1"></i>
                                        ${Math.round(attachment.fileSize / 1024)} KB
                                    </small>
                                </div>
                                <a href="${createLink(controller: 'fileUpload', action: 'download', id: attachment.id)}"
                                   class="btn btn-sm btn-outline-primary ms-3"
                                   target="_blank">
                                    <i class="fas fa-download"></i>
                                </a>
                            </div>
                        </g:each>
                    </div>
                </g:if>
                <g:else>
                    <p class="text-muted text-center py-4">
                        <i class="fas fa-paperclip fa-2x d-block mb-2"></i>
                        No attachments uploaded
                    </p>
                </g:else>
            </div>

            <!-- Quick Actions -->
            <div class="detail-card">
                <h5 class="mb-4">
                    <i class="fas fa-bolt me-2 text-primary"></i>
                    Quick Actions
                </h5>

                <div class="d-grid gap-2">
                    <sec:ifAnyGranted roles="ROLE_INTERN,ROLE_ADMIN">
                        <g:if test="${report?.isSubmitted()}">
                            <g:link controller="weeklyReport" action="edit" id="${report?.id}"
                                    class="btn btn-warning">
                                <i class="fas fa-edit me-2"></i>Edit Report
                            </g:link>
                        </g:if>
                    </sec:ifAnyGranted>

                    <sec:ifAnyGranted roles="ROLE_SUPERVISOR,ROLE_ADMIN">
                        <g:if test="${report?.status == 'SUBMITTED'}">
                            <g:link controller="weeklyReport" action="reviewReport" id="${report?.id}"
                                    class="btn btn-success">
                                <i class="fas fa-check-circle me-2"></i>Review Report
                            </g:link>
                        </g:if>
                    </sec:ifAnyGranted>

                    <sec:ifAnyGranted roles="ROLE_ADMIN">
                        <g:link controller="weeklyReport" action="delete" id="${report?.id}"
                                class="btn btn-danger"
                                onclick="return confirm('Are you sure you want to delete this report?');">
                            <i class="fas fa-trash me-2"></i>Delete Report
                        </g:link>
                    </sec:ifAnyGranted>

                    <button onclick="window.print()" class="btn btn-outline-secondary">
                        <i class="fas fa-print me-2"></i>Print Report
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Optional: Add this if you want to enable print styling -->
<style media="print">
.btn, .alert, .quick-actions, .sidebar {
    display: none !important;
}
.detail-card {
    box-shadow: none !important;
    border: 1px solid #ddd !important;
    break-inside: avoid;
}
</style>

</html>