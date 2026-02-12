<!DOCTYPE html>
<html>
<head>
  <meta name="layout" content="main"/>
  <title>Edit User - ${user.username} - InternTrack</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet"/>
  <style>
  .form-label.required:after {
    content: " *";
    color: #dc3545;
  }
  .avatar-edit {
    width: 100px;
    height: 100px;
    font-size: 40px;
  }
  .password-strength {
    height: 5px;
    border-radius: 3px;
    transition: all 0.3s ease;
  }
  </style>
</head>
<body>
<div class="container-fluid">
  <div class="row mb-4">
    <div class="col-12">
      <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><g:link action="index">Users</g:link></li>
          <li class="breadcrumb-item"><g:link action="show" id="${user.id}">${user.username}</g:link></li>
          <li class="breadcrumb-item active">Edit User</li>
        </ol>
      </nav>
      <div class="d-flex justify-content-between align-items-center">
        <h2 class="mb-0"><i class="fas fa-user-edit me-2"></i>Edit User</h2>
        <div class="btn-group">
          <g:link action="show" id="${user.id}" class="btn btn-outline-info"><i class="fas fa-eye me-1"></i> View</g:link>
          <g:link action="index" class="btn btn-outline-secondary"><i class="fas fa-list me-1"></i> All Users</g:link>
        </div>
      </div>
      <p class="text-muted mb-0">Update user information and permissions</p>
    </div>
  </div>

  <div class="row justify-content-center">
    <div class="col-lg-10">
      <div class="card">
        <div class="card-header">
          <div class="row align-items-center">
            <div class="col-md-6">
              <h5 class="mb-0"><i class="fas fa-user-circle me-2"></i>Edit User Information</h5>
            </div>
            <div class="col-md-6 text-end">
              <div class="badge bg-primary fs-6">User ID: ${user.id}</div>
            </div>
          </div>
        </div>

        <div class="card-body">
          <g:form action="update" method="POST" class="needs-validation" novalidate="novalidate">
            <g:hiddenField name="version" value="${user.version}" />

            <!-- User Info -->
            <div class="row mb-4">
              <div class="col-md-2 text-center">
                <div class="avatar-edit bg-primary text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-2">${user.initials}</div>
                <small class="text-muted">${user.username}</small>
              </div>
              <div class="col-md-10">
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label for="fullName" class="form-label required"><i class="fas fa-user me-1"></i>Full Name</label>
                    <input type="text" class="form-control ${hasErrors(bean: user, field: 'fullName', 'is-invalid')}" id="fullName" name="fullName" value="${user.fullName}" placeholder="John Doe" required>
                    <div class="invalid-feedback">Please enter the full name.</div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="username" class="form-label required"><i class="fas fa-envelope me-1"></i>Username (Email)</label>
                    <input type="email" class="form-control ${hasErrors(bean: user, field: 'username', 'is-invalid')}" id="username" name="username" value="${user.username}" placeholder="user@example.com" readonly style="background-color: #f8f9fa;">
                    <small class="text-muted">Username cannot be changed</small>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="email" class="form-label required"><i class="fas fa-at me-1"></i>Email Address</label>
                <input type="email" class="form-control ${hasErrors(bean: user, field: 'email', 'is-invalid')}" id="email" name="email" value="${user.email}" placeholder="user@example.com" required>
                <div class="invalid-feedback">Please enter a valid email address.</div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="phone" class="form-label"><i class="fas fa-phone me-1"></i>Phone Number</label>
                <input type="tel" class="form-control ${hasErrors(bean: user, field: 'phone', 'is-invalid')}" id="phone" name="phone" value="${user.phone}" placeholder="+1234567890">
              </div>
            </div>

            <!-- Password -->
            <div class="card mb-4">
              <div class="card-header bg-light"><h6 class="mb-0"><i class="fas fa-lock me-2"></i>Password Management</h6></div>
              <div class="card-body">
                <div class="alert alert-info"><i class="fas fa-info-circle me-2"></i>Leave password blank if you don't want to change it.</div>
                <div class="row">
                  <div class="col-md-6">
                    <label for="password" class="form-label"><i class="fas fa-key me-1"></i>New Password</label>
                    <div class="input-group">
                      <input type="password" class="form-control" id="password" name="password" placeholder="Enter new password (min 6 chars)" oninput="checkPasswordStrength(this.value)">
                      <button class="btn btn-outline-secondary" type="button" id="togglePassword"><i class="fas fa-eye"></i></button>
                    </div>
                    <div class="password-strength mt-2" id="passwordStrength"></div>
                  </div>
                  <div class="col-md-6">
                    <label for="confirmPassword" class="form-label"><i class="fas fa-key me-1"></i>Confirm Password</label>
                    <div class="input-group">
                      <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password">
                      <button class="btn btn-outline-secondary" type="button" id="toggleConfirmPassword"><i class="fas fa-eye"></i></button>
                    </div>
                    <div id="passwordMatch" class="mt-2"></div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Account Status & Roles -->
            <div class="row">
              <div class="col-md-6">
                <div class="card mb-4">
                  <div class="card-header bg-light"><h6 class="mb-0"><i class="fas fa-toggle-on me-2"></i>Account Status</h6></div>
                  <div class="card-body">
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" role="switch" id="enabled" name="enabled" ${user.enabled ? 'checked' : ''}>
                      <label class="form-check-label" for="enabled">Account Enabled</label>
                    </div>
                    <hr>
                    <div class="row">
                      <div class="col-6"><div class="form-check"><input class="form-check-input" type="checkbox" id="accountExpired" name="accountExpired" ${user.accountExpired ? 'checked' : ''}><label class="form-check-label" for="accountExpired">Account Expired</label></div></div>
                      <div class="col-6"><div class="form-check"><input class="form-check-input" type="checkbox" id="accountLocked" name="accountLocked" ${user.accountLocked ? 'checked' : ''}><label class="form-check-label" for="accountLocked">Account Locked</label></div></div>
                      <div class="col-6"><div class="form-check"><input class="form-check-input" type="checkbox" id="passwordExpired" name="passwordExpired" ${user.passwordExpired ? 'checked' : ''}><label class="form-check-label" for="passwordExpired">Password Expired</label></div></div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-6">
                <div class="card mb-4">
                  <div class="card-header bg-light"><h6 class="mb-0"><i class="fas fa-user-tag me-2"></i>User Roles</h6></div>
                  <div class="card-body">
                    <g:each in="${roles}" var="role">
                      <div class="form-check mb-2">
                        <input class="form-check-input" type="checkbox" name="selectedRoles" value="${role.id}" id="role_${role.id}" ${selectedRoles?.contains(role.id) ? 'checked' : ''}>
                        <label class="form-check-label" for="role_${role.id}">
                          <g:if test="${role.authority == 'ROLE_ADMIN'}"><span class="badge bg-danger p-2">${role.authority}</span><small class="text-muted ms-2">Full system access</small></g:if>
                          <g:elseif test="${role.authority == 'ROLE_SUPERVISOR'}"><span class="badge bg-warning p-2">${role.authority}</span><small class="text-muted ms-2">Can manage interns</small></g:elseif>
                          <g:else><span class="badge bg-info p-2">${role.authority}</span><small class="text-muted ms-2">Basic intern access</small></g:else>
                        </label>
                      </div>
                    </g:each>
                    <g:if test="${!roles}"><div class="alert alert-warning"><i class="fas fa-exclamation-triangle me-2"></i>No roles found in the system.</div></g:if>
                  </div>
                </div>
              </div>
            </div>

            <!-- Action Buttons -->
            <div class="d-flex justify-content-between mt-4">
              <div>
                <g:link action="show" id="${user.id}" class="btn btn-secondary me-2"><i class="fas fa-times me-1"></i> Cancel</g:link>
                <g:link action="delete" id="${user.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this user?\\n\\nThis action cannot be undone!');"><i class="fas fa-trash me-1"></i> Delete User</g:link>
              </div>
              <div>
                <button type="submit" class="btn btn-primary"><i class="fas fa-save me-1"></i> Update User</button>
              </div>
            </div>

          </g:form>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
  $(document).ready(function() {
    $('#togglePassword').click(function() {
      const passwordInput = $('#password');
      const type = passwordInput.attr('type') === 'password' ? 'text' : 'password';
      passwordInput.attr('type', type);
      $(this).find('i').toggleClass('fa-eye fa-eye-slash');
    });

    $('#toggleConfirmPassword').click(function() {
      const confirmInput = $('#confirmPassword');
      const type = confirmInput.attr('type') === 'password' ? 'text' : 'password';
      confirmInput.attr('type', type);
      $(this).find('i').toggleClass('fa-eye fa-eye-slash');
    });

    $('#password, #confirmPassword').on('keyup', function() {
      const password = $('#password').val();
      const confirmPassword = $('#confirmPassword').val();
      const matchDiv = $('#passwordMatch');
      if(password && confirmPassword){
        if(password === confirmPassword) matchDiv.html('<span class="text-success"><i class="fas fa-check-circle me-1"></i>Passwords match</span>');
        else matchDiv.html('<span class="text-danger"><i class="fas fa-times-circle me-1"></i>Passwords do not match</span>');
      } else matchDiv.html('');
    });

    $('.needs-validation').on('submit', function(event){
      const roles = $('input[name="selectedRoles"]:checked');
      const password = $('#password').val();
      const confirmPassword = $('#confirmPassword').val();

      if(roles.length === 0){
        event.preventDefault(); event.stopPropagation(); alert('Please select at least one role for the user.'); return false;
      }
      if(password && password !== confirmPassword){
        event.preventDefault(); event.stopPropagation(); alert('Passwords do not match.'); return false;
      }
      if(!this.checkValidity()){ event.preventDefault(); event.stopPropagation(); }
      $(this).addClass('was-validated');
    });
  });

  function checkPasswordStrength(password){
    const strengthBar = $('#passwordStrength');
    let strength=0;
    if(password.length>=8) strength++;
    if(/[A-Z]/.test(password)) strength++;
    if(/[a-z]/.test(password)) strength++;
    if(/[0-9]/.test(password)) strength++;
    if(/[^A-Za-z0-9]/.test(password)) strength++;
    const colors=['#dc3545','#ffc107','#ffc107','#28a745','#28a745'];
    const widths=['20%','40%','60%','80%','100%'];
    const messages=['Very Weak','Weak','Fair','Good','Strong'];
    if(password.length>0){
      strengthBar.css({'width':widths[strength-1]||'0%','background-color':colors[strength-1]||'#dc3545'}).show().html(messages[strength-1]||'Very Weak');
    } else strengthBar.hide().html('');
  }
</script>
</body>
</html>
