<!-- grails-app/views/weeklyReport/reviewReport.gsp -->
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Review Weekly Report - Week ${report.weekNumber} - InternTrack</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
    body {
        background-color: #f8f9fa;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        padding: 20px 0;
    }

    .report-header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 25px;
        border-radius: 10px;
        margin-bottom: 25px;
    }

    .section-card {
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        margin-bottom: 25px;
        border: none;
    }

    .section-header {
        padding: 15px 20px;
        border-bottom: 1px solid #eaeaea;
        font-weight: 600;
    }

    .section-body {
        padding: 20px;
    }

    .attachment-item {
        display: flex;
        align-items: center;
        padding: 12px;
        border: 1px solid #eaeaea;
        border-radius: 8px;
        margin-bottom: 10px;
        transition: all 0.3s;
    }

    .attachment-item:hover {
        background-color: #f8f9fa;
        border-color: #667eea;
    }

    .file-icon {
        font-size: 24px;
        width: 40px;
        text-align: center;
    }

    .status-badge {
        padding: 8px 16px;
        border-radius: 20px;
        font-weight: 600;
        display: inline-block;
    }

    .status-SUBMITTED { background-color: #ffc107; color: #212529; }
    .status-UNDER_REVIEW { background-color: #17a2b8; color: white; }
    .status-APPROVED { background-color: #28a745; color: white; }
    .status-REJECTED { background-color: #dc3545; color: white; }

    .comment-box {
        background-color: #f8f9fa;
        border-left: 4px solid #667eea;
        padding: 15px;
        border-radius: 5px;
        margin-bottom: 15px;
    }

    .action-buttons {
        position: sticky;
        bottom: 20px;
        background: white;
        padding: 15px;
        border-radius: 10px;
        box-shadow: 0 -5px 20px rgba(0,0,0,0.1);
        margin-top: 30px;
        border: 1px solid #eaeaea;
    }

    .intern-info {
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 20px;
    }
    </style>
</head>
<body>
<div class="container-fluid">
    <!-- Breadcrumb -->
    <div class="mb-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><g:link controller="dashboard" action="supervisor">Dashboard</g:link></li>
                <li class="breadcrumb-item"><g:link controller="weeklyReport" action="review">Pending Reports</g:link></li>
                <li class="breadcrumb-item active">Week ${report.weekNumber} - ${report.intern.user.fullName}</li>
            </ol>
        </nav>
    </div>

    <!-- Report Header -->
    <div class="report-header">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h2 class="mb-2">
                    <i class="fas fa-file-alt me-2"></i>
                    Weekly Report - Week ${report.weekNumber}
                </h2>
                <div class="d-flex align-items-center">
                    <div class="avatar me-3">
                        ${report.intern.user.initials ?: 'U'}
                    </div>
                    <div>
                        <h5 class="mb-1">${report.intern.user.fullName}</h5>
                        <p class="mb-0 opacity-75">${report.intern.university} • ${report.intern.major}</p>
                    </div>
                </div>
            </div>
            <div class="text-end">
                <span class="status-badge status-${report.status} mb-2 d-inline-block">
                    ${report.status}
                </span>
                <div class="text-white-50 small">
                    Submitted: <g:formatDate date="${report.reportDate}" format="dd MMM yyyy, HH:mm"/>
                </div>
                <g:if test="${report.reviewedDate}">
                    <div class="text-white-50 small">
                        Reviewed: <g:formatDate date="${report.reviewedDate}" format="dd MMM yyyy, HH:mm"/>
                    </div>
                </g:if>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Main Content -->
        <div class="col-lg-8">
            <!-- Accomplishments -->
            <div class="section-card">
                <div class="section-header" style="border-left: 4px solid #28a745;">
                    <h5 class="mb-0">
                        <i class="fas fa-check-circle text-success me-2"></i>
                        Accomplishments
                    </h5>
                </div>
                <div class="section-body">
                    <p class="mb-0">${report.accomplishments?.encodeAsHTML()?.replace('\n', '<br>')}</p>
                    <div class="mt-2 text-muted small">
                        <i class="fas fa-clock me-1"></i> Hours worked: ${report.hoursWorked ?: 0} hours
                    </div>
                </div>
            </div>

        <!-- Challenges -->
            <g:if test="${report.challenges}">
                <div class="section-card">
                    <div class="section-header" style="border-left: 4px solid #dc3545;">
                        <h5 class="mb-0">
                            <i class="fas fa-exclamation-triangle text-danger me-2"></i>
                            Challenges & Issues
                        </h5>
                    </div>
                    <div class="section-body">
                        <p class="mb-0">${report.challenges?.encodeAsHTML()?.replace('\n', '<br>')}</p>
                    </div>
                </div>
            </g:if>

        <!-- Lessons Learned -->
            <g:if test="${report.lessonsLearned}">
                <div class="section-card">
                    <div class="section-header" style="border-left: 4px solid #17a2b8;">
                        <h5 class="mb-0">
                            <i class="fas fa-graduation-cap text-info me-2"></i>
                            Lessons Learned
                        </h5>
                    </div>
                    <div class="section-body">
                        <p class="mb-0">${report.lessonsLearned?.encodeAsHTML()?.replace('\n', '<br>')}</p>
                    </div>
                </div>
            </g:if>

        <!-- Next Week Plan -->
            <g:if test="${report.plansForNextWeek}">
                <div class="section-card">
                    <div class="section-header" style="border-left: 4px solid #ffc107;">
                        <h5 class="mb-0">
                            <i class="fas fa-calendar-alt text-warning me-2"></i>
                            Plans for Next Week
                        </h5>
                    </div>
                    <div class="section-body">
                        <p class="mb-0">${report.plansForNextWeek?.encodeAsHTML()?.replace('\n', '<br>')}</p>
                    </div>
                </div>
            </g:if>

        <!-- Previous Review Comments -->
            <g:if test="${report.supervisorComments}">
                <div class="section-card">
                    <div class="section-header" style="border-left: 4px solid #6c757d;">
                        <h5 class="mb-0">
                            <i class="fas fa-comment-dots text-secondary me-2"></i>
                            Previous Review Comments
                        </h5>
                    </div>
                    <div class="section-body">
                        <div class="comment-box">
                            <p class="mb-2">${report.supervisorComments?.encodeAsHTML()?.replace('\n', '<br>')}</p>
                            <small class="text-muted">
                                Reviewed on <g:formatDate date="${report.reviewedDate ?: report.lastUpdated}" format="dd MMM yyyy HH:mm"/>
                            </small>
                        </div>
                    </div>
                </div>
            </g:if>

        <!-- Review Form -->
            <div class="section-card">
                <div class="section-header" style="border-left: 4px solid #667eea;">
                    <h5 class="mb-0">
                        <i class="fas fa-check-double me-2"></i>
                        Review Report
                    </h5>
                </div>
                <div class="section-body">
                    <div class="mb-3">
                        <label for="comments" class="form-label fw-bold">Supervisor Comments</label>
                        <textarea id="comments" name="comments" class="form-control" rows="4"
                                  placeholder="Enter your feedback, suggestions, or review comments...">${report.supervisorComments}</textarea>
                    </div>

                    <div class="action-buttons">
                        <div class="row g-2">
                            <div class="col-md-4">
                                <button onclick="updateReportStatus('APPROVED')" class="btn btn-success w-100 py-3">
                                    <i class="fas fa-check-circle me-2"></i>
                                    Approve Report
                                </button>
                            </div>
                            <div class="col-md-4">
                                <button onclick="updateReportStatus('REJECTED')" class="btn btn-danger w-100 py-3">
                                    <i class="fas fa-times-circle me-2"></i>
                                    Reject Report
                                </button>
                            </div>
                            <div class="col-md-4">
                                <button onclick="updateReportStatus('UNDER_REVIEW')" class="btn btn-warning w-100 py-3">
                                    <i class="fas fa-clock me-2"></i>
                                    Mark as Under Review
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">
            <!-- Intern Info -->
            <div class="section-card">
                <div class="section-header">
                    <h5 class="mb-0">
                        <i class="fas fa-user me-2"></i>
                        Intern Information
                    </h5>
                </div>
                <div class="section-body">
                    <div class="intern-info">
                        <div class="d-flex align-items-center mb-3">
                            <div class="avatar avatar-lg me-3" style="width: 60px; height: 60px; font-size: 24px;">
                                ${report.intern.user.initials ?: 'U'}
                            </div>
                            <div>
                                <h6 class="mb-1">${report.intern.user.fullName}</h6>
                                <div class="small text-muted">${report.intern.studentId}</div>
                            </div>
                        </div>
                        <table class="table table-sm table-borderless">
                            <tr>
                                <td class="text-muted">University:</td>
                                <td class="fw-bold">${report.intern.university}</td>
                            </tr>
                            <tr>
                                <td class="text-muted">Major:</td>
                                <td>${report.intern.major}</td>
                            </tr>
                            <tr>
                                <td class="text-muted">Year:</td>
                                <td>${report.intern.yearOfStudy}</td>
                            </tr>
                            <tr>
                                <td class="text-muted">Internship Period:</td>
                                <td><g:formatDate date="${report.intern.startDate}" format="dd/MM/yyyy"/> - <g:formatDate date="${report.intern.endDate}" format="dd/MM/yyyy"/></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Attachments -->
            <div class="section-card">
                <div class="section-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">
                        <i class="fas fa-paperclip me-2"></i>
                        Attachments
                    </h5>
                    <span class="badge bg-primary">${attachments?.size() ?: 0} files</span>
                </div>
                <div class="section-body">
                    <g:if test="${attachments}">
                        <div id="attachmentList">
                            <g:each in="${attachments}" var="attachment">
                                <div class="attachment-item" id="attachment-${attachment.id}">
                                    <div class="file-icon me-3">
                                        <i class="${attachment.iconClass} fa-lg" style="color: #667eea;"></i>
                                    </div>
                                    <div class="flex-grow-1">
                                        <div class="fw-bold small">${attachment.originalFilename}</div>
                                        <div class="small text-muted">
                                            <g:formatDate date="${attachment.dateUploaded}" format="dd/MM/yyyy HH:mm"/>
                                            (${Math.round(attachment.fileSize / 1024)} KB)
                                        </div>
                                    </div>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-primary" onclick="previewAttachment(${attachment.id})" data-bs-toggle="modal" data-bs-target="#previewModal">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <a href="${createLink(controller: 'attachment', action: 'download', id: attachment.id)}" class="btn btn-sm btn-outline-success" target="_blank">
                                            <i class="fas fa-download"></i>
                                        </a>
                                    </div>
                                </div>
                            </g:each>
                        </div>
                    </g:if>
                    <g:else>
                        <div class="text-center py-4">
                            <i class="fas fa-paperclip fa-3x text-muted mb-3"></i>
                            <p class="text-muted mb-0">No attachments found</p>
                        </div>
                    </g:else>
                </div>
            </div>

            <!-- Quick Stats -->
            <div class="section-card">
                <div class="section-header">
                    <h5 class="mb-0">
                        <i class="fas fa-chart-pie me-2"></i>
                        Report Stats
                    </h5>
                </div>
                <div class="section-body">
                    <table class="table table-sm">
                        <tr>
                            <td class="text-muted">Week Period:</td>
                            <td class="fw-bold">
                                <g:formatDate date="${report.weekStartDate}" format="dd/MM"/> -
                                <g:formatDate date="${report.weekEndDate}" format="dd/MM/yyyy"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-muted">Hours Worked:</td>
                            <td><span class="badge bg-info">${report.hoursWorked ?: 0} hours</span></td>
                        </tr>
                        <tr>
                            <td class="text-muted">Status:</td>
                            <td><span class="status-badge status-${report.status} py-1 px-3">${report.status}</span></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Preview Modal -->
<div class="modal fade" id="previewModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">File Preview</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body text-center" id="previewContent">
                <div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function updateReportStatus(status) {
        let comments = $('#comments').val();

        let statusMessages = {
            'APPROVED': 'approve',
            'REJECTED': 'reject',
            'UNDER_REVIEW': 'mark as under review'
        };

        if (!confirm(`Are you sure you want to ${statusMessages[status]} this report?`)) {
            return;
        }

        $.ajax({
            url: '${createLink(controller: "weeklyReport", action: "updateStatus")}',
            type: 'POST',
            data: {
                id: ${report.id},
                status: status,
                comments: comments
            },
            success: function(response) {
                if (response.success) {
                    alert('Report ' + statusMessages[status] + 'd successfully!');
                    location.reload();
                } else {
                    alert('Error: ' + response.message);
                }
            },
            error: function(xhr, status, error) {
                alert('An error occurred: ' + error);
            }
        });
    }

    function previewAttachment(attachmentId) {
        $('#previewContent').html('<div class="spinner-border text-primary" role="status"></div><p class="mt-2">Loading preview...</p>');

        $.ajax({
            url: '${createLink(controller: "attachment", action: "preview")}/' + attachmentId,
            type: 'GET',
            success: function(data) {
                $('#previewContent').html(data);
            },
            error: function() {
                $('#previewContent').html('<p class="text-danger">Failed to load preview</p>');
            }
        });
    }

    $(document).ready(function() {
        // Auto-save comments
        let autoSaveTimer;
        $('#comments').on('input', function() {
            clearTimeout(autoSaveTimer);
            autoSaveTimer = setTimeout(function() {
                localStorage.setItem('report_${report.id}_comments', $('#comments').val());
            }, 30000);
        });

        // Load saved comments
        let savedComments = localStorage.getItem('report_${report.id}_comments');
        if (savedComments && !$('#comments').val()) {
            $('#comments').val(savedComments);
        }
    });
</script>
</body>
</html>