<%--
  Created by IntelliJ IDEA.
  User: Eng.Hanan Awad
  Date: 2/21/2026
  Time: 3:05 AM
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title></title>--}%
%{--</head>--}%

%{--<body>--}%

%{--</body>--}%
%{--</html>--}%
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Edit Intern - InternTrack</title>

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

  .page-header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 25px;
    border-radius: 10px;
    margin-bottom: 25px;
    margin-top: 70px;
  }

  .form-section {
    background: white;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    padding: 25px;
    margin-bottom: 25px;
    border: 1px solid #e2e8f0;
  }

  .section-title {
    font-size: 1.2rem;
    font-weight: 600;
    color: #334155;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #667eea;
  }

  .form-label {
    font-weight: 600;
    color: #4a5568;
    margin-bottom: 8px;
  }

  .required:after {
    content: " *";
    color: red;
  }

  .avatar-preview {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 36px;
    font-weight: bold;
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
    background-color: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
  }

  .status-badge {
    padding: 8px 16px;
    border-radius: 30px;
    font-weight: 600;
    display: inline-block;
  }

  .status-ACTIVE { background-color: #28a745; color: white; }
  .status-INACTIVE { background-color: #dc3545; color: white; }
  .status-ON_HOLD { background-color: #ffc107; color: #212529; }
  .status-COMPLETED { background-color: #17a2b8; color: white; }
  </style>
</head>

<div class="container-fluid">
  <!-- Header -->
  <div class="page-header">
    <div class="d-flex justify-content-between align-items-center">
      <div>
        <h2 class="mb-2">
          <i class="fas fa-user-edit me-2"></i>
          Edit Intern
        </h2>
        <p class="mb-0 opacity-75">Update intern information and details</p>
      </div>
      <div>
        <g:link controller="intern" action="index" class="btn btn-light me-2">
          <i class="fas fa-list me-2"></i>All Interns
        </g:link>
        <g:link controller="intern" action="show" id="${intern?.id}" class="btn btn-light">
          <i class="fas fa-arrow-left me-2"></i>Back to Profile
        </g:link>
      </div>
    </div>
  </div>

<!-- Flash Messages -->
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
  <g:form controller="intern" action="update" id="${intern?.id}" method="POST" class="card p-4 shadow-sm" enctype="multipart/form-data">

    <!-- Current Status -->
    <div class="intern-info">
      <div class="row align-items-center">
        <div class="col-md-auto">
          <div class="avatar-preview">
            ${intern?.user?.initials ?: 'U'}
          </div>
        </div>
        <div class="col-md">
          <h4 class="mb-1">${intern?.user?.fullName}</h4>
          <p class="text-muted mb-2">${intern?.user?.email}</p>
          <div class="d-flex gap-2">
            <span class="status-badge status-${intern?.status ?: 'ACTIVE'}">
              <i class="fas fa-circle me-1"></i>${intern?.status ?: 'ACTIVE'}
            </span>
            <span class="badge bg-info">
              <i class="fas fa-clock me-1"></i>ID: ${intern?.studentId}
            </span>
          </div>
        </div>
      </div>
    </div>

    <!-- Personal Information -->
    <div class="form-section">
      <h5 class="section-title">
        <i class="fas fa-user me-2 text-primary"></i>
        Personal Information
      </h5>

      <div class="row">
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">Full Name</label>
            <input type="text" name="fullName" class="form-control" required
                   value="${intern?.user?.fullName}">
          </div>
        </div>
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">Email Address</label>
            <input type="email" name="email" class="form-control" required
                   value="${intern?.user?.email}">
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" name="phone" class="form-control"
                   value="${intern?.user?.phone}">
          </div>
        </div>
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label">Profile Image</label>
            <input type="file" name="profileImage" class="form-control" accept="image/*">
            <small class="text-muted">Leave empty to keep current image</small>
          </div>
        </div>
      </div>
    </div>

    <!-- Academic Information -->
    <div class="form-section">
      <h5 class="section-title">
        <i class="fas fa-graduation-cap me-2 text-primary"></i>
        Academic Information
      </h5>

      <div class="row">
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">Student ID</label>
            <input type="text" name="studentId" class="form-control" required
                   value="${intern?.studentId}">
          </div>
        </div>
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">University</label>
            <input type="text" name="university" class="form-control" required
                   value="${intern?.university}">
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">Major/Field of Study</label>
            <input type="text" name="major" class="form-control" required
                   value="${intern?.major}">
          </div>
        </div>
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">Year of Study</label>
            <select name="yearOfStudy" class="form-select" required>
              <option value="1" ${intern?.yearOfStudy == 1 ? 'selected' : ''}>1st Year</option>
              <option value="2" ${intern?.yearOfStudy == 2 ? 'selected' : ''}>2nd Year</option>
              <option value="3" ${intern?.yearOfStudy == 3 ? 'selected' : ''}>3rd Year</option>
              <option value="4" ${intern?.yearOfStudy == 4 ? 'selected' : ''}>4th Year</option>
              <option value="5" ${intern?.yearOfStudy == 5 ? 'selected' : ''}>5th Year</option>
            </select>
          </div>
        </div>
      </div>

      <!-- حذفت حقل GPA لأنه مش موجود -->
    </div>

    <!-- Internship Details -->
    <div class="form-section">
      <h5 class="section-title">
        <i class="fas fa-briefcase me-2 text-primary"></i>
        Internship Details
      </h5>

      <div class="row">
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">Start Date</label>
            <input type="date" name="startDate" class="form-control" required
                   value="<g:formatDate date="${intern?.startDate}" format="yyyy-MM-dd"/>">
          </div>
        </div>
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">End Date</label>
            <input type="date" name="endDate" class="form-control" required
                   value="<g:formatDate date="${intern?.endDate}" format="yyyy-MM-dd"/>">
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">Department</label>
            <input type="text" name="department" class="form-control" required
                   value="${intern?.department}">
          </div>
        </div>
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">Position/Title</label>
            <input type="text" name="position" class="form-control" required
                   value="${intern?.position}">
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label required">Status</label>
            <select name="status" class="form-select" required>
              <option value="ACTIVE" ${intern?.status == 'ACTIVE' ? 'selected' : ''}>Active</option>
              <option value="INACTIVE" ${intern?.status == 'INACTIVE' ? 'selected' : ''}>Inactive</option>
              <option value="ON_HOLD" ${intern?.status == 'ON_HOLD' ? 'selected' : ''}>On Hold</option>
              <option value="COMPLETED" ${intern?.status == 'COMPLETED' ? 'selected' : ''}>Completed</option>
            </select>
          </div>
        </div>
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label">Supervisor</label>
            <select name="supervisorId" class="form-select">
              <option value="">Select Supervisor...</option>
              <g:each in="${supervisors}" var="sup">
                <option value="${sup.id}" ${intern?.supervisor?.id == sup.id ? 'selected' : ''}>
                  ${sup.user?.fullName} - ${sup.position}
                </option>
              </g:each>
            </select>
          </div>
        </div>
      </div>
    </div>

    <!-- Additional Information -->
    <div class="form-section">
      <h5 class="section-title">
        <i class="fas fa-info-circle me-2 text-primary"></i>
        Additional Information
      </h5>

      <div class="mb-3">
        <label class="form-label">Address</label>
        <textarea name="address" class="form-control" rows="2">${intern?.address}</textarea>
      </div>

      <div class="row">
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label">Emergency Contact Name</label>
            <input type="text" name="emergencyContactName" class="form-control"
                   value="${intern?.emergencyContactName}">
          </div>
        </div>
        <div class="col-md-6">
          <div class="mb-3">
            <label class="form-label">Emergency Contact Phone</label>
            <input type="text" name="emergencyContactPhone" class="form-control"
                   value="${intern?.emergencyContactPhone}">
          </div>
        </div>
      </div>

      <div class="mb-3">
        <label class="form-label">Notes</label>
        <textarea name="notes" class="form-control" rows="3">${intern?.notes}</textarea>
      </div>
    </div>

    <!-- Action Buttons -->
    <div class="action-buttons">
      <div class="d-flex justify-content-between">
        <g:link controller="intern" action="show" id="${intern?.id}" class="btn btn-secondary btn-lg">
          <i class="fas fa-times me-2"></i>Cancel
        </g:link>
        <div>
          <button type="button" class="btn btn-info btn-lg me-2" onclick="saveDraft()">
            <i class="fas fa-save me-2"></i>Save Draft
          </button>
          <button type="submit" class="btn btn-primary btn-lg">
            <i class="fas fa-check-circle me-2"></i>Update Intern
          </button>
        </div>
      </div>
    </div>
  </g:form>
</div>

<!-- JavaScript -->
<script>
  // Preview selected files
  document.querySelector('input[name="profileImage"]')?.addEventListener('change', function(event) {
    if (this.files && this.files[0]) {
      const reader = new FileReader();
      reader.onload = function(e) {
        const preview = document.querySelector('.avatar-preview');
        if (preview) {
          preview.style.backgroundImage = `url('${e.target.result}')`;
          preview.style.backgroundSize = 'cover';
          preview.style.backgroundPosition = 'center';
          preview.textContent = '';
        }
      }
      reader.readAsDataURL(this.files[0]);
    }
  });

  // Save draft to localStorage
  function saveDraft() {
    const formData = {
      fullName: document.querySelector('input[name="fullName"]')?.value || '',
      email: document.querySelector('input[name="email"]')?.value || '',
      phone: document.querySelector('input[name="phone"]')?.value || '',
      studentId: document.querySelector('input[name="studentId"]')?.value || '',
      university: document.querySelector('input[name="university"]')?.value || '',
      major: document.querySelector('input[name="major"]')?.value || '',
      yearOfStudy: document.querySelector('select[name="yearOfStudy"]')?.value || '',
      startDate: document.querySelector('input[name="startDate"]')?.value || '',
      endDate: document.querySelector('input[name="endDate"]')?.value || '',
      department: document.querySelector('input[name="department"]')?.value || '',
      position: document.querySelector('input[name="position"]')?.value || '',
      status: document.querySelector('select[name="status"]')?.value || '',
      supervisorId: document.querySelector('select[name="supervisorId"]')?.value || '',
      address: document.querySelector('textarea[name="address"]')?.value || '',
      emergencyContactName: document.querySelector('input[name="emergencyContactName"]')?.value || '',
      emergencyContactPhone: document.querySelector('input[name="emergencyContactPhone"]')?.value || '',
      notes: document.querySelector('textarea[name="notes"]')?.value || '',
      internId: '${intern?.id}',
      lastSaved: new Date().toISOString()
    };

    localStorage.setItem('intern_edit_${intern?.id}', JSON.stringify(formData));

    const alert = document.createElement('div');
    alert.className = 'alert alert-success alert-dismissible fade show position-fixed top-0 end-0 m-3';
    alert.style.zIndex = '9999';

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

  // Load draft from localStorage
  document.addEventListener('DOMContentLoaded', function() {
    const saved = localStorage.getItem('intern_edit_${intern?.id}');
    if (saved) {
      try {
        const data = JSON.parse(saved);
        const savedTime = new Date(data.lastSaved);
        const now = new Date();
        const minutesDiff = Math.round((now - savedTime) / 60000);

        if (minutesDiff < 60 && confirm('You have a draft saved from ' + minutesDiff + ' minute(s) ago. Would you like to load it?')) {
          document.querySelector('input[name="fullName"]').value = data.fullName || '';
          document.querySelector('input[name="email"]').value = data.email || '';
          document.querySelector('input[name="phone"]').value = data.phone || '';
          document.querySelector('input[name="studentId"]').value = data.studentId || '';
          document.querySelector('input[name="university"]').value = data.university || '';
          document.querySelector('input[name="major"]').value = data.major || '';
          document.querySelector('select[name="yearOfStudy"]').value = data.yearOfStudy || '';
          document.querySelector('input[name="startDate"]').value = data.startDate || '';
          document.querySelector('input[name="endDate"]').value = data.endDate || '';
          document.querySelector('input[name="department"]').value = data.department || '';
          document.querySelector('input[name="position"]').value = data.position || '';
          document.querySelector('select[name="status"]').value = data.status || '';
          document.querySelector('select[name="supervisorId"]').value = data.supervisorId || '';
          document.querySelector('textarea[name="address"]').value = data.address || '';
          document.querySelector('input[name="emergencyContactName"]').value = data.emergencyContactName || '';
          document.querySelector('input[name="emergencyContactPhone"]').value = data.emergencyContactPhone || '';
          document.querySelector('textarea[name="notes"]').value = data.notes || '';
        }
      } catch (e) {
        console.error('Error loading draft:', e);
      }
    }
  });

  // Auto-save every 30 seconds
  let autoSaveTimer;
  const form = document.querySelector('form');
  if (form) {
    form.addEventListener('input', function() {
      clearTimeout(autoSaveTimer);
      autoSaveTimer = setTimeout(saveDraft, 30000);
    });
  }

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

<style>
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