<%--
  Created by IntelliJ IDEA.
  User: Eng.Hanan Awad
  Date: 2/12/2026
  Time: 11:52 AM
--%>

<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <meta name="active-evaluations" content="true"/>
  <title>Evaluation Details - InternTrack</title>

  <style>
  .score-circle {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2.5rem;
    font-weight: bold;
    margin: 0 auto 20px;
  }

  .criterion-item {
    padding: 15px;
    border-bottom: 1px solid #eaeaea;
  }

  .criterion-item:last-child {
    border-bottom: none;
  }
  </style>
</head>

<div class="container-fluid">
  <!-- Breadcrumb -->
  <div class="mb-3">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><g:link controller="dashboard" action="index">Dashboard</g:link></li>
        <li class="breadcrumb-item"><g:link controller="evaluation" action="index">Evaluations</g:link></li>
        <li class="breadcrumb-item active">Evaluation</li>
      </ol>
    </nav>
  </div>

  <div class="row">
    <div class="col-md-4">
      <!-- Score Card -->
      <div class="card mb-4">
        <div class="card-body text-center">
          <div class="score-circle ${evaluation.overallScore >= 80 ? 'bg-success' :
                  evaluation.overallScore >= 60 ? 'bg-warning' : 'bg-danger'} text-white">
            ${evaluation.overallScore}
          </div>
          <h4>Overall Score</h4>
          <p class="text-muted mb-0">${evaluation.overallScore >= 80 ? 'Excellent' :
                  evaluation.overallScore >= 60 ? 'Good' : 'Needs Improvement'}</p>
        </div>
      </div>

      <!-- Intern Info -->
      <div class="card mb-4">
        <div class="card-header">
          <h5 class="mb-0">Intern Information</h5>
        </div>
        <div class="card-body">
          <div class="d-flex align-items-center mb-3">
            <div class="avatar-lg me-3">
              ${evaluation.intern?.user?.initials ?: 'U'}
            </div>
            <div>
              <h6 class="mb-1">${evaluation.intern?.user?.fullName}</h6>
              <small class="text-muted">${evaluation.intern?.studentId}</small>
            </div>
          </div>
          <table class="table table-sm">
            <tr>
              <td class="text-muted">University:</td>
              <td>${evaluation.intern?.university}</td>
            </tr>
            <tr>
              <td class="text-muted">Major:</td>
              <td>${evaluation.intern?.major}</td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="col-md-8">
      <!-- Evaluation Details -->
      <div class="card mb-4">
        <div class="card-header d-flex justify-content-between align-items-center">
          <h5 class="mb-0">Evaluation Criteria</h5>
          <span class="badge bg-primary">${evaluation.evaluatorName}</span>
        </div>
        <div class="card-body p-0">
          <div class="criterion-item d-flex justify-content-between">
            <span>Technical Skills</span>
            <span class="fw-bold">${evaluation.technicalScore}/100</span>
          </div>
          <div class="criterion-item d-flex justify-content-between">
            <span>Communication Skills</span>
            <span class="fw-bold">${evaluation.communicationScore}/100</span>
          </div>
          <div class="criterion-item d-flex justify-content-between">
            <span>Teamwork</span>
            <span class="fw-bold">${evaluation.teamworkScore}/100</span>
          </div>
          <div class="criterion-item d-flex justify-content-between">
            <span>Initiative</span>
            <span class="fw-bold">${evaluation.initiativeScore}/100</span>
          </div>
          <div class="criterion-item d-flex justify-content-between">
            <span>Quality of Work</span>
            <span class="fw-bold">${evaluation.qualityScore}/100</span>
          </div>
        </div>
      </div>

      <!-- Comments -->
      <div class="card mb-4">
        <div class="card-header">
          <h5 class="mb-0">Comments & Feedback</h5>
        </div>
        <div class="card-body">
          <p class="mb-0">${evaluation.comments ?: 'No comments provided.'}</p>
          <hr>
          <small class="text-muted">
            Evaluated on <g:formatDate date="${evaluation.evaluationDate}" format="dd MMMM yyyy"/>
          </small>
        </div>
      </div>

      <!-- Actions -->
      <div class="d-flex gap-2">
        <g:link controller="evaluation" action="edit" id="${evaluation.id}" class="btn btn-warning">
          <i class="fas fa-edit me-2"></i>
          Edit Evaluation
        </g:link>
        <g:link controller="evaluation" action="delete" id="${evaluation.id}" class="btn btn-danger"
                onclick="return confirm('Are you sure you want to delete this evaluation?');">
          <i class="fas fa-trash me-2"></i>
          Delete Evaluation
        </g:link>
      </div>
    </div>
  </div>
</div>

</html>