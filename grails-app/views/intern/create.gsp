<!-- File: grails-app/views/intern/create.gsp -->
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Create New Intern - InternTrack</title>
    <style>
    .form-container {
        max-width: 900px;
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

    .form-header p {
        color: #7F8C8D;
        font-size: 14px;
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

    .form-control.is-invalid {
        border-color: #E74C3C;
    }

    .invalid-feedback {
        color: #E74C3C;
        font-size: 12px;
        margin-top: 5px;
    }

    .form-text {
        color: #7F8C8D;
        font-size: 12px;
        margin-top: 5px;
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

    .col-md-4 {
        width: 33.333%;
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

    .btn-secondary:hover {
        background: #E0E0E0;
    }

    .alert {
        padding: 15px 20px;
        border-radius: 8px;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
    }

    .alert-danger {
        background: #FDEDEC;
        color: #E74C3C;
        border: 1px solid #FADBD8;
    }

    .alert-success {
        background: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }

    .alert-warning {
        background: #fff3cd;
        color: #856404;
        border: 1px solid #ffeeba;
    }

    .alert i {
        margin-right: 10px;
    }

    @media (max-width: 768px) {
        .col-md-6, .col-md-4 {
            width: 100%;
        }
    }
    </style>
</head>

<div class="form-container">
    <div class="form-card">
        <div class="form-header">
            <h2><i class="fas fa-user-graduate"></i> Create New Intern</h2>
            <p>Add a new intern to the system - User account will be created automatically</p>
        </div>

        <g:if test="${flash.error}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-circle"></i>
                ${flash.error}
            </div>
        </g:if>

        <g:if test="${flash.warning}">
            <div class="alert alert-warning">
                <i class="fas fa-exclamation-triangle"></i>
                ${flash.warning}
            </div>
        </g:if>

        <g:hasErrors bean="${intern}">
            <div class="alert alert-danger">
                <i class="fas fa-exclamation-triangle"></i>
                Please correct the errors below.
            </div>
        </g:hasErrors>

        <g:form name="createInternForm" controller="intern" action="save" method="POST" autocomplete="off">

            <!-- Personal Information Section -->
            <div class="form-section">
                <div class="form-section-title">
                    <i class="fas fa-user-circle"></i>
                    Personal Information
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-id-card"></i>
                                Student ID <span class="required">*</span>
                            </label>
                            <g:textField name="studentId"
                                         value="${intern?.studentId}"
                                         class="form-control ${hasErrors(bean: intern, field: 'studentId', 'is-invalid')}"
                                         placeholder="e.g., 20230001"
                                         required=""/>
                            <g:hasErrors bean="${intern}" field="studentId">
                                <div class="invalid-feedback">
                                    <g:eachError bean="${intern}" field="studentId">
                                        <g:message error="${it}"/>
                                    </g:eachError>
                                </div>
                            </g:hasErrors>
                            <div class="form-text">Unique student identification number</div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-user"></i>
                                Full Name <span class="required">*</span>
                            </label>
                            <g:textField name="fullName"
                                         value=""
                                         class="form-control"
                                         placeholder="e.g., Ahmed Mohammed"
                                         required=""/>
                            <div class="form-text">Intern's full name (will be used for user account)</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Academic Information Section -->
            <div class="form-section">
                <div class="form-section-title">
                    <i class="fas fa-graduation-cap"></i>
                    Academic Information
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-university"></i>
                                University <span class="required">*</span>
                            </label>
                            <g:textField name="university"
                                         value="${intern?.university}"
                                         class="form-control ${hasErrors(bean: intern, field: 'university', 'is-invalid')}"
                                         placeholder="e.g., King Saud University"
                                         required=""/>
                            <g:hasErrors bean="${intern}" field="university">
                                <div class="invalid-feedback">
                                    <g:eachError bean="${intern}" field="university">
                                        <g:message error="${it}"/>
                                    </g:eachError>
                                </div>
                            </g:hasErrors>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-book"></i>
                                Major <span class="required">*</span>
                            </label>
                            <g:textField name="major"
                                         value="${intern?.major}"
                                         class="form-control ${hasErrors(bean: intern, field: 'major', 'is-invalid')}"
                                         placeholder="e.g., Computer Science"
                                         required=""/>
                            <g:hasErrors bean="${intern}" field="major">
                                <div class="invalid-feedback">
                                    <g:eachError bean="${intern}" field="major">
                                        <g:message error="${it}"/>
                                    </g:eachError>
                                </div>
                            </g:hasErrors>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-building"></i>
                                Department
                            </label>
                            <g:textField name="department"
                                         value="${intern?.department}"
                                         class="form-control"
                                         placeholder="e.g., Software Development"/>
                            <div class="form-text">Optional: Specific department</div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-calendar-alt"></i>
                                Year of Study
                            </label>
                            <g:select name="yearOfStudy"
                                      from="${yearOfStudyList}"
                                      value="${intern?.yearOfStudy}"
                                      noSelection="['': '-- Select Year --']"
                                      class="form-control"/>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Internship Details Section -->
            <div class="form-section">
                <div class="form-section-title">
                    <i class="fas fa-briefcase"></i>
                    Internship Details
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-calendar"></i>
                                Start Date <span class="required">*</span>
                            </label>
                            <g:datePicker name="startDate"
                                          value="${intern?.startDate ?: new Date()}"
                                          precision="day"
                                          years="${2024..2026}"
                                          class="form-control"
                                          required=""/>
                            <g:hasErrors bean="${intern}" field="startDate">
                                <div class="invalid-feedback">
                                    <g:eachError bean="${intern}" field="startDate">
                                        <g:message error="${it}"/>
                                    </g:eachError>
                                </div>
                            </g:hasErrors>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-calendar"></i>
                                End Date <span class="required">*</span>
                            </label>
                            <g:datePicker name="endDate"
                                          value="${intern?.endDate ?: defaultEndDate}"
                                          precision="day"
                                          years="${2024..2026}"
                                          class="form-control"
                                          required=""/>
                            <g:hasErrors bean="${intern}" field="endDate">
                                <div class="invalid-feedback">
                                    <g:eachError bean="${intern}" field="endDate">
                                        <g:message error="${it}"/>
                                    </g:eachError>
                                </div>
                            </g:hasErrors>
                            <div class="form-text">Default: 90 days from today</div>
                        </div>
                    </div>

%{--                    <div class="col-md-6">--}%
%{--                        <div class="form-group">--}%
%{--                            <label class="form-label">--}%
%{--                                <i class="fas fa-user-tie"></i>--}%
%{--                                Supervisor <span class="required">*</span>--}%
%{--                            </label>--}%
%{--                            <g:select name="supervisorId"--}%
%{--                                      from="${supervisors}"--}%
%{--                                      optionKey="id"--}%
%{--                                      optionValue="${{ it.user?.fullName + ' - ' + it.position }}"--}%
%{--                                      value="${intern?.supervisor?.id}"--}%
%{--                                      noSelection="['': '-- Select Supervisor --']"--}%
%{--                                      class="form-control ${hasErrors(bean: intern, field: 'supervisor', 'is-invalid')}"--}%
%{--                                      required=""/>--}%
%{--                            <g:hasErrors bean="${intern}" field="supervisor">--}%
%{--                                <div class="invalid-feedback">--}%
%{--                                    <g:eachError bean="${intern}" field="supervisor">--}%
%{--                                        <g:message error="${it}"/>--}%
%{--                                    </g:eachError>--}%
%{--                                </div>--}%
%{--                            </g:hasErrors>--}%
%{--                        </div>--}%
%{--                    </div>--}%
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-user-tie"></i>
                                Supervisor <span class="required">*</span>
                            </label>


                            <g:if test="${supervisors && supervisors.size() > 0}">
                                <g:select name="supervisorId"
                                          from="${supervisors}"
                                          optionKey="id"
                                          optionValue="${{ it.user?.fullName ? it.user.fullName + ' - ' + it.position : 'Unknown Supervisor' }}"
                                          value="${intern?.supervisor?.id}"
                                          noSelection="['': '-- Select Supervisor --']"
                                          class="form-control ${hasErrors(bean: intern, field: 'supervisor', 'is-invalid')}"
                                          required=""/>
                            </g:if>
                            <g:else>
                                <select name="supervisorId" class="form-control" required>
                                    <option value="">-- No Supervisors Available --</option>
                                </select>
                                <div class="form-text text-danger">No supervisors found. Please create a supervisor first.</div>
                            </g:else>

                            <g:hasErrors bean="${intern}" field="supervisor">
                                <div class="invalid-feedback">
                                    <g:eachError bean="${intern}" field="supervisor">
                                        <g:message error="${it}"/>
                                    </g:eachError>
                                </div>
                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-flag"></i>
                                Status
                            </label>
                            <g:select name="status"
                                      from="['ACTIVE', 'COMPLETED', 'TERMINATED']"
                                      value="${intern?.status ?: 'ACTIVE'}"
                                      class="form-control"/>
                            <div class="form-text">Default: ACTIVE</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Emergency Contact Section -->
            <div class="form-section">
                <div class="form-section-title">
                    <i class="fas fa-phone-alt"></i>
                    Emergency Contact (Optional)
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-user"></i>
                                Contact Name
                            </label>
                            <g:textField name="emergencyContact"
                                         value="${intern?.emergencyContact}"
                                         class="form-control"
                                         placeholder="e.g., Parent, Spouse"/>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-phone"></i>
                                Contact Phone
                            </label>
                            <g:textField name="emergencyPhone"
                                         value="${intern?.emergencyPhone}"
                                         class="form-control"
                                         placeholder="e.g., +966501234567"/>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Additional Notes -->
            <div class="form-section">
                <div class="form-section-title">
                    <i class="fas fa-sticky-note"></i>
                    Additional Notes
                </div>

                <div class="form-group">
                    <label class="form-label">Notes</label>
                    <g:textArea name="notes"
                                value="${intern?.notes}"
                                rows="4"
                                class="form-control"
                                placeholder="Any additional information about this intern..."/>
                </div>
            </div>

            <!-- Form Actions -->
            <div class="form-actions">
                <g:link controller="intern" action="index" class="btn btn-secondary">
                    <i class="fas fa-times"></i> Cancel
                </g:link>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Create Intern
                </button>
            </div>

        </g:form>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.querySelector('form[name="createInternForm"]');

        form.addEventListener('submit', function(e) {
            const studentId = document.querySelector('[name="studentId"]').value;
            const fullName = document.querySelector('[name="fullName"]').value;
            const university = document.querySelector('[name="university"]').value;
            const major = document.querySelector('[name="major"]').value;
            const supervisorId = document.querySelector('[name="supervisorId"]').value;

            if (!studentId || !fullName || !university || !major || !supervisorId) {
                e.preventDefault();
                alert('Please fill in all required fields');
                return false;
            }

            return true;
        });
    });
</script>

</html>