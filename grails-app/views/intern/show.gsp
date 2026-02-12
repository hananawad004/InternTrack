<!DOCTYPE html>
<html>
<head>
  <meta name="layouts" content="main"/>
  <title>Intern Details - InternTrack</title>
  <style>
  .profile-container {
    max-width: 1000px;
    margin: 0 auto;
  }

  .profile-card {
    background: white;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    overflow: hidden;
  }

  .profile-header {
    background: linear-gradient(135deg, #2C3E50, #3498DB);
    padding: 30px;
    color: white;
    display: flex;
    align-items: center;
    gap: 20px;
  }

  .profile-avatar {
    width: 80px;
    height: 80px;
    background: rgba(255,255,255,0.2);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 36px;
    font-weight: bold;
    color: white;
  }

  .profile-title h1 {
    margin: 0;
    font-size: 28px;
    font-weight: 700;
  }

  .profile-title p {
    margin: 5px 0 0;
    opacity: 0.9;
    font-size: 16px;
  }

  .profile-body {
    padding: 30px;
  }

  .info-section {
    background: #F8F9FA;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 25px;
  }

  .info-section h3 {
    color: #2C3E50;
    font-size: 18px;
    font-weight: 600;
    margin-top: 0;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
  }

  .info-section h3 i {
    margin-right: 10px;
    color: #1ABC9C;
  }

  .info-grid {
    display: flex;
    flex-wrap: wrap;
    margin: -10px;
  }

  .info-item {
    width: 33.333%;
    padding: 10px;
    box-sizing: border-box;
  }

  .info-label {
    font-size: 12px;
    color: #7F8C8D;
    margin-bottom: 5px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  .info-value {
    font-size: 16px;
    color: #2C3E50;
    font-weight: 500;
  }

  .status-badge {
    display: inline-block;
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
  }

  .status-active {
    background: #d4edda;
    color: #155724;
  }

  .status-completed {
    background: #cce5ff;
    color: #004085;
  }

  .status-terminated {
    background: #f8d7da;
    color: #721c24;
  }

  .action-buttons {
    display: flex;
    gap: 10px;
    margin-top: 20px;
  }

  .btn {
    padding: 10px 20px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
    border: none;
    display: inline-flex;
    align-items: center;
    gap: 8px;
    text-decoration: none;
  }

  .btn-edit {
    background: #3498DB;
    color: white;
  }

  .btn-delete {
    background: #E74C3C;
    color: white;
  }

  .btn-back {
    background: #ECF0F1;
    color: #7F8C8D;
  }

  .btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 10px rgba(0,0,0,0.1);
  }

  @media (max-width: 768px) {
    .info-item {
      width: 100%;
    }
    .profile-header {
      flex-direction: column;
      text-align: center;
    }
  }
  </style>
</head>
<body>
<div class="profile-container">
  <div class="profile-card">
    <div class="profile-header">
      <div class="profile-avatar">
        ${intern?.user?.fullName?.split(' ').collect { it[0] }.join()?.toUpperCase() ?: 'I'}
      </div>
      <div class="profile-title">
        <h1>${intern?.user?.fullName}</h1>
        <p><i class="fas fa-id-card"></i> ${intern?.studentId}</p>
      </div>
    </div>

    <div class="profile-body">
      <!-- Personal Information -->
      <div class="info-section">
        <h3>
          <i class="fas fa-user-circle"></i>
          Personal Information
        </h3>
        <div class="info-grid">
          <div class="info-item">
            <div class="info-label">Full Name</div>
            <div class="info-value">${intern?.user?.fullName}</div>
          </div>
          <div class="info-item">
            <div class="info-label">Email</div>
            <div class="info-value">${intern?.user?.email}</div>
          </div>
          <div class="info-item">
            <div class="info-label">Phone</div>
            <div class="info-value">${intern?.user?.phone ?: 'N/A'}</div>
          </div>
          <div class="info-item">
            <div class="info-label">Student ID</div>
            <div class="info-value">${intern?.studentId}</div>
          </div>
        </div>
      </div>

      <!-- Academic Information -->
      <div class="info-section">
        <h3>
          <i class="fas fa-graduation-cap"></i>
          Academic Information
        </h3>
        <div class="info-grid">
          <div class="info-item">
            <div class="info-label">University</div>
            <div class="info-value">${intern?.university}</div>
          </div>
          <div class="info-item">
            <div class="info-label">Major</div>
            <div class="info-value">${intern?.major}</div>
          </div>
          <div class="info-item">
            <div class="info-label">Department</div>
            <div class="info-value">${intern?.department ?: 'N/A'}</div>
          </div>
          <div class="info-item">
            <div class="info-label">Year of Study</div>
            <div class="info-value">${intern?.yearOfStudy ?: 'N/A'}</div>
          </div>
        </div>
      </div>

      <!-- Internship Details -->
      <div class="info-section">
        <h3>
          <i class="fas fa-briefcase"></i>
          Internship Details
        </h3>
        <div class="info-grid">
          <div class="info-item">
            <div class="info-label">Supervisor</div>
            <div class="info-value">
              <a href="#">${intern?.supervisor?.user?.fullName}</a>
            </div>
          </div>
          <div class="info-item">
            <div class="info-label">Start Date</div>
            <div class="info-value">
              <g:formatDate date="${intern?.startDate}" format="dd MMM yyyy"/>
            </div>
          </div>
          <div class="info-item">
            <div class="info-label">End Date</div>
            <div class="info-value">
              <g:formatDate date="${intern?.endDate}" format="dd MMM yyyy"/>
            </div>
          </div>
          <div class="info-item">
            <div class="info-label">Status</div>
            <div class="info-value">
              <span class="status-badge status-${intern?.status?.toLowerCase()}">
                ${intern?.status}
              </span>
            </div>
          </div>
          <div class="info-item">
            <div class="info-label">Total Hours</div>
            <div class="info-value">${intern?.totalHours} hrs</div>
          </div>
          <div class="info-item">
            <div class="info-label">Days Remaining</div>
            <div class="info-value">
              <g:if test="${intern?.status == 'ACTIVE'}">
                ${intern?.remainingDays} days
              </g:if>
              <g:else>
                -
              </g:else>
            </div>
          </div>
        </div>
      </div>

    <!-- Emergency Contact -->
      <g:if test="${intern?.emergencyContact || intern?.emergencyPhone}">
        <div class="info-section">
          <h3>
            <i class="fas fa-phone-alt"></i>
            Emergency Contact
          </h3>
          <div class="info-grid">
            <div class="info-item">
              <div class="info-label">Contact Name</div>
              <div class="info-value">${intern?.emergencyContact ?: 'N/A'}</div>
            </div>
            <div class="info-item">
              <div class="info-label">Contact Phone</div>
              <div class="info-value">${intern?.emergencyPhone ?: 'N/A'}</div>
            </div>
          </div>
        </div>
      </g:if>

    <!-- Notes -->
      <g:if test="${intern?.notes}">
        <div class="info-section">
          <h3>
            <i class="fas fa-sticky-note"></i>
            Notes
          </h3>
          <p style="margin:0; color:#2C3E50;">${intern?.notes}</p>
        </div>
      </g:if>

    <!-- Action Buttons -->
      <div class="action-buttons">
        <g:link controller="intern" action="index" class="btn btn-back">
          <i class="fas fa-arrow-left"></i> Back to List
        </g:link>

        <sec:ifAnyGranted roles="ROLE_ADMIN">
          <g:link controller="intern" action="edit" id="${intern?.id}" class="btn btn-edit">
            <i class="fas fa-edit"></i> Edit
          </g:link>

          <g:link controller="intern" action="delete" id="${intern?.id}"
                  class="btn btn-delete"
                  onclick="return confirm('Are you sure you want to delete this intern?');">
            <i class="fas fa-trash"></i> Delete
          </g:link>
        </sec:ifAnyGranted>

        <sec:ifAnyGranted roles="ROLE_SUPERVISOR">
          <g:if test="${springSecurityService.currentUser?.id == intern?.supervisor?.user?.id}">
            <g:link controller="intern" action="edit" id="${intern?.id}" class="btn btn-edit">
              <i class="fas fa-edit"></i> Edit
            </g:link>
          </g:if>
        </sec:ifAnyGranted>
      </div>
    </div>
  </div>
</div>
</body>
</html>