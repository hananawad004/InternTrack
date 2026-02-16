<%--
  Created by IntelliJ IDEA.
  User: Eng.Hanan Awad
  Date: 2/11/2026
  Time: 10:18 AM
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title></title>--}%
%{--</head>--}%

%{--<body>--}%

%{--</body>--}%
%{--</html>--}%
<!-- File: grails-app/views/user/show.gsp -->
<!DOCTYPE html>
<html>
<head>
  <meta name="layouts" content="main"/>
  <title>User Details - ${user.username}</title>
  <asset:stylesheet src="bootstrap.css"/>
</head>

<div class="container mt-4">
  <div class="row mb-3">
    <div class="col-12">
      <g:link action="index" class="btn btn-secondary">
        <i class="fas fa-arrow-left"></i> Back to Users
      </g:link>
    </div>
  </div>

  <div class="row">
    <div class="col-md-8 offset-md-2">
      <div class="card">
        <div class="card-header">
          <h4 class="mb-0">
            <i class="fas fa-user-circle"></i> User Details
          </h4>
        </div>
        <div class="card-body">
          <div class="row mb-4">
            <div class="col-md-8">
              <h5>${user.fullName}</h5>
              <p class="text-muted mb-0">${user.username}</p>
            </div>
            <div class="col-md-4 text-end">
              <g:if test="${user.enabled}">
                <span class="badge bg-success fs-6">Active</span>
              </g:if>
              <g:else>
                <span class="badge bg-secondary fs-6">Inactive</span>
              </g:else>
            </div>
          </div>

          <div class="row">
            <!-- Basic Information -->
            <div class="col-md-6">
              <div class="mb-4">
                <h6><i class="fas fa-info-circle"></i> Basic Information</h6>
                <hr>
                <dl class="row">
                  <dt class="col-sm-4">Email:</dt>
                  <dd class="col-sm-8">${user.email}</dd>

                  <dt class="col-sm-4">Phone:</dt>
                  <dd class="col-sm-8">${user.phone ?: 'Not provided'}</dd>

                  <dt class="col-sm-4">Created:</dt>
                  <dd class="col-sm-8">
                    <g:formatDate date="${user.dateCreated}" format="dd/MM/yyyy HH:mm"/>
                  </dd>

                  <dt class="col-sm-4">Last Updated:</dt>
                  <dd class="col-sm-8">
                    <g:formatDate date="${user.lastUpdated}" format="dd/MM/yyyy HH:mm"/>
                  </dd>
                </dl>
              </div>
            </div>

            <!-- Roles & Permissions -->
            <div class="col-md-6">
              <div class="mb-4">
                <h6><i class="fas fa-user-tag"></i> Roles & Permissions</h6>
                <hr>
                <g:if test="${user.authorities}">
                  <g:each in="${user.authorities}" var="role">
                    <div class="mb-2">
                      <g:if test="${role.authority == 'ROLE_ADMIN'}">
                        <span class="badge bg-danger p-2 fs-6">${role.authority}</span>
                        <p class="text-muted mt-1">Full system access</p>
                      </g:if>
                      <g:elseif test="${role.authority == 'ROLE_SUPERVISOR'}">
                        <span class="badge bg-warning p-2 fs-6">${role.authority}</span>
                        <p class="text-muted mt-1">Can manage interns and view reports</p>
                      </g:elseif>
                      <g:else>
                        <span class="badge bg-info p-2 fs-6">${role.authority}</span>
                        <p class="text-muted mt-1">Basic intern access</p>
                      </g:else>
                    </div>
                  </g:each>
                </g:if>
                <g:else>
                  <p class="text-muted">No roles assigned</p>
                </g:else>
              </div>
            </div>
          </div>

          <!-- Account Status -->
          <div class="mt-4">
            <h6><i class="fas fa-shield-alt"></i> Account Status</h6>
            <hr>
            <div class="row">
              <div class="col-md-3">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox"
                    ${user.enabled ? 'checked' : ''} disabled>
                  <label class="form-check-label">Enabled</label>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox"
                    ${user.accountExpired ? 'checked' : ''} disabled>
                  <label class="form-check-label">Account Expired</label>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox"
                    ${user.accountLocked ? 'checked' : ''} disabled>
                  <label class="form-check-label">Account Locked</label>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox"
                    ${user.passwordExpired ? 'checked' : ''} disabled>
                  <label class="form-check-label">Password Expired</label>
                </div>
              </div>
            </div>
          </div>

          <!-- Actions -->
          <div class="mt-4 d-flex justify-content-between">
            <g:link action="edit" id="${user.id}" class="btn btn-warning">
              <i class="fas fa-edit"></i> Edit User
            </g:link>
            <g:link action="index" class="btn btn-secondary">
              <i class="fas fa-list"></i> View All Users
            </g:link>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</html>