<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layouts" content="main"/>
    <title>InternTrack | Login</title>

    <style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, sans-serif;
        background: linear-gradient(135deg, #2C3E50 0%, #3498DB 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        padding: 20px;
    }

    .login-container {
        background: white;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0,0,0,0.3);
        padding: 50px 40px;
        max-width: 450px;
        width: 100%;
        animation: fadeIn 0.5s ease-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .login-header {
        text-align: center;
        margin-bottom: 40px;
    }

    .login-icon {
        font-size: 64px;
        color: #2C3E50;
        margin-bottom: 20px;
    }

    .app-title {
        font-size: 32px;
        font-weight: 800;
        color: #2C3E50;
        margin-bottom: 10px;
    }

    .subtitle {
        font-size: 16px;
        color: #7F8C8D;
    }

    .form-group {
        margin-bottom: 25px;
    }

    .form-label {
        display: block;
        font-size: 14px;
        font-weight: 600;
        color: #34495E;
        margin-bottom: 8px;
    }

    .form-input {
        width: 100%;
        padding: 14px 16px;
        border: 2px solid #E0E0E0;
        border-radius: 12px;
        font-size: 16px;
        transition: all 0.3s;
        box-sizing: border-box;
    }

    .form-input:focus {
        outline: none;
        border-color: #1ABC9C;
        box-shadow: 0 0 0 3px rgba(26, 188, 156, 0.2);
    }

    .remember-me {
        display: flex;
        align-items: center;
        margin-bottom: 25px;
    }

    .remember-me input {
        margin-right: 10px;
        width: 18px;
        height: 18px;
        cursor: pointer;
    }

    .remember-me label {
        font-size: 14px;
        color: #34495E;
        cursor: pointer;
    }

    .btn-login {
        width: 100%;
        padding: 16px;
        background: linear-gradient(135deg, #1ABC9C, #16A085);
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s;
    }

    .btn-login:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 20px rgba(26, 188, 156, 0.3);
    }

    .test-section {
        margin-top: 30px;
        padding-top: 25px;
        border-top: 1px solid #ECF0F1;
    }

    .test-title {
        text-align: center;
        font-size: 14px;
        color: #7F8C8D;
        margin-bottom: 15px;
        font-weight: 600;
    }

    .test-buttons {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .test-btn {
        padding: 14px;
        border-radius: 10px;
        text-decoration: none;
        text-align: center;
        font-weight: 600;
        font-size: 14px;
        transition: all 0.3s;
        display: flex;
        align-items: center;
        justify-content: center;
        border: none;
        cursor: pointer;
    }

    .test-btn i {
        margin-right: 10px;
        font-size: 16px;
    }

    .test-btn:hover {
        transform: translateY(-2px);
        opacity: 0.9;
    }

    .btn-admin {
        background: #E74C3C;
        color: white;
    }

    .btn-supervisor {
        background: #F39C12;
        color: white;
    }

    .btn-intern {
        background: #3498DB;
        color: white;
    }

    .alert {
        padding: 14px 16px;
        border-radius: 12px;
        font-size: 14px;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
    }

    .alert i {
        margin-right: 10px;
        font-size: 18px;
    }

    .alert-error {
        background: #FDEDEC;
        color: #E74C3C;
        border: 1px solid #FADBD8;
    }

    .alert-success {
        background: #DEF7EC;
        color: #0B5345;
        border: 1px solid #A3E4D7;
    }

    .forgot-password {
        text-align: center;
        margin-top: 20px;
    }

    .forgot-password a {
        color: #7F8C8D;
        text-decoration: none;
        font-size: 14px;
    }

    .forgot-password a:hover {
        color: #1ABC9C;
        text-decoration: underline;
    }

    .register-link {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
        color: #7F8C8D;
    }

    .register-link a {
        color: #1ABC9C;
        text-decoration: none;
        font-weight: 600;
    }

    .register-link a:hover {
        text-decoration: underline;
    }
    </style>
</head>

<body>
<div class="login-container">
    <div class="login-header">
        <div class="login-icon">
            <i class="fas fa-briefcase"></i>
        </div>
        <h1 class="app-title">InternTrack</h1>
        <p class="subtitle">Your Internship Management System</p>
    </div>

<!-- Flash Messages -->
    <g:if test="${flash.error}">
        <div class="alert alert-error">
            <i class="fas fa-exclamation-circle"></i>
            ${flash.error}
        </div>
    </g:if>

    <g:if test="${flash.message}">
        <div class="alert alert-success">
            <i class="fas fa-check-circle"></i>
            ${flash.message}
        </div>
    </g:if>


    <form action="/login/authenticate" method="POST" autocomplete="off">

        <div class="form-group">
            <label for="username" class="form-label">
                <i class="fas fa-envelope me-1"></i> Email Address
            </label>
            <input type="text"
                   id="username"
                   name="username"
                   class="form-input"
                   placeholder="you@university.edu"
                   required
                   autofocus
                   value="${params.username ?: ''}">
        </div>

        <div class="form-group">
            <label for="password" class="form-label">
                <i class="fas fa-lock me-1"></i> Password
            </label>
            <input type="password"
                   id="password"
                   name="password"
                   class="form-input"
                   placeholder="Enter your password"
                   required>
        </div>

        <div class="remember-me">
            <input type="checkbox" name="remember-me" id="remember-me" checked>
            <label for="remember-me">Remember me on this device</label>
        </div>

        <button type="submit" class="btn-login">
            <i class="fas fa-sign-in-alt me-2"></i> Sign In
        </button>
    </form>

    <div class="forgot-password">
        <a href="#">
            <i class="fas fa-key me-1"></i> Forgot your password?
        </a>
    </div>

    <div class="register-link">
        New to InternTrack?
        <a href="#">Create an account</a>
    </div>

    <!-- Quick Test Section -->
    <div class="test-section">
        <div class="test-title">
            <i class="fas fa-flask me-1"></i> Quick Test Accounts
        </div>
        <div class="test-buttons">
            <a href="${createLink(controller: 'login', action: 'testAuth', params: [username: 'admin@intern.com'])}"
               class="test-btn btn-admin">
                <i class="fas fa-user-shield"></i>
                Admin Account (admin@intern.com / admin123)
            </a>

            <a href="${createLink(controller: 'login', action: 'testAuth', params: [username: 'ahmed.supervisor@company.com'])}"
               class="test-btn btn-supervisor">
                <i class="fas fa-user-tie"></i>
                Supervisor Account (ahmed.supervisor@company.com / super123)
            </a>

            <a href="${createLink(controller: 'login', action: 'testAuth', params: [username: 'mohammed.student@university.edu'])}"
               class="test-btn btn-intern">
                <i class="fas fa-user-graduate"></i>
                Intern Account (mohammed.student@university.edu / intern123)
            </a>
        </div>
    </div>
</div>

<script>
    // Auto-hide alerts after 5 seconds
    setTimeout(function() {
        var alerts = document.querySelectorAll('.alert');
        alerts.forEach(function(alert) {
            alert.style.transition = 'opacity 0.5s';
            alert.style.opacity = '0';
            setTimeout(function() {
                alert.style.display = 'none';
            }, 500);
        });
    }, 5000);

    // Form validation
    document.querySelector('form').addEventListener('submit', function(e) {
        var username = document.getElementById('username').value.trim();
        var password = document.getElementById('password').value.trim();

        if (!username || !password) {
            e.preventDefault();
            alert('Please enter both email and password');
            return false;
        }

        if (!username.includes('@')) {
            e.preventDefault();
            alert('Please enter a valid email address');
            return false;
        }

        console.log('Login form submitted');
        return true;
    });
</script>
</body>
</html>