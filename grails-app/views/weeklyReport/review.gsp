<!-- grails-app/views/weeklyReport/review.gsp -->

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Review Weekly Report - InternTrack</title>
    <style>
    .report-header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 25px;
        border-radius: 10px;
        margin-bottom: 25px;
    }

    .attachment-card {
        border: 1px solid #eaeaea;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 15px;
        transition: all 0.3s;
    }

    .attachment-card:hover {
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transform: translateY(-2px);
    }

    .file-icon {
        font-size: 2.5rem;
        color: #667eea;
    }

    .preview-container {
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 20px;
        margin-top: 20px;
    }

    .comment-box {
        background-color: #fff3cd;
        border-left: 4px solid #ffc107;
        padding: 15px;
        border-radius: 5px;
        margin-top: 20px;
    }

    .action-buttons {
        position: sticky;
        bottom: 20px;
        background: white;
        padding: 15px;
        border-radius: 10px;
        box-shadow: 0 -5px 20px rgba(0,0,0,0.1);
        margin-top: 30px;
    }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="report-header">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h2 class="mb-2">
                    <i class="fas fa-file-alt me-2"></i>
                    Weekly Report - Week ${report.weekNumber}
                </h2>
                <p class="mb-1">
                    <strong>Intern:</strong> ${report.intern.user.fullName}
                (${report.intern.studentId})
                </p>
                <p class="mb-0">
                    <strong>Submitted:</strong>
                    <g:formatDate date="${report.reportDate}" format="dd MMMM yyyy, HH:mm"/>
                </p>
            </div>
            <div>
                <span class="badge bg-light text-dark p-3">
                    <i class="fas fa-calendar me-2"></i>
                    Week ${report.weekNumber}
                </span>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- المحتوى الرئيسي للتقرير -->
        <div class="col-lg-8">
            <!-- Accomplishments -->
            <div class="card mb-4">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0">
                        <i class="fas fa-check-circle me-2"></i>
                        Accomplishments
                    </h5>
                </div>
                <div class="card-body">
                    <p class="mb-0">${report.accomplishments?.encodeAsRaw()}</p>
                </div>
            </div>

            <!-- Challenges -->
            <div class="card mb-4">
                <div class="card-header bg-warning">
                    <h5 class="mb-0">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        Challenges & Issues
                    </h5>
                </div>
                <div class="card-body">
                    <p class="mb-0">${report.challenges?.encodeAsRaw()}</p>
                </div>
            </div>

            <!-- Next Week Plan -->
            <div class="card mb-4">
                <div class="card-header bg-info text-white">
                    <h5 class="mb-0">
                        <i class="fas fa-tasks me-2"></i>
                        Next Week Plan
                    </h5>
                </div>
                <div class="card-body">
                    <p class="mb-0">${report.nextWeekPlan?.encodeAsRaw()}</p>
                </div>
            </div>

            <!-- Comments Section -->
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-comments me-2"></i>
                        Review Comments
                    </h5>
                </div>
                <div class="card-body">
                    <g:if test="${report.reviewComments}">
                        <div class="comment-box">
                            <p class="mb-2"><strong>Previous Review:</strong></p>
                            <p class="mb-1">${report.reviewComments}</p>
                            <small class="text-muted">
                                Reviewed by ${report.reviewedBy?.user?.fullName} on
                                <g:formatDate date="${report.reviewedDate}" format="dd/MM/yyyy HH:mm"/>
                            </small>
                        </div>
                    </g:if>

                    <div class="mt-3">
                        <label class="form-label fw-bold">Add Comments:</label>
                        <textarea id="reviewComments" class="form-control" rows="4"
                                  placeholder="Enter your feedback, suggestions, or review comments..."></textarea>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sidebar - المرفقات وحالة التقرير -->
        <div class="col-lg-4">
            <!-- حالة التقرير -->
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-info-circle me-2"></i>
                        Report Status
                    </h5>
                </div>
                <div class="card-body">
                    <div class="text-center mb-3">
                        <span class="badge fs-6 p-3
                            ${report.status == 'APPROVED' ? 'bg-success' :
                                report.status == 'REJECTED' ? 'bg-danger' : 'bg-warning'}">
                            ${report.status ?: 'PENDING'}
                        </span>
                    </div>

                    <div class="d-grid gap-2">
                        <button onclick="updateStatus('APPROVED')" class="btn btn-success btn-lg">
                            <i class="fas fa-check me-2"></i>
                            Approve Report
                        </button>
                        <button onclick="updateStatus('REJECTED')" class="btn btn-danger btn-lg">
                            <i class="fas fa-times me-2"></i>
                            Reject Report
                        </button>
                        <button onclick="updateStatus('PENDING')" class="btn btn-warning">
                            <i class="fas fa-clock me-2"></i>
                            Mark as Pending
                        </button>
                    </div>
                </div>
            </div>

            <!-- المرفقات -->
            <div class="card mb-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">
                        <i class="fas fa-paperclip me-2"></i>
                        Attachments
                    </h5>
                    <span class="badge bg-primary">${attachments?.size() ?: 0} files</span>
                </div>
                <div class="card-body">
                    <g:if test="${attachments}">
                        <div class="list-group">
                            <g:each in="${attachments}" var="attachment">
                                <div class="attachment-card">
                                    <div class="d-flex align-items-center">
                                        <div class="file-icon me-3">
                                            <g:if test="${attachment.fileName?.toLowerCase()?.endsWith('.pdf')}">
                                                <i class="fas fa-file-pdf text-danger"></i>
                                            </g:if>
                                            <g:elseif test="${attachment.fileName?.toLowerCase()?.endsWith('.jpg') ||
                                                    attachment.fileName?.toLowerCase()?.endsWith('.png')}">
                                                <i class="fas fa-file-image text-primary"></i>
                                            </g:elseif>
                                            <g:else>
                                                <i class="fas fa-file-alt text-secondary"></i>
                                            </g:else>
                                        </div>
                                        <div class="flex-grow-1">
                                            <h6 class="mb-1">${attachment.fileName}</h6>
                                            <small class="text-muted">
                                                ${attachment.fileSize} bytes •
                                                <g:formatDate date="${attachment.dateCreated}" format="dd/MM/yyyy"/>
                                            </small>
                                        </div>
                                        <div class="ms-2">
                                            <a href="${createLink(controller: 'attachment', action: 'download', id: attachment.id)}"
                                               class="btn btn-sm btn-outline-primary" target="_blank">
                                                <i class="fas fa-download"></i>
                                            </a>
                                            <button onclick="previewAttachment('${attachment.id}')"
                                                    class="btn btn-sm btn-outline-info"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#previewModal">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                        </div>
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

            <!-- معلومات إضافية -->
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">
                        <i class="fas fa-chart-simple me-2"></i>
                        Intern Progress
                    </h5>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label class="small text-muted">Reports Completed</label>
                        <div class="progress" style="height: 10px;">
                            <div class="progress-bar bg-success" style="width: 75%"></div>
                        </div>
                        <small>6/8 reports submitted</small>
                    </div>
                    <div>
                        <label class="small text-muted">Tasks Completion</label>
                        <div class="progress" style="height: 10px;">
                            <div class="progress-bar bg-info" style="width: 60%"></div>
                        </div>
                        <small>12/20 tasks completed</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal for Preview -->
    <div class="modal fade" id="previewModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">File Preview</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div id="previewContent" class="text-center">
                        <p>Loading preview...</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function updateStatus(status) {
        let comments = $('#reviewComments').val();
        if (!confirm('Are you sure you want to ' + status.toLowerCase() + ' this report?')) {
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
                    alert('Report ' + status.toLowerCase() + ' successfully!');
                    location.reload();
                } else {
                    alert('Error: ' + response.message);
                }
            },
            error: function() {
                alert('An error occurred while updating the report');
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
        // Auto-save comments every 30 seconds
        let autoSaveTimer;
        $('#reviewComments').on('input', function() {
            clearTimeout(autoSaveTimer);
            autoSaveTimer = setTimeout(function() {
                localStorage.setItem('report_${report.id}_comments', $('#reviewComments').val());
            }, 30000);
        });

        // Load saved comments
        let savedComments = localStorage.getItem('report_${report.id}_comments');
        if (savedComments) {
            $('#reviewComments').val(savedComments);
        }
    });
</script>
</body>
</html>