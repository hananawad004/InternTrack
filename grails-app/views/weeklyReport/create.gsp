<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Weekly Report - InternTrack</title>
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
    .form-control:focus {
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
    </style>
</head>

<div class="container-fluid mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-file-alt me-2 text-primary"></i>Create Weekly Report</h2>
        <g:link controller="weeklyReport" action="index" class="btn btn-outline-secondary">
            <i class="fas fa-arrow-left me-2"></i>Back to Reports
        </g:link>
    </div>

<!-- Error Messages -->
    <g:if test="${flash.error}">
        <div class="alert alert-danger alert-dismissible fade show">
            <i class="fas fa-exclamation-circle me-2"></i>${flash.error}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>

    <g:if test="${flash.message}">
        <div class="alert alert-info alert-dismissible fade show">
            <i class="fas fa-info-circle me-2"></i>${flash.message}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>

<!-- Form -->
    <g:uploadForm controller="weeklyReport" action="save" method="POST" class="card p-4 shadow-sm" enctype="multipart/form-data">

        <!-- Week Information -->
        <div class="form-section">
            <h5 class="mb-3">
                <i class="fas fa-calendar-alt me-2 text-primary"></i>
                Week Information
            </h5>
            <div class="row">
                <div class="col-md-4">
                    <div class="mb-3">
                        <label class="form-label required">Week Number</label>
                        <input type="number" name="weekNumber" class="form-control"
                               value="${report?.weekNumber ?: currentWeek}" readonly>
                        <small class="text-muted">Current week: ${currentWeek}</small>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="mb-3">
                        <label class="form-label required">Start Date</label>
                        <g:set var="startDateValue" value="${report?.weekStartDate ?: weekRange?.startDate}"/>
                        <input type="date" name="weekStartDate" class="form-control"
                               value="<g:if test="${startDateValue}"><g:formatDate date="${startDateValue}" format="yyyy-MM-dd"/></g:if>" required>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="mb-3">
                        <label class="form-label required">End Date</label>
                        <g:set var="endDateValue" value="${report?.weekEndDate ?: weekRange?.endDate}"/>
                        <input type="date" name="weekEndDate" class="form-control"
                               value="<g:if test="${endDateValue}"><g:formatDate date="${endDateValue}" format="yyyy-MM-dd"/></g:if>" required>
                    </div>
                </div>
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
                <small class="text-muted">Be specific about what you achieved this week</small>
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
                <small class="text-muted">Any difficulties you faced and how you handled them</small>
            </div>
            <div class="mb-3">
                <label class="form-label">Lessons Learned</label>
                <textarea name="lessonsLearned" class="form-control" rows="4"
                          placeholder="What new skills or knowledge did you gain?">${report?.lessonsLearned}</textarea>
                <small class="text-muted">Key takeaways and new skills acquired</small>
            </div>
            <div class="mb-3">
                <label class="form-label">Plans for Next Week</label>
                <textarea name="plansForNextWeek" class="form-control" rows="4"
                          placeholder="What do you plan to work on next week?">${report?.plansForNextWeek}</textarea>
                <small class="text-muted">Your goals and tasks for the upcoming week</small>
            </div>
        </div>

        <!-- Attachments -->
        <div class="form-section">
            <h5 class="mb-3">
                <i class="fas fa-paperclip me-2 text-info"></i>
                Attachments
            </h5>
            <div class="mb-3">
                <label class="form-label">Upload Supporting Documents</label>
                <input type="file" name="attachments" id="attachments" class="form-control" multiple
                       accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">
                <small class="text-muted">
                    <i class="fas fa-info-circle me-1"></i>
                    Max file size: 5MB. Allowed formats: PDF, DOC, DOCX, JPG, PNG
                </small>
            </div>
            <div class="mt-2" id="fileList"></div>
        </div>

        <!-- Submit Buttons -->
        <div class="d-flex justify-content-between mt-4">
            <g:link controller="weeklyReport" action="index" class="btn btn-secondary">
                <i class="fas fa-times me-2"></i>Cancel
            </g:link>
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-paper-plane me-2"></i>Submit Report
            </button>
        </div>
    </g:uploadForm>
</div>

<!-- JavaScript -->
<script>
    document.getElementById('attachments')
        .addEventListener('change', function (event) {
            const fileList = document.getElementById('fileList');
            fileList.innerHTML = '';

            if (this.files.length > 0) {
                Array.from(event.target.files).forEach(function (file) {
                    const li = document.createElement('li');
                    li.className = 'list-group-item d-flex justify-content-between align-items-center';

                    const nameSpan = document.createElement('span');
                    nameSpan.innerHTML = '<i class="fas fa-file me-2"></i>' + file.name;

                    const sizeSpan = document.createElement('span');
                    sizeSpan.className = 'badge bg-secondary';
                    sizeSpan.innerText = (file.size / 1024).toFixed(1) + ' KB';

                    li.appendChild(nameSpan);
                    li.appendChild(sizeSpan);
                    fileList.appendChild(li);
                });
            }
        });

    // Save draft to localStorage
    function saveDraft() {
        const formData = {
            weekNumber: document.querySelector('input[name="weekNumber"]')?.value || '',
            weekStartDate: document.querySelector('input[name="weekStartDate"]')?.value || '',
            weekEndDate: document.querySelector('input[name="weekEndDate"]')?.value || '',
            accomplishments: document.querySelector('textarea[name="accomplishments"]')?.value || '',
            challenges: document.querySelector('textarea[name="challenges"]')?.value || '',
            lessonsLearned: document.querySelector('textarea[name="lessonsLearned"]')?.value || '',
            plansForNextWeek: document.querySelector('textarea[name="plansForNextWeek"]')?.value || '',
            hoursWorked: document.querySelector('input[name="hoursWorked"]')?.value || '40'
        };

        localStorage.setItem('weeklyReportDraft', JSON.stringify(formData));

        // Show success message
        const alert = document.createElement('div');
        alert.className = 'alert alert-success alert-dismissible fade show position-fixed top-0 end-0 m-3';
        alert.style.zIndex = '9999';
        alert.innerHTML = `
            <i class="fas fa-check-circle me-2"></i>
            Draft saved successfully!
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        `;
        document.body.appendChild(alert);
        setTimeout(() => alert.remove(), 3000);
    }

    // Load draft from localStorage
    function loadDraft() {
        const saved = localStorage.getItem('weeklyReportDraft');
        if (saved) {
            try {
                const data = JSON.parse(saved);

                const weekNumberInput = document.querySelector('input[name="weekNumber"]');
                if (weekNumberInput) weekNumberInput.value = data.weekNumber || weekNumberInput.value;

                const startDateInput = document.querySelector('input[name="weekStartDate"]');
                if (startDateInput) startDateInput.value = data.weekStartDate || startDateInput.value;

                const endDateInput = document.querySelector('input[name="weekEndDate"]');
                if (endDateInput) endDateInput.value = data.weekEndDate || endDateInput.value;

                const accomplishmentsInput = document.querySelector('textarea[name="accomplishments"]');
                if (accomplishmentsInput) accomplishmentsInput.value = data.accomplishments || accomplishmentsInput.value;

                const challengesInput = document.querySelector('textarea[name="challenges"]');
                if (challengesInput) challengesInput.value = data.challenges || challengesInput.value;

                const lessonsInput = document.querySelector('textarea[name="lessonsLearned"]');
                if (lessonsInput) lessonsInput.value = data.lessonsLearned || lessonsInput.value;

                const plansInput = document.querySelector('textarea[name="plansForNextWeek"]');
                if (plansInput) plansInput.value = data.plansForNextWeek || plansInput.value;

                const hoursInput = document.querySelector('input[name="hoursWorked"]');
                if (hoursInput) hoursInput.value = data.hoursWorked || '40';
            } catch (e) {
                console.error('Error loading draft:', e);
            }
        }
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

    // Load draft on page load
    document.addEventListener('DOMContentLoaded', function() {
        loadDraft();
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
</style>


</html>