<%--
  Created by IntelliJ IDEA.
  User: Eng.Hanan Awad
  Date: 2/11/2026
  Time: 2:29 PM
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
  <title>Interns List - InternTrack</title>
  <style>
  .page-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
  }

  .page-title h1 {
    color: #2C3E50;
    font-weight: 700;
    margin: 0;
  }

  .page-title p {
    color: #7F8C8D;
    margin: 5px 0 0;
  }

  .btn-create {
    background: linear-gradient(135deg, #1ABC9C, #16A085);
    color: white;
    padding: 12px 24px;
    border-radius: 8px;
    text-decoration: none;
    display: flex;
    align-items: center;
    gap: 8px;
    font-weight: 600;
    transition: all 0.3s;
  }

  .btn-create:hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(26, 188, 156, 0.3);
    color: white;
  }

  .interns-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
    gap: 20px;
  }

  .intern-card {
    background: white;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    padding: 20px;
    transition: all 0.3s;
    border: 1px solid #ECF0F1;
  }

  .intern-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 20px rgba(0,0,0,0.1);
    border-color: #1ABC9C;
  }

  .card-header {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 15px;
  }

  .avatar {
    width: 50px;
    height: 50px;
    background: linear-gradient(135deg, #3498DB, #2980B9);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: bold;
    font-size: 20px;
  }

  .info {
    flex: 1;
  }

  .name {
    font-size: 16px;
    font-weight: 600;
    color: #2C3E50;
    margin: 0 0 5px;
  }

  .student-id {
    font-size: 13px;
    color: #7F8C8D;
    margin: 0;
    display: flex;
    align-items: center;
    gap: 5px;
  }

  .card-body {
    margin-bottom: 15px;
  }

  .detail-row {
    display: flex;
    margin-bottom: 8px;
    font-size: 13px;
  }

  .detail-label {
    width: 100px;
    color: #7F8C8D;
  }

  .detail-value {
    color: #2C3E50;
    font-weight: 500;
  }

  .card-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 15px;
    padding-top: 15px;
    border-top: 1px solid #ECF0F1;
  }

  .status-badge {
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
  }

  .status-ACTIVE {
    background: #d4edda;
    color: #155724;
  }

  .status-COMPLETED {
    background: #cce5ff;
    color: #004085;
  }

  .status-TERMINATED {
    background: #f8d7da;
    color: #721c24;
  }

  .btn-view {
    padding: 6px 16px;
    background: #ECF0F1;
    color: #2C3E50;
    border-radius: 6px;
    text-decoration: none;
    font-size: 13px;
    font-weight: 600;
    transition: all 0.3s;
  }

  .btn-view:hover {
    background: #1ABC9C;
    color: white;
  }

  .empty-state {
    text-align: center;
    padding: 60px 20px;
    background: white;
    border-radius: 12px;
    color: #7F8C8D;
  }

  .empty-state i {
    font-size: 48px;
    margin-bottom: 20px;
    color: #BDC3C7;
  }

  .empty-state h3 {
    color: #2C3E50;
    margin-bottom: 10px;
  }
  </style>
</head>

<div class="page-header">
  <div class="page-title">
    <h1><i class="fas fa-users"></i> Interns</h1>
    <p>${internCount} total interns</p>
  </div>

  <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_SUPERVISOR">
    <g:link controller="intern" action="create" class="btn-create">
      <i class="fas fa-plus-circle"></i> Add New Intern
    </g:link>
  </sec:ifAnyGranted>
</div>

<g:if test="${flash.message}">
  <div class="alert alert-success" style="margin-bottom: 20px;">
    <i class="fas fa-check-circle"></i> ${flash.message}
  </div>
</g:if>

<g:if test="${internList}">
  <div class="interns-grid">
    <g:each in="${internList}" var="intern">
      <div class="intern-card">
        <div class="card-header">
          <div class="avatar">
            ${intern.user?.fullName?.split(' ').collect { it[0] }.join()?.toUpperCase() ?: 'I'}
          </div>
          <div class="info">
            <h3 class="name">${intern.user?.fullName}</h3>
            <p class="student-id">
              <i class="fas fa-id-card"></i> ${intern.studentId}
            </p>
          </div>
        </div>

        <div class="card-body">
          <div class="detail-row">
            <span class="detail-label"><i class="fas fa-university"></i> University:</span>
            <span class="detail-value">${intern.university}</span>
          </div>
          <div class="detail-row">
            <span class="detail-label"><i class="fas fa-book"></i> Major:</span>
            <span class="detail-value">${intern.major}</span>
          </div>
          <div class="detail-row">
            <span class="detail-label"><i class="fas fa-user-tie"></i> Supervisor:</span>
            <span class="detail-value">${intern.supervisor?.user?.fullName}</span>
          </div>
          <div class="detail-row">
            <span class="detail-label"><i class="fas fa-calendar"></i> End Date:</span>
            <span class="detail-value">
              <g:formatDate date="${intern.endDate}" format="dd/MM/yyyy"/>
              <g:if test="${intern.status == 'ACTIVE'}">
                (${intern.remainingDays} days)
              </g:if>
            </span>
          </div>
        </div>

        <div class="card-footer">
          <span class="status-badge status-${intern.status}">
            ${intern.status}
          </span>
          <g:link controller="intern" action="show" id="${intern.id}" class="btn-view">
            View Details <i class="fas fa-arrow-right"></i>
          </g:link>
        </div>
      </div>
    </g:each>
  </div>
</g:if>
<g:else>
  <div class="empty-state">
    <i class="fas fa-user-graduate"></i>
    <h3>No Interns Found</h3>
    <p>Get started by adding your first intern.</p>
    <g:link controller="intern" action="create" class="btn-create" style="display: inline-flex; margin-top: 20px;">
      <i class="fas fa-plus-circle"></i> Add New Intern
    </g:link>
  </div>
</g:else>

</html>