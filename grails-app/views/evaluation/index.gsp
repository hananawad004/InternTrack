%{--<%----}%
%{--  Created by IntelliJ IDEA.--}%
%{--  User: Eng.Hanan Awad--}%
%{--  Date: 2/12/2026--}%
%{--  Time: 11:43 AM--}%
%{----%>--}%

%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--  <meta name="layout" content="main"/>--}%
%{--  <meta name="active-evaluations" content="true"/>--}%
%{--  <title>Evaluations - InternTrack</title>--}%

%{--  <style>--}%
%{--  .evaluation-card {--}%
%{--    background: white;--}%
%{--    border-radius: 10px;--}%
%{--    box-shadow: 0 2px 10px rgba(0,0,0,0.08);--}%
%{--    margin-bottom: 20px;--}%
%{--    padding: 20px;--}%
%{--    border-left: 4px solid #ffc107;--}%
%{--    transition: all 0.3s;--}%
%{--  }--}%

%{--  .evaluation-card:hover {--}%
%{--    transform: translateY(-3px);--}%
%{--    box-shadow: 0 5px 20px rgba(0,0,0,0.12);--}%
%{--  }--}%

%{--  .score-badge {--}%
%{--    width: 60px;--}%
%{--    height: 60px;--}%
%{--    border-radius: 50%;--}%
%{--    display: flex;--}%
%{--    align-items: center;--}%
%{--    justify-content: center;--}%
%{--    font-weight: bold;--}%
%{--    font-size: 1.2rem;--}%
%{--  }--}%

%{--  .score-high { background: #28a745; color: white; }--}%
%{--  .score-medium { background: #ffc107; color: #212529; }--}%
%{--  .score-low { background: #dc3545; color: white; }--}%
%{--  </style>--}%
%{--</head>--}%

%{--<div class="container-fluid">--}%
%{--  <div class="d-flex justify-content-between align-items-center mb-4">--}%
%{--    <div>--}%
%{--      <h1 class="h3 mb-0">--}%
%{--        <i class="fas fa-star me-2 text-warning"></i>--}%
%{--        Evaluations--}%
%{--      </h1>--}%
%{--      <p class="text-muted mb-0">Intern performance evaluations</p>--}%
%{--    </div>--}%
%{--    <div>--}%
%{--      <g:link controller="evaluation" action="create" class="btn btn-primary">--}%
%{--        <i class="fas fa-plus-circle me-2"></i>--}%
%{--        New Evaluation--}%
%{--      </g:link>--}%
%{--    </div>--}%
%{--  </div>--}%

%{--  <g:if test="${evaluationList}">--}%
%{--    <div class="row">--}%
%{--      <g:each in="${evaluationList}" var="evaluation">--}%
%{--        <div class="col-md-6">--}%
%{--          <div class="evaluation-card">--}%
%{--            <div class="d-flex justify-content-between">--}%
%{--              <div>--}%
%{--                <h5 class="mb-1">${evaluation.intern?.user?.fullName}</h5>--}%
%{--                <p class="text-muted small mb-2">--}%
%{--                  ${evaluation.evaluatorName} •--}%
%{--                  <g:formatDate date="${evaluation.evaluationDate}" format="dd/MM/yyyy"/>--}%
%{--                </p>--}%
%{--              </div>--}%
%{--              <div class="score-badge--}%
%{--                                ${evaluation.overallScore >= 80 ? 'score-high' :--}%
%{--                      evaluation.overallScore >= 60 ? 'score-medium' : 'score-low'}">--}%
%{--                ${evaluation.overallScore}--}%
%{--              </div>--}%
%{--            </div>--}%
%{--            <div class="mt-2">--}%
%{--              <g:link controller="evaluation" action="show" id="${evaluation.id}"--}%
%{--                      class="btn btn-sm btn-outline-primary">--}%
%{--                <i class="fas fa-eye"></i> View Details--}%
%{--              </g:link>--}%
%{--            </div>--}%
%{--          </div>--}%
%{--        </div>--}%
%{--      </g:each>--}%
%{--    </div>--}%
%{--  </g:if>--}%
%{--  <g:else>--}%
%{--    <div class="text-center py-5">--}%
%{--      <i class="fas fa-star fa-4x text-muted mb-3"></i>--}%
%{--      <h5 class="text-muted">No evaluations found</h5>--}%
%{--    </div>--}%
%{--  </g:else>--}%
%{--</div>--}%

%{--</html>--}%
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Evaluations - InternTrack</title>

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

  .evaluation-card {
    background: white;
    border-radius: 10px;
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
    margin-bottom: 15px;
    padding: 20px;
  }

  .evaluation-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 20px rgba(0,0,0,0.12);
    border-color: #667eea;
  }

  .rating-badge {
    padding: 5px 10px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
  }

  .rating-EXCELLENT { background-color: #28a745; color: white; }
  .rating-VERY_GOOD { background-color: #17a2b8; color: white; }
  .rating-GOOD { background-color: #ffc107; color: #212529; }
  .rating-SATISFACTORY { background-color: #fd7e14; color: white; }
  .rating-NEEDS_IMPROVEMENT { background-color: #dc3545; color: white; }

  .filter-card {
    background: white;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    margin-bottom: 25px;
    padding: 20px;
    border: 1px solid #e2e8f0;
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
          Evaluations
        </h2>
        <p class="mb-0 opacity-75">View and manage intern evaluations</p>
      </div>
      <div>
        <g:link controller="dashboard" action="supervisor" class="btn btn-light me-2">
          <i class="fas fa-arrow-left me-2"></i>Dashboard
        </g:link>
        <g:link controller="evaluation" action="create" class="btn btn-primary">
          <i class="fas fa-plus me-2"></i>New Evaluation
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

<!-- Filters -->
  <div class="filter-card">
    <div class="row g-3">
      <div class="col-md-3">
        <label class="form-label">Overall Rating</label>
        <select class="form-select" id="ratingFilter">
          <option value="">All Ratings</option>
          <option value="EXCELLENT">Excellent</option>
          <option value="VERY_GOOD">Very Good</option>
          <option value="GOOD">Good</option>
          <option value="SATISFACTORY">Satisfactory</option>
          <option value="NEEDS_IMPROVEMENT">Needs Improvement</option>
        </select>
      </div>
      <div class="col-md-3">
        <label class="form-label">Recommendation</label>
        <select class="form-select" id="recommendationFilter">
          <option value="">All Recommendations</option>
          <option value="HIRE">Hire</option>
          <option value="EXTEND">Extend</option>
          <option value="CONDITIONAL">Conditional</option>
          <option value="NOT_RECOMMEND">Not Recommend</option>
        </select>
      </div>
      <div class="col-md-3">
        <label class="form-label">Intern</label>
        <input type="text" class="form-control" id="internFilter" placeholder="Intern name">
      </div>
      <div class="col-md-3 d-flex align-items-end">
        <button class="btn btn-primary w-100" onclick="applyFilters()">
          <i class="fas fa-filter me-2"></i>Apply Filters
        </button>
      </div>
    </div>
  </div>

<!-- Evaluations List -->
  <g:if test="${evaluationList}">
    <div class="row">
      <g:each in="${evaluationList}" var="evaluation">
        <div class="col-md-6 col-lg-4">
          <div class="evaluation-card">
            <div class="d-flex justify-content-between align-items-start mb-3">
              <div>
                <h5 class="mb-1">${evaluation.intern?.user?.fullName}</h5>
                <small class="text-muted">
                  <i class="fas fa-calendar me-1"></i>
                  <g:formatDate date="${evaluation.evaluationDate}" format="dd MMM yyyy"/>
                </small>
              </div>
              <span class="rating-badge rating-${evaluation.overallRating}">
                ${evaluation.overallRating?.replace('_', ' ')}
              </span>
            </div>

            <div class="mb-3">
              <div class="small text-muted mb-2">
                <i class="fas fa-university me-1"></i>${evaluation.intern?.university}
              </div>
              <div class="d-flex justify-content-between">
                <span class="small">Technical: ${evaluation.technicalSkills}/5</span>
                <span class="small">Communication: ${evaluation.communicationSkills}/5</span>
              </div>
            </div>

            <g:if test="${evaluation.recommendation}">
              <div class="mb-3">
                <span class="badge ${evaluation.recommendation == 'HIRE' ? 'bg-success' :
                        evaluation.recommendation == 'EXTEND' ? 'bg-info' :
                                evaluation.recommendation == 'CONDITIONAL' ? 'bg-warning' : 'bg-danger'}">
                  <i class="fas fa-gavel me-1"></i>${evaluation.recommendation}
                </span>
              </div>
            </g:if>

            <div class="d-flex justify-content-between align-items-center">
              <small class="text-muted">
                <i class="fas fa-user me-1"></i>By: ${evaluation.evaluatorName}
              </small>
              <g:link controller="evaluation" action="show" id="${evaluation.id}" class="btn btn-sm btn-outline-primary">
                <i class="fas fa-eye me-1"></i>View Details
              </g:link>
            </div>
          </div>
        </div>
      </g:each>
    </div>
  </g:if>
  <g:else>
    <div class="text-center py-5">
      <i class="fas fa-star fa-4x text-muted mb-3"></i>
      <h4 class="text-muted">No Evaluations Found</h4>
      <p class="text-muted">There are no evaluations to display.</p>
      <g:link controller="evaluation" action="create" class="btn btn-primary mt-3">
        <i class="fas fa-plus me-2"></i>Create Your First Evaluation
      </g:link>
    </div>
  </g:else>
</div>

<script>
  function applyFilters() {
    const rating = document.getElementById('ratingFilter').value;
    const recommendation = document.getElementById('recommendationFilter').value;
    const intern = document.getElementById('internFilter').value;

    let url = '${createLink(action: "index")}';
    let params = [];

    if (rating) params.push('rating=' + encodeURIComponent(rating));
    if (recommendation) params.push('recommendation=' + encodeURIComponent(recommendation));
    if (intern) params.push('intern=' + encodeURIComponent(intern));

    if (params.length > 0) {
      url += '?' + params.join('&');
    }

    window.location.href = url;
  }
</script>

</html>