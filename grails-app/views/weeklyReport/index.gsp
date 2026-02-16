<%--
  Created by IntelliJ IDEA.
  User: Eng.Hanan Awad
  Date: 2/12/2026
  Time: 10:03 AM
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
  <title>Weekly Reports - InternTrack</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
 {
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
  }

  .filter-card {
    background: white;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    margin-bottom: 25px;
    padding: 20px;
  }

  .report-card {
    background: white;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    margin-bottom: 15px;
    transition: all 0.3s;
    border: 1px solid #eaeaea;
  }

  .report-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 20px rgba(0,0,0,0.12);
    border-color: #667eea;
  }

  .status-badge {
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 600;
  }

  .status-SUBMITTED { background-color: #ffc107; color: #212529; }
  .status-UNDER_REVIEW { background-color: #17a2b8; color: white; }
  .status-APPROVED { background-color: #28a745; color: white; }
  .status-REJECTED { background-color: #dc3545; color: white; }

  .avatar-sm {
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
  </style>
</head>
<body>
<div class="container-fluid">
  <!-- Page Header -->
  <div class="page-header">
    <div class="d-flex justify-content-between align-items-center">
      <div>
        <h2 class="mb-2">
          <i class="fas fa-file-alt me-2"></i>
          Weekly Reports
        </h2>
        <p class="mb-0 opacity-75">View and manage all weekly reports</p>
      </div>
      <div>
        <g:if test="${hasRole('ROLE_INTERN')}">
          <g:link controller="weeklyReport" action="create" class="btn btn-light">
            <i class="fas fa-plus-circle me-2"></i>
            New Report
          </g:link>
        </g:if>
      </div>
    </div>
  </div>

  <!-- Filter Section -->
  <div class="filter-card">
    <div class="row">
      <div class="col-md-3">
        <label class="form-label text-muted small">Status</label>
        <select class="form-select" id="statusFilter">
          <option value="">All Status</option>
          <g:each in="${statusList}" var="status">
            <option value="${status}">${status}</option>
          </g:each>
        </select>
      </div>
      <div class="col-md-3">
        <label class="form-label text-muted small">Week</label>
        <input type="number" class="form-control" id="weekFilter" placeholder="Week number">
      </div>
      <div class="col-md-3">
        <label class="form-label text-muted small">From Date</label>
        <input type="date" class="form-control" id="dateFromFilter">
      </div>
      <div class="col-md-3 d-flex align-items-end">
        <button class="btn btn-primary w-100" onclick="applyFilters()">
          <i class="fas fa-filter me-2"></i>
          Apply Filters
        </button>
      </div>
    </div>
  </div>

<!-- Reports List -->
  <g:if test="${reportList}">
    <div class="row">
      <g:each in="${reportList}" var="report">
        <div class="col-md-6 col-lg-4">
          <div class="report-card">
            <div class="card-body p-4">
              <!-- Header -->
              <div class="d-flex justify-content-between align-items-start mb-3">
                <div>
                  <span class="status-badge status-${report.status}">
                    ${report.status}
                  </span>
                </div>
                <small class="text-muted">
                  <i class="fas fa-calendar-alt me-1"></i>
                  Week ${report.weekNumber}
                </small>
              </div>

              <!-- Intern Info -->
              <div class="d-flex align-items-center mb-3">
                <div class="avatar-sm me-3">
                  ${report.intern?.user?.initials ?: 'U'}
                </div>
                <div>
                  <h6 class="mb-1">${report.intern?.user?.fullName}</h6>
                  <small class="text-muted">
                    <i class="fas fa-building me-1"></i>
                    ${report.intern?.university ?: 'N/A'}
                  </small>
                </div>
              </div>

              <!-- Report Details -->
              <div class="mb-3">
                <div class="small text-muted mb-2">
                  <i class="fas fa-clock me-1"></i>
                  Submitted: <g:formatDate date="${report.reportDate}" format="dd MMM yyyy"/>
                </div>
                <p class="small mb-0 text-truncate">
                  ${report.accomplishments?.truncate(100) ?: 'No description'}
                </p>
              </div>

              <!-- Attachments & Hours -->
              <div class="d-flex justify-content-between align-items-center mb-3">
                <div>
                  <span class="badge bg-light text-dark me-2">
                    <i class="fas fa-paperclip me-1"></i>
                    ${report.attachments?.size() ?: 0}
                  </span>
                  <span class="badge bg-light text-dark">
                    <i class="fas fa-clock me-1"></i>
                    ${report.hoursWorked ?: 0}h
                  </span>
                </div>
                <small class="text-${report.reviewedDate ? 'success' : 'warning'}">
                  <i class="fas ${report.reviewedDate ? 'fa-check-circle' : 'fa-clock'}"></i>
                  ${report.reviewedDate ? 'Reviewed' : 'Pending Review'}
                </small>
              </div>

              <!-- Actions -->
              <div class="d-flex gap-2">
                <g:link controller="weeklyReport" action="show" id="${report.id}"
                        class="btn btn-outline-primary btn-sm flex-grow-1">
                  <i class="fas fa-eye me-1"></i>
                  View Details
                </g:link>

                <g:if test="${hasRole('ROLE_SUPERVISOR') && report.status == 'SUBMITTED'}">
                  <g:link controller="weeklyReport" action="reviewReport" id="${report.id}"
                          class="btn btn-outline-success btn-sm flex-grow-1">
                    <i class="fas fa-check-circle me-1"></i>
                    Review
                  </g:link>
                </g:if>

                <g:if test="${hasRole('ROLE_INTERN') && report.isSubmitted()}">
                  <g:link controller="weeklyReport" action="edit" id="${report.id}"
                          class="btn btn-outline-warning btn-sm">
                    <i class="fas fa-edit"></i>
                  </g:link>
                </g:if>
              </div>
            </div>
          </div>
        </div>
      </g:each>
    </div>
  </g:if>
  <g:else>
    <div class="text-center py-5">
      <i class="fas fa-file-alt fa-4x text-muted mb-3"></i>
      <h5 class="text-muted">No reports found</h5>
      <g:if test="${hasRole('ROLE_INTERN')}">
        <p class="text-muted mb-3">You haven't submitted any weekly reports yet.</p>
        <g:link controller="weeklyReport" action="create" class="btn btn-primary">
          <i class="fas fa-plus-circle me-2"></i>
          Submit Your First Report
        </g:link>
      </g:if>
      <g:else>
        <p class="text-muted">No reports are available.</p>
      </g:else>
    </div>
  </g:else>
</div>

<script>
  function applyFilters() {
    // TODO: Implement filter logic
    console.log('Applying filters...');
  }

  // Helper function to check role (you might need to pass this from controller)
  function hasRole(role) {
    return ${hasRole('ROLE_INTERN') ?: false} ||
    ${hasRole('ROLE_SUPERVISOR') ?: false} ||
    ${hasRole('ROLE_ADMIN') ?: false};
  }
</script>

</html>