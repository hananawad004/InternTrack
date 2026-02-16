<%--
  Created by IntelliJ IDEA.
  User: Eng.Hanan Awad
  Date: 2/12/2026
  Time: 11:43 AM
--%>

<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <meta name="active-evaluations" content="true"/>
  <title>Evaluations - InternTrack</title>

  <style>
  .evaluation-card {
    background: white;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    margin-bottom: 20px;
    padding: 20px;
    border-left: 4px solid #ffc107;
    transition: all 0.3s;
  }

  .evaluation-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 20px rgba(0,0,0,0.12);
  }

  .score-badge {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 1.2rem;
  }

  .score-high { background: #28a745; color: white; }
  .score-medium { background: #ffc107; color: #212529; }
  .score-low { background: #dc3545; color: white; }
  </style>
</head>

<div class="container-fluid">
  <div class="d-flex justify-content-between align-items-center mb-4">
    <div>
      <h1 class="h3 mb-0">
        <i class="fas fa-star me-2 text-warning"></i>
        Evaluations
      </h1>
      <p class="text-muted mb-0">Intern performance evaluations</p>
    </div>
    <div>
      <g:link controller="evaluation" action="create" class="btn btn-primary">
        <i class="fas fa-plus-circle me-2"></i>
        New Evaluation
      </g:link>
    </div>
  </div>

  <g:if test="${evaluationList}">
    <div class="row">
      <g:each in="${evaluationList}" var="evaluation">
        <div class="col-md-6">
          <div class="evaluation-card">
            <div class="d-flex justify-content-between">
              <div>
                <h5 class="mb-1">${evaluation.intern?.user?.fullName}</h5>
                <p class="text-muted small mb-2">
                  ${evaluation.evaluatorName} •
                  <g:formatDate date="${evaluation.evaluationDate}" format="dd/MM/yyyy"/>
                </p>
              </div>
              <div class="score-badge
                                ${evaluation.overallScore >= 80 ? 'score-high' :
                      evaluation.overallScore >= 60 ? 'score-medium' : 'score-low'}">
                ${evaluation.overallScore}
              </div>
            </div>
            <div class="mt-2">
              <g:link controller="evaluation" action="show" id="${evaluation.id}"
                      class="btn btn-sm btn-outline-primary">
                <i class="fas fa-eye"></i> View Details
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
      <h5 class="text-muted">No evaluations found</h5>
    </div>
  </g:else>
</div>

</html>