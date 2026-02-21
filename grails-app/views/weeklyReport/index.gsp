%{--<%----}%
%{--  Created by IntelliJ IDEA.--}%
%{--  User: Eng.Hanan Awad--}%
%{--  Date: 2/12/2026--}%
%{--  Time: 10:03 AM--}%
%{----%>--}%

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title></title>--}%
%{--</head>--}%

%{--<body>--}%

%{--</body>--}%
%{--</html>--}%

%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--  <meta name="layout" content="main"/>--}%
%{--  <title>Weekly Reports - InternTrack</title>--}%

%{--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--}%
%{--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--}%

%{--  <style>--}%
%{-- {--}%
%{--    background-color: #f8f9fa;--}%
%{--    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--}%
%{--    padding: 20px 0;--}%
%{--  }--}%

%{--  .page-header {--}%
%{--    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--    color: white;--}%
%{--    padding: 25px;--}%
%{--    border-radius: 10px;--}%
%{--    margin-bottom: 25px;--}%
%{--  }--}%

%{--  .filter-card {--}%
%{--    background: white;--}%
%{--    border-radius: 10px;--}%
%{--    box-shadow: 0 2px 10px rgba(0,0,0,0.08);--}%
%{--    margin-bottom: 25px;--}%
%{--    padding: 20px;--}%
%{--  }--}%

%{--  .report-card {--}%
%{--    background: white;--}%
%{--    border-radius: 10px;--}%
%{--    box-shadow: 0 2px 10px rgba(0,0,0,0.08);--}%
%{--    margin-bottom: 15px;--}%
%{--    transition: all 0.3s;--}%
%{--    border: 1px solid #eaeaea;--}%
%{--  }--}%

%{--  .report-card:hover {--}%
%{--    transform: translateY(-3px);--}%
%{--    box-shadow: 0 5px 20px rgba(0,0,0,0.12);--}%
%{--    border-color: #667eea;--}%
%{--  }--}%

%{--  .status-badge {--}%
%{--    padding: 5px 12px;--}%
%{--    border-radius: 20px;--}%
%{--    font-size: 0.85rem;--}%
%{--    font-weight: 600;--}%
%{--  }--}%

%{--  .status-SUBMITTED { background-color: #ffc107; color: #212529; }--}%
%{--  .status-UNDER_REVIEW { background-color: #17a2b8; color: white; }--}%
%{--  .status-APPROVED { background-color: #28a745; color: white; }--}%
%{--  .status-REJECTED { background-color: #dc3545; color: white; }--}%

%{--  .avatar-sm {--}%
%{--    width: 40px;--}%
%{--    height: 40px;--}%
%{--    border-radius: 50%;--}%
%{--    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--    color: white;--}%
%{--    display: flex;--}%
%{--    align-items: center;--}%
%{--    justify-content: center;--}%
%{--    font-weight: bold;--}%
%{--  }--}%
%{--  </style>--}%
%{--</head>--}%

%{--<div class="container-fluid">--}%
%{--  <!-- Page Header -->--}%
%{--  <div class="page-header">--}%
%{--    <div class="d-flex justify-content-between align-items-center">--}%
%{--      <div>--}%
%{--        <h2 class="mb-2">--}%
%{--          <i class="fas fa-file-alt me-2"></i>--}%
%{--          Weekly Reports--}%
%{--        </h2>--}%
%{--        <p class="mb-0 opacity-75">View and manage all weekly reports</p>--}%
%{--      </div>--}%
%{--      <div>--}%
%{--        <g:if test="${hasRole('ROLE_INTERN')}">--}%
%{--          <g:link controller="weeklyReport" action="create" class="btn btn-light">--}%
%{--            <i class="fas fa-plus-circle me-2"></i>--}%
%{--            New Report--}%
%{--          </g:link>--}%
%{--        </g:if>--}%
%{--      </div>--}%
%{--    </div>--}%
%{--  </div>--}%

%{--  <!-- Filter Section -->--}%
%{--  <div class="filter-card">--}%
%{--    <div class="row">--}%
%{--      <div class="col-md-3">--}%
%{--        <label class="form-label text-muted small">Status</label>--}%
%{--        <select class="form-select" id="statusFilter">--}%
%{--          <option value="">All Status</option>--}%
%{--          <g:each in="${statusList}" var="status">--}%
%{--            <option value="${status}">${status}</option>--}%
%{--          </g:each>--}%
%{--        </select>--}%
%{--      </div>--}%
%{--      <div class="col-md-3">--}%
%{--        <label class="form-label text-muted small">Week</label>--}%
%{--        <input type="number" class="form-control" id="weekFilter" placeholder="Week number">--}%
%{--      </div>--}%
%{--      <div class="col-md-3">--}%
%{--        <label class="form-label text-muted small">From Date</label>--}%
%{--        <input type="date" class="form-control" id="dateFromFilter">--}%
%{--      </div>--}%
%{--      <div class="col-md-3 d-flex align-items-end">--}%
%{--        <button class="btn btn-primary w-100" onclick="applyFilters()">--}%
%{--          <i class="fas fa-filter me-2"></i>--}%
%{--          Apply Filters--}%
%{--        </button>--}%
%{--      </div>--}%
%{--    </div>--}%
%{--  </div>--}%

%{--<!-- Reports List -->--}%
%{--  <g:if test="${reportList}">--}%
%{--    <div class="row">--}%
%{--      <g:each in="${reportList}" var="report">--}%
%{--        <div class="col-md-6 col-lg-4">--}%
%{--          <div class="report-card">--}%
%{--            <div class="card-body p-4">--}%
%{--              <!-- Header -->--}%
%{--              <div class="d-flex justify-content-between align-items-start mb-3">--}%
%{--                <div>--}%
%{--                  <span class="status-badge status-${report.status}">--}%
%{--                    ${report.status}--}%
%{--                  </span>--}%
%{--                </div>--}%
%{--                <small class="text-muted">--}%
%{--                  <i class="fas fa-calendar-alt me-1"></i>--}%
%{--                  Week ${report.weekNumber}--}%
%{--                </small>--}%
%{--              </div>--}%

%{--              <!-- Intern Info -->--}%
%{--              <div class="d-flex align-items-center mb-3">--}%
%{--                <div class="avatar-sm me-3">--}%
%{--                  ${report.intern?.user?.initials ?: 'U'}--}%
%{--                </div>--}%
%{--                <div>--}%
%{--                  <h6 class="mb-1">${report.intern?.user?.fullName}</h6>--}%
%{--                  <small class="text-muted">--}%
%{--                    <i class="fas fa-building me-1"></i>--}%
%{--                    ${report.intern?.university ?: 'N/A'}--}%
%{--                  </small>--}%
%{--                </div>--}%
%{--              </div>--}%

%{--              <!-- Report Details -->--}%
%{--              <div class="mb-3">--}%
%{--                <div class="small text-muted mb-2">--}%
%{--                  <i class="fas fa-clock me-1"></i>--}%
%{--                  Submitted: <g:formatDate date="${report.reportDate}" format="dd MMM yyyy"/>--}%
%{--                </div>--}%
%{--                <p class="small mb-0 text-truncate">--}%
%{--                  ${report.accomplishments?.truncate(100) ?: 'No description'}--}%
%{--                </p>--}%
%{--              </div>--}%

%{--              <!-- Attachments & Hours -->--}%
%{--              <div class="d-flex justify-content-between align-items-center mb-3">--}%
%{--                <div>--}%
%{--                  <span class="badge bg-light text-dark me-2">--}%
%{--                    <i class="fas fa-paperclip me-1"></i>--}%
%{--                    ${report.attachments?.size() ?: 0}--}%
%{--                  </span>--}%
%{--                  <span class="badge bg-light text-dark">--}%
%{--                    <i class="fas fa-clock me-1"></i>--}%
%{--                    ${report.hoursWorked ?: 0}h--}%
%{--                  </span>--}%
%{--                </div>--}%
%{--                <small class="text-${report.reviewedDate ? 'success' : 'warning'}">--}%
%{--                  <i class="fas ${report.reviewedDate ? 'fa-check-circle' : 'fa-clock'}"></i>--}%
%{--                  ${report.reviewedDate ? 'Reviewed' : 'Pending Review'}--}%
%{--                </small>--}%
%{--              </div>--}%

%{--              <!-- Actions -->--}%
%{--              <div class="d-flex gap-2">--}%
%{--                <g:link controller="weeklyReport" action="show" id="${report.id}"--}%
%{--                        class="btn btn-outline-primary btn-sm flex-grow-1">--}%
%{--                  <i class="fas fa-eye me-1"></i>--}%
%{--                  View Details--}%
%{--                </g:link>--}%

%{--                <g:if test="${hasRole('ROLE_SUPERVISOR') && report.status == 'SUBMITTED'}">--}%
%{--                  <g:link controller="weeklyReport" action="reviewReport" id="${report.id}"--}%
%{--                          class="btn btn-outline-success btn-sm flex-grow-1">--}%
%{--                    <i class="fas fa-check-circle me-1"></i>--}%
%{--                    Review--}%
%{--                  </g:link>--}%
%{--                </g:if>--}%

%{--                <g:if test="${hasRole('ROLE_INTERN') && report.isSubmitted()}">--}%
%{--                  <g:link controller="weeklyReport" action="edit" id="${report.id}"--}%
%{--                          class="btn btn-outline-warning btn-sm">--}%
%{--                    <i class="fas fa-edit"></i>--}%
%{--                  </g:link>--}%
%{--                </g:if>--}%
%{--              </div>--}%
%{--            </div>--}%
%{--          </div>--}%
%{--        </div>--}%
%{--      </g:each>--}%
%{--    </div>--}%
%{--  </g:if>--}%
%{--  <g:else>--}%
%{--    <div class="text-center py-5">--}%
%{--      <i class="fas fa-file-alt fa-4x text-muted mb-3"></i>--}%
%{--      <h5 class="text-muted">No reports found</h5>--}%
%{--      <g:if test="${hasRole('ROLE_INTERN')}">--}%
%{--        <p class="text-muted mb-3">You haven't submitted any weekly reports yet.</p>--}%
%{--        <g:link controller="weeklyReport" action="create" class="btn btn-primary">--}%
%{--          <i class="fas fa-plus-circle me-2"></i>--}%
%{--          Submit Your First Report--}%
%{--        </g:link>--}%
%{--      </g:if>--}%
%{--      <g:else>--}%
%{--        <p class="text-muted">No reports are available.</p>--}%
%{--      </g:else>--}%
%{--    </div>--}%
%{--  </g:else>--}%
%{--</div>--}%

%{--<script>--}%
%{--  function applyFilters() {--}%
%{--    // TODO: Implement filter logic--}%
%{--    console.log('Applying filters...');--}%
%{--  }--}%

%{--  // Helper function to check role (you might need to pass this from controller)--}%
%{--  function hasRole(role) {--}%
%{--    return ${hasRole('ROLE_INTERN') ?: false} ||--}%
%{--    ${hasRole('ROLE_SUPERVISOR') ?: false} ||--}%
%{--    ${hasRole('ROLE_ADMIN') ?: false};--}%
%{--  }--}%
%{--</script>--}%

%{--</html>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--  <meta name="layout" content="main"/>--}%
%{--  <title>Weekly Reports - InternTrack</title>--}%

%{--  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--}%
%{--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--}%

%{--  <style>--}%
%{--  body {--}%
%{--    background-color: #f8f9fa;--}%
%{--    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--}%
%{--    padding: 20px 0;--}%
%{--  }--}%

%{--  .page-header {--}%
%{--    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--    color: white;--}%
%{--    padding: 25px;--}%
%{--    border-radius: 10px;--}%
%{--    margin-bottom: 25px;--}%
%{--  }--}%

%{--  .filter-card {--}%
%{--    background: white;--}%
%{--    border-radius: 10px;--}%
%{--    box-shadow: 0 2px 10px rgba(0,0,0,0.08);--}%
%{--    margin-bottom: 25px;--}%
%{--    padding: 20px;--}%
%{--  }--}%

%{--  .report-card {--}%
%{--    background: white;--}%
%{--    border-radius: 10px;--}%
%{--    box-shadow: 0 2px 10px rgba(0,0,0,0.08);--}%
%{--    margin-bottom: 15px;--}%
%{--    transition: all 0.3s;--}%
%{--    border: 1px solid #eaeaea;--}%
%{--  }--}%

%{--  .report-card:hover {--}%
%{--    transform: translateY(-3px);--}%
%{--    box-shadow: 0 5px 20px rgba(0,0,0,0.12);--}%
%{--    border-color: #667eea;--}%
%{--  }--}%

%{--  .status-badge {--}%
%{--    padding: 5px 12px;--}%
%{--    border-radius: 20px;--}%
%{--    font-size: 0.85rem;--}%
%{--    font-weight: 600;--}%
%{--  }--}%

%{--  .status-SUBMITTED { background-color: #ffc107; color: #212529; }--}%
%{--  .status-UNDER_REVIEW { background-color: #17a2b8; color: white; }--}%
%{--  .status-APPROVED { background-color: #28a745; color: white; }--}%
%{--  .status-REJECTED { background-color: #dc3545; color: white; }--}%

%{--  .avatar-sm {--}%
%{--    width: 40px;--}%
%{--    height: 40px;--}%
%{--    border-radius: 50%;--}%
%{--    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--    color: white;--}%
%{--    display: flex;--}%
%{--    align-items: center;--}%
%{--    justify-content: center;--}%
%{--    font-weight: bold;--}%
%{--  }--}%
%{--  </style>--}%
%{--</head>--}%



%{--<div class="container-fluid">--}%

%{--  <!-- Header -->--}%
%{--  <div class="page-header">--}%
%{--    <div class="d-flex justify-content-between align-items-center">--}%
%{--      <div>--}%
%{--        <h2 class="mb-2">--}%
%{--          <i class="fas fa-file-alt me-2"></i>--}%
%{--          Weekly Reports--}%
%{--        </h2>--}%
%{--        <p class="mb-0 opacity-75">View and manage all weekly reports</p>--}%
%{--      </div>--}%

%{--      <sec:ifGranted roles="ROLE_INTERN">--}%
%{--        <g:link controller="weeklyReport" action="create" class="btn btn-light">--}%
%{--          <i class="fas fa-plus-circle me-2"></i>--}%
%{--          New Report--}%
%{--        </g:link>--}%
%{--      </sec:ifGranted>--}%

%{--    </div>--}%
%{--  </div>--}%


%{--  <!-- Filters -->--}%
%{--  <div class="filter-card">--}%
%{--    <div class="row">--}%
%{--      <div class="col-md-3">--}%
%{--        <label class="form-label text-muted small">Status</label>--}%
%{--        <select class="form-select">--}%
%{--          <option value="">All Status</option>--}%
%{--          <g:each in="${statusList}" var="status">--}%
%{--            <option value="${status}">${status}</option>--}%
%{--          </g:each>--}%
%{--        </select>--}%
%{--      </div>--}%

%{--      <div class="col-md-3">--}%
%{--        <label class="form-label text-muted small">Week</label>--}%
%{--        <input type="number" class="form-control" placeholder="Week number">--}%
%{--      </div>--}%

%{--      <div class="col-md-3">--}%
%{--        <label class="form-label text-muted small">From Date</label>--}%
%{--        <input type="date" class="form-control">--}%
%{--      </div>--}%

%{--      <div class="col-md-3 d-flex align-items-end">--}%
%{--        <button class="btn btn-primary w-100">--}%
%{--          <i class="fas fa-filter me-2"></i>--}%
%{--          Apply Filters--}%
%{--        </button>--}%
%{--      </div>--}%
%{--    </div>--}%
%{--  </div>--}%


%{--<!-- Reports -->--}%
%{--  <g:if test="${reportList}">--}%
%{--    <div class="row">--}%

%{--      <g:each in="${reportList}" var="report">--}%
%{--        <div class="col-md-6 col-lg-4">--}%

%{--          <div class="report-card">--}%
%{--            <div class="card-body p-4">--}%

%{--              <!-- Status -->--}%
%{--              <div class="d-flex justify-content-between mb-3">--}%
%{--                <span class="status-badge status-${report.status}">--}%
%{--                  ${report.status}--}%
%{--                </span>--}%

%{--                <small class="text-muted">--}%
%{--                  <i class="fas fa-calendar-alt me-1"></i>--}%
%{--                  Week ${report.weekNumber}--}%
%{--                </small>--}%
%{--              </div>--}%


%{--              <!-- Intern -->--}%
%{--              <div class="d-flex align-items-center mb-3">--}%
%{--                <div class="avatar-sm me-3">--}%
%{--                  ${report.intern?.user?.initials ?: 'U'}--}%
%{--                </div>--}%

%{--                <div>--}%
%{--                  <h6 class="mb-1">${report.intern?.user?.fullName}</h6>--}%
%{--                  <small class="text-muted">--}%
%{--                    <i class="fas fa-building me-1"></i>--}%
%{--                    ${report.intern?.university ?: 'N/A'}--}%
%{--                  </small>--}%
%{--                </div>--}%
%{--              </div>--}%


%{--              <!-- Details -->--}%
%{--              <div class="mb-3">--}%
%{--                <div class="small text-muted mb-2">--}%
%{--                  <i class="fas fa-clock me-1"></i>--}%
%{--                  Submitted:--}%
%{--                  <g:formatDate date="${report.reportDate}" format="dd MMM yyyy"/>--}%
%{--                </div>--}%

%{--                <p class="small mb-0 text-truncate">--}%
%{--                  ${report.accomplishments?.truncate(100) ?: 'No description'}--}%
%{--                </p>--}%
%{--              </div>--}%


%{--              <!-- Info -->--}%
%{--              <div class="d-flex justify-content-between mb-3">--}%

%{--                <div>--}%
%{--                  <span class="badge bg-light text-dark me-2">--}%
%{--                    <i class="fas fa-paperclip me-1"></i>--}%
%{--                    ${report.attachments?.size() ?: 0}--}%
%{--                  </span>--}%

%{--                  <span class="badge bg-light text-dark">--}%
%{--                    <i class="fas fa-clock me-1"></i>--}%
%{--                    ${report.hoursWorked ?: 0}h--}%
%{--                  </span>--}%
%{--                </div>--}%

%{--                <small class="text-${report.reviewedDate ? 'success' : 'warning'}">--}%
%{--                  <i class="fas ${report.reviewedDate ? 'fa-check-circle' : 'fa-clock'}"></i>--}%
%{--                  ${report.reviewedDate ? 'Reviewed' : 'Pending'}--}%
%{--                </small>--}%
%{--              </div>--}%


%{--              <!-- Actions -->--}%
%{--              <div class="d-flex gap-2">--}%

%{--                <g:link controller="weeklyReport" action="show" id="${report.id}"--}%
%{--                        class="btn btn-outline-primary btn-sm flex-grow-1">--}%
%{--                  <i class="fas fa-eye me-1"></i>--}%
%{--                  View--}%
%{--                </g:link>--}%

%{--                <sec:ifGranted roles="ROLE_SUPERVISOR">--}%
%{--                  <g:if test="${report.status == 'SUBMITTED'}">--}%
%{--                    <g:link controller="weeklyReport" action="reviewReport" id="${report.id}"--}%
%{--                            class="btn btn-outline-success btn-sm flex-grow-1">--}%
%{--                      <i class="fas fa-check-circle me-1"></i>--}%
%{--                      Review--}%
%{--                    </g:link>--}%
%{--                  </g:if>--}%
%{--                </sec:ifGranted>--}%

%{--                <sec:ifGranted roles="ROLE_INTERN">--}%
%{--                  <g:if test="${report.isSubmitted()}">--}%
%{--                    <g:link controller="weeklyReport" action="edit" id="${report.id}"--}%
%{--                            class="btn btn-outline-warning btn-sm">--}%
%{--                      <i class="fas fa-edit"></i>--}%
%{--                    </g:link>--}%
%{--                  </g:if>--}%
%{--                </sec:ifGranted>--}%

%{--              </div>--}%

%{--            </div>--}%
%{--          </div>--}%

%{--        </div>--}%
%{--      </g:each>--}%

%{--    </div>--}%
%{--  </g:if>--}%

%{--<!-- Empty -->--}%
%{--  <g:else>--}%
%{--    <div class="text-center py-5">--}%

%{--      <i class="fas fa-file-alt fa-4x text-muted mb-3"></i>--}%
%{--      <h5 class="text-muted">No reports found</h5>--}%

%{--      <sec:ifGranted roles="ROLE_INTERN">--}%
%{--        <p class="text-muted mb-3">You haven't submitted any reports yet.</p>--}%

%{--        <g:link controller="weeklyReport" action="create" class="btn btn-primary">--}%
%{--          <i class="fas fa-plus-circle me-2"></i>--}%
%{--          Submit First Report--}%
%{--        </g:link>--}%
%{--      </sec:ifGranted>--}%

%{--    </div>--}%
%{--  </g:else>--}%

%{--</div>--}%


%{--</html>--}%
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Weekly Reports - InternTrack</title>
  <style>
  .report-card {
    background: white;
    border-radius: 10px;
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
    margin-bottom: 15px;
    padding: 20px;
  }
  .report-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 20px rgba(0,0,0,0.12);
    border-color: #667eea;
  }
  .status-badge {
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
  }
  .status-SUBMITTED { background-color: #ffc107; color: #212529; }
  .status-UNDER_REVIEW { background-color: #17a2b8; color: white; }
  .status-APPROVED { background-color: #28a745; color: white; }
  .status-REJECTED { background-color: #dc3545; color: white; }
  </style>
</head>

<div class="container-fluid mt-4">
  <!-- Header -->
  <div class="d-flex justify-content-between align-items-center mb-4">
    <div>
      <h2><i class="fas fa-file-alt me-2 text-primary"></i>Weekly Reports</h2>
      <p class="text-muted">View and manage all weekly reports</p>
    </div>

  <!-- New Report Button - فقط للمتدرب -->
    <g:if test="${session?.roles?.contains('ROLE_INTERN')}">
      <g:link controller="weeklyReport" action="create" class="btn btn-primary">
        <i class="fas fa-plus me-2"></i>New Report
      </g:link>
    </g:if>
  </div>

  <!-- Filters -->
  <div class="card mb-4">
    <div class="card-body">
      <div class="row g-3">
        <div class="col-md-3">
          <label class="form-label">Status</label>
          <select class="form-select" id="statusFilter">
            <option value="">All Status</option>
            <g:each in="${statusList}" var="status">
              <option value="${status}">${status}</option>
            </g:each>
          </select>
        </div>
        <div class="col-md-3">
          <label class="form-label">Week Number</label>
          <input type="number" class="form-control" id="weekFilter" placeholder="Week number">
        </div>
        <div class="col-md-3">
          <label class="form-label">From Date</label>
          <input type="date" class="form-control" id="dateFilter">
        </div>
        <div class="col-md-3 d-flex align-items-end">
          <button class="btn btn-primary w-100" onclick="applyFilters()">
            <i class="fas fa-filter me-2"></i>Apply Filters
          </button>
        </div>
      </div>
    </div>
  </div>

<!-- Reports List -->
  <g:if test="${reportList}">
    <div class="row">
      <g:each in="${reportList}" var="report">
        <div class="col-md-6 col-lg-4">
          <div class="report-card">
            <div class="d-flex justify-content-between align-items-start mb-3">
              <div>
                <h5 class="mb-1">Week ${report.weekNumber}</h5>
                <small class="text-muted">
                  <g:formatDate date="${report.weekStartDate}" format="dd MMM"/> -
                  <g:formatDate date="${report.weekEndDate}" format="dd MMM yyyy"/>
                </small>
              </div>
              <span class="status-badge status-${report.status}">
                ${report.status}
              </span>
            </div>

            <p class="text-muted small mb-3">
              <i class="fas fa-clock me-1"></i>${report.hoursWorked ?: 0} hours
            </p>

            <p class="mb-3">
              ${report.accomplishments?.length() > 100 ? report.accomplishments.substring(0, 100) + '...' : report.accomplishments}
            </p>

            <div class="d-flex justify-content-between align-items-center">
              <small class="text-muted">
                <i class="fas fa-calendar me-1"></i>
                Submitted: <g:formatDate date="${report.reportDate}" format="dd MMM yyyy"/>
              </small>
              <g:link controller="weeklyReport" action="show" id="${report.id}" class="btn btn-sm btn-outline-primary">
                <i class="fas fa-eye me-1"></i>View
              </g:link>
            </div>

            <g:if test="${report.supervisorComments}">
              <div class="mt-3 pt-3 border-top">
                <small class="text-muted">
                  <i class="fas fa-comment me-1"></i>
                  ${report.supervisorComments?.length() > 50 ? report.supervisorComments.substring(0, 50) + '...' : report.supervisorComments}
                </small>
              </div>
            </g:if>
          </div>
        </div>
      </g:each>
    </div>
  </g:if>
  <g:else>
    <div class="text-center py-5">
      <i class="fas fa-file-alt fa-4x text-muted mb-3"></i>
      <h4 class="text-muted">No Reports Found</h4>
      <p class="text-muted">There are no weekly reports to display.</p>
      <g:if test="${session?.roles?.contains('ROLE_INTERN')}">
        <g:link controller="weeklyReport" action="create" class="btn btn-primary mt-3">
          <i class="fas fa-plus me-2"></i>Create Your First Report
        </g:link>
      </g:if>
    </div>
  </g:else>
</div>

<script>
  function applyFilters() {
    const status = document.getElementById('statusFilter').value;
    const week = document.getElementById('weekFilter').value;
    const date = document.getElementById('dateFilter').value;

    let url = '${createLink(controller: "weeklyReport", action: "index")}';
    let params = [];

    if (status) params.push('status=' + encodeURIComponent(status));
    if (week) params.push('week=' + encodeURIComponent(week));
    if (date) params.push('date=' + encodeURIComponent(date));

    if (params.length > 0) {
      url += '?' + params.join('&');
    }

    window.location.href = url;
  }

  // Auto-submit filters when dropdown changes
  document.getElementById('statusFilter').addEventListener('change', applyFilters);
</script>


</html>