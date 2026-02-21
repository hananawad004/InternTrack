<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create New Supervisor - InternTrack</title>
    <style>
    .form-container {
        max-width: 800px;
        margin: 0 auto;
    }
    .form-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        padding: 30px;
    }
    .form-header {
        margin-bottom: 30px;
        border-bottom: 2px solid #ECF0F1;
        padding-bottom: 20px;
    }
    .form-header h2 {
        color: #2C3E50;
        font-weight: 700;
        margin-bottom: 5px;
    }
    .form-section {
        background: #F8F9FA;
        border-radius: 8px;
        padding: 20px;
        margin-bottom: 25px;
    }
    .form-section-title {
        color: #2C3E50;
        font-size: 16px;
        font-weight: 600;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
    }
    .form-section-title i {
        margin-right: 10px;
        color: #1ABC9C;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-label {
        display: block;
        font-size: 13px;
        font-weight: 600;
        color: #34495E;
        margin-bottom: 8px;
    }
    .form-label .required {
        color: #E74C3C;
        margin-left: 4px;
    }
    .form-control {
        width: 100%;
        padding: 10px 14px;
        border: 2px solid #E0E0E0;
        border-radius: 8px;
        font-size: 14px;
        transition: all 0.3s;
        box-sizing: border-box;
    }
    .form-control:focus {
        outline: none;
        border-color: #1ABC9C;
        box-shadow: 0 0 0 3px rgba(26, 188, 156, 0.1);
    }
    .row {
        display: flex;
        flex-wrap: wrap;
        margin: 0 -10px;
    }
    .col-md-6 {
        width: 50%;
        padding: 0 10px;
        box-sizing: border-box;
    }
    .col-md-12 {
        width: 100%;
        padding: 0 10px;
        box-sizing: border-box;
    }
    .form-actions {
        display: flex;
        justify-content: flex-end;
        gap: 15px;
        margin-top: 30px;
        padding-top: 20px;
        border-top: 1px solid #ECF0F1;
    }
    .btn {
        padding: 12px 24px;
        border-radius: 8px;
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
    .btn-primary {
        background: linear-gradient(135deg, #1ABC9C, #16A085);
        color: white;
    }
    .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(26, 188, 156, 0.3);
    }
    .btn-secondary {
        background: #ECF0F1;
        color: #7F8C8D;
    }
    .alert {
        padding: 15px 20px;
        border-radius: 8px;
        margin-bottom: 20px;
    }
    .alert-danger {
        background: #FDEDEC;
        color: #E74C3C;
        border: 1px solid #FADBD8;
    }
    .alert-info {
        background: #d1ecf1;
        color: #0c5460;
        border: 1px solid #bee5eb;
    }
    </style>
</head>

<div class="form-container">
    <div class="form-card">
        <div class="form-header">
            <h2><i class="fas fa-user-tie"></i> Create New Supervisor</h2>
            <p>Add a new supervisor to the system</p>
        </div>

        <g:if test="${flash.error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle"></i>
                ${flash.error}
            </div>
        </g:if>

        <g:if test="${selectedUser}">
            <div class="alert alert-info">
                <i class="fas fa-info-circle me-2"></i>
                Creating supervisor for user: <strong>${selectedUser.fullName}</strong> (${selectedUser.username})
            </div>
        </g:if>

        <g:form controller="supervisor" action="save" method="POST" autocomplete="off">

            <g:if test="${selectedUser}">
                <input type="hidden" name="userId" value="${selectedUser.id}"/>
            </g:if>

            <!-- User Account Section (only show if no selectedUser) -->
            <g:if test="${!selectedUser}">
                <div class="form-section">
                    <div class="form-section-title">
                        <i class="fas fa-user-circle"></i>
                        User Account Information
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">
                                    <i class="fas fa-user"></i>
                                    Full Name <span class="required">*</span>
                                </label>
                                <input type="text" name="fullName" class="form-control" required
                                       placeholder="e.g., Ahmed Mohammed" value="${params.fullName}"/>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">
                                    <i class="fas fa-envelope"></i>
                                    Email <span class="required">*</span>
                                </label>
                                <input type="email" name="email" class="form-control" required
                                       placeholder="ahmed@company.com" value="${params.email}"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">
                                    <i class="fas fa-lock"></i>
                                    Password
                                </label>
                                <input type="password" name="password" class="form-control"
                                       placeholder="Leave blank for default (super123)"/>
                                <small class="form-text">Default: super123</small>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">
                                    <i class="fas fa-phone"></i>
                                    Phone Number
                                </label>
                                <input type="text" name="phone" class="form-control"
                                       placeholder="+966501234567" value="${params.phone}"/>
                            </div>
                        </div>
                    </div>
                </div>
            </g:if>

            <!-- Supervisor Details Section -->
            <div class="form-section">
                <div class="form-section-title">
                    <i class="fas fa-briefcase"></i>
                    Supervisor Details
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-id-card"></i>
                                Employee ID <span class="required">*</span>
                            </label>
                            <input type="text" name="employeeId" class="form-control" required
                                   placeholder="e.g., EMP001" value="${params.employeeId}"/>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-building"></i>
                                Department <span class="required">*</span>
                            </label>
                            <input type="text" name="department" class="form-control" required
                                   placeholder="e.g., Software Engineering" value="${params.department}"/>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-briefcase"></i>
                                Position <span class="required">*</span>
                            </label>
                            <input type="text" name="position" class="form-control" required
                                   placeholder="e.g., Senior Developer" value="${params.position}"/>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-users"></i>
                                Max Interns
                            </label>
                            <g:select name="maxInterns"
                                      from="${maxInternsList}"
                                      value="${params.int('maxInterns') ?: 5}"
                                      class="form-control"/>
                            <small class="form-text">Default: 5 interns</small>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-map-marker-alt"></i>
                                Office Location
                            </label>
                            <input type="text" name="officeLocation" class="form-control"
                                   placeholder="e.g., Building A, Room 101" value="${params.officeLocation}"/>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-phone-alt"></i>
                                Phone Extension
                            </label>
                            <input type="text" name="phoneExtension" class="form-control"
                                   placeholder="e.g., 1234" value="${params.phoneExtension}"/>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="form-group">
                        <label class="form-label">
                            <i class="fas fa-certificate"></i>
                            Qualifications
                        </label>
                        <textarea name="qualifications" class="form-control" rows="3"
                                  placeholder="e.g., PhD in Computer Science, 5+ years experience...">${params.qualifications}</textarea>
                    </div>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="form-actions">
                <g:link controller="supervisor" action="index" class="btn btn-secondary">
                    <i class="fas fa-times"></i> Cancel
                </g:link>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Create Supervisor
                </button>
            </div>
        </g:form>
    </div>
</div>
</html>