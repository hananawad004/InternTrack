%{--<%----}%
%{--  Created by IntelliJ IDEA.--}%
%{--  User: Eng.Hanan Awad--}%
%{--  Date: 2/12/2026--}%
%{--  Time: 11:52 AM--}%
%{----%>--}%

%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--  <meta name="layout" content="main"/>--}%
%{--  <meta name="active-evaluations" content="true"/>--}%
%{--  <title>Evaluation Details - InternTrack</title>--}%

%{--  <style>--}%
%{--  .score-circle {--}%
%{--    width: 120px;--}%
%{--    height: 120px;--}%
%{--    border-radius: 50%;--}%
%{--    display: flex;--}%
%{--    align-items: center;--}%
%{--    justify-content: center;--}%
%{--    font-size: 2.5rem;--}%
%{--    font-weight: bold;--}%
%{--    margin: 0 auto 20px;--}%
%{--  }--}%

%{--  .criterion-item {--}%
%{--    padding: 15px;--}%
%{--    border-bottom: 1px solid #eaeaea;--}%
%{--  }--}%

%{--  .criterion-item:last-child {--}%
%{--    border-bottom: none;--}%
%{--  }--}%
%{--  </style>--}%
%{--</head>--}%

%{--<div class="container-fluid">--}%
%{--  <!-- Breadcrumb -->--}%
%{--  <div class="mb-3">--}%
%{--    <nav aria-label="breadcrumb">--}%
%{--      <ol class="breadcrumb">--}%
%{--        <li class="breadcrumb-item"><g:link controller="dashboard" action="index">Dashboard</g:link></li>--}%
%{--        <li class="breadcrumb-item"><g:link controller="evaluation" action="index">Evaluations</g:link></li>--}%
%{--        <li class="breadcrumb-item active">Evaluation</li>--}%
%{--      </ol>--}%
%{--    </nav>--}%
%{--  </div>--}%

%{--  <div class="row">--}%
%{--    <div class="col-md-4">--}%
%{--      <!-- Score Card -->--}%
%{--      <div class="card mb-4">--}%
%{--        <div class="card-body text-center">--}%
%{--          <div class="score-circle ${evaluation.overallScore >= 80 ? 'bg-success' :--}%
%{--                  evaluation.overallScore >= 60 ? 'bg-warning' : 'bg-danger'} text-white">--}%
%{--            ${evaluation.overallScore}--}%
%{--          </div>--}%
%{--          <h4>Overall Score</h4>--}%
%{--          <p class="text-muted mb-0">${evaluation.overallScore >= 80 ? 'Excellent' :--}%
%{--                  evaluation.overallScore >= 60 ? 'Good' : 'Needs Improvement'}</p>--}%
%{--        </div>--}%
%{--      </div>--}%

%{--      <!-- Intern Info -->--}%
%{--      <div class="card mb-4">--}%
%{--        <div class="card-header">--}%
%{--          <h5 class="mb-0">Intern Information</h5>--}%
%{--        </div>--}%
%{--        <div class="card-body">--}%
%{--          <div class="d-flex align-items-center mb-3">--}%
%{--            <div class="avatar-lg me-3">--}%
%{--              ${evaluation.intern?.user?.initials ?: 'U'}--}%
%{--            </div>--}%
%{--            <div>--}%
%{--              <h6 class="mb-1">${evaluation.intern?.user?.fullName}</h6>--}%
%{--              <small class="text-muted">${evaluation.intern?.studentId}</small>--}%
%{--            </div>--}%
%{--          </div>--}%
%{--          <table class="table table-sm">--}%
%{--            <tr>--}%
%{--              <td class="text-muted">University:</td>--}%
%{--              <td>${evaluation.intern?.university}</td>--}%
%{--            </tr>--}%
%{--            <tr>--}%
%{--              <td class="text-muted">Major:</td>--}%
%{--              <td>${evaluation.intern?.major}</td>--}%
%{--            </tr>--}%
%{--          </table>--}%
%{--        </div>--}%
%{--      </div>--}%
%{--    </div>--}%

%{--    <div class="col-md-8">--}%
%{--      <!-- Evaluation Details -->--}%
%{--      <div class="card mb-4">--}%
%{--        <div class="card-header d-flex justify-content-between align-items-center">--}%
%{--          <h5 class="mb-0">Evaluation Criteria</h5>--}%
%{--          <span class="badge bg-primary">${evaluation.evaluatorName}</span>--}%
%{--        </div>--}%
%{--        <div class="card-body p-0">--}%
%{--          <div class="criterion-item d-flex justify-content-between">--}%
%{--            <span>Technical Skills</span>--}%
%{--            <span class="fw-bold">${evaluation.technicalScore}/100</span>--}%
%{--          </div>--}%
%{--          <div class="criterion-item d-flex justify-content-between">--}%
%{--            <span>Communication Skills</span>--}%
%{--            <span class="fw-bold">${evaluation.communicationScore}/100</span>--}%
%{--          </div>--}%
%{--          <div class="criterion-item d-flex justify-content-between">--}%
%{--            <span>Teamwork</span>--}%
%{--            <span class="fw-bold">${evaluation.teamworkScore}/100</span>--}%
%{--          </div>--}%
%{--          <div class="criterion-item d-flex justify-content-between">--}%
%{--            <span>Initiative</span>--}%
%{--            <span class="fw-bold">${evaluation.initiativeScore}/100</span>--}%
%{--          </div>--}%
%{--          <div class="criterion-item d-flex justify-content-between">--}%
%{--            <span>Quality of Work</span>--}%
%{--            <span class="fw-bold">${evaluation.qualityScore}/100</span>--}%
%{--          </div>--}%
%{--        </div>--}%
%{--      </div>--}%

%{--      <!-- Comments -->--}%
%{--      <div class="card mb-4">--}%
%{--        <div class="card-header">--}%
%{--          <h5 class="mb-0">Comments & Feedback</h5>--}%
%{--        </div>--}%
%{--        <div class="card-body">--}%
%{--          <p class="mb-0">${evaluation.comments ?: 'No comments provided.'}</p>--}%
%{--          <hr>--}%
%{--          <small class="text-muted">--}%
%{--            Evaluated on <g:formatDate date="${evaluation.evaluationDate}" format="dd MMMM yyyy"/>--}%
%{--          </small>--}%
%{--        </div>--}%
%{--      </div>--}%

%{--      <!-- Actions -->--}%
%{--      <div class="d-flex gap-2">--}%
%{--        <g:link controller="evaluation" action="edit" id="${evaluation.id}" class="btn btn-warning">--}%
%{--          <i class="fas fa-edit me-2"></i>--}%
%{--          Edit Evaluation--}%
%{--        </g:link>--}%
%{--        <g:link controller="evaluation" action="delete" id="${evaluation.id}" class="btn btn-danger"--}%
%{--                onclick="return confirm('Are you sure you want to delete this evaluation?');">--}%
%{--          <i class="fas fa-trash me-2"></i>--}%
%{--          Delete Evaluation--}%
%{--        </g:link>--}%
%{--      </div>--}%
%{--    </div>--}%
%{--  </div>--}%
%{--</div>--}%

%{--</html>--}%
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Evaluation Details - InternTrack</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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

  .info-card {
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

  .criteria-badge {
    display: inline-block;
    padding: 8px 16px;
    border-radius: 30px;
    font-weight: 600;
    margin: 5px;
  }

  .rating-EXCELLENT { background-color: #28a745; color: white; }
  .rating-VERY_GOOD { background-color: #17a2b8; color: white; }
  .rating-GOOD { background-color: #ffc107; color: #212529; }
  .rating-SATISFACTORY { background-color: #fd7e14; color: white; }
  .rating-NEEDS_IMPROVEMENT { background-color: #dc3545; color: white; }

  .recommendation-HIRE { background-color: #28a745; color: white; }
  .recommendation-EXTEND { background-color: #17a2b8; color: white; }
  .recommendation-CONDITIONAL { background-color: #ffc107; color: #212529; }
  .recommendation-NOT_RECOMMEND { background-color: #dc3545; color: white; }

  .score-badge {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 1.2rem;
  }

  .score-high { background-color: #28a745; color: white; }
  .score-medium { background-color: #ffc107; color: #212529; }
  .score-low { background-color: #dc3545; color: white; }

  .attachment-item {
    display: flex;
    align-items: center;
    padding: 12px;
    border: 1px solid #e2e8f0;
    border-radius: 8px;
    margin-bottom: 10px;
    transition: all 0.3s;
  }

  .attachment-item:hover {
    background-color: #f8fafc;
    border-color: #667eea;
  }
  </style>
</head>

<div class="container-fluid">
  <!-- Header -->
  <div class="page-header">
    <div class="d-flex justify-content-between align-items-center">
      <div>
        <h2 class="mb-2">
          <i class="fas fa-star me-2"></i>
          Evaluation Details
        </h2>
        <p class="mb-0 opacity-75">View intern evaluation and feedback</p>
      </div>
      <div>
        <g:link controller="evaluation" action="index" class="btn btn-light me-2">
          <i class="fas fa-list me-2"></i>All Evaluations
        </g:link>
        <g:link controller="dashboard" action="supervisor" class="btn btn-light">
          <i class="fas fa-arrow-left me-2"></i>Dashboard
        </g:link>
      </div>
    </div>
  </div>

<!-- Flash Messages -->
  <g:if test="${flash.message}">
    <div class="alert alert-success alert-dismissible fade show">
      <i class="fas fa-check-circle me-2"></i>${flash.message}
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </g:if>

<!-- Intern Info -->
  <div class="info-card">
    <div class="row">
      <div class="col-md-8">
        <h4 class="mb-3">${evaluation.intern?.user?.fullName}</h4>
        <div class="row">
          <div class="col-md-6">
            <p><strong><i class="fas fa-university me-2"></i>University:</strong> ${evaluation.intern?.university}</p>
            <p><strong><i class="fas fa-graduation-cap me-2"></i>Major:</strong> ${evaluation.intern?.major}</p>
          </div>
          <div class="col-md-6">
            <p><strong><i class="fas fa-id-card me-2"></i>Student ID:</strong> ${evaluation.intern?.studentId}</p>
            <p><strong><i class="fas fa-calendar me-2"></i>Period:</strong>
              <g:formatDate date="${evaluation.periodStart}" format="dd/MM/yyyy"/> -
              <g:formatDate date="${evaluation.periodEnd}" format="dd/MM/yyyy"/>
            </p>
          </div>
        </div>
      </div>
      <div class="col-md-4 text-end">
        <div class="d-inline-block p-3 bg-light rounded">
          <div class="mb-2"><strong>Evaluation Date:</strong></div>
          <div><g:formatDate date="${evaluation.evaluationDate}" format="dd MMMM yyyy"/></div>
          <div class="mt-2"><strong>Evaluator:</strong> ${evaluation.evaluatorName}</div>
        </div>
      </div>
    </div>
  </div>

  <!-- Scores -->
  <div class="row">
    <div class="col-md-8">
      <!-- Performance Criteria Scores -->
      <div class="info-card">
        <h5 class="section-title">
          <i class="fas fa-chart-line me-2 text-primary"></i>
          Performance Scores
        </h5>

        <div class="row">
          <div class="col-md-6">
            <table class="table table-borderless">
              <tr>
                <td><strong>Technical Skills:</strong></td>
                <td>
                  <span class="badge bg-primary">${evaluation.technicalSkills}/5</span>
                </td>
              </tr>
              <tr>
                <td><strong>Communication Skills:</strong></td>
                <td>
                  <span class="badge bg-success">${evaluation.communicationSkills}/5</span>
                </td>
              </tr>
              <tr>
                <td><strong>Problem Solving:</strong></td>
                <td>
                  <span class="badge bg-warning">${evaluation.problemSolving}/5</span>
                </td>
              </tr>
            </table>
          </div>
          <div class="col-md-6">
            <table class="table table-borderless">
              <tr>
                <td><strong>Initiative:</strong></td>
                <td>
                  <span class="badge bg-info">${evaluation.initiative}/5</span>
                </td>
              </tr>
              <tr>
                <td><strong>Teamwork:</strong></td>
                <td>
                  <span class="badge bg-danger">${evaluation.teamwork}/5</span>
                </td>
              </tr>
              <tr>
                <td><strong>Total Score:</strong></td>
                <td>
                  <g:set var="totalScore" value="${(evaluation.technicalSkills * 0.3) + (evaluation.communicationSkills * 0.2) + (evaluation.problemSolving * 0.2) + (evaluation.initiative * 0.15) + (evaluation.teamwork * 0.15)}"/>
                  <span class="badge ${totalScore >= 4 ? 'bg-success' : totalScore >= 3 ? 'bg-warning' : 'bg-danger'}">
                    ${totalScore.round(1)}/5
                  </span>
                </td>
              </tr>
            </table>
          </div>
        </div>
      </div>

      <!-- Comments -->
      <div class="info-card">
        <h5 class="section-title">
          <i class="fas fa-comment me-2 text-primary"></i>
          Feedback & Comments
        </h5>

        <g:if test="${evaluation.strengths}">
          <div class="mb-4">
            <h6 class="text-success"><i class="fas fa-plus-circle me-2"></i>Strengths</h6>
            <p class="bg-light p-3 rounded">${evaluation.strengths}</p>
          </div>
        </g:if>

        <g:if test="${evaluation.improvements}">
          <div class="mb-4">
            <h6 class="text-warning"><i class="fas fa-exclamation-triangle me-2"></i>Areas for Improvement</h6>
            <p class="bg-light p-3 rounded">${evaluation.improvements}</p>
          </div>
        </g:if>

        <g:if test="${evaluation.generalComments}">
          <div class="mb-4">
            <h6 class="text-info"><i class="fas fa-comment-dots me-2"></i>General Comments</h6>
            <p class="bg-light p-3 rounded">${evaluation.generalComments}</p>
          </div>
        </g:if>
      </div>
    </div>

    <div class="col-md-4">
      <!-- Overall Rating -->
      <div class="info-card">
        <h5 class="section-title">
          <i class="fas fa-star me-2 text-primary"></i>
          Overall Rating
        </h5>

        <div class="text-center mb-4">
          <span class="criteria-badge rating-${evaluation.overallRating} fs-5">
            ${evaluation.overallRating?.replace('_', ' ')}
          </span>
        </div>

        <h5 class="section-title mt-4">
          <i class="fas fa-gavel me-2 text-primary"></i>
          Recommendation
        </h5>

        <div class="text-center">
          <span class="criteria-badge recommendation-${evaluation.recommendation} fs-5">
            ${evaluation.recommendation?.replace('_', ' ')}
          </span>
        </div>
      </div>

    <!-- Attachments -->
      <g:if test="${evaluation.attachments}">
        <div class="info-card">
          <h5 class="section-title">
            <i class="fas fa-paperclip me-2 text-primary"></i>
            Attachments (${evaluation.attachments.size()})
          </h5>

          <div class="attachment-list">
            <g:each in="${evaluation.attachments}" var="attachment">
              <div class="attachment-item">
                <div class="flex-grow-1">
                  <div class="d-flex align-items-center">
                    <i class="fas fa-file-alt me-2 text-primary"></i>
                    <strong>${attachment.fileName}</strong>
                  </div>
                  <small class="text-muted">
                    <g:formatDate date="${attachment.dateUploaded}" format="dd MMM yyyy"/>
                  </small>
                </div>
                <a href="${createLink(controller: 'attachment', action: 'download', id: attachment.id)}"
                   class="btn btn-sm btn-outline-primary ms-3">
                  <i class="fas fa-download"></i>
                </a>
              </div>
            </g:each>
          </div>
        </div>
      </g:if>

    <!-- Actions -->
      <div class="info-card">
        <h5 class="section-title">
          <i class="fas fa-cog me-2 text-primary"></i>
          Actions
        </h5>

        <div class="d-grid gap-2">
          <g:link controller="evaluation" action="edit" id="${evaluation.id}" class="btn btn-warning">
            <i class="fas fa-edit me-2"></i>Edit Evaluation
          </g:link>

          <g:link controller="evaluation" action="delete" id="${evaluation.id}"
                  class="btn btn-danger"
                  onclick="return confirm('Are you sure you want to delete this evaluation?');">
            <i class="fas fa-trash me-2"></i>Delete Evaluation
          </g:link>

          <button onclick="window.print()" class="btn btn-outline-secondary">
            <i class="fas fa-print me-2"></i>Print Evaluation
          </button>
        </div>
      </div>
    </div>
  </div>
</div>

</html>