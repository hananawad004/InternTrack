%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <title>Create Evaluation - InternTrack</title>--}%

%{--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--}%
%{--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--}%
%{--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--}%
%{--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--}%

%{--    <style>--}%
%{--    body {--}%
%{--        background-color: #f8f9fa;--}%
%{--        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--}%
%{--        padding: 20px 0;--}%
%{--    }--}%

%{--    .page-header {--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        color: white;--}%
%{--        padding: 25px;--}%
%{--        border-radius: 10px;--}%
%{--        margin-bottom: 25px;--}%
%{--    }--}%

%{--    .form-section {--}%
%{--        background: white;--}%
%{--        border-radius: 10px;--}%
%{--        box-shadow: 0 2px 10px rgba(0,0,0,0.08);--}%
%{--        padding: 25px;--}%
%{--        margin-bottom: 25px;--}%
%{--        border: 1px solid #e2e8f0;--}%
%{--    }--}%

%{--    .section-title {--}%
%{--        font-size: 1.2rem;--}%
%{--        font-weight: 600;--}%
%{--        color: #334155;--}%
%{--        margin-bottom: 20px;--}%
%{--        padding-bottom: 10px;--}%
%{--        border-bottom: 2px solid #667eea;--}%
%{--    }--}%

%{--    .form-label {--}%
%{--        font-weight: 600;--}%
%{--        color: #4a5568;--}%
%{--        margin-bottom: 8px;--}%
%{--    }--}%

%{--    .required:after {--}%
%{--        content: " *";--}%
%{--        color: red;--}%
%{--    }--}%

%{--    .rating-group {--}%
%{--        display: flex;--}%
%{--        gap: 20px;--}%
%{--        align-items: center;--}%
%{--        flex-wrap: wrap;--}%
%{--    }--}%

%{--    .rating-option {--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        gap: 5px;--}%
%{--    }--}%

%{--    .rating-option input[type="radio"] {--}%
%{--        width: 18px;--}%
%{--        height: 18px;--}%
%{--    }--}%

%{--    .rating-badge {--}%
%{--        background-color: #667eea;--}%
%{--        color: white;--}%
%{--        padding: 5px 15px;--}%
%{--        border-radius: 20px;--}%
%{--        font-size: 14px;--}%
%{--        font-weight: 600;--}%
%{--    }--}%

%{--    .criteria-card {--}%
%{--        background-color: #f8fafc;--}%
%{--        border: 1px solid #e2e8f0;--}%
%{--        border-radius: 8px;--}%
%{--        padding: 20px;--}%
%{--        margin-bottom: 20px;--}%
%{--        transition: all 0.3s;--}%
%{--    }--}%

%{--    .criteria-card:hover {--}%
%{--        box-shadow: 0 5px 15px rgba(0,0,0,0.1);--}%
%{--        border-color: #667eea;--}%
%{--    }--}%

%{--    .criteria-title {--}%
%{--        font-weight: 600;--}%
%{--        color: #2d3748;--}%
%{--        margin-bottom: 15px;--}%
%{--        display: flex;--}%
%{--        justify-content: space-between;--}%
%{--        align-items: center;--}%
%{--    }--}%

%{--    .intern-info {--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        color: white;--}%
%{--        padding: 20px;--}%
%{--        border-radius: 10px;--}%
%{--        margin-bottom: 25px;--}%
%{--    }--}%

%{--    .intern-avatar {--}%
%{--        width: 60px;--}%
%{--        height: 60px;--}%
%{--        border-radius: 50%;--}%
%{--        background: white;--}%
%{--        color: #667eea;--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--        font-size: 24px;--}%
%{--        font-weight: bold;--}%
%{--    }--}%

%{--    .action-buttons {--}%
%{--        position: sticky;--}%
%{--        bottom: 20px;--}%
%{--        background: white;--}%
%{--        padding: 15px;--}%
%{--        border-radius: 10px;--}%
%{--        box-shadow: 0 -5px 20px rgba(0,0,0,0.1);--}%
%{--        margin-top: 30px;--}%
%{--        border: 1px solid #eaeaea;--}%
%{--    }--}%

%{--    .rating-scale {--}%
%{--        display: flex;--}%
%{--        gap: 15px;--}%
%{--        margin-top: 10px;--}%
%{--    }--}%

%{--    .rating-item {--}%
%{--        text-align: center;--}%
%{--        flex: 1;--}%
%{--    }--}%

%{--    .rating-item label {--}%
%{--        display: block;--}%
%{--        margin-bottom: 5px;--}%
%{--        font-size: 12px;--}%
%{--        color: #718096;--}%
%{--    }--}%

%{--    .rating-item input {--}%
%{--        width: 100%;--}%
%{--    }--}%
%{--    </style>--}%
%{--</head>--}%

%{--<div class="container-fluid">--}%
%{--    <!-- Header -->--}%
%{--    <div class="page-header">--}%
%{--        <div class="d-flex justify-content-between align-items-center">--}%
%{--            <div>--}%
%{--                <h2 class="mb-2">--}%
%{--                    <i class="fas fa-star me-2"></i>--}%
%{--                    Create Intern Evaluation--}%
%{--                </h2>--}%
%{--                <p class="mb-0 opacity-75">Evaluate intern performance and provide feedback</p>--}%
%{--            </div>--}%
%{--            <div>--}%
%{--                <g:link controller="dashboard" action="supervisor" class="btn btn-light">--}%
%{--                    <i class="fas fa-arrow-left me-2"></i>--}%
%{--                    Back to Dashboard--}%
%{--                </g:link>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--<!-- Flash Messages -->--}%
%{--    <g:if test="${flash.error}">--}%
%{--        <div class="alert alert-danger alert-dismissible fade show">--}%
%{--            <i class="fas fa-exclamation-circle me-2"></i>${flash.error}--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>--}%
%{--        </div>--}%
%{--    </g:if>--}%

%{--    <g:if test="${flash.message}">--}%
%{--        <div class="alert alert-success alert-dismissible fade show">--}%
%{--            <i class="fas fa-check-circle me-2"></i>${flash.message}--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>--}%
%{--        </div>--}%
%{--    </g:if>--}%

%{--<!-- Intern Information -->--}%
%{--    <g:if test="${intern}">--}%
%{--        <div class="intern-info">--}%
%{--            <div class="row align-items-center">--}%
%{--                <div class="col-md-auto">--}%
%{--                    <div class="intern-avatar">--}%
%{--                        ${intern.user?.initials ?: 'U'}--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--                <div class="col-md">--}%
%{--                    <h4 class="mb-1">${intern.user?.fullName}</h4>--}%
%{--                    <p class="mb-0">--}%
%{--                        <i class="fas fa-university me-2"></i>${intern.university} - ${intern.major} (Year ${intern.yearOfStudy})--}%
%{--                    </p>--}%
%{--                    <p class="mb-0 mt-1">--}%
%{--                        <i class="fas fa-id-card me-2"></i>Student ID: ${intern.studentId} |--}%
%{--                        <i class="fas fa-calendar me-2"></i>Period: <g:formatDate date="${intern.startDate}" format="dd/MM/yyyy"/> - <g:formatDate date="${intern.endDate}" format="dd/MM/yyyy"/>--}%
%{--                    </p>--}%
%{--                </div>--}%
%{--                <div class="col-md-auto">--}%
%{--                    <span class="rating-badge">--}%
%{--                        <i class="fas fa-chart-line me-1"></i>--}%
%{--                        Reports: ${reportStats?.total ?: 0} | Approved: ${reportStats?.approved ?: 0}--}%
%{--                    </span>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </g:if>--}%

%{--<!-- Evaluation Form -->--}%
%{--    <g:uploadForm controller="evaluation" action="save" method="POST" class="card p-4 shadow-sm" enctype="multipart/form-data">--}%
%{--        <input type="hidden" name="internId" value="${intern?.id}"/>--}%

%{--        <!-- Evaluation Period -->--}%
%{--        <div class="form-section">--}%
%{--            <h5 class="section-title">--}%
%{--                <i class="fas fa-calendar-alt me-2 text-primary"></i>--}%
%{--                Evaluation Period--}%
%{--            </h5>--}%
%{--            <div class="row">--}%
%{--                <div class="col-md-6">--}%
%{--                    <div class="mb-3">--}%
%{--                        <label class="form-label required">Evaluation Period Start</label>--}%
%{--                        <input type="date" name="periodStart" class="form-control" required--}%
%{--                               value="<g:formatDate date="${new Date() - 30}" format="yyyy-MM-dd"/>">--}%
%{--                        <small class="text-muted">Start date of evaluation period</small>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--                <div class="col-md-6">--}%
%{--                    <div class="mb-3">--}%
%{--                        <label class="form-label required">Evaluation Period End</label>--}%
%{--                        <input type="date" name="periodEnd" class="form-control" required--}%
%{--                               value="<g:formatDate date="${new Date()}" format="yyyy-MM-dd"/>">--}%
%{--                        <small class="text-muted">End date of evaluation period</small>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--        <!-- Performance Criteria -->--}%
%{--        <div class="form-section">--}%
%{--            <h5 class="section-title">--}%
%{--                <i class="fas fa-tasks me-2 text-primary"></i>--}%
%{--                Performance Criteria--}%
%{--            </h5>--}%

%{--            <!-- Technical Skills -->--}%
%{--            <div class="criteria-card">--}%
%{--                <div class="criteria-title">--}%
%{--                    <span><i class="fas fa-code me-2 text-primary"></i>Technical Skills</span>--}%
%{--                    <span class="badge bg-primary">Weight: 30%</span>--}%
%{--                </div>--}%
%{--                <div class="row">--}%
%{--                    <div class="col-md-8">--}%
%{--                        <p class="text-muted small mb-3">Evaluate the intern's technical abilities, coding skills, and understanding of required technologies.</p>--}%
%{--                    </div>--}%
%{--                    <div class="col-md-4">--}%
%{--                        <div class="rating-group">--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="technicalSkills" id="tech1" value="1" required>--}%
%{--                                <label for="tech1">1 (Poor)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="technicalSkills" id="tech2" value="2">--}%
%{--                                <label for="tech2">2 (Fair)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="technicalSkills" id="tech3" value="3" checked>--}%
%{--                                <label for="tech3">3 (Good)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="technicalSkills" id="tech4" value="4">--}%
%{--                                <label for="tech4">4 (Very Good)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="technicalSkills" id="tech5" value="5">--}%
%{--                                <label for="tech5">5 (Excellent)</label>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <!-- Communication Skills -->--}%
%{--            <div class="criteria-card">--}%
%{--                <div class="criteria-title">--}%
%{--                    <span><i class="fas fa-comments me-2 text-success"></i>Communication Skills</span>--}%
%{--                    <span class="badge bg-success">Weight: 20%</span>--}%
%{--                </div>--}%
%{--                <div class="row">--}%
%{--                    <div class="col-md-8">--}%
%{--                        <p class="text-muted small mb-3">Evaluate verbal and written communication, team collaboration, and presentation skills.</p>--}%
%{--                    </div>--}%
%{--                    <div class="col-md-4">--}%
%{--                        <div class="rating-group">--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="communicationSkills" id="comm1" value="1" required>--}%
%{--                                <label for="comm1">1 (Poor)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="communicationSkills" id="comm2" value="2">--}%
%{--                                <label for="comm2">2 (Fair)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="communicationSkills" id="comm3" value="3" checked>--}%
%{--                                <label for="comm3">3 (Good)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="communicationSkills" id="comm4" value="4">--}%
%{--                                <label for="comm4">4 (Very Good)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="communicationSkills" id="comm5" value="5">--}%
%{--                                <label for="comm5">5 (Excellent)</label>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <!-- Problem Solving -->--}%
%{--            <div class="criteria-card">--}%
%{--                <div class="criteria-title">--}%
%{--                    <span><i class="fas fa-puzzle-piece me-2 text-warning"></i>Problem Solving</span>--}%
%{--                    <span class="badge bg-warning">Weight: 20%</span>--}%
%{--                </div>--}%
%{--                <div class="row">--}%
%{--                    <div class="col-md-8">--}%
%{--                        <p class="text-muted small mb-3">Evaluate analytical thinking, creativity in finding solutions, and ability to overcome obstacles.</p>--}%
%{--                    </div>--}%
%{--                    <div class="col-md-4">--}%
%{--                        <div class="rating-group">--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="problemSolving" id="prob1" value="1" required>--}%
%{--                                <label for="prob1">1 (Poor)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="problemSolving" id="prob2" value="2">--}%
%{--                                <label for="prob2">2 (Fair)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="problemSolving" id="prob3" value="3" checked>--}%
%{--                                <label for="prob3">3 (Good)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="problemSolving" id="prob4" value="4">--}%
%{--                                <label for="prob4">4 (Very Good)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="problemSolving" id="prob5" value="5">--}%
%{--                                <label for="prob5">5 (Excellent)</label>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <!-- Initiative & Proactiveness -->--}%
%{--            <div class="criteria-card">--}%
%{--                <div class="criteria-title">--}%
%{--                    <span><i class="fas fa-rocket me-2 text-info"></i>Initiative & Proactiveness</span>--}%
%{--                    <span class="badge bg-info">Weight: 15%</span>--}%
%{--                </div>--}%
%{--                <div class="row">--}%
%{--                    <div class="col-md-8">--}%
%{--                        <p class="text-muted small mb-3">Evaluate self-motivation, willingness to take on new tasks, and proactive attitude.</p>--}%
%{--                    </div>--}%
%{--                    <div class="col-md-4">--}%
%{--                        <div class="rating-group">--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="initiative" id="init1" value="1" required>--}%
%{--                                <label for="init1">1 (Poor)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="initiative" id="init2" value="2">--}%
%{--                                <label for="init2">2 (Fair)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="initiative" id="init3" value="3" checked>--}%
%{--                                <label for="init3">3 (Good)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="initiative" id="init4" value="4">--}%
%{--                                <label for="init4">4 (Very Good)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="initiative" id="init5" value="5">--}%
%{--                                <label for="init5">5 (Excellent)</label>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <!-- Teamwork -->--}%
%{--            <div class="criteria-card">--}%
%{--                <div class="criteria-title">--}%
%{--                    <span><i class="fas fa-users me-2 text-danger"></i>Teamwork & Collaboration</span>--}%
%{--                    <span class="badge bg-danger">Weight: 15%</span>--}%
%{--                </div>--}%
%{--                <div class="row">--}%
%{--                    <div class="col-md-8">--}%
%{--                        <p class="text-muted small mb-3">Evaluate ability to work in a team, help others, and contribute to team goals.</p>--}%
%{--                    </div>--}%
%{--                    <div class="col-md-4">--}%
%{--                        <div class="rating-group">--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="teamwork" id="team1" value="1" required>--}%
%{--                                <label for="team1">1 (Poor)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="teamwork" id="team2" value="2">--}%
%{--                                <label for="team2">2 (Fair)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="teamwork" id="team3" value="3" checked>--}%
%{--                                <label for="team3">3 (Good)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="teamwork" id="team4" value="4">--}%
%{--                                <label for="team4">4 (Very Good)</label>--}%
%{--                            </div>--}%
%{--                            <div class="rating-option">--}%
%{--                                <input type="radio" name="teamwork" id="team5" value="5">--}%
%{--                                <label for="team5">5 (Excellent)</label>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--        <!-- Comments & Feedback -->--}%
%{--        <div class="form-section">--}%
%{--            <h5 class="section-title">--}%
%{--                <i class="fas fa-comment me-2 text-primary"></i>--}%
%{--                Comments & Feedback--}%
%{--            </h5>--}%

%{--            <div class="mb-3">--}%
%{--                <label class="form-label">Strengths</label>--}%
%{--                <textarea name="strengths" class="form-control" rows="3"--}%
%{--                          placeholder="What are the intern's key strengths?"></textarea>--}%
%{--            </div>--}%

%{--            <div class="mb-3">--}%
%{--                <label class="form-label">Areas for Improvement</label>--}%
%{--                <textarea name="improvements" class="form-control" rows="3"--}%
%{--                          placeholder="What areas need improvement?"></textarea>--}%
%{--            </div>--}%

%{--            <div class="mb-3">--}%
%{--                <label class="form-label">General Comments</label>--}%
%{--                <textarea name="generalComments" class="form-control" rows="4"--}%
%{--                          placeholder="Any additional comments or feedback for the intern..."></textarea>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--        <!-- Recommendations -->--}%
%{--        <div class="form-section">--}%
%{--            <h5 class="section-title">--}%
%{--                <i class="fas fa-gavel me-2 text-primary"></i>--}%
%{--                Final Recommendation--}%
%{--            </h5>--}%

%{--            <div class="row">--}%
%{--                <div class="col-md-6">--}%
%{--                    <div class="mb-3">--}%
%{--                        <label class="form-label required">Overall Rating</label>--}%
%{--                        <select name="overallRating" class="form-select" required>--}%
%{--                            <option value="">Select rating...</option>--}%
%{--                            <option value="EXCELLENT">Excellent (90-100%)</option>--}%
%{--                            <option value="VERY_GOOD">Very Good (80-89%)</option>--}%
%{--                            <option value="GOOD">Good (70-79%)</option>--}%
%{--                            <option value="SATISFACTORY">Satisfactory (60-69%)</option>--}%
%{--                            <option value="NEEDS_IMPROVEMENT">Needs Improvement (Below 60%)</option>--}%
%{--                        </select>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--                <div class="col-md-6">--}%
%{--                    <div class="mb-3">--}%
%{--                        <label class="form-label required">Recommendation</label>--}%
%{--                        <select name="recommendation" class="form-select" required>--}%
%{--                            <option value="">Select recommendation...</option>--}%
%{--                            <option value="HIRE">Recommend for Hire</option>--}%
%{--                            <option value="EXTEND">Recommend Extending Internship</option>--}%
%{--                            <option value="CONDITIONAL">Conditional Pass</option>--}%
%{--                            <option value="NOT_RECOMMEND">Not Recommend</option>--}%
%{--                        </select>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--        <!-- Attachments -->--}%
%{--        <div class="form-section">--}%
%{--            <h5 class="section-title">--}%
%{--                <i class="fas fa-paperclip me-2 text-primary"></i>--}%
%{--                Attachments--}%
%{--            </h5>--}%

%{--            <div class="mb-3">--}%
%{--                <label class="form-label">Supporting Documents</label>--}%
%{--                <input type="file" name="attachments" class="form-control" multiple--}%
%{--                       accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">--}%
%{--                <small class="text-muted">--}%
%{--                    <i class="fas fa-info-circle me-1"></i>--}%
%{--                    Max file size: 5MB. Allowed formats: PDF, DOC, DOCX, JPG, PNG--}%
%{--                </small>--}%
%{--            </div>--}%
%{--            <div id="fileList" class="mt-2"></div>--}%
%{--        </div>--}%

%{--        <!-- Action Buttons -->--}%
%{--        <div class="action-buttons">--}%
%{--            <div class="d-flex justify-content-between">--}%
%{--                <g:link controller="dashboard" action="supervisor" class="btn btn-secondary btn-lg">--}%
%{--                    <i class="fas fa-times me-2"></i>Cancel--}%
%{--                </g:link>--}%
%{--                <div>--}%
%{--                    <button type="button" class="btn btn-info btn-lg me-2" onclick="saveDraft()">--}%
%{--                        <i class="fas fa-save me-2"></i>Save Draft--}%
%{--                    </button>--}%
%{--                    <button type="submit" class="btn btn-primary btn-lg">--}%
%{--                        <i class="fas fa-paper-plane me-2"></i>Submit Evaluation--}%
%{--                    </button>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </g:uploadForm>--}%
%{--</div>--}%

%{--<!-- JavaScript -->--}%
%{--<script>--}%
%{--    // Preview selected files--}%
%{--    document.getElementById('attachments')?.addEventListener('change', function(event) {--}%
%{--        const fileList = document.getElementById('fileList');--}%
%{--        fileList.innerHTML = '';--}%

%{--        if (this.files.length > 0) {--}%
%{--            const list = document.createElement('ul');--}%
%{--            list.className = 'list-group';--}%

%{--            Array.from(event.target.files).forEach(function(file) {--}%
%{--                const li = document.createElement('li');--}%
%{--                li.className = 'list-group-item d-flex justify-content-between align-items-center';--}%

%{--                const nameSpan = document.createElement('span');--}%
%{--                nameSpan.innerHTML = '<i class="fas fa-file me-2"></i>' + file.name;--}%

%{--                const sizeSpan = document.createElement('span');--}%
%{--                sizeSpan.className = 'badge bg-secondary';--}%
%{--                sizeSpan.innerText = (file.size / 1024).toFixed(1) + ' KB';--}%

%{--                li.appendChild(nameSpan);--}%
%{--                li.appendChild(sizeSpan);--}%
%{--                list.appendChild(li);--}%
%{--            });--}%

%{--            fileList.appendChild(list);--}%
%{--        }--}%
%{--    });--}%

%{--    // Save draft to localStorage--}%
%{--    function saveDraft() {--}%
%{--        const formData = {--}%
%{--            periodStart: document.querySelector('input[name="periodStart"]')?.value || '',--}%
%{--            periodEnd: document.querySelector('input[name="periodEnd"]')?.value || '',--}%
%{--            technicalSkills: document.querySelector('input[name="technicalSkills"]:checked')?.value || '3',--}%
%{--            communicationSkills: document.querySelector('input[name="communicationSkills"]:checked')?.value || '3',--}%
%{--            problemSolving: document.querySelector('input[name="problemSolving"]:checked')?.value || '3',--}%
%{--            initiative: document.querySelector('input[name="initiative"]:checked')?.value || '3',--}%
%{--            teamwork: document.querySelector('input[name="teamwork"]:checked')?.value || '3',--}%
%{--            strengths: document.querySelector('textarea[name="strengths"]')?.value || '',--}%
%{--            improvements: document.querySelector('textarea[name="improvements"]')?.value || '',--}%
%{--            generalComments: document.querySelector('textarea[name="generalComments"]')?.value || '',--}%
%{--            overallRating: document.querySelector('select[name="overallRating"]')?.value || '',--}%
%{--            recommendation: document.querySelector('select[name="recommendation"]')?.value || '',--}%
%{--            internId: '${intern?.id}',--}%
%{--            lastSaved: new Date().toISOString()--}%
%{--        };--}%

%{--        localStorage.setItem('evaluation_draft_${intern?.id}', JSON.stringify(formData));--}%

%{--        const alert = document.createElement('div');--}%
%{--        alert.className = 'alert alert-success alert-dismissible fade show position-fixed top-0 end-0 m-3';--}%
%{--        alert.style.zIndex = '9999';--}%
%{--        alert.innerHTML = `--}%
%{--            <i class="fas fa-check-circle me-2"></i>--}%
%{--            Draft saved successfully at ${new Date().toLocaleTimeString()}!--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>--}%
%{--        `;--}%
%{--        document.body.appendChild(alert);--}%
%{--        setTimeout(() => alert.remove(), 3000);--}%
%{--    }--}%

%{--    // Load draft from localStorage--}%
%{--    document.addEventListener('DOMContentLoaded', function() {--}%
%{--        const saved = localStorage.getItem('evaluation_draft_${intern?.id}');--}%
%{--        if (saved) {--}%
%{--            try {--}%
%{--                const data = JSON.parse(saved);--}%
%{--                const savedTime = new Date(data.lastSaved);--}%
%{--                const now = new Date();--}%
%{--                const minutesDiff = Math.round((now - savedTime) / 60000);--}%

%{--                if (minutesDiff < 60 && confirm(`You have a draft saved from ${minutesDiff} minute(s) ago. Would you like to load it?`)) {--}%
%{--                    document.querySelector('input[name="periodStart"]').value = data.periodStart || '';--}%
%{--                    document.querySelector('input[name="periodEnd"]').value = data.periodEnd || '';--}%

%{--                    if (data.technicalSkills) {--}%
%{--                        document.querySelector(`input[name="technicalSkills"][value="${data.technicalSkills}"]`).checked = true;--}%
%{--                    }--}%
%{--                    if (data.communicationSkills) {--}%
%{--                        document.querySelector(`input[name="communicationSkills"][value="${data.communicationSkills}"]`).checked = true;--}%
%{--                    }--}%
%{--                    if (data.problemSolving) {--}%
%{--                        document.querySelector(`input[name="problemSolving"][value="${data.problemSolving}"]`).checked = true;--}%
%{--                    }--}%
%{--                    if (data.initiative) {--}%
%{--                        document.querySelector(`input[name="initiative"][value="${data.initiative}"]`).checked = true;--}%
%{--                    }--}%
%{--                    if (data.teamwork) {--}%
%{--                        document.querySelector(`input[name="teamwork"][value="${data.teamwork}"]`).checked = true;--}%
%{--                    }--}%

%{--                    document.querySelector('textarea[name="strengths"]').value = data.strengths || '';--}%
%{--                    document.querySelector('textarea[name="improvements"]').value = data.improvements || '';--}%
%{--                    document.querySelector('textarea[name="generalComments"]').value = data.generalComments || '';--}%
%{--                    document.querySelector('select[name="overallRating"]').value = data.overallRating || '';--}%
%{--                    document.querySelector('select[name="recommendation"]').value = data.recommendation || '';--}%
%{--                }--}%
%{--            } catch (e) {--}%
%{--                console.error('Error loading draft:', e);--}%
%{--            }--}%
%{--        }--}%
%{--    });--}%

%{--    // Auto-save every 30 seconds--}%
%{--    let autoSaveTimer;--}%
%{--    const form = document.querySelector('form');--}%
%{--    if (form) {--}%
%{--        form.addEventListener('input', function() {--}%
%{--            clearTimeout(autoSaveTimer);--}%
%{--            autoSaveTimer = setTimeout(saveDraft, 30000);--}%
%{--        });--}%
%{--    }--}%

%{--    // Calculate total score--}%
%{--    function calculateTotal() {--}%
%{--        const tech = parseInt(document.querySelector('input[name="technicalSkills"]:checked')?.value || 0);--}%
%{--        const comm = parseInt(document.querySelector('input[name="communicationSkills"]:checked')?.value || 0);--}%
%{--        const prob = parseInt(document.querySelector('input[name="problemSolving"]:checked')?.value || 0);--}%
%{--        const init = parseInt(document.querySelector('input[name="initiative"]:checked')?.value || 0);--}%
%{--        const team = parseInt(document.querySelector('input[name="teamwork"]:checked')?.value || 0);--}%

%{--        const total = (tech * 0.3) + (comm * 0.2) + (prob * 0.2) + (init * 0.15) + (team * 0.15);--}%
%{--        return total.toFixed(1);--}%
%{--    }--}%

%{--    // Update rating display--}%
%{--    const radios = document.querySelectorAll('input[type="radio"]');--}%
%{--    radios.forEach(radio => {--}%
%{--        radio.addEventListener('change', function() {--}%
%{--            const total = calculateTotal();--}%
%{--            console.log('Total Score:', total);--}%
%{--        });--}%
%{--    });--}%
%{--</script>--}%

%{--</html>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <title>Create Evaluation - InternTrack</title>--}%
%{--    <%@ page import="java.time.LocalDate" %>--}%

%{--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--}%
%{--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--}%
%{--    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--}%
%{--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>--}%

%{--    <style>--}%
%{--    body {--}%
%{--        background-color: #f8f9fa;--}%
%{--        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--}%
%{--        padding: 20px 0;--}%
%{--    }--}%

%{--    .page-header {--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        color: white;--}%
%{--        padding: 25px;--}%
%{--        border-radius: 10px;--}%
%{--        margin-bottom: 25px;--}%
%{--        margin-top: 70px;--}%
%{--    }--}%

%{--    .form-section {--}%
%{--        background: white;--}%
%{--        border-radius: 10px;--}%
%{--        box-shadow: 0 2px 10px rgba(0,0,0,0.08);--}%
%{--        padding: 25px;--}%
%{--        margin-bottom: 25px;--}%
%{--        border: 1px solid #e2e8f0;--}%
%{--    }--}%

%{--    .section-title {--}%
%{--        font-size: 1.2rem;--}%
%{--        font-weight: 600;--}%
%{--        color: #334155;--}%
%{--        margin-bottom: 20px;--}%
%{--        padding-bottom: 10px;--}%
%{--        border-bottom: 2px solid #667eea;--}%
%{--    }--}%

%{--    .form-label {--}%
%{--        font-weight: 600;--}%
%{--        color: #4a5568;--}%
%{--        margin-bottom: 8px;--}%
%{--    }--}%

%{--    .required:after {--}%
%{--        content: " *";--}%
%{--        color: red;--}%
%{--    }--}%

%{--    .rating-group {--}%
%{--        display: flex;--}%
%{--        gap: 20px;--}%
%{--        align-items: center;--}%
%{--        flex-wrap: wrap;--}%
%{--    }--}%

%{--    .rating-option {--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        gap: 5px;--}%
%{--    }--}%

%{--    .rating-option input[type="radio"] {--}%
%{--        width: 18px;--}%
%{--        height: 18px;--}%
%{--    }--}%

%{--    .rating-badge {--}%
%{--        background-color: #667eea;--}%
%{--        color: white;--}%
%{--        padding: 5px 15px;--}%
%{--        border-radius: 20px;--}%
%{--        font-size: 14px;--}%
%{--        font-weight: 600;--}%
%{--    }--}%

%{--    .criteria-card {--}%
%{--        background-color: #f8fafc;--}%
%{--        border: 1px solid #e2e8f0;--}%
%{--        border-radius: 8px;--}%
%{--        padding: 20px;--}%
%{--        margin-bottom: 20px;--}%
%{--        transition: all 0.3s;--}%
%{--    }--}%

%{--    .criteria-card:hover {--}%
%{--        box-shadow: 0 5px 15px rgba(0,0,0,0.1);--}%
%{--        border-color: #667eea;--}%
%{--    }--}%

%{--    .criteria-title {--}%
%{--        font-weight: 600;--}%
%{--        color: #2d3748;--}%
%{--        margin-bottom: 15px;--}%
%{--        display: flex;--}%
%{--        justify-content: space-between;--}%
%{--        align-items: center;--}%
%{--    }--}%

%{--    .intern-info {--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        color: white;--}%
%{--        padding: 20px;--}%
%{--        border-radius: 10px;--}%
%{--        margin-bottom: 25px;--}%
%{--    }--}%

%{--    .intern-avatar {--}%
%{--        width: 60px;--}%
%{--        height: 60px;--}%
%{--        border-radius: 50%;--}%
%{--        background: white;--}%
%{--        color: #667eea;--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--        font-size: 24px;--}%
%{--        font-weight: bold;--}%
%{--    }--}%

%{--    .action-buttons {--}%
%{--        position: sticky;--}%
%{--        bottom: 20px;--}%
%{--        background: white;--}%
%{--        padding: 15px;--}%
%{--        border-radius: 10px;--}%
%{--        box-shadow: 0 -5px 20px rgba(0,0,0,0.1);--}%
%{--        margin-top: 30px;--}%
%{--        border: 1px solid #eaeaea;--}%
%{--    }--}%

%{--    .rating-scale {--}%
%{--        display: flex;--}%
%{--        gap: 15px;--}%
%{--        margin-top: 10px;--}%
%{--    }--}%

%{--    .rating-item {--}%
%{--        text-align: center;--}%
%{--        flex: 1;--}%
%{--    }--}%

%{--    .rating-item label {--}%
%{--        display: block;--}%
%{--        margin-bottom: 5px;--}%
%{--        font-size: 12px;--}%
%{--        color: #718096;--}%
%{--    }--}%

%{--    .rating-item input {--}%
%{--        width: 100%;--}%
%{--    }--}%
%{--    </style>--}%
%{--</head>--}%

%{--<div class="container-fluid">--}%
%{--    <!-- Header -->--}%
%{--    <div class="page-header">--}%
%{--        <div class="d-flex justify-content-between align-items-center">--}%
%{--            <div>--}%
%{--                <h2 class="mb-2">--}%
%{--                    <i class="fas fa-star me-2"></i>--}%
%{--                    Create Intern Evaluation--}%
%{--                </h2>--}%
%{--                <p class="mb-0 opacity-75">Evaluate intern performance and provide feedback</p>--}%
%{--            </div>--}%
%{--            <div>--}%
%{--                <g:link controller="dashboard" action="supervisor" class="btn btn-light">--}%
%{--                    <i class="fas fa-arrow-left me-2"></i>--}%
%{--                    Back to Dashboard--}%
%{--                </g:link>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--<!-- Flash Messages -->--}%
%{--    <g:if test="${flash.error}">--}%
%{--        <div class="alert alert-danger alert-dismissible fade show">--}%
%{--            <i class="fas fa-exclamation-circle me-2"></i>${flash.error}--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>--}%
%{--        </div>--}%
%{--    </g:if>--}%

%{--    <g:if test="${flash.message}">--}%
%{--        <div class="alert alert-success alert-dismissible fade show">--}%
%{--            <i class="fas fa-check-circle me-2"></i>${flash.message}--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>--}%
%{--        </div>--}%
%{--    </g:if>--}%

%{--<!-- Intern Selection (if no intern specified) -->--}%
%{--    <g:if test="${!intern && interns}">--}%
%{--        <div class="form-section">--}%
%{--            <h5 class="section-title">--}%
%{--                <i class="fas fa-user me-2 text-primary"></i>--}%
%{--                Select Intern--}%
%{--            </h5>--}%
%{--            <div class="row">--}%
%{--                <div class="col-md-6">--}%
%{--                    <select class="form-select" id="internSelector" onchange="location.href='${createLink(action: 'create')}?internId='+this.value">--}%
%{--                        <option value="">Select an intern...</option>--}%
%{--                        <g:each in="${interns}" var="internOption">--}%
%{--                            <option value="${internOption.id}">${internOption.user?.fullName} - ${internOption.university}</option>--}%
%{--                        </g:each>--}%
%{--                    </select>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </g:if>--}%

%{--<!-- Intern Information -->--}%
%{--    <g:if test="${intern}">--}%
%{--        <div class="intern-info">--}%
%{--            <div class="row align-items-center">--}%
%{--                <div class="col-md-auto">--}%
%{--                    <div class="intern-avatar">--}%
%{--                        ${intern.user?.initials ?: 'U'}--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--                <div class="col-md">--}%
%{--                    <h4 class="mb-1">${intern.user?.fullName}</h4>--}%
%{--                    <p class="mb-0">--}%
%{--                        <i class="fas fa-university me-2"></i>${intern.university} - ${intern.major} (Year ${intern.yearOfStudy})--}%
%{--                    </p>--}%
%{--                    <p class="mb-0 mt-1">--}%
%{--                        <i class="fas fa-id-card me-2"></i>Student ID: ${intern.studentId} |--}%
%{--                        <i class="fas fa-calendar me-2"></i>Period: <g:formatDate date="${intern.startDate}" format="dd/MM/yyyy"/> - <g:formatDate date="${intern.endDate}" format="dd/MM/yyyy"/>--}%
%{--                    </p>--}%
%{--                </div>--}%
%{--                <div class="col-md-auto">--}%
%{--                    <span class="rating-badge">--}%
%{--                        <i class="fas fa-chart-line me-1"></i>--}%
%{--                        Reports: ${reportStats?.total ?: 0} | Approved: ${reportStats?.approved ?: 0}--}%
%{--                    </span>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </g:if>--}%

%{--<!-- Evaluation Form -->--}%
%{--    <g:if test="${intern}">--}%
%{--        <g:uploadForm controller="evaluation" action="save" method="POST" class="card p-4 shadow-sm" enctype="multipart/form-data">--}%
%{--            <input type="hidden" name="internId" value="${intern?.id}"/>--}%

%{--            <!-- Evaluation Period -->--}%
%{--            <div class="form-section">--}%
%{--                <h5 class="section-title">--}%
%{--                    <i class="fas fa-calendar-alt me-2 text-primary"></i>--}%
%{--                    Evaluation Period--}%
%{--                </h5>--}%
%{--                <div class="row">--}%
%{--                    <div class="col-md-6">--}%
%{--                        <div class="mb-3">--}%
%{--                            <label class="form-label required">Evaluation Period Start</label>--}%
%{--                            <input type="date" name="periodStart" class="form-control" required--}%
%{--                                   value="${LocalDate.now().minusDays(30)}">--}%
%{--                            <small class="text-muted">Start date of evaluation period (30 days ago)</small>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                    <div class="col-md-6">--}%
%{--                        <div class="mb-3">--}%
%{--                            <label class="form-label required">Evaluation Period End</label>--}%
%{--                            <input type="date" name="periodEnd" class="form-control" required--}%
%{--                                   value="${LocalDate.now()}">--}%
%{--                            <small class="text-muted">End date of evaluation period (today)</small>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <!-- Performance Criteria -->--}%
%{--            <div class="form-section">--}%
%{--                <h5 class="section-title">--}%
%{--                    <i class="fas fa-tasks me-2 text-primary"></i>--}%
%{--                    Performance Criteria--}%
%{--                </h5>--}%

%{--                <!-- Technical Skills -->--}%
%{--                <div class="criteria-card">--}%
%{--                    <div class="criteria-title">--}%
%{--                        <span><i class="fas fa-code me-2 text-primary"></i>Technical Skills</span>--}%
%{--                        <span class="badge bg-primary">Weight: 30%</span>--}%
%{--                    </div>--}%
%{--                    <div class="row">--}%
%{--                        <div class="col-md-8">--}%
%{--                            <p class="text-muted small mb-3">Evaluate the intern's technical abilities, coding skills, and understanding of required technologies.</p>--}%
%{--                        </div>--}%
%{--                        <div class="col-md-4">--}%
%{--                            <div class="rating-group">--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="technicalSkills" id="tech1" value="1" required>--}%
%{--                                    <label for="tech1">1 (Poor)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="technicalSkills" id="tech2" value="2">--}%
%{--                                    <label for="tech2">2 (Fair)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="technicalSkills" id="tech3" value="3" checked>--}%
%{--                                    <label for="tech3">3 (Good)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="technicalSkills" id="tech4" value="4">--}%
%{--                                    <label for="tech4">4 (Very Good)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="technicalSkills" id="tech5" value="5">--}%
%{--                                    <label for="tech5">5 (Excellent)</label>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%

%{--                <!-- Communication Skills -->--}%
%{--                <div class="criteria-card">--}%
%{--                    <div class="criteria-title">--}%
%{--                        <span><i class="fas fa-comments me-2 text-success"></i>Communication Skills</span>--}%
%{--                        <span class="badge bg-success">Weight: 20%</span>--}%
%{--                    </div>--}%
%{--                    <div class="row">--}%
%{--                        <div class="col-md-8">--}%
%{--                            <p class="text-muted small mb-3">Evaluate verbal and written communication, team collaboration, and presentation skills.</p>--}%
%{--                        </div>--}%
%{--                        <div class="col-md-4">--}%
%{--                            <div class="rating-group">--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="communicationSkills" id="comm1" value="1" required>--}%
%{--                                    <label for="comm1">1 (Poor)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="communicationSkills" id="comm2" value="2">--}%
%{--                                    <label for="comm2">2 (Fair)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="communicationSkills" id="comm3" value="3" checked>--}%
%{--                                    <label for="comm3">3 (Good)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="communicationSkills" id="comm4" value="4">--}%
%{--                                    <label for="comm4">4 (Very Good)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="communicationSkills" id="comm5" value="5">--}%
%{--                                    <label for="comm5">5 (Excellent)</label>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%

%{--                <!-- Problem Solving -->--}%
%{--                <div class="criteria-card">--}%
%{--                    <div class="criteria-title">--}%
%{--                        <span><i class="fas fa-puzzle-piece me-2 text-warning"></i>Problem Solving</span>--}%
%{--                        <span class="badge bg-warning">Weight: 20%</span>--}%
%{--                    </div>--}%
%{--                    <div class="row">--}%
%{--                        <div class="col-md-8">--}%
%{--                            <p class="text-muted small mb-3">Evaluate analytical thinking, creativity in finding solutions, and ability to overcome obstacles.</p>--}%
%{--                        </div>--}%
%{--                        <div class="col-md-4">--}%
%{--                            <div class="rating-group">--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="problemSolving" id="prob1" value="1" required>--}%
%{--                                    <label for="prob1">1 (Poor)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="problemSolving" id="prob2" value="2">--}%
%{--                                    <label for="prob2">2 (Fair)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="problemSolving" id="prob3" value="3" checked>--}%
%{--                                    <label for="prob3">3 (Good)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="problemSolving" id="prob4" value="4">--}%
%{--                                    <label for="prob4">4 (Very Good)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="problemSolving" id="prob5" value="5">--}%
%{--                                    <label for="prob5">5 (Excellent)</label>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%

%{--                <!-- Initiative & Proactiveness -->--}%
%{--                <div class="criteria-card">--}%
%{--                    <div class="criteria-title">--}%
%{--                        <span><i class="fas fa-rocket me-2 text-info"></i>Initiative & Proactiveness</span>--}%
%{--                        <span class="badge bg-info">Weight: 15%</span>--}%
%{--                    </div>--}%
%{--                    <div class="row">--}%
%{--                        <div class="col-md-8">--}%
%{--                            <p class="text-muted small mb-3">Evaluate self-motivation, willingness to take on new tasks, and proactive attitude.</p>--}%
%{--                        </div>--}%
%{--                        <div class="col-md-4">--}%
%{--                            <div class="rating-group">--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="initiative" id="init1" value="1" required>--}%
%{--                                    <label for="init1">1 (Poor)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="initiative" id="init2" value="2">--}%
%{--                                    <label for="init2">2 (Fair)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="initiative" id="init3" value="3" checked>--}%
%{--                                    <label for="init3">3 (Good)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="initiative" id="init4" value="4">--}%
%{--                                    <label for="init4">4 (Very Good)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="initiative" id="init5" value="5">--}%
%{--                                    <label for="init5">5 (Excellent)</label>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%

%{--                <!-- Teamwork -->--}%
%{--                <div class="criteria-card">--}%
%{--                    <div class="criteria-title">--}%
%{--                        <span><i class="fas fa-users me-2 text-danger"></i>Teamwork & Collaboration</span>--}%
%{--                        <span class="badge bg-danger">Weight: 15%</span>--}%
%{--                    </div>--}%
%{--                    <div class="row">--}%
%{--                        <div class="col-md-8">--}%
%{--                            <p class="text-muted small mb-3">Evaluate ability to work in a team, help others, and contribute to team goals.</p>--}%
%{--                        </div>--}%
%{--                        <div class="col-md-4">--}%
%{--                            <div class="rating-group">--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="teamwork" id="team1" value="1" required>--}%
%{--                                    <label for="team1">1 (Poor)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="teamwork" id="team2" value="2">--}%
%{--                                    <label for="team2">2 (Fair)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="teamwork" id="team3" value="3" checked>--}%
%{--                                    <label for="team3">3 (Good)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="teamwork" id="team4" value="4">--}%
%{--                                    <label for="team4">4 (Very Good)</label>--}%
%{--                                </div>--}%
%{--                                <div class="rating-option">--}%
%{--                                    <input type="radio" name="teamwork" id="team5" value="5">--}%
%{--                                    <label for="team5">5 (Excellent)</label>--}%
%{--                                </div>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <!-- Comments & Feedback -->--}%
%{--            <div class="form-section">--}%
%{--                <h5 class="section-title">--}%
%{--                    <i class="fas fa-comment me-2 text-primary"></i>--}%
%{--                    Comments & Feedback--}%
%{--                </h5>--}%

%{--                <div class="mb-3">--}%
%{--                    <label class="form-label">Strengths</label>--}%
%{--                    <textarea name="strengths" class="form-control" rows="3"--}%
%{--                              placeholder="What are the intern's key strengths?"></textarea>--}%
%{--                </div>--}%

%{--                <div class="mb-3">--}%
%{--                    <label class="form-label">Areas for Improvement</label>--}%
%{--                    <textarea name="improvements" class="form-control" rows="3"--}%
%{--                              placeholder="What areas need improvement?"></textarea>--}%
%{--                </div>--}%

%{--                <div class="mb-3">--}%
%{--                    <label class="form-label">General Comments</label>--}%
%{--                    <textarea name="generalComments" class="form-control" rows="4"--}%
%{--                              placeholder="Any additional comments or feedback for the intern..."></textarea>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <!-- Recommendations -->--}%
%{--            <div class="form-section">--}%
%{--                <h5 class="section-title">--}%
%{--                    <i class="fas fa-gavel me-2 text-primary"></i>--}%
%{--                    Final Recommendation--}%
%{--                </h5>--}%

%{--                <div class="row">--}%
%{--                    <div class="col-md-6">--}%
%{--                        <div class="mb-3">--}%
%{--                            <label class="form-label required">Overall Rating</label>--}%
%{--                            <select name="overallRating" class="form-select" required>--}%
%{--                                <option value="">Select rating...</option>--}%
%{--                                <option value="EXCELLENT">Excellent (90-100%)</option>--}%
%{--                                <option value="VERY_GOOD">Very Good (80-89%)</option>--}%
%{--                                <option value="GOOD">Good (70-79%)</option>--}%
%{--                                <option value="SATISFACTORY">Satisfactory (60-69%)</option>--}%
%{--                                <option value="NEEDS_IMPROVEMENT">Needs Improvement (Below 60%)</option>--}%
%{--                            </select>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                    <div class="col-md-6">--}%
%{--                        <div class="mb-3">--}%
%{--                            <label class="form-label required">Recommendation</label>--}%
%{--                            <select name="recommendation" class="form-select" required>--}%
%{--                                <option value="">Select recommendation...</option>--}%
%{--                                <option value="HIRE">Recommend for Hire</option>--}%
%{--                                <option value="EXTEND">Recommend Extending Internship</option>--}%
%{--                                <option value="CONDITIONAL">Conditional Pass</option>--}%
%{--                                <option value="NOT_RECOMMEND">Not Recommend</option>--}%
%{--                            </select>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <!-- Attachments -->--}%
%{--            <div class="form-section">--}%
%{--                <h5 class="section-title">--}%
%{--                    <i class="fas fa-paperclip me-2 text-primary"></i>--}%
%{--                    Attachments--}%
%{--                </h5>--}%

%{--                <div class="mb-3">--}%
%{--                    <label class="form-label">Supporting Documents</label>--}%
%{--                    <input type="file" name="attachments" class="form-control" multiple--}%
%{--                           accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">--}%
%{--                    <small class="text-muted">--}%
%{--                        <i class="fas fa-info-circle me-1"></i>--}%
%{--                        Max file size: 5MB. Allowed formats: PDF, DOC, DOCX, JPG, PNG--}%
%{--                    </small>--}%
%{--                </div>--}%
%{--                <div id="fileList" class="mt-2"></div>--}%
%{--            </div>--}%

%{--            <!-- Action Buttons -->--}%
%{--            <div class="action-buttons">--}%
%{--                <div class="d-flex justify-content-between">--}%
%{--                    <g:link controller="dashboard" action="supervisor" class="btn btn-secondary btn-lg">--}%
%{--                        <i class="fas fa-times me-2"></i>Cancel--}%
%{--                    </g:link>--}%
%{--                    <div>--}%
%{--                        <button type="button" class="btn btn-info btn-lg me-2" onclick="saveDraft()">--}%
%{--                            <i class="fas fa-save me-2"></i>Save Draft--}%
%{--                        </button>--}%
%{--                        <button type="submit" class="btn btn-primary btn-lg">--}%
%{--                            <i class="fas fa-paper-plane me-2"></i>Submit Evaluation--}%
%{--                        </button>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </g:uploadForm>--}%
%{--    </g:if>--}%
%{--    <g:elseif test="${!intern && !interns}">--}%
%{--        <div class="text-center py-5">--}%
%{--            <i class="fas fa-users fa-4x text-muted mb-3"></i>--}%
%{--            <h4 class="text-muted">No Interns Available</h4>--}%
%{--            <p class="text-muted">You don't have any interns assigned for evaluation.</p>--}%
%{--            <g:link controller="dashboard" action="supervisor" class="btn btn-primary">--}%
%{--                <i class="fas fa-arrow-left me-2"></i>Back to Dashboard--}%
%{--            </g:link>--}%
%{--        </div>--}%
%{--    </g:elseif>--}%
%{--</div>--}%

%{--<!-- JavaScript -->--}%
%{--<script>--}%
%{--    // Preview selected files--}%
%{--    document.getElementById('attachments')?.addEventListener('change', function(event) {--}%
%{--        const fileList = document.getElementById('fileList');--}%
%{--        fileList.innerHTML = '';--}%

%{--        if (this.files.length > 0) {--}%
%{--            const list = document.createElement('ul');--}%
%{--            list.className = 'list-group';--}%

%{--            Array.from(event.target.files).forEach(function(file) {--}%
%{--                const li = document.createElement('li');--}%
%{--                li.className = 'list-group-item d-flex justify-content-between align-items-center';--}%

%{--                const nameSpan = document.createElement('span');--}%
%{--                nameSpan.innerHTML = '<i class="fas fa-file me-2"></i>' + file.name;--}%

%{--                const sizeSpan = document.createElement('span');--}%
%{--                sizeSpan.className = 'badge bg-secondary';--}%
%{--                sizeSpan.innerText = (file.size / 1024).toFixed(1) + ' KB';--}%

%{--                li.appendChild(nameSpan);--}%
%{--                li.appendChild(sizeSpan);--}%
%{--                list.appendChild(li);--}%
%{--            });--}%

%{--            fileList.appendChild(list);--}%
%{--        }--}%
%{--    });--}%

%{--    // Save draft to localStorage--}%
%{--    function saveDraft() {--}%
%{--        const formData = {--}%
%{--            periodStart: document.querySelector('input[name="periodStart"]')?.value || '',--}%
%{--            periodEnd: document.querySelector('input[name="periodEnd"]')?.value || '',--}%
%{--            technicalSkills: document.querySelector('input[name="technicalSkills"]:checked')?.value || '3',--}%
%{--            communicationSkills: document.querySelector('input[name="communicationSkills"]:checked')?.value || '3',--}%
%{--            problemSolving: document.querySelector('input[name="problemSolving"]:checked')?.value || '3',--}%
%{--            initiative: document.querySelector('input[name="initiative"]:checked')?.value || '3',--}%
%{--            teamwork: document.querySelector('input[name="teamwork"]:checked')?.value || '3',--}%
%{--            strengths: document.querySelector('textarea[name="strengths"]')?.value || '',--}%
%{--            improvements: document.querySelector('textarea[name="improvements"]')?.value || '',--}%
%{--            generalComments: document.querySelector('textarea[name="generalComments"]')?.value || '',--}%
%{--            overallRating: document.querySelector('select[name="overallRating"]')?.value || '',--}%
%{--            recommendation: document.querySelector('select[name="recommendation"]')?.value || '',--}%
%{--            internId: '${intern?.id}',--}%
%{--            lastSaved: new Date().toISOString()--}%
%{--        };--}%

%{--        localStorage.setItem('evaluation_draft_${intern?.id}', JSON.stringify(formData));--}%

%{--        const alert = document.createElement('div');--}%
%{--        alert.className = 'alert alert-success alert-dismissible fade show position-fixed top-0 end-0 m-3';--}%
%{--        alert.style.zIndex = '9999';--}%

%{--        const now = new Date();--}%
%{--        const timeString = now.toLocaleTimeString();--}%

%{--        alert.innerHTML = `--}%
%{--            <i class="fas fa-check-circle me-2"></i>--}%
%{--            Draft saved successfully at ${timeString}!--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>--}%
%{--        `;--}%

%{--        document.body.appendChild(alert);--}%
%{--        setTimeout(() => alert.remove(), 3000);--}%
%{--    }--}%

%{--    // Load draft from localStorage--}%
%{--    document.addEventListener('DOMContentLoaded', function() {--}%
%{--        const saved = localStorage.getItem('evaluation_draft_${intern?.id}');--}%
%{--        if (saved) {--}%
%{--            try {--}%
%{--                const data = JSON.parse(saved);--}%
%{--                const savedTime = new Date(data.lastSaved);--}%
%{--                const now = new Date();--}%
%{--                const minutesDiff = Math.round((now - savedTime) / 60000);--}%

%{--                if (minutesDiff < 60 && confirm('You have a draft saved from ' + minutesDiff + ' minute(s) ago. Would you like to load it?')) {--}%
%{--                    document.querySelector('input[name="periodStart"]').value = data.periodStart || '';--}%
%{--                    document.querySelector('input[name="periodEnd"]').value = data.periodEnd || '';--}%

%{--                    if (data.technicalSkills) {--}%
%{--                        document.querySelector('input[name="technicalSkills"][value="' + data.technicalSkills + '"]').checked = true;--}%
%{--                    }--}%
%{--                    if (data.communicationSkills) {--}%
%{--                        document.querySelector('input[name="communicationSkills"][value="' + data.communicationSkills + '"]').checked = true;--}%
%{--                    }--}%
%{--                    if (data.problemSolving) {--}%
%{--                        document.querySelector('input[name="problemSolving"][value="' + data.problemSolving + '"]').checked = true;--}%
%{--                    }--}%
%{--                    if (data.initiative) {--}%
%{--                        document.querySelector('input[name="initiative"][value="' + data.initiative + '"]').checked = true;--}%
%{--                    }--}%
%{--                    if (data.teamwork) {--}%
%{--                        document.querySelector('input[name="teamwork"][value="' + data.teamwork + '"]').checked = true;--}%
%{--                    }--}%

%{--                    document.querySelector('textarea[name="strengths"]').value = data.strengths || '';--}%
%{--                    document.querySelector('textarea[name="improvements"]').value = data.improvements || '';--}%
%{--                    document.querySelector('textarea[name="generalComments"]').value = data.generalComments || '';--}%
%{--                    document.querySelector('select[name="overallRating"]').value = data.overallRating || '';--}%
%{--                    document.querySelector('select[name="recommendation"]').value = data.recommendation || '';--}%
%{--                }--}%
%{--            } catch (e) {--}%
%{--                console.error('Error loading draft:', e);--}%
%{--            }--}%
%{--        }--}%
%{--    });--}%

%{--    // Auto-save every 30 seconds--}%
%{--    let autoSaveTimer;--}%
%{--    const form = document.querySelector('form');--}%
%{--    if (form) {--}%
%{--        form.addEventListener('input', function() {--}%
%{--            clearTimeout(autoSaveTimer);--}%
%{--            autoSaveTimer = setTimeout(saveDraft, 30000);--}%
%{--        });--}%
%{--    }--}%

%{--    // Confirm before leaving with unsaved changes--}%
%{--    let formChanged = false;--}%
%{--    if (form) {--}%
%{--        form.addEventListener('input', function() {--}%
%{--            formChanged = true;--}%
%{--        });--}%
%{--    }--}%

%{--    window.addEventListener('beforeunload', function(e) {--}%
%{--        if (formChanged) {--}%
%{--            e.preventDefault();--}%
%{--            e.returnValue = 'You have unsaved changes. Are you sure you want to leave?';--}%
%{--        }--}%
%{--    });--}%

%{--    // Calculate total score--}%
%{--    function calculateTotal() {--}%
%{--        const tech = parseInt(document.querySelector('input[name="technicalSkills"]:checked')?.value || 0);--}%
%{--        const comm = parseInt(document.querySelector('input[name="communicationSkills"]:checked')?.value || 0);--}%
%{--        const prob = parseInt(document.querySelector('input[name="problemSolving"]:checked')?.value || 0);--}%
%{--        const init = parseInt(document.querySelector('input[name="initiative"]:checked')?.value || 0);--}%
%{--        const team = parseInt(document.querySelector('input[name="teamwork"]:checked')?.value || 0);--}%

%{--        const total = (tech * 0.3) + (comm * 0.2) + (prob * 0.2) + (init * 0.15) + (team * 0.15);--}%
%{--        return total.toFixed(1);--}%
%{--    }--}%

%{--    // Update rating display--}%
%{--    const radios = document.querySelectorAll('input[type="radio"]');--}%
%{--    radios.forEach(radio => {--}%
%{--        radio.addEventListener('change', function() {--}%
%{--            const total = calculateTotal();--}%
%{--            console.log('Total Score:', total);--}%
%{--        });--}%
%{--    });--}%
%{--</script>--}%
%{--</html>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <title>Evaluation Details - InternTrack</title>--}%

%{--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">--}%
%{--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">--}%

%{--    <style>--}%
%{--    body {--}%
%{--        background-color: #f8f9fa;--}%
%{--        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--}%
%{--        padding: 20px 0;--}%
%{--    }--}%

%{--    .page-header {--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        color: white;--}%
%{--        padding: 25px;--}%
%{--        border-radius: 10px;--}%
%{--        margin-bottom: 25px;--}%
%{--        margin-top: 70px;--}%
%{--    }--}%

%{--    .info-card {--}%
%{--        background: white;--}%
%{--        border-radius: 10px;--}%
%{--        box-shadow: 0 2px 10px rgba(0,0,0,0.08);--}%
%{--        padding: 25px;--}%
%{--        margin-bottom: 25px;--}%
%{--        border: 1px solid #e2e8f0;--}%
%{--    }--}%

%{--    .section-title {--}%
%{--        font-size: 1.2rem;--}%
%{--        font-weight: 600;--}%
%{--        color: #334155;--}%
%{--        margin-bottom: 20px;--}%
%{--        padding-bottom: 10px;--}%
%{--        border-bottom: 2px solid #667eea;--}%
%{--    }--}%

%{--    .criteria-badge {--}%
%{--        display: inline-block;--}%
%{--        padding: 8px 16px;--}%
%{--        border-radius: 30px;--}%
%{--        font-weight: 600;--}%
%{--        margin: 5px;--}%
%{--    }--}%

%{--    .rating-EXCELLENT { background-color: #28a745; color: white; }--}%
%{--    .rating-VERY_GOOD { background-color: #17a2b8; color: white; }--}%
%{--    .rating-GOOD { background-color: #ffc107; color: #212529; }--}%
%{--    .rating-SATISFACTORY { background-color: #fd7e14; color: white; }--}%
%{--    .rating-NEEDS_IMPROVEMENT { background-color: #dc3545; color: white; }--}%

%{--    .recommendation-HIRE { background-color: #28a745; color: white; }--}%
%{--    .recommendation-EXTEND { background-color: #17a2b8; color: white; }--}%
%{--    .recommendation-CONDITIONAL { background-color: #ffc107; color: #212529; }--}%
%{--    .recommendation-NOT_RECOMMEND { background-color: #dc3545; color: white; }--}%
%{--    </style>--}%
%{--</head>--}%

%{--<div class="container-fluid">--}%
%{--    <!-- Header -->--}%
%{--    <div class="page-header">--}%
%{--        <div class="d-flex justify-content-between align-items-center">--}%
%{--            <div>--}%
%{--                <h2 class="mb-2">--}%
%{--                    <i class="fas fa-star me-2"></i>--}%
%{--                    Evaluation Details--}%
%{--                </h2>--}%
%{--                <p class="mb-0 opacity-75">View intern evaluation and feedback</p>--}%
%{--            </div>--}%
%{--            <div>--}%
%{--                <g:link controller="evaluation" action="index" class="btn btn-light me-2">--}%
%{--                    <i class="fas fa-list me-2"></i>All Evaluations--}%
%{--                </g:link>--}%
%{--                <g:link controller="dashboard" action="supervisor" class="btn btn-light">--}%
%{--                    <i class="fas fa-arrow-left me-2"></i>Dashboard--}%
%{--                </g:link>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--<!-- Flash Messages -->--}%
%{--    <g:if test="${flash.message}">--}%
%{--        <div class="alert alert-success alert-dismissible fade show">--}%
%{--            <i class="fas fa-check-circle me-2"></i>${flash.message}--}%
%{--            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>--}%
%{--        </div>--}%
%{--    </g:if>--}%

%{--<!-- Intern Info -->--}%
%{--    <div class="info-card">--}%
%{--        <div class="row">--}%
%{--            <div class="col-md-8">--}%
%{--                <h4 class="mb-3">${evaluation.intern?.user?.fullName}</h4>--}%
%{--                <div class="row">--}%
%{--                    <div class="col-md-6">--}%
%{--                        <p><strong><i class="fas fa-university me-2"></i>University:</strong> ${evaluation.intern?.university}</p>--}%
%{--                        <p><strong><i class="fas fa-graduation-cap me-2"></i>Major:</strong> ${evaluation.intern?.major}</p>--}%
%{--                    </div>--}%
%{--                    <div class="col-md-6">--}%
%{--                        <p><strong><i class="fas fa-id-card me-2"></i>Student ID:</strong> ${evaluation.intern?.studentId}</p>--}%
%{--                        <p><strong><i class="fas fa-calendar me-2"></i>Period:</strong>--}%
%{--                            <g:formatDate date="${evaluation.periodStart}" format="dd/MM/yyyy"/> ---}%
%{--                            <g:formatDate date="${evaluation.periodEnd}" format="dd/MM/yyyy"/>--}%
%{--                        </p>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--            <div class="col-md-4 text-end">--}%
%{--                <div class="d-inline-block p-3 bg-light rounded">--}%
%{--                    <div class="mb-2"><strong>Evaluation Date:</strong></div>--}%
%{--                    <div><g:formatDate date="${evaluation.evaluationDate}" format="dd MMMM yyyy"/></div>--}%
%{--                    <div class="mt-2"><strong>Evaluator:</strong> ${evaluation.evaluatorName}</div>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%

%{--    <!-- Scores -->--}%
%{--    <div class="row">--}%
%{--        <div class="col-md-8">--}%
%{--            <!-- Performance Criteria Scores -->--}%
%{--            <div class="info-card">--}%
%{--                <h5 class="section-title">--}%
%{--                    <i class="fas fa-chart-line me-2 text-primary"></i>--}%
%{--                    Performance Scores--}%
%{--                </h5>--}%

%{--                <div class="row">--}%
%{--                    <div class="col-md-6">--}%
%{--                        <table class="table table-borderless">--}%
%{--                            <tr>--}%
%{--                                <td><strong>Technical Skills:</strong></td>--}%
%{--                                <td>--}%
%{--                                    <span class="badge bg-primary">${evaluation.technicalSkills}/5</span>--}%
%{--                                </td>--}%
%{--                            </tr>--}%
%{--                            <tr>--}%
%{--                                <td><strong>Communication Skills:</strong></td>--}%
%{--                                <td>--}%
%{--                                    <span class="badge bg-success">${evaluation.communicationSkills}/5</span>--}%
%{--                                </td>--}%
%{--                            </tr>--}%
%{--                            <tr>--}%
%{--                                <td><strong>Problem Solving:</strong></td>--}%
%{--                                <td>--}%
%{--                                    <span class="badge bg-warning">${evaluation.problemSolving}/5</span>--}%
%{--                                </td>--}%
%{--                            </tr>--}%
%{--                        </table>--}%
%{--                    </div>--}%
%{--                    <div class="col-md-6">--}%
%{--                        <table class="table table-borderless">--}%
%{--                            <tr>--}%
%{--                                <td><strong>Initiative:</strong></td>--}%
%{--                                <td>--}%
%{--                                    <span class="badge bg-info">${evaluation.initiative}/5</span>--}%
%{--                                </td>--}%
%{--                            </tr>--}%
%{--                            <tr>--}%
%{--                                <td><strong>Teamwork:</strong></td>--}%
%{--                                <td>--}%
%{--                                    <span class="badge bg-danger">${evaluation.teamwork}/5</span>--}%
%{--                                </td>--}%
%{--                            </tr>--}%
%{--                            <tr>--}%
%{--                                <td><strong>Total Score:</strong></td>--}%
%{--                                <td>--}%
%{--                                    <g:set var="totalScore" value="${(evaluation.technicalSkills * 0.3) + (evaluation.communicationSkills * 0.2) + (evaluation.problemSolving * 0.2) + (evaluation.initiative * 0.15) + (evaluation.teamwork * 0.15)}"/>--}%
%{--                                    <span class="badge ${totalScore >= 4 ? 'bg-success' : totalScore >= 3 ? 'bg-warning' : 'bg-danger'}">--}%
%{--                                        ${totalScore.round(1)}/5--}%
%{--                                    </span>--}%
%{--                                </td>--}%
%{--                            </tr>--}%
%{--                        </table>--}%
%{--                    </div>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <!-- Comments -->--}%
%{--            <div class="info-card">--}%
%{--                <h5 class="section-title">--}%
%{--                    <i class="fas fa-comment me-2 text-primary"></i>--}%
%{--                    Feedback & Comments--}%
%{--                </h5>--}%

%{--                <g:if test="${evaluation.strengths}">--}%
%{--                    <div class="mb-4">--}%
%{--                        <h6 class="text-success"><i class="fas fa-plus-circle me-2"></i>Strengths</h6>--}%
%{--                        <p class="bg-light p-3 rounded">${evaluation.strengths}</p>--}%
%{--                    </div>--}%
%{--                </g:if>--}%

%{--                <g:if test="${evaluation.improvements}">--}%
%{--                    <div class="mb-4">--}%
%{--                        <h6 class="text-warning"><i class="fas fa-exclamation-triangle me-2"></i>Areas for Improvement</h6>--}%
%{--                        <p class="bg-light p-3 rounded">${evaluation.improvements}</p>--}%
%{--                    </div>--}%
%{--                </g:if>--}%

%{--                <g:if test="${evaluation.generalComments}">--}%
%{--                    <div class="mb-4">--}%
%{--                        <h6 class="text-info"><i class="fas fa-comment-dots me-2"></i>General Comments</h6>--}%
%{--                        <p class="bg-light p-3 rounded">${evaluation.generalComments}</p>--}%
%{--                    </div>--}%
%{--                </g:if>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--        <div class="col-md-4">--}%
%{--            <!-- Overall Rating -->--}%
%{--            <div class="info-card">--}%
%{--                <h5 class="section-title">--}%
%{--                    <i class="fas fa-star me-2 text-primary"></i>--}%
%{--                    Overall Rating--}%
%{--                </h5>--}%

%{--                <div class="text-center mb-4">--}%
%{--                    <span class="criteria-badge rating-${evaluation.overallRating} fs-5">--}%
%{--                        ${evaluation.overallRating?.replace('_', ' ')}--}%
%{--                    </span>--}%
%{--                </div>--}%

%{--                <h5 class="section-title mt-4">--}%
%{--                    <i class="fas fa-gavel me-2 text-primary"></i>--}%
%{--                    Recommendation--}%
%{--                </h5>--}%

%{--                <div class="text-center">--}%
%{--                    <span class="criteria-badge recommendation-${evaluation.recommendation} fs-5">--}%
%{--                        ${evaluation.recommendation?.replace('_', ' ')}--}%
%{--                    </span>--}%
%{--                </div>--}%
%{--            </div>--}%

%{--            <!-- Actions -->--}%
%{--            <div class="info-card">--}%
%{--                <h5 class="section-title">--}%
%{--                    <i class="fas fa-cog me-2 text-primary"></i>--}%
%{--                    Actions--}%
%{--                </h5>--}%

%{--                <div class="d-grid gap-2">--}%
%{--                    <g:link controller="evaluation" action="edit" id="${evaluation.id}" class="btn btn-warning">--}%
%{--                        <i class="fas fa-edit me-2"></i>Edit Evaluation--}%
%{--                    </g:link>--}%

%{--                    <g:link controller="evaluation" action="delete" id="${evaluation.id}"--}%
%{--                            class="btn btn-danger"--}%
%{--                            onclick="return confirm('Are you sure you want to delete this evaluation?');">--}%
%{--                        <i class="fas fa-trash me-2"></i>Delete Evaluation--}%
%{--                    </g:link>--}%

%{--                    <button onclick="window.print()" class="btn btn-outline-secondary">--}%
%{--                        <i class="fas fa-print me-2"></i>Print Evaluation--}%
%{--                    </button>--}%
%{--                </div>--}%
%{--            </div>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%

%{--</html>--}%
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create Evaluation - InternTrack</title>
    <%@ page import="java.time.LocalDate" %>

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

    .rating-group {
        display: flex;
        gap: 20px;
        align-items: center;
        flex-wrap: wrap;
    }

    .rating-option {
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .rating-option input[type="radio"] {
        width: 18px;
        height: 18px;
    }

    .rating-badge {
        background-color: #667eea;
        color: white;
        padding: 5px 15px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: 600;
    }

    .criteria-card {
        background-color: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 20px;
        transition: all 0.3s;
    }

    .criteria-card:hover {
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        border-color: #667eea;
    }

    .criteria-title {
        font-weight: 600;
        color: #2d3748;
        margin-bottom: 15px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .intern-info {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 20px;
        border-radius: 10px;
        margin-bottom: 25px;
    }

    .intern-avatar {
        width: 60px;
        height: 60px;
        border-radius: 50%;
        background: white;
        color: #667eea;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 24px;
        font-weight: bold;
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

    .rating-scale {
        display: flex;
        gap: 15px;
        margin-top: 10px;
    }

    .rating-item {
        text-align: center;
        flex: 1;
    }

    .rating-item label {
        display: block;
        margin-bottom: 5px;
        font-size: 12px;
        color: #718096;
    }

    .rating-item input {
        width: 100%;
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
                    Create Intern Evaluation
                </h2>
                <p class="mb-0 opacity-75">Evaluate intern performance and provide feedback</p>
            </div>
            <div>
                <g:link controller="dashboard" action="supervisor" class="btn btn-light">
                    <i class="fas fa-arrow-left me-2"></i>
                    Back to Dashboard
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

    <g:if test="${flash.warning}">
        <div class="alert alert-warning alert-dismissible fade show">
            <i class="fas fa-exclamation-triangle me-2"></i>${flash.warning}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </g:if>

<!-- Intern Selection (if no intern specified) -->
    <g:if test="${!intern && interns}">
        <div class="form-section">
            <h5 class="section-title">
                <i class="fas fa-user me-2 text-primary"></i>
                Select Intern
            </h5>
            <div class="row">
                <div class="col-md-6">
                    <select class="form-select" id="internSelector" onchange="location.href='${createLink(action: 'create')}?internId='+this.value">
                        <option value="">Select an intern...</option>
                        <g:each in="${interns}" var="internOption">
                            <option value="${internOption.id}">${internOption.user?.fullName} - ${internOption.university} (${internOption.user?.email ?: ''})</option>
                        </g:each>
                    </select>
                </div>
            </div>
        </div>
    </g:if>

<!-- Intern Information -->
    <g:if test="${intern}">
        <div class="intern-info">
            <div class="row align-items-center">
                <div class="col-md-auto">
                    <div class="intern-avatar">
                        ${intern.user?.initials ?: 'U'}
                    </div>
                </div>
                <div class="col-md">
                    <h4 class="mb-1">${intern.user?.fullName}</h4>
                    <p class="mb-0">
                        <i class="fas fa-university me-2"></i>${intern.university} - ${intern.major} (Year ${intern.yearOfStudy})
                    </p>
                    <p class="mb-0 mt-1">
                        <i class="fas fa-id-card me-2"></i>Student ID: ${intern.studentId} |
                        <i class="fas fa-calendar me-2"></i>Period: <g:formatDate date="${intern.startDate}" format="dd/MM/yyyy"/> - <g:formatDate date="${intern.endDate}" format="dd/MM/yyyy"/>
                    </p>
                </div>
                <div class="col-md-auto">
                    <span class="rating-badge">
                        <i class="fas fa-chart-line me-1"></i>
                        Reports: ${reportStats?.total ?: 0} | Approved: ${reportStats?.approved ?: 0}
                    </span>
                </div>
            </div>
        </div>
    </g:if>

<!-- Evaluation Form -->
    <g:if test="${intern}">
        <g:uploadForm controller="evaluation" action="save" method="POST" class="card p-4 shadow-sm" enctype="multipart/form-data">
            <input type="hidden" name="internId" value="${intern?.id}"/>

            <!-- Evaluation Period -->
            <div class="form-section">
                <h5 class="section-title">
                    <i class="fas fa-calendar-alt me-2 text-primary"></i>
                    Evaluation Period
                </h5>
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label required">Evaluation Period Start</label>
                            <input type="date" name="periodStart" class="form-control" required
                                   value="${LocalDate.now().minusDays(30)}">
                            <small class="text-muted">Start date of evaluation period (30 days ago)</small>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label required">Evaluation Period End</label>
                            <input type="date" name="periodEnd" class="form-control" required
                                   value="${LocalDate.now()}">
                            <small class="text-muted">End date of evaluation period (today)</small>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Performance Criteria -->
            <div class="form-section">
                <h5 class="section-title">
                    <i class="fas fa-tasks me-2 text-primary"></i>
                    Performance Criteria
                </h5>

                <!-- Technical Skills -->
                <div class="criteria-card">
                    <div class="criteria-title">
                        <span><i class="fas fa-code me-2 text-primary"></i>Technical Skills</span>
                        <span class="badge bg-primary">Weight: 30%</span>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <p class="text-muted small mb-3">Evaluate the intern's technical abilities, coding skills, and understanding of required technologies.</p>
                        </div>
                        <div class="col-md-4">
                            <div class="rating-group">
                                <div class="rating-option">
                                    <input type="radio" name="technicalSkills" id="tech1" value="1" required>
                                    <label for="tech1">1 (Poor)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="technicalSkills" id="tech2" value="2">
                                    <label for="tech2">2 (Fair)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="technicalSkills" id="tech3" value="3" checked>
                                    <label for="tech3">3 (Good)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="technicalSkills" id="tech4" value="4">
                                    <label for="tech4">4 (Very Good)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="technicalSkills" id="tech5" value="5">
                                    <label for="tech5">5 (Excellent)</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Communication Skills -->
                <div class="criteria-card">
                    <div class="criteria-title">
                        <span><i class="fas fa-comments me-2 text-success"></i>Communication Skills</span>
                        <span class="badge bg-success">Weight: 20%</span>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <p class="text-muted small mb-3">Evaluate verbal and written communication, team collaboration, and presentation skills.</p>
                        </div>
                        <div class="col-md-4">
                            <div class="rating-group">
                                <div class="rating-option">
                                    <input type="radio" name="communicationSkills" id="comm1" value="1" required>
                                    <label for="comm1">1 (Poor)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="communicationSkills" id="comm2" value="2">
                                    <label for="comm2">2 (Fair)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="communicationSkills" id="comm3" value="3" checked>
                                    <label for="comm3">3 (Good)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="communicationSkills" id="comm4" value="4">
                                    <label for="comm4">4 (Very Good)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="communicationSkills" id="comm5" value="5">
                                    <label for="comm5">5 (Excellent)</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Problem Solving -->
                <div class="criteria-card">
                    <div class="criteria-title">
                        <span><i class="fas fa-puzzle-piece me-2 text-warning"></i>Problem Solving</span>
                        <span class="badge bg-warning">Weight: 20%</span>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <p class="text-muted small mb-3">Evaluate analytical thinking, creativity in finding solutions, and ability to overcome obstacles.</p>
                        </div>
                        <div class="col-md-4">
                            <div class="rating-group">
                                <div class="rating-option">
                                    <input type="radio" name="problemSolving" id="prob1" value="1" required>
                                    <label for="prob1">1 (Poor)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="problemSolving" id="prob2" value="2">
                                    <label for="prob2">2 (Fair)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="problemSolving" id="prob3" value="3" checked>
                                    <label for="prob3">3 (Good)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="problemSolving" id="prob4" value="4">
                                    <label for="prob4">4 (Very Good)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="problemSolving" id="prob5" value="5">
                                    <label for="prob5">5 (Excellent)</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Initiative & Proactiveness -->
                <div class="criteria-card">
                    <div class="criteria-title">
                        <span><i class="fas fa-rocket me-2 text-info"></i>Initiative & Proactiveness</span>
                        <span class="badge bg-info">Weight: 15%</span>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <p class="text-muted small mb-3">Evaluate self-motivation, willingness to take on new tasks, and proactive attitude.</p>
                        </div>
                        <div class="col-md-4">
                            <div class="rating-group">
                                <div class="rating-option">
                                    <input type="radio" name="initiative" id="init1" value="1" required>
                                    <label for="init1">1 (Poor)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="initiative" id="init2" value="2">
                                    <label for="init2">2 (Fair)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="initiative" id="init3" value="3" checked>
                                    <label for="init3">3 (Good)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="initiative" id="init4" value="4">
                                    <label for="init4">4 (Very Good)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="initiative" id="init5" value="5">
                                    <label for="init5">5 (Excellent)</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Teamwork -->
                <div class="criteria-card">
                    <div class="criteria-title">
                        <span><i class="fas fa-users me-2 text-danger"></i>Teamwork & Collaboration</span>
                        <span class="badge bg-danger">Weight: 15%</span>
                    </div>
                    <div class="row">
                        <div class="col-md-8">
                            <p class="text-muted small mb-3">Evaluate ability to work in a team, help others, and contribute to team goals.</p>
                        </div>
                        <div class="col-md-4">
                            <div class="rating-group">
                                <div class="rating-option">
                                    <input type="radio" name="teamwork" id="team1" value="1" required>
                                    <label for="team1">1 (Poor)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="teamwork" id="team2" value="2">
                                    <label for="team2">2 (Fair)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="teamwork" id="team3" value="3" checked>
                                    <label for="team3">3 (Good)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="teamwork" id="team4" value="4">
                                    <label for="team4">4 (Very Good)</label>
                                </div>
                                <div class="rating-option">
                                    <input type="radio" name="teamwork" id="team5" value="5">
                                    <label for="team5">5 (Excellent)</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Comments & Feedback -->
            <div class="form-section">
                <h5 class="section-title">
                    <i class="fas fa-comment me-2 text-primary"></i>
                    Comments & Feedback
                </h5>

                <div class="mb-3">
                    <label class="form-label">Strengths</label>
                    <textarea name="strengths" class="form-control" rows="3"
                              placeholder="What are the intern's key strengths?"></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">Areas for Improvement</label>
                    <textarea name="improvements" class="form-control" rows="3"
                              placeholder="What areas need improvement?"></textarea>
                </div>

                <div class="mb-3">
                    <label class="form-label">General Comments</label>
                    <textarea name="generalComments" class="form-control" rows="4"
                              placeholder="Any additional comments or feedback for the intern..."></textarea>
                </div>
            </div>

            <!-- Recommendations -->
            <div class="form-section">
                <h5 class="section-title">
                    <i class="fas fa-gavel me-2 text-primary"></i>
                    Final Recommendation
                </h5>

                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label required">Overall Rating</label>
                            <select name="overallRating" class="form-select" required>
                                <option value="">Select rating...</option>
                                <option value="EXCELLENT">Excellent (90-100%)</option>
                                <option value="VERY_GOOD">Very Good (80-89%)</option>
                                <option value="GOOD">Good (70-79%)</option>
                                <option value="SATISFACTORY">Satisfactory (60-69%)</option>
                                <option value="NEEDS_IMPROVEMENT">Needs Improvement (Below 60%)</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label class="form-label required">Recommendation</label>
                            <select name="recommendation" class="form-select" required>
                                <option value="">Select recommendation...</option>
                                <option value="HIRE">Recommend for Hire</option>
                                <option value="EXTEND">Recommend Extending Internship</option>
                                <option value="CONDITIONAL">Conditional Pass</option>
                                <option value="NOT_RECOMMEND">Not Recommend</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Attachments -->
            <div class="form-section">
                <h5 class="section-title">
                    <i class="fas fa-paperclip me-2 text-primary"></i>
                    Attachments
                </h5>

                <div class="mb-3">
                    <label class="form-label">Supporting Documents</label>
                    <input type="file" name="attachments" class="form-control" multiple
                           accept=".pdf,.doc,.docx,.jpg,.jpeg,.png">
                    <small class="text-muted">
                        <i class="fas fa-info-circle me-1"></i>
                        Max file size: 5MB. Allowed formats: PDF, DOC, DOCX, JPG, PNG
                    </small>
                </div>
                <div id="fileList" class="mt-2"></div>
            </div>

            <!-- Action Buttons -->
            <div class="action-buttons">
                <div class="d-flex justify-content-between">
                    <g:link controller="dashboard" action="supervisor" class="btn btn-secondary btn-lg">
                        <i class="fas fa-times me-2"></i>Cancel
                    </g:link>
                    <div>
                        <button type="button" class="btn btn-info btn-lg me-2" onclick="saveDraft()">
                            <i class="fas fa-save me-2"></i>Save Draft
                        </button>
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-paper-plane me-2"></i>Submit Evaluation
                        </button>
                    </div>
                </div>
            </div>
        </g:uploadForm>
    </g:if>
    <g:elseif test="${!intern && !interns}">
        <div class="text-center py-5">
            <i class="fas fa-users fa-4x text-muted mb-3"></i>
            <h4 class="text-muted">No Interns Available</h4>
            <p class="text-muted">You don't have any interns assigned for evaluation.</p>
            <g:link controller="dashboard" action="supervisor" class="btn btn-primary">
                <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
            </g:link>
        </div>
    </g:elseif>
</div>

<!-- JavaScript -->
<script>
    // Preview selected files
    document.getElementById('attachments')?.addEventListener('change', function(event) {
        const fileList = document.getElementById('fileList');
        fileList.innerHTML = '';

        if (this.files.length > 0) {
            const list = document.createElement('ul');
            list.className = 'list-group';

            Array.from(event.target.files).forEach(function(file) {
                const li = document.createElement('li');
                li.className = 'list-group-item d-flex justify-content-between align-items-center';

                const nameSpan = document.createElement('span');
                nameSpan.innerHTML = '<i class="fas fa-file me-2"></i>' + file.name;

                const sizeSpan = document.createElement('span');
                sizeSpan.className = 'badge bg-secondary';
                sizeSpan.innerText = (file.size / 1024).toFixed(1) + ' KB';

                li.appendChild(nameSpan);
                li.appendChild(sizeSpan);
                list.appendChild(li);
            });

            fileList.appendChild(list);
        }
    });

    // Save draft to localStorage
    function saveDraft() {
        const formData = {
            periodStart: document.querySelector('input[name="periodStart"]')?.value || '',
            periodEnd: document.querySelector('input[name="periodEnd"]')?.value || '',
            technicalSkills: document.querySelector('input[name="technicalSkills"]:checked')?.value || '3',
            communicationSkills: document.querySelector('input[name="communicationSkills"]:checked')?.value || '3',
            problemSolving: document.querySelector('input[name="problemSolving"]:checked')?.value || '3',
            initiative: document.querySelector('input[name="initiative"]:checked')?.value || '3',
            teamwork: document.querySelector('input[name="teamwork"]:checked')?.value || '3',
            strengths: document.querySelector('textarea[name="strengths"]')?.value || '',
            improvements: document.querySelector('textarea[name="improvements"]')?.value || '',
            generalComments: document.querySelector('textarea[name="generalComments"]')?.value || '',
            overallRating: document.querySelector('select[name="overallRating"]')?.value || '',
            recommendation: document.querySelector('select[name="recommendation"]')?.value || '',
            internId: '${intern?.id}',
            lastSaved: new Date().toISOString()
        };

        localStorage.setItem('evaluation_draft_${intern?.id}', JSON.stringify(formData));

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
        const saved = localStorage.getItem('evaluation_draft_${intern?.id}');
        if (saved) {
            try {
                const data = JSON.parse(saved);
                const savedTime = new Date(data.lastSaved);
                const now = new Date();
                const minutesDiff = Math.round((now - savedTime) / 60000);

                if (minutesDiff < 60 && confirm('You have a draft saved from ' + minutesDiff + ' minute(s) ago. Would you like to load it?')) {
                    document.querySelector('input[name="periodStart"]').value = data.periodStart || '';
                    document.querySelector('input[name="periodEnd"]').value = data.periodEnd || '';

                    if (data.technicalSkills) {
                        document.querySelector('input[name="technicalSkills"][value="' + data.technicalSkills + '"]').checked = true;
                    }
                    if (data.communicationSkills) {
                        document.querySelector('input[name="communicationSkills"][value="' + data.communicationSkills + '"]').checked = true;
                    }
                    if (data.problemSolving) {
                        document.querySelector('input[name="problemSolving"][value="' + data.problemSolving + '"]').checked = true;
                    }
                    if (data.initiative) {
                        document.querySelector('input[name="initiative"][value="' + data.initiative + '"]').checked = true;
                    }
                    if (data.teamwork) {
                        document.querySelector('input[name="teamwork"][value="' + data.teamwork + '"]').checked = true;
                    }

                    document.querySelector('textarea[name="strengths"]').value = data.strengths || '';
                    document.querySelector('textarea[name="improvements"]').value = data.improvements || '';
                    document.querySelector('textarea[name="generalComments"]').value = data.generalComments || '';
                    document.querySelector('select[name="overallRating"]').value = data.overallRating || '';
                    document.querySelector('select[name="recommendation"]').value = data.recommendation || '';
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

    // Calculate total score
    function calculateTotal() {
        const tech = parseInt(document.querySelector('input[name="technicalSkills"]:checked')?.value || 0);
        const comm = parseInt(document.querySelector('input[name="communicationSkills"]:checked')?.value || 0);
        const prob = parseInt(document.querySelector('input[name="problemSolving"]:checked')?.value || 0);
        const init = parseInt(document.querySelector('input[name="initiative"]:checked')?.value || 0);
        const team = parseInt(document.querySelector('input[name="teamwork"]:checked')?.value || 0);

        const total = (tech * 0.3) + (comm * 0.2) + (prob * 0.2) + (init * 0.15) + (team * 0.15);
        return total.toFixed(1);
    }

    // Update rating display
    const radios = document.querySelectorAll('input[type="radio"]');
    radios.forEach(radio => {
        radio.addEventListener('change', function() {
            const total = calculateTotal();
            console.log('Total Score:', total);
        });
    });

    // التأكد من عمل قائمة اختيار المتدرب
    document.addEventListener('DOMContentLoaded', function() {
        const internSelector = document.getElementById('internSelector');
        if (internSelector) {
            console.log('Intern selector found with', internSelector.options.length, 'options');
        }
    });
</script>

</html>