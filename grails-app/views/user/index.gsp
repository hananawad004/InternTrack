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
<!-- File: grails-app/views/user/index.gsp -->
<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Users Management</title>
  <asset:stylesheet src="bootstrap.css"/>
  <asset:stylesheet src="dataTables.bootstrap5.css"/>
</head>
<body>
<div class="container-fluid mt-4">
  <div class="row mb-4">
    <div class="col-12">
      <div class="d-flex justify-content-between align-items-center">
        <h2>
          <i class="fas fa-users"></i> Users Management
        </h2>
        <g:link controller="user" action="create" class="btn btn-primary">
          <i class="fas fa-plus"></i> Add New User
        </g:link>
      </div>
    </div>
  </div>

  <g:if test="${flash.message}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
      ${flash.message}
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </g:if>

  <g:if test="${flash.error}">
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      ${flash.error}
      <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
  </g:if>

  <div class="card">
    <div class="card-body">
      <table class="table table-striped table-hover" id="usersTable">
        <thead>
        <tr>
          <th>Username</th>
          <th>Full Name</th>
          <th>Email</th>
          <th>Roles</th>
          <th>Status</th>
          <th>Created</th>
          <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${users}" var="user">
          <tr>
            <td>${user.username}</td>
            <td>${user.fullName}</td>
            <td>${user.email}</td>
            <td>
              <g:each in="${user.authorities}" var="role">
                <g:if test="${role.authority == 'ROLE_ADMIN'}">
                  <span class="badge bg-danger">${role.authority}</span>
                </g:if>
                <g:elseif test="${role.authority == 'ROLE_SUPERVISOR'}">
                  <span class="badge bg-warning">${role.authority}</span>
                </g:elseif>
                <g:else>
                  <span class="badge bg-info">${role.authority}</span>
                </g:else>
              </g:each>
            </td>
            <td>
              <g:if test="${user.enabled}">
                <span class="badge bg-success">Active</span>
              </g:if>
              <g:else>
                <span class="badge bg-secondary">Inactive</span>
              </g:else>
            </td>
            <td>
              <g:formatDate date="${user.dateCreated}" format="dd/MM/yyyy"/>
            </td>
            <td>
              <div class="btn-group btn-group-sm" role="group">
                <g:link action="show" id="${user.id}"
                        class="btn btn-info" title="View">
                  <i class="fas fa-eye"></i>
                </g:link>
                <g:link action="edit" id="${user.id}"
                        class="btn btn-warning" title="Edit">
                  <i class="fas fa-edit"></i>
                </g:link>
                <g:link action="delete" id="${user.id}"
                        class="btn btn-danger"
                        onclick="return confirm('Are you sure you want to delete this user?')"
                        title="Delete">
                  <i class="fas fa-trash"></i>
                </g:link>
              </div>
            </td>
          </tr>
        </g:each>
        </tbody>
      </table>
    </div>
  </div>
</div>

<asset:javascript src="jquery.js"/>
<asset:javascript src="bootstrap.bundle.js"/>
<asset:javascript src="jquery.dataTables.js"/>
<asset:javascript src="dataTables.bootstrap5.js"/>

<script>
  $(document).ready(function() {
    $('#usersTable').DataTable({
      pageLength: 10,
      responsive: true,
      order: [[5, 'desc']]
    });
  });
</script>
</body>
</html>