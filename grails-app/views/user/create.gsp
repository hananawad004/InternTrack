<%--
  Created by IntelliJ IDEA.
  User: Eng.Hanan Awad
  Date: 2/11/2026
  Time: 10:17 AM
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title></title>--}%
%{--</head>--}%

%{--<body>--}%

%{--</body>--}%
%{--</html>--}%
<!-- File: grails-app/views/user/create.gsp -->
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Create New User</title>
  <asset:stylesheet src="bootstrap.css"/>
</head>
<body>
<div class="container mt-4">
  <div class="row">
    <div class="col-md-8 offset-md-2">
      <div class="card">
        <div class="card-header">
          <h4 class="mb-0">
            <i class="fas fa-user-plus"></i> Create New User
          </h4>
        </div>
        <div class="card-body">
          <g:if test="${flash.error}">
            <div class="alert alert-danger">
              ${flash.error}
            </div>
          </g:if>

          <g:form action="save" method="POST">
            <div class="row">
              <!-- Username -->
              <div class="col-md-6 mb-3">
                <label for="username" class="form-label">
                  <i class="fas fa-envelope"></i> Username (Email)*
                </label>
                <g:textField name="username"
                             class="form-control ${hasErrors(bean: user, field: 'username', 'is-invalid')}"
                             value="${user?.username}"
                             placeholder="user@example.com"
                             required="true"/>
                <g:renderErrors bean="${user}" field="username"
                                as="list" class="invalid-feedback"/>
              </div>

              <!-- Password -->
              <div class="col-md-6 mb-3">
                <label for="password" class="form-label">
                  <i class="fas fa-lock"></i> Password*
                </label>
                <g:passwordField name="password"
                                 class="form-control ${hasErrors(bean: user, field: 'password', 'is-invalid')}"
                                 placeholder="At least 6 characters"
                                 required="true"/>
                <div class="form-text">Password will be encrypted automatically</div>
                <g:renderErrors bean="${user}" field="password"
                                as="list" class="invalid-feedback"/>
              </div>
            </div>

            <div class="row">
              <!-- Email -->
              <div class="col-md-6 mb-3">
                <label for="email" class="form-label">
                  <i class="fas fa-at"></i> Email Address*
                </label>
                <g:textField name="email"
                             class="form-control ${hasErrors(bean: user, field: 'email', 'is-invalid')}"
                             value="${user?.email}"
                             placeholder="user@example.com"
                             required="true"/>
                <g:renderErrors bean="${user}" field="email"
                                as="list" class="invalid-feedback"/>
              </div>

              <!-- Full Name -->
              <div class="col-md-6 mb-3">
                <label for="fullName" class="form-label">
                  <i class="fas fa-user"></i> Full Name*
                </label>
                <g:textField name="fullName"
                             class="form-control ${hasErrors(bean: user, field: 'fullName', 'is-invalid')}"
                             value="${user?.fullName}"
                             placeholder="John Doe"
                             required="true"/>
                <g:renderErrors bean="${user}" field="fullName"
                                as="list" class="invalid-feedback"/>
              </div>
            </div>

            <div class="row">
              <!-- Phone -->
              <div class="col-md-6 mb-3">
                <label for="phone" class="form-label">
                  <i class="fas fa-phone"></i> Phone Number
                </label>
                <g:textField name="phone"
                             class="form-control ${hasErrors(bean: user, field: 'phone', 'is-invalid')}"
                             value="${user?.phone}"
                             placeholder="+1234567890"/>
                <g:renderErrors bean="${user}" field="phone"
                                as="list" class="invalid-feedback"/>
              </div>

              <!-- Enabled Status -->
              <div class="col-md-6 mb-3">
                <label class="form-label">
                  <i class="fas fa-toggle-on"></i> Account Status
                </label>
                <div class="form-check">
                  <g:checkBox name="enabled"
                              class="form-check-input"
                              value="${user?.enabled ?: true}"/>
                  <label class="form-check-label" for="enabled">
                    Account Enabled
                  </label>
                </div>
              </div>
            </div>

            <!-- Roles -->
            <div class="mb-4">
              <label class="form-label">
                <i class="fas fa-user-tag"></i> User Roles*
              </label>
              <div class="row">
                <g:each in="${roles}" var="role">
                  <div class="col-md-4">
                    <div class="form-check">
                      <g:checkBox name="selectedRoles"
                                  value="${role.id}"
                                  class="form-check-input"/>
                      <label class="form-check-label" for="selectedRoles">
                        <g:if test="${role.authority == 'ROLE_ADMIN'}">
                          <span class="badge bg-danger">${role.authority}</span>
                        </g:if>
                        <g:elseif test="${role.authority == 'ROLE_SUPERVISOR'}">
                          <span class="badge bg-warning">${role.authority}</span>
                        </g:elseif>
                        <g:else>
                          <span class="badge bg-info">${role.authority}</span>
                        </g:else>
                      </label>
                    </div>
                  </div>
                </g:each>
              </div>
            </div>

            <!-- Buttons -->
            <div class="d-flex justify-content-between mt-4">
              <g:link action="index" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to List
              </g:link>
              <button type="submit" class="btn btn-primary">
                <i class="fas fa-save"></i> Create User
              </button>
            </div>
          </g:form>
        </div>
      </div>
    </div>
  </div>
</div>

<asset:javascript src="bootstrap.bundle.js"/>
</body>
</html>