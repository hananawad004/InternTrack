<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <meta name="active-interns" content="true"/>
  <title>Intern Profile - InternTrack</title>

  <style>
  .profile-header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 30px;
    border-radius: 10px;
    margin-bottom: 25px;
  }

  .stat-box {
    background: white;
    border-radius: 10px;
    padding: 20px;
    text-align: center;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
  }

  .stat-number {
    font-size: 2rem;
    font-weight: 700;
    color: #667eea;
  }
  </style>
</head>

<div class="container-fluid">
  <!-- Profile Header -->
  <div class="profile-header">
    <div class="d-flex justify-content-between align-items-center">
      <div class="d-flex align-items-center">
        <div class="avatar-lg me-4 bg-white text-primary" style="font-size: 2.5rem;">
          ${intern.user?.initials ?: 'U'}
        </div>
        <div>
          <h1 class="mb-2">${intern.user?.fullName}</h1>
          <p class="mb-1">${intern.university} - ${intern.major}</p>
          <p class="mb-0">Student ID: ${intern.studentId}</p>
        </div>
      </div>
      <span class="badge bg-light text-dark p-3">
        <i class="fas fa-calendar me-2"></i>
        ${intern.remainingDays} days remaining
      </span>
    </div>
  </div>

  <!-- Statistics -->
  <div class="row mb-4">
    <div class="col-md-3">
      <div class="stat-box">
        <div class="stat-number">${taskStats?.completed ?: 0}/${taskStats?.total ?: 0}</div>
        <div class="text-muted">Tasks Completed</div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="stat-box">
        <div class="stat-number">${reportStats?.approved ?: 0}/${reportStats?.total ?: 0}</div>
        <div class="text-muted">Reports Approved</div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="stat-box">
        <div class="stat-number">${evalStats?.averageScore ?: 0}%</div>
        <div class="text-muted">Average Score</div>
      </div>
    </div>
    <div class="col-md-3">
      <div class="stat-box">
        <div class="stat-number">${intern.totalHours ?: 0}</div>
        <div class="text-muted">Total Hours</div>
      </div>
    </div>
  </div>

  <div class="row">
    <!-- Personal Info -->
    <div class="col-md-4">
      <div class="card mb-4">
        <div class="card-header">
          <h5 class="mb-0">Personal Information</h5>
        </div>
        <div class="card-body">
          <table class="table table-sm">
            <tr>
              <td class="text-muted">Email:</td>
              <td>${intern.user?.email}</td>
            </tr>
            <tr>
              <td class="text-muted">Phone:</td>
              <td>${intern.emergencyPhone ?: 'N/A'}</td>
            </tr>
            <tr>
              <td class="text-muted">Emergency Contact:</td>
              <td>${intern.emergencyContact ?: 'N/A'}</td>
            </tr>
            <tr>
              <td class="text-muted">Department:</td>
              <td>${intern.department ?: 'N/A'}</td>
            </tr>
            <tr>
              <td class="text-muted">Year of Study:</td>
              <td>${intern.yearOfStudy ?: 'N/A'}</td>
            </tr>
          </table>
        </div>
      </div>

      <!-- Internship Period -->
      <div class="card mb-4">
        <div class="card-header">
          <h5 class="mb-0">Internship Period</h5>
        </div>
        <div class="card-body">
          <div class="mb-3">
            <label class="text-muted small">Start Date</label>
            <p class="fw-bold"><g:formatDate date="${intern.startDate}" format="dd MMMM yyyy"/></p>
          </div>
          <div class="mb-3">
            <label class="text-muted small">End Date</label>
            <p class="fw-bold"><g:formatDate date="${intern.endDate}" format="dd MMMM yyyy"/></p>
          </div>
          <div class="progress" style="height: 10px;">
            <div class="progress-bar" style="width: ${intern.remainingDays < 0 ? 100 : (60 - intern.remainingDays) * 100 / 60}%"></div>
          </div>
        </div>
      </div>
    </div>

    <!-- Recent Activity -->
    <div class="col-md-8">
      <!-- Tasks -->
      <div class="card mb-4">
        <div class="card-header d-flex justify-content-between">
          <h5 class="mb-0">Recent Tasks</h5>
          <g:link controller="task" action="create" params="[internId: intern.id]" class="btn btn-sm btn-primary">
            <i class="fas fa-plus"></i> Add Task
          </g:link>
        </div>
        <div class="card-body">
          <g:if test="${recentTasks}">
            <div class="table-responsive">
              <table class="table table-sm">
                <thead>
                <tr>
                  <th>Task</th>
                  <th>Due Date</th>
                  <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${recentTasks}" var="task">
                  <tr>
                    <td><g:link controller="task" action="show" id="${task.id}">${task.title}</g:link></td>
                    <td><g:formatDate date="${task.dueDate}" format="dd/MM/yyyy"/></td>
                    <td><span class="badge bg-${task.status == 'COMPLETED' ? 'success' : task.status == 'OVERDUE' ? 'danger' : 'warning'}">${task.status}</span></td>
                  </tr>
                </g:each>
                </tbody>
              </table>
            </div>
          </g:if>
          <g:else>
            <p class="text-muted text-center py-3 mb-0">No tasks assigned</p>
          </g:else>
        </div>
      </div>

      <!-- Reports -->
      <div class="card mb-4">
        <div class="card-header d-flex justify-content-between">
          <h5 class="mb-0">Weekly Reports</h5>
          <g:link controller="weeklyReport" action="create" params="[internId: intern.id]" class="btn btn-sm btn-primary">
            <i class="fas fa-plus"></i> New Report
          </g:link>
        </div>
        <div class="card-body">
          <g:if test="${recentReports}">
            <div class="table-responsive">
              <table class="table table-sm">
                <thead>
                <tr>
                  <th>Week</th>
                  <th>Date</th>
                  <th>Hours</th>
                  <th>Status</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${recentReports}" var="report">
                  <tr>
                    <td>Week ${report.weekNumber}</td>
                    <td><g:formatDate date="${report.reportDate}" format="dd/MM/yyyy"/></td>
                    <td>${report.hoursWorked}</td>
                    <td><span class="badge bg-${report.status == 'APPROVED' ? 'success' : report.status == 'REJECTED' ? 'danger' : 'warning'}">${report.status}</span></td>
                  </tr>
                </g:each>
                </tbody>
              </table>
            </div>
          </g:if>
          <g:else>
            <p class="text-muted text-center py-3 mb-0">No reports submitted</p>
          </g:else>
        </div>
      </div>
    </div>
  </div>

  <div class="d-flex gap-2 mb-4">
    <g:link controller="intern" action="edit" id="${intern.id}" class="btn btn-warning">
      <i class="fas fa-edit me-2"></i>
      Edit Profile
    </g:link>
    <g:link controller="evaluation" action="create" params="[internId: intern.id]" class="btn btn-success">
      <i class="fas fa-star me-2"></i>
      Add Evaluation
    </g:link>
  </div>
</div>

</html>