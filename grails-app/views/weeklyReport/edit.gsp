<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Edit Weekly Report - InternTrack</title>
    <style>
    .form-section {
        background: white;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.08);
        padding: 25px;
        margin-bottom: 25px;
        border: 1px solid #e2e8f0;
    }
    .required:after {
        content: " *";
        color: red;
    }
    .form-label {
        font-weight: 600;
        color: #334155;
        margin-bottom: 8px;
    }
    .form-control:focus, .form-select:focus {
        border-color: #4f46e5;
        box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
    }
    .btn-primary {
        background: linear-gradient(135deg, #4f46e5 0%, #7c3aed 100%);
        border: none;
    }
    .btn-primary:hover {
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
    }
    .attachment-item {
        display: flex;
        align-items: center;
        padding: 12px;
        border: 1px solid #e2e8f0;
        border-radius: 8px;
        margin-bottom: 10px;
        background: #f8fafc;
    }
    .attachment-item:hover {
        background: #f1f5f9;
    }
    </style>
</head>

<div class="container-fluid mt-4">
    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2>
                <i class="fas fa-edit me-2 text-primary"></i>
                Edit Weekly Report - Week ${report?.weekNumber}
            </h2>
            <p class="text-muted">
                <i class="fas fa-calendar me-2"></i>
                <g:formatDate date="${report?.weekStartDate}" format="dd MMMM yyyy"/> -
                <g:formatDate date="${report?.weekEndDate}" format="dd MMMM yyyy"/>
            </p>
        </div>
        <g:link controller="weeklyReport" action="show" id="${report?.id}" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left me-2"></i>Back to Report
        </g:link>
    </div>

<!-- Warning for reviewed reports -->
    <g:if test="${report?.status != 'SUBMITTED'}">
        <div class="alert alert-warning">
            <i class="fas fa-exclamation-triangle me-2"></i>
            This report is ${report?.status?.toLowerCase()} and cannot be edited.
            Please contact your supervisor if you need to make changes.
        </div>
    </g:if>

<!-- Error Messages -->
    <g:if test="${flash.error}">
        <div class="alert alert-danger alert-dismissible fade show">
            <i class="fas fa-exclamation-circle me-2"></i>${flash.error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>

    <g:if test="${flash.message}">
        <div class="alert alert-success alert-dismissible fade show">
            <i class="fas fa-check-circle me-2"></i>${flash.message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>

<!-- Edit Form -->
    <g:if test="${report?.isSubmitted()}">
        <g:uploadForm controller="weeklyReport" action="update" id="${report?.id}"
                      method="POST" class="card p-4 shadow-sm" enctype="multipart/form-data">

            <!-- Read-only Week Information -->
            <div class="form-section">
                <h5 class="mb-3">
                    <i class="fas fa-calendar-alt me-2 text-primary"></i>
                    Week Information
                </h5>
                <div class="row">
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label class="form-label">Week Number</label>
                            <input type="number" class="form-control" value="${report?.weekNumber}" readonly disabled>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label class="form-label">Start Date</label>
                            <input type="text" class="form-control"
                                   value="<g:formatDate date="${report?.weekStartDate}" format="dd MMMM yyyy"/>"
                                   readonly disabled>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="mb-3">
                            <label class="form-label">End Date</label>
                            <input type="text" class="form-control"
                                   value="<g:formatDate date="${report?.weekEndDate}" format="dd MMMM yyyy"/>"
                                   readonly disabled>
                        </div>
                    </div>
                </div>
                <div class="alert alert-info">
                    <i class="fas fa-info-circle me-2"></i>
                    Week information cannot be edited. Please create a new report if the week is incorrect.
                </div>
            </div>

            <!-- Accomplishments -->
            <div class="form-section">
                <h5 class="mb-3">
                    <i class="fas fa-check-circle me-2 text-success"></i>
                    Accomplishments
                </h5>
                <div class="mb-3">
                    <label class="form-label required">What did you accomplish this week?</label>
                    <textarea name="accomplishments" class="form-control" rows="6" required
                              placeholder="List the tasks you completed, skills you learned, and achievements...">${report?.accomplishments}</textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label required">Hours Worked</label>
                    <input type="number" name="hoursWorked" class="form-control" min="0" max="100"
                           value="${report?.hoursWorked ?: 40}" required>
                    <small class="text-muted">Total hours worked this week (0-100 hours)</small>
                </div>
            </div>

            <!-- Challenges & Lessons -->
            <div class="form-section">
                <h5 class="mb-3">
                    <i class="fas fa-exclamation-triangle me-2 text-warning"></i>
                    Challenges & Lessons
                </h5>
                <div class="mb-3">
                    <label class="form-label">Challenges Faced</label>
                    <textarea name="challenges" class="form-control" rows="4"
                              placeholder="What challenges or obstacles did you encounter?">${report?.challenges}</textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Lessons Learned</label>
                    <textarea name="lessonsLearned" class="form-control" rows="4"
                              placeholder="What new skills or knowledge did you gain?">${report?.lessonsLearned}</textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">Plans for Next Week</label>
                    <textarea name="plansForNextWeek" class="form-control" rows="4"
                              placeholder="What do you plan to work on next week?">${report?.plansForNextWeek}</textarea>
                </div>
            </div>

            <!-- Current Attachments -->
            <g:if test="${attachments}">
                <div class="form-section">
                    <h5 class="mb-3">
                        <i class="fas fa-paperclip me-2 text-info"></i>
                        Current Attachments
                    </h5>
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
                                <div>
                                    <a href="${createLink(controller: 'fileUpload', action: 'download', id: attachment.id)}"
                                       class="btn btn-sm btn-outline-primary me-2"
                                       target="_blank">
                                        <i class="fas fa-download"></i>
                                    </a>
                                    <g:link controller="fileUpload" action="delete" id="${attachment.id}"
                                            params="[reportId: report.id, returnAction: 'edit']"
                                            class="btn btn-sm btn-outline-danger"
                                            onclick="return confirm('Are you sure you want to delete this attachment?');">
                                        <i class="fas fa-trash"></i>
                                    </g:link>
                                </div>
                            </div>
                        </g:each>
                    </div>
                </div>
            </g:if>

            <!-- New Attachments -->
            <div class="form-section">
                <h5 class="mb-3">
                    <i class="fas fa-plus-circle me-2 text-success"></i>
                    Add New Attachments
                </h5>
                <div class="mb-3">
                    <label class="form-label">Upload Additional Documents</label>
                    <input type="file" name="attachments" id="attachments" class="form-control" multiple
                           accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">
                    <small class="text-muted">
                        <i class="fas fa-info-circle me-1"></i>
                        Max file size: 5MB. Allowed formats: PDF, DOC, DOCX, JPG, PNG
                    </small>
                </div>
                <div class="mt-2" id="fileList"></div>
            </div>

            <!-- Form Actions -->
            <div class="d-flex justify-content-between mt-4">
                <div>
                    <g:link controller="weeklyReport" action="show" id="${report?.id}" class="btn btn-secondary">
                        <i class="fas fa-times me-2"></i>Cancel
                    </g:link>
                </div>
                <div>
                    <button type="button" class="btn btn-info me-2" onclick="saveDraft()">
                        <i class="fas fa-save me-2"></i>Save Draft
                    </button>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-paper-plane me-2"></i>Update Report
                    </button>
                </div>
            </div>
        </g:uploadForm>
    </g:if>

    <g:else>
        <!-- Show message if report cannot be edited -->
        <div class="text-center py-5">
            <i class="fas fa-lock fa-4x text-muted mb-3"></i>
            <h4 class="text-muted">Report Cannot Be Edited</h4>
            <p class="text-muted mb-4">
                This report is ${report?.status?.toLowerCase()} and cannot be modified.
            </p>
            <g:link controller="weeklyReport" action="show" id="${report?.id}" class="btn btn-primary">
                <i class="fas fa-eye me-2"></i>View Report
            </g:link>
        </div>
    </g:else>
</div>

<!-- JavaScript -->
<script>
    // Preview selected files
    document.getElementById('attachments')?.addEventListener('change', function(event) {
        const fileList = document.getElementById('fileList');
        fileList.innerHTML = '';

        if (this.files.length > 0) {
            const list = document.createElement('ul');
            list.className = 'list-group';

            Array.from(event.target.files).forEach(function(file) {
                const li = document.createElement('li');
                li.className = 'list-group-item d-flex justify-content-between align-items-center';

                const nameSpan = document.createElement('span');
                nameSpan.innerHTML = '<i class="fas fa-file me-2"></i>' + file.name;

                const sizeSpan = document.createElement('span');
                sizeSpan.className = 'badge bg-secondary';
                sizeSpan.innerText = (file.size / 1024).toFixed(1) + ' KB';

                li.appendChild(nameSpan);
                li.appendChild(sizeSpan);
                list.appendChild(li);
            });

            fileList.appendChild(list);
        }
    });

    // Save draft to localStorage
    // Save draft to localStorage
    function saveDraft() {
        const formData = {
            accomplishments: document.querySelector('textarea[name="accomplishments"]')?.value || '',
            challenges: document.querySelector('textarea[name="challenges"]')?.value || '',
            lessonsLearned: document.querySelector('textarea[name="lessonsLearned"]')?.value || '',
            plansForNextWeek: document.querySelector('textarea[name="plansForNextWeek"]')?.value || '',
            hoursWorked: document.querySelector('input[name="hoursWorked"]')?.value || '40',
            reportId: '${report?.id}',
            lastSaved: new Date().toISOString()
        };

        localStorage.setItem('weeklyReportEdit_${report?.id}', JSON.stringify(formData));

        // Show success message
        const alert = document.createElement('div');
        alert.className = 'alert alert-success alert-dismissible fade show position-fixed top-0 end-0 m-3';
        alert.style.zIndex = '9999';

        // استخدام JavaScript Date object بدلاً من Groovy
        const now = new Date();
        const timeString = now.toLocaleTimeString();

        alert.innerHTML = `
        <i class="fas fa-check-circle me-2"></i>
        Draft saved successfully at ${timeString}!
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    `;

        document.body.appendChild(alert);
        setTimeout(() => alert.remove(), 3000);
    }

    // Auto-save every 30 seconds
    let autoSaveTimer;
    const form = document.querySelector('form');
    if (form) {
        form.addEventListener('input', function() {
            clearTimeout(autoSaveTimer);
            autoSaveTimer = setTimeout(saveDraft, 30000);
        });
    }

    // Load draft from localStorage
    document.addEventListener('DOMContentLoaded', function() {
        const saved = localStorage.getItem('weeklyReportEdit_${report?.id}');
        if (saved) {
            try {
                const data = JSON.parse(saved);
                const savedTime = new Date(data.lastSaved);
                const now = new Date();
                const minutesDiff = Math.round((now - savedTime) / 60000);

                // Ask user if they want to load the draft (if it's less than 60 minutes old)
                if (minutesDiff < 60 && confirm(`You have a draft saved from ${minutesDiff} minute(s) ago. Would you like to load it?`)) {
                    document.querySelector('textarea[name="accomplishments"]').value = data.accomplishments || '';
                    document.querySelector('textarea[name="challenges"]').value = data.challenges || '';
                    document.querySelector('textarea[name="lessonsLearned"]').value = data.lessonsLearned || '';
                    document.querySelector('textarea[name="plansForNextWeek"]').value = data.plansForNextWeek || '';
                    document.querySelector('input[name="hoursWorked"]').value = data.hoursWorked || '40';
                }
            } catch (e) {
                console.error('Error loading draft:', e);
            }
        }
    });

    // Confirm before leaving with unsaved changes
    let formChanged = false;
    if (form) {
        form.addEventListener('input', function() {
            formChanged = true;
        });
    }

    window.addEventListener('beforeunload', function(e) {
        if (formChanged) {
            e.preventDefault();
            e.returnValue = 'You have unsaved changes. Are you sure you want to leave?';
        }
    });

    // Character counters
    function setupCharacterCounter(textareaId, maxLength) {
        const textarea = document.getElementById(textareaId);
        if (textarea) {
            const counter = document.createElement('small');
            counter.className = 'text-muted float-end';
            counter.id = textareaId + 'Counter';
            textarea.parentNode.appendChild(counter);

            function updateCounter() {
                const remaining = maxLength - textarea.value.length;
                counter.textContent = remaining + ' characters remaining';
                if (remaining < 0) {
                    counter.style.color = 'red';
                } else {
                    counter.style.color = '';
                }
            }

            textarea.addEventListener('input', updateCounter);
            updateCounter();
        }
    }

    // Setup character counters (optional - adjust max lengths as needed)
    setupCharacterCounter('accomplishments', 2000);
    setupCharacterCounter('challenges', 1000);
    setupCharacterCounter('lessonsLearned', 1000);
    setupCharacterCounter('plansForNextWeek', 1000);
</script>

<!-- CSS for validation -->
<style>
.was-validated .form-control:invalid {
    border-color: #dc3545;
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 12' width='12' height='12' fill='none' stroke='%23dc3545'%3e%3ccircle cx='6' cy='6' r='4.5'/%3e%3cpath stroke-linejoin='round' d='M5.8 3.6h.4L6 6.5z'/%3e%3ccircle cx='6' cy='8.2' r='.6' fill='%23dc3545' stroke='none'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

.was-validated .form-control:valid {
    border-color: #28a745;
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 8 8'%3e%3cpath fill='%2328a745' d='M2.3 6.73L.6 4.53c-.4-1.04.46-1.4 1.1-.8l1.1 1.4 3.4-3.8c.6-.63 1.6-.27 1.2.7l-4 4.6c-.43.5-.8.4-1.1.1z'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right calc(0.375em + 0.1875rem) center;
    background-size: calc(0.75em + 0.375rem) calc(0.75em + 0.375rem);
}

/* Loading spinner */
.spinner-border {
    width: 1.5rem;
    height: 1.5rem;
    border-width: 0.15em;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .form-section {
        padding: 15px;
    }
    .btn {
        width: 100%;
        margin-bottom: 10px;
    }
    .d-flex {
        flex-direction: column;
    }
}
</style>

</html>