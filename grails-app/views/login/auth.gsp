%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title>InternTrack | Login</title>--}%

%{--    <style>--}%
%{--    body.login-page {--}%
%{--        margin: 0;--}%
%{--        font-family: 'Segoe UI', sans-serif;--}%
%{--        height: 100vh;--}%
%{--        background: url('https://t4.ftcdn.net/jpg/06/80/90/07/240_F_680900785_2MtMPNNsWlGte9Mmx4EUc1L2f9x4CcDz.jpg')--}%
%{--        no-repeat center center fixed;--}%
%{--        background-size: cover;--}%
%{--    }--}%

%{--    .login-overlay {--}%
%{--        backdrop-filter: blur(6px);--}%
%{--        background-color: rgba(0,0,0,0.35);--}%
%{--        height: 100vh;--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--    }--}%

%{--    /* CARD أكبر وأوضح */--}%
%{--    .login-card {--}%
%{--        background: #ffffff;--}%
%{--        width: 480px;              /* ⬅️ أوسع */--}%
%{--        padding: 50px 50px;        /* ⬅️ هواء أكتر */--}%
%{--        border-radius: 18px;--}%
%{--        box-shadow: 0 30px 60px rgba(0,0,0,0.3);--}%
%{--        text-align: center;--}%
%{--    }--}%

%{--    .login-icon {--}%
%{--        font-size: 54px;--}%
%{--        margin-bottom: 18px;--}%
%{--        color: #111827;--}%
%{--    }--}%

%{--    .app-title {--}%
%{--        font-size: 32px;--}%
%{--        font-weight: 800;--}%
%{--        color: #111827;--}%
%{--        margin-bottom: 8px;--}%
%{--    }--}%

%{--    .subtitle {--}%
%{--        font-size: 16px;--}%
%{--        color: #6b7280;--}%
%{--        margin-bottom: 42px;--}%
%{--    }--}%

%{--    .form-group {--}%
%{--        text-align: left;--}%
%{--        margin-bottom: 26px;--}%
%{--    }--}%

%{--    .form-group label {--}%
%{--        font-size: 15px;--}%
%{--        font-weight: 600;--}%
%{--        color: #374151;--}%
%{--        margin-bottom: 10px;--}%
%{--        display: block;--}%
%{--    }--}%

%{--    .form-group input,--}%
%{--    .form-group select {--}%
%{--        width: 100%;--}%
%{--        padding: 16px;--}%
%{--        border-radius: 14px;--}%
%{--        border: 1px solid #d1d5db;--}%
%{--        font-size: 16px;--}%
%{--        outline: none;--}%
%{--    }--}%

%{--    .form-group input:focus,--}%
%{--    .form-group select:focus {--}%
%{--        border-color: #10b981;--}%
%{--        box-shadow: 0 0 0 3px rgba(16,185,129,0.25);--}%
%{--    }--}%

%{--    .options {--}%
%{--        display: flex;--}%
%{--        justify-content: space-between;--}%
%{--        align-items: center;--}%
%{--        font-size: 14px;--}%
%{--        margin: 22px 0 32px;--}%
%{--    }--}%

%{--    .options a {--}%
%{--        color: #10b981;--}%
%{--        text-decoration: none;--}%
%{--        font-weight: 600;--}%
%{--    }--}%

%{--    .btn-login {--}%
%{--        width: 100%;--}%
%{--        padding: 17px;--}%
%{--        background: linear-gradient(135deg, #10b981, #059669);--}%
%{--        border: none;--}%
%{--        border-radius: 14px;--}%
%{--        color: #fff;--}%
%{--        font-size: 17px;--}%
%{--        font-weight: 700;--}%
%{--        cursor: pointer;--}%
%{--    }--}%

%{--    .btn-login:hover {--}%
%{--        opacity: 0.95;--}%
%{--    }--}%

%{--    .support {--}%
%{--        margin-top: 30px;--}%
%{--        font-size: 14px;--}%
%{--        color: #6b7280;--}%
%{--    }--}%

%{--    .support a {--}%
%{--        color: #10b981;--}%
%{--        font-weight: 600;--}%
%{--        text-decoration: none;--}%
%{--    }--}%

%{--    .error-msg {--}%
%{--        background: #fee2e2;--}%
%{--        color: #991b1b;--}%
%{--        padding: 12px;--}%
%{--        border-radius: 10px;--}%
%{--        font-size: 14px;--}%
%{--        margin-bottom: 22px;--}%
%{--    }--}%

%{--</style>--}%
%{--</head>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title>InternTrack | Login</title>--}%
%{--    <style>--}%
%{--    /* نفس الأنماط الموجودة */--}%
%{--    </style>--}%
%{--</head>--}%
%{--<body class="login-page">--}%

%{--<div class="login-overlay">--}%
%{--    <div class="login-card">--}%

%{--        <div class="login-icon">🎓</div>--}%
%{--        <div class="app-title">InternTrack</div>--}%
%{--        <div class="subtitle">Access your internship dashboard</div>--}%

%{--        <g:if test="${flash.error}">--}%
%{--            <div class="error-msg">${flash.error}</div>--}%
%{--        </g:if>--}%

%{--    <!-- هذا هو الفورم المعدل -->--}%
%{--        <form action="${postUrl ?: '/login/authenticate'}" method="POST" autocomplete="off">--}%

%{--            <div class="form-group">--}%
%{--                <label>Email Address</label>--}%
%{--                <input type="text" name="username" placeholder="you@university.edu" required>--}%
%{--            </div>--}%

%{--            <div class="form-group">--}%
%{--                <label>Password</label>--}%
%{--                <input type="password" name="password" placeholder="Enter your password" required>--}%
%{--            </div>--}%

%{--            <input type="hidden" name="spring-security-redirect" value="/login/success">--}%

%{--            <div class="options">--}%
%{--                <label>--}%
%{--                    <input type="checkbox" name="remember-me"> Remember me--}%
%{--                </label>--}%
%{--                <a href="#">Forgot password?</a>--}%
%{--            </div>--}%

%{--            <button type="submit" class="btn-login">Sign In</button>--}%
%{--        </form>--}%

%{--        <div class="support">--}%
%{--            Need help? <a href="#">Contact IT Support</a>--}%
%{--        </div>--}%

%{--        <!-- قسم للاختبار فقط (يمكن حذفه لاحقاً) -->--}%
%{--        <div style="margin-top: 20px; border-top: 1px solid #eee; padding-top: 15px;">--}%
%{--            <p style="font-size: 12px; color: #666; margin-bottom: 10px;">For Testing (Temporary):</p>--}%
%{--            <div style="display: flex; gap: 10px; justify-content: center;">--}%
%{--                <a href="${createLink(controller: 'dashboard', action: 'admin')}"--}%
%{--                   style="padding: 8px 12px; background: #dc3545; color: white; border-radius: 6px; text-decoration: none; font-size: 12px;">--}%
%{--                    Test Admin--}%
%{--                </a>--}%
%{--                <a href="${createLink(controller: 'dashboard', action: 'supervisor')}"--}%
%{--                   style="padding: 8px 12px; background: #ffc107; color: #000; border-radius: 6px; text-decoration: none; font-size: 12px;">--}%
%{--                    Test Supervisor--}%
%{--                </a>--}%
%{--                <a href="${createLink(controller: 'dashboard', action: 'intern')}"--}%
%{--                   style="padding: 8px 12px; background: #0d6efd; color: white; border-radius: 6px; text-decoration: none; font-size: 12px;">--}%
%{--                    Test Intern--}%
%{--                </a>--}%
%{--            </div>--}%
%{--        </div>--}%

%{--    </div>--}%
%{--</div>--}%

%{--</body>--}%
%{--</html>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title>InternTrack | Login</title>--}%
%{--    <meta name="layout" content="main"/>--}%

%{--    <style>--}%
%{--    body.login-page {--}%
%{--        margin: 0;--}%
%{--        font-family: 'Segoe UI', Tahoma, sans-serif;--}%
%{--        height: 100vh;--}%
%{--        background: url('https://t4.ftcdn.net/jpg/06/80/90/07/240_F_680900785_2MtMPNNsWlGte9Mmx4EUc1L2f9x4CcDz.jpg') no-repeat center center fixed;--}%
%{--        background-size: cover;--}%
%{--    }--}%

%{--    .login-overlay {--}%
%{--        backdrop-filter: blur(6px);--}%
%{--        background-color: rgba(0,0,0,0.35);--}%
%{--        height: 100vh;--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--    }--}%

%{--    .login-card {--}%
%{--        background: #ffffff;--}%
%{--        width: 480px;--}%
%{--        padding: 50px;--}%
%{--        border-radius: 18px;--}%
%{--        box-shadow: 0 30px 60px rgba(0,0,0,0.3);--}%
%{--        text-align: center;--}%
%{--    }--}%

%{--    .login-icon {--}%
%{--        font-size: 54px;--}%
%{--        margin-bottom: 18px;--}%
%{--        color: #111827;--}%
%{--    }--}%

%{--    .app-title {--}%
%{--        font-size: 32px;--}%
%{--        font-weight: 800;--}%
%{--        color: #111827;--}%
%{--        margin-bottom: 8px;--}%
%{--    }--}%

%{--    .subtitle {--}%
%{--        font-size: 16px;--}%
%{--        color: #6b7280;--}%
%{--        margin-bottom: 42px;--}%
%{--    }--}%

%{--    .form-group {--}%
%{--        text-align: left;--}%
%{--        margin-bottom: 26px;--}%
%{--    }--}%

%{--    .form-group label {--}%
%{--        font-size: 15px;--}%
%{--        font-weight: 600;--}%
%{--        color: #374151;--}%
%{--        margin-bottom: 10px;--}%
%{--        display: block;--}%
%{--    }--}%

%{--    .form-group input {--}%
%{--        width: 100%;--}%
%{--        padding: 16px;--}%
%{--        border-radius: 14px;--}%
%{--        border: 1px solid #d1d5db;--}%
%{--        font-size: 16px;--}%
%{--        outline: none;--}%
%{--    }--}%

%{--    .form-group input:focus {--}%
%{--        border-color: #10b981;--}%
%{--        box-shadow: 0 0 0 3px rgba(16,185,129,0.25);--}%
%{--    }--}%

%{--    .options {--}%
%{--        display: flex;--}%
%{--        justify-content: space-between;--}%
%{--        align-items: center;--}%
%{--        font-size: 14px;--}%
%{--        margin: 22px 0 32px;--}%
%{--    }--}%

%{--    .options a {--}%
%{--        color: #10b981;--}%
%{--        text-decoration: none;--}%
%{--        font-weight: 600;--}%
%{--    }--}%

%{--    .btn-login {--}%
%{--        width: 100%;--}%
%{--        padding: 17px;--}%
%{--        background: linear-gradient(135deg, #10b981, #059669);--}%
%{--        border: none;--}%
%{--        border-radius: 14px;--}%
%{--        color: #fff;--}%
%{--        font-size: 17px;--}%
%{--        font-weight: 700;--}%
%{--        cursor: pointer;--}%
%{--    }--}%

%{--    .btn-login:hover {--}%
%{--        opacity: 0.95;--}%
%{--    }--}%

%{--    .support {--}%
%{--        margin-top: 30px;--}%
%{--        font-size: 14px;--}%
%{--        color: #6b7280;--}%
%{--    }--}%

%{--    .support a {--}%
%{--        color: #10b981;--}%
%{--        font-weight: 600;--}%
%{--        text-decoration: none;--}%
%{--    }--}%

%{--    .error-msg {--}%
%{--        background: #fee2e2;--}%
%{--        color: #991b1b;--}%
%{--        padding: 12px;--}%
%{--        border-radius: 10px;--}%
%{--        font-size: 14px;--}%
%{--        margin-bottom: 22px;--}%
%{--    }--}%

%{--    .success-msg {--}%
%{--        background: #d1fae5;--}%
%{--        color: #065f46;--}%
%{--        padding: 12px;--}%
%{--        border-radius: 10px;--}%
%{--        font-size: 14px;--}%
%{--        margin-bottom: 22px;--}%
%{--    }--}%

%{--    .test-buttons {--}%
%{--        margin-top: 20px;--}%
%{--        padding-top: 20px;--}%
%{--        border-top: 1px solid #eee;--}%
%{--    }--}%

%{--    .test-btn {--}%
%{--        display: block;--}%
%{--        padding: 12px;--}%
%{--        margin: 8px 0;--}%
%{--        border-radius: 8px;--}%
%{--        text-decoration: none;--}%
%{--        text-align: center;--}%
%{--        font-weight: 600;--}%
%{--        transition: all 0.3s;--}%
%{--    }--}%

%{--    .test-btn:hover {--}%
%{--        opacity: 0.9;--}%
%{--        transform: translateY(-2px);--}%
%{--    }--}%

%{--    .test-admin {--}%
%{--        background: #dc3545;--}%
%{--        color: white;--}%
%{--    }--}%

%{--    .test-supervisor {--}%
%{--        background: #ffc107;--}%
%{--        color: #000;--}%
%{--    }--}%

%{--    .test-intern {--}%
%{--        background: #0d6efd;--}%
%{--        color: white;--}%
%{--    }--}%
%{--    </style>--}%
%{--</head>--}%

%{--<body class="login-page">--}%

%{--<div class="login-overlay">--}%
%{--    <div class="login-card">--}%

%{--        <div class="login-icon">🎓</div>--}%
%{--        <div class="app-title">InternTrack</div>--}%
%{--        <div class="subtitle">Access your internship dashboard</div>--}%

%{--        <g:if test='${flash.error}'>--}%
%{--            <div class="error-msg">--}%
%{--                <i class="fas fa-exclamation-circle"></i> ${flash.error}--}%
%{--            </div>--}%
%{--        </g:if>--}%

%{--        <g:if test='${flash.message}'>--}%
%{--            <div class="success-msg">--}%
%{--                <i class="fas fa-check-circle"></i> ${flash.message}--}%
%{--            </div>--}%
%{--        </g:if>--}%

%{--    <!-- نموذج تسجيل الدخول -->--}%
%{--        <g:form name="loginForm" action="authenticate" method="POST" autocomplete="off">--}%
%{--            <div class="form-group">--}%
%{--                <label for="username">Email Address</label>--}%
%{--                <input type="text" id="username" name="username"--}%
%{--                       placeholder="you@university.edu" required--}%
%{--                       value="${params.username ?: ''}">--}%
%{--            </div>--}%

%{--            <div class="form-group">--}%
%{--                <label for="password">Password</label>--}%
%{--                <input type="password" id="password" name="password"--}%
%{--                       placeholder="Enter your password" required>--}%
%{--            </div>--}%

%{--            <div class="options">--}%
%{--                <label>--}%
%{--                    <input type="checkbox" name="remember-me" id="remember-me">--}%
%{--                    Remember me--}%
%{--                </label>--}%
%{--                <a href="#">Forgot password?</a>--}%
%{--            </div>--}%

%{--            <button type="submit" class="btn-login">--}%
%{--                <i class="fas fa-sign-in-alt"></i> Sign In--}%
%{--            </button>--}%
%{--        </g:form>--}%

%{--    <!-- قسم الاختبار السريع -->--}%
%{--        <div class="test-buttons">--}%
%{--            <p style="font-size: 14px; color: #666; margin-bottom: 12px;">Quick Test:</p>--}%

%{--            <g:link controller="login" action="testAuth" params="[username:'admin@intern.com']"--}%
%{--                    class="test-btn test-admin">--}%
%{--                <i class="fas fa-user-shield me-2"></i> Test as Admin--}%
%{--            </g:link>--}%

%{--            <g:link controller="login" action="testAuth" params="[username:'ahmed.supervisor@company.com']"--}%
%{--                    class="test-btn test-supervisor">--}%
%{--                <i class="fas fa-user-tie me-2"></i> Test as Supervisor--}%
%{--            </g:link>--}%

%{--            <g:link controller="login" action="testAuth" params="[username:'mohammed.student@university.edu']"--}%
%{--                    class="test-btn test-intern">--}%
%{--                <i class="fas fa-user-graduate me-2"></i> Test as Intern--}%
%{--            </g:link>--}%
%{--        </div>--}%

%{--        <div class="support">--}%
%{--            Need help? <a href="#">Contact IT Support</a>--}%
%{--        </div>--}%

%{--    </div>--}%
%{--</div>--}%

%{--<script>--}%
%{--    document.addEventListener('DOMContentLoaded', function() {--}%
%{--        const form = document.querySelector('form[name="loginForm"]');--}%

%{--        if (form) {--}%
%{--            form.addEventListener('submit', function(e) {--}%
%{--                const username = document.getElementById('username').value;--}%
%{--                const password = document.getElementById('password').value;--}%

%{--                if (!username || !password) {--}%
%{--                    e.preventDefault();--}%
%{--                    alert('Please enter both username and password');--}%
%{--                    return false;--}%
%{--                }--}%

%{--                return true;--}%
%{--            });--}%
%{--        }--}%
%{--    });--}%
%{--</script>--}%

%{--</body>--}%
%{--</html>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <title>InternTrack | Login</title>--}%

%{--    <style>--}%
%{--    body.login-page {--}%
%{--        margin: 0;--}%
%{--        font-family: 'Segoe UI', Tahoma, sans-serif;--}%
%{--        height: 100vh;--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--        padding: 20px;--}%
%{--    }--}%

%{--    .login-container {--}%
%{--        background: white;--}%
%{--        border-radius: 20px;--}%
%{--        box-shadow: 0 20px 60px rgba(0,0,0,0.3);--}%
%{--        padding: 40px;--}%
%{--        max-width: 450px;--}%
%{--        width: 100%;--}%
%{--    }--}%

%{--    .login-header {--}%
%{--        text-align: center;--}%
%{--        margin-bottom: 40px;--}%
%{--    }--}%

%{--    .login-icon {--}%
%{--        font-size: 60px;--}%
%{--        color: #667eea;--}%
%{--        margin-bottom: 20px;--}%
%{--    }--}%

%{--    .app-title {--}%
%{--        font-size: 32px;--}%
%{--        font-weight: 800;--}%
%{--        color: #333;--}%
%{--        margin-bottom: 10px;--}%
%{--    }--}%

%{--    .subtitle {--}%
%{--        font-size: 16px;--}%
%{--        color: #666;--}%
%{--    }--}%

%{--    .form-group {--}%
%{--        margin-bottom: 25px;--}%
%{--    }--}%

%{--    .form-label {--}%
%{--        display: block;--}%
%{--        font-size: 14px;--}%
%{--        font-weight: 600;--}%
%{--        color: #333;--}%
%{--        margin-bottom: 8px;--}%
%{--    }--}%

%{--    .form-input {--}%
%{--        width: 100%;--}%
%{--        padding: 14px;--}%
%{--        border: 2px solid #e0e0e0;--}%
%{--        border-radius: 10px;--}%
%{--        font-size: 16px;--}%
%{--        transition: all 0.3s;--}%
%{--        box-sizing: border-box;--}%
%{--    }--}%

%{--    .form-input:focus {--}%
%{--        outline: none;--}%
%{--        border-color: #667eea;--}%
%{--        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);--}%
%{--    }--}%

%{--    .remember-me {--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        margin-bottom: 25px;--}%
%{--    }--}%

%{--    .remember-me input {--}%
%{--        margin-right: 8px;--}%
%{--    }--}%

%{--    .remember-me label {--}%
%{--        font-size: 14px;--}%
%{--        color: #666;--}%
%{--    }--}%

%{--    .btn-login {--}%
%{--        width: 100%;--}%
%{--        padding: 16px;--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        color: white;--}%
%{--        border: none;--}%
%{--        border-radius: 10px;--}%
%{--        font-size: 16px;--}%
%{--        font-weight: 600;--}%
%{--        cursor: pointer;--}%
%{--        transition: all 0.3s;--}%
%{--    }--}%

%{--    .btn-login:hover {--}%
%{--        transform: translateY(-2px);--}%
%{--        box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);--}%
%{--    }--}%

%{--    .test-section {--}%
%{--        margin-top: 30px;--}%
%{--        padding-top: 25px;--}%
%{--        border-top: 1px solid #eee;--}%
%{--    }--}%

%{--    .test-title {--}%
%{--        text-align: center;--}%
%{--        font-size: 14px;--}%
%{--        color: #666;--}%
%{--        margin-bottom: 15px;--}%
%{--    }--}%

%{--    .test-buttons {--}%
%{--        display: flex;--}%
%{--        flex-direction: column;--}%
%{--        gap: 10px;--}%
%{--    }--}%

%{--    .test-btn {--}%
%{--        padding: 12px;--}%
%{--        border-radius: 8px;--}%
%{--        text-decoration: none;--}%
%{--        text-align: center;--}%
%{--        font-weight: 600;--}%
%{--        font-size: 14px;--}%
%{--        transition: all 0.3s;--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--    }--}%

%{--    .test-btn i {--}%
%{--        margin-right: 8px;--}%
%{--    }--}%

%{--    .test-btn:hover {--}%
%{--        transform: translateY(-2px);--}%
%{--        opacity: 0.9;--}%
%{--    }--}%

%{--    .btn-admin {--}%
%{--        background: #dc3545;--}%
%{--        color: white;--}%
%{--    }--}%

%{--    .btn-supervisor {--}%
%{--        background: #ffc107;--}%
%{--        color: #333;--}%
%{--    }--}%

%{--    .btn-intern {--}%
%{--        background: #0d6efd;--}%
%{--        color: white;--}%
%{--    }--}%

%{--    .messages {--}%
%{--        margin-bottom: 25px;--}%
%{--    }--}%

%{--    .alert {--}%
%{--        padding: 12px 15px;--}%
%{--        border-radius: 10px;--}%
%{--        font-size: 14px;--}%
%{--        margin-bottom: 15px;--}%
%{--    }--}%

%{--    .alert-error {--}%
%{--        background: #fee2e2;--}%
%{--        color: #dc2626;--}%
%{--        border: 1px solid #fecaca;--}%
%{--    }--}%

%{--    .alert-success {--}%
%{--        background: #d1fae5;--}%
%{--        color: #065f46;--}%
%{--        border: 1px solid #a7f3d0;--}%
%{--    }--}%

%{--    .forgot-password {--}%
%{--        text-align: center;--}%
%{--        margin-top: 20px;--}%
%{--    }--}%

%{--    .forgot-password a {--}%
%{--        color: #667eea;--}%
%{--        text-decoration: none;--}%
%{--        font-size: 14px;--}%
%{--    }--}%

%{--    .forgot-password a:hover {--}%
%{--        text-decoration: underline;--}%
%{--    }--}%

%{--    .register-link {--}%
%{--        text-align: center;--}%
%{--        margin-top: 15px;--}%
%{--        font-size: 14px;--}%
%{--        color: #666;--}%
%{--    }--}%

%{--    .register-link a {--}%
%{--        color: #667eea;--}%
%{--        text-decoration: none;--}%
%{--        font-weight: 600;--}%
%{--    }--}%

%{--    .register-link a:hover {--}%
%{--        text-decoration: underline;--}%
%{--    }--}%
%{--    </style>--}%
%{--</head>--}%

%{--<body class="login-page">--}%

%{--<div class="login-container">--}%
%{--    <div class="login-header">--}%
%{--        <div class="login-icon">🎓</div>--}%
%{--        <h1 class="app-title">InternTrack</h1>--}%
%{--        <p class="subtitle">Your Internship Management System</p>--}%
%{--    </div>--}%

%{--    <div class="messages">--}%
%{--        <g:if test='${flash.error}'>--}%
%{--            <div class="alert alert-error">--}%
%{--                <i class="fas fa-exclamation-circle"></i> ${flash.error}--}%
%{--            </div>--}%
%{--        </g:if>--}%

%{--        <g:if test='${flash.message}'>--}%
%{--            <div class="alert alert-success">--}%
%{--                <i class="fas fa-check-circle"></i> ${flash.message}--}%
%{--            </div>--}%
%{--        </g:if>--}%
%{--    </div>--}%

%{--<!-- نموذج تسجيل الدخول -->--}%
%{--    <g:form name="loginForm" action="authenticate" method="POST" autocomplete="off">--}%
%{--        <div class="form-group">--}%
%{--            <label for="username" class="form-label">--}%
%{--                <i class="fas fa-envelope me-1"></i> Email Address--}%
%{--            </label>--}%
%{--            <input type="text"--}%
%{--                   id="username"--}%
%{--                   name="username"--}%
%{--                   class="form-input"--}%
%{--                   placeholder="Enter your email address"--}%
%{--                   required--}%
%{--                   autofocus--}%
%{--                   value="${params.username ?: ''}">--}%
%{--        </div>--}%

%{--        <div class="form-group">--}%
%{--            <label for="password" class="form-label">--}%
%{--                <i class="fas fa-lock me-1"></i> Password--}%
%{--            </label>--}%
%{--            <input type="password"--}%
%{--                   id="password"--}%
%{--                   name="password"--}%
%{--                   class="form-input"--}%
%{--                   placeholder="Enter your password"--}%
%{--                   required>--}%
%{--        </div>--}%

%{--        <div class="remember-me">--}%
%{--            <input type="checkbox" name="remember-me" id="remember-me">--}%
%{--            <label for="remember-me">Remember me on this device</label>--}%
%{--        </div>--}%

%{--        <button type="submit" class="btn-login">--}%
%{--            <i class="fas fa-sign-in-alt me-2"></i> Sign In--}%
%{--        </button>--}%
%{--    </g:form>--}%

%{--    <div class="forgot-password">--}%
%{--        <a href="#">--}%
%{--            <i class="fas fa-key me-1"></i> Forgot your password?--}%
%{--        </a>--}%
%{--    </div>--}%

%{--    <div class="register-link">--}%
%{--        New to InternTrack?--}%
%{--        <g:link controller="login" action="register">Create an account</g:link>--}%
%{--    </div>--}%

%{--    <!-- قسم الاختبار السريع (للاختبار فقط) -->--}%
%{--    <div class="test-section">--}%
%{--        <p class="test-title">Quick Test Accounts:</p>--}%
%{--        <div class="test-buttons">--}%
%{--            <g:link controller="login" action="testAuth" params="[username:'admin@intern.com']"--}%
%{--                    class="test-btn btn-admin">--}%
%{--                <i class="fas fa-user-shield me-2"></i> Admin Account--}%
%{--            </g:link>--}%

%{--            <g:link controller="login" action="testAuth" params="[username:'ahmed.supervisor@company.com']"--}%
%{--                    class="test-btn btn-supervisor">--}%
%{--                <i class="fas fa-user-tie me-2"></i> Supervisor Account--}%
%{--            </g:link>--}%

%{--            <g:link controller="login" action="testAuth" params="[username:'mohammed.student@university.edu']"--}%
%{--                    class="test-btn btn-intern">--}%
%{--                <i class="fas fa-user-graduate me-2"></i> Intern Account--}%
%{--            </g:link>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%

%{--<script>--}%
%{--    document.addEventListener('DOMContentLoaded', function() {--}%
%{--        const form = document.querySelector('form[name="loginForm"]');--}%

%{--        if (form) {--}%
%{--            form.addEventListener('submit', function(e) {--}%
%{--                const username = document.getElementById('username').value;--}%
%{--                const password = document.getElementById('password').value;--}%

%{--                if (!username || !password) {--}%
%{--                    e.preventDefault();--}%
%{--                    alert('Please enter both email and password');--}%
%{--                    return false;--}%
%{--                }--}%

%{--                console.log('Login form submitted');--}%
%{--                return true;--}%
%{--            });--}%
%{--        }--}%

%{--        // إضافة تأثير عند التركيز على الحقول--}%
%{--        const inputs = document.querySelectorAll('.form-input');--}%
%{--        inputs.forEach(input => {--}%
%{--            input.addEventListener('focus', function() {--}%
%{--                this.parentElement.classList.add('focused');--}%
%{--            });--}%

%{--            input.addEventListener('blur', function() {--}%
%{--                this.parentElement.classList.remove('focused');--}%
%{--            });--}%
%{--        });--}%
%{--    });--}%
%{--</script>--}%

%{--</body>--}%
%{--</html>--}%
%{--<!DOCTYPE html>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <meta name="layout" content="main"/>--}%
%{--    <title>InternTrack | Login</title>--}%

%{--    <style>--}%
%{--    body.login-page {--}%
%{--        margin: 0;--}%
%{--        font-family: 'Segoe UI', Tahoma, sans-serif;--}%
%{--        height: 100vh;--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--        padding: 20px;--}%
%{--    }--}%

%{--    .login-container {--}%
%{--        background: white;--}%
%{--        border-radius: 20px;--}%
%{--        box-shadow: 0 20px 60px rgba(0,0,0,0.3);--}%
%{--        padding: 40px;--}%
%{--        max-width: 450px;--}%
%{--        width: 100%;--}%
%{--    }--}%

%{--    .login-header {--}%
%{--        text-align: center;--}%
%{--        margin-bottom: 40px;--}%
%{--    }--}%

%{--    .login-icon {--}%
%{--        font-size: 60px;--}%
%{--        color: #667eea;--}%
%{--        margin-bottom: 20px;--}%
%{--    }--}%

%{--    .app-title {--}%
%{--        font-size: 32px;--}%
%{--        font-weight: 800;--}%
%{--        color: #333;--}%
%{--        margin-bottom: 10px;--}%
%{--    }--}%

%{--    .subtitle {--}%
%{--        font-size: 16px;--}%
%{--        color: #666;--}%
%{--    }--}%

%{--    .form-group {--}%
%{--        margin-bottom: 25px;--}%
%{--    }--}%

%{--    .form-label {--}%
%{--        display: block;--}%
%{--        font-size: 14px;--}%
%{--        font-weight: 600;--}%
%{--        color: #333;--}%
%{--        margin-bottom: 8px;--}%
%{--    }--}%

%{--    .form-input {--}%
%{--        width: 100%;--}%
%{--        padding: 14px;--}%
%{--        border: 2px solid #e0e0e0;--}%
%{--        border-radius: 10px;--}%
%{--        font-size: 16px;--}%
%{--        transition: all 0.3s;--}%
%{--        box-sizing: border-box;--}%
%{--    }--}%

%{--    .form-input:focus {--}%
%{--        outline: none;--}%
%{--        border-color: #667eea;--}%
%{--        box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.2);--}%
%{--    }--}%

%{--    .remember-me {--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        margin-bottom: 25px;--}%
%{--    }--}%

%{--    .remember-me input {--}%
%{--        margin-right: 8px;--}%
%{--    }--}%

%{--    .remember-me label {--}%
%{--        font-size: 14px;--}%
%{--        color: #666;--}%
%{--    }--}%

%{--    .btn-login {--}%
%{--        width: 100%;--}%
%{--        padding: 16px;--}%
%{--        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);--}%
%{--        color: white;--}%
%{--        border: none;--}%
%{--        border-radius: 10px;--}%
%{--        font-size: 16px;--}%
%{--        font-weight: 600;--}%
%{--        cursor: pointer;--}%
%{--        transition: all 0.3s;--}%
%{--    }--}%

%{--    .btn-login:hover {--}%
%{--        transform: translateY(-2px);--}%
%{--        box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);--}%
%{--    }--}%

%{--    .test-section {--}%
%{--        margin-top: 30px;--}%
%{--        padding-top: 25px;--}%
%{--        border-top: 1px solid #eee;--}%
%{--    }--}%

%{--    .test-title {--}%
%{--        text-align: center;--}%
%{--        font-size: 14px;--}%
%{--        color: #666;--}%
%{--        margin-bottom: 15px;--}%
%{--    }--}%

%{--    .test-buttons {--}%
%{--        display: flex;--}%
%{--        flex-direction: column;--}%
%{--        gap: 10px;--}%
%{--    }--}%

%{--    .test-btn {--}%
%{--        padding: 12px;--}%
%{--        border-radius: 8px;--}%
%{--        text-decoration: none;--}%
%{--        text-align: center;--}%
%{--        font-weight: 600;--}%
%{--        font-size: 14px;--}%
%{--        transition: all 0.3s;--}%
%{--        display: flex;--}%
%{--        align-items: center;--}%
%{--        justify-content: center;--}%
%{--    }--}%

%{--    .test-btn i {--}%
%{--        margin-right: 8px;--}%
%{--    }--}%

%{--    .test-btn:hover {--}%
%{--        transform: translateY(-2px);--}%
%{--        opacity: 0.9;--}%
%{--    }--}%

%{--    .btn-admin {--}%
%{--        background: #dc3545;--}%
%{--        color: white;--}%
%{--    }--}%

%{--    .btn-supervisor {--}%
%{--        background: #ffc107;--}%
%{--        color: #333;--}%
%{--    }--}%

%{--    .btn-intern {--}%
%{--        background: #0d6efd;--}%
%{--        color: white;--}%
%{--    }--}%

%{--    .messages {--}%
%{--        margin-bottom: 25px;--}%
%{--    }--}%

%{--    .alert {--}%
%{--        padding: 12px 15px;--}%
%{--        border-radius: 10px;--}%
%{--        font-size: 14px;--}%
%{--        margin-bottom: 15px;--}%
%{--    }--}%

%{--    .alert-error {--}%
%{--        background: #fee2e2;--}%
%{--        color: #dc2626;--}%
%{--        border: 1px solid #fecaca;--}%
%{--    }--}%

%{--    .alert-success {--}%
%{--        background: #d1fae5;--}%
%{--        color: #065f46;--}%
%{--        border: 1px solid #a7f3d0;--}%
%{--    }--}%

%{--    .forgot-password {--}%
%{--        text-align: center;--}%
%{--        margin-top: 20px;--}%
%{--    }--}%

%{--    .forgot-password a {--}%
%{--        color: #667eea;--}%
%{--        text-decoration: none;--}%
%{--        font-size: 14px;--}%
%{--    }--}%

%{--    .forgot-password a:hover {--}%
%{--        text-decoration: underline;--}%
%{--    }--}%

%{--    .register-link {--}%
%{--        text-align: center;--}%
%{--        margin-top: 15px;--}%
%{--        font-size: 14px;--}%
%{--        color: #666;--}%
%{--    }--}%

%{--    .register-link a {--}%
%{--        color: #667eea;--}%
%{--        text-decoration: none;--}%
%{--        font-weight: 600;--}%
%{--    }--}%

%{--    .register-link a:hover {--}%
%{--        text-decoration: underline;--}%
%{--    }--}%
%{--    </style>--}%
%{--</head>--}%

%{--<body class="login-page">--}%

%{--<div class="login-container">--}%
%{--    <div class="login-header">--}%
%{--        <div class="login-icon">🎓</div>--}%
%{--        <h1 class="app-title">InternTrack</h1>--}%
%{--        <p class="subtitle">Your Internship Management System</p>--}%
%{--    </div>--}%

%{--    <div class="messages">--}%
%{--        <g:if test='${flash.error}'>--}%
%{--            <div class="alert alert-error">--}%
%{--                <i class="fas fa-exclamation-circle"></i> ${flash.error}--}%
%{--            </div>--}%
%{--        </g:if>--}%

%{--        <g:if test='${flash.message}'>--}%
%{--            <div class="alert alert-success">--}%
%{--                <i class="fas fa-check-circle"></i> ${flash.message}--}%
%{--            </div>--}%
%{--        </g:if>--}%
%{--    </div>--}%

%{--<!-- التصحيح الرئيسي هنا: استخدم postUrl من Spring Security -->--}%
%{--    <g:form name="loginForm" action="${postUrl ?: '/login/authenticate'}" method="POST" autocomplete="off">--}%
%{--        <div class="form-group">--}%
%{--            <label for="username" class="form-label">--}%
%{--                <i class="fas fa-envelope me-1"></i> Email Address--}%
%{--            </label>--}%
%{--            <input type="text"--}%
%{--                   id="username"--}%
%{--                   name="username"--}%
%{--                   class="form-input"--}%
%{--                   placeholder="Enter your email address"--}%
%{--                   required--}%
%{--                   autofocus--}%
%{--                   value="${params.username ?: ''}">--}%
%{--        </div>--}%

%{--        <div class="form-group">--}%
%{--            <label for="password" class="form-label">--}%
%{--                <i class="fas fa-lock me-1"></i> Password--}%
%{--            </label>--}%
%{--            <input type="password"--}%
%{--                   id="password"--}%
%{--                   name="password"--}%
%{--                   class="form-input"--}%
%{--                   placeholder="Enter your password"--}%
%{--                   required>--}%
%{--        </div>--}%

%{--        <div class="remember-me">--}%
%{--            <input type="checkbox" name="remember-me" id="remember-me">--}%
%{--            <label for="remember-me">Remember me on this device</label>--}%
%{--        </div>--}%

%{--        <!-- أضف CSRF token إذا كان مفعلاً -->--}%
%{--        <g:if test="${csrfEnabled}">--}%
%{--            <input type="hidden" name="${_csrf?.parameterName}" value="${_csrf?.token}"/>--}%
%{--        </g:if>--}%

%{--        <button type="submit" class="btn-login">--}%
%{--            <i class="fas fa-sign-in-alt me-2"></i> Sign In--}%
%{--        </button>--}%
%{--    </g:form>--}%

%{--    <div class="forgot-password">--}%
%{--        <a href="#">--}%
%{--            <i class="fas fa-key me-1"></i> Forgot your password?--}%
%{--        </a>--}%
%{--    </div>--}%

%{--    <div class="register-link">--}%
%{--        New to InternTrack?--}%
%{--        <g:link controller="login" action="register">Create an account</g:link>--}%
%{--    </div>--}%

%{--    <!-- قسم الاختبار السريع (للاختبار فقط) -->--}%
%{--    <div class="test-section">--}%
%{--        <p class="test-title">Quick Test Accounts:</p>--}%
%{--        <div class="test-buttons">--}%
%{--            <g:link controller="login" action="testAuth" params="[username:'admin@intern.com']"--}%
%{--                    class="test-btn btn-admin">--}%
%{--                <i class="fas fa-user-shield me-2"></i> Admin Account--}%
%{--            </g:link>--}%

%{--            <g:link controller="login" action="testAuth" params="[username:'ahmed.supervisor@company.com']"--}%
%{--                    class="test-btn btn-supervisor">--}%
%{--                <i class="fas fa-user-tie me-2"></i> Supervisor Account--}%
%{--            </g:link>--}%

%{--            <g:link controller="login" action="testAuth" params="[username:'mohammed.student@university.edu']"--}%
%{--                    class="test-btn btn-intern">--}%
%{--                <i class="fas fa-user-graduate me-2"></i> Intern Account--}%
%{--            </g:link>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--</div>--}%

%{--<script>--}%
%{--    document.addEventListener('DOMContentLoaded', function() {--}%
%{--        const form = document.querySelector('form[name="loginForm"]');--}%

%{--        if (form) {--}%
%{--            form.addEventListener('submit', function(e) {--}%
%{--                const username = document.getElementById('username').value;--}%
%{--                const password = document.getElementById('password').value;--}%

%{--                if (!username || !password) {--}%
%{--                    e.preventDefault();--}%
%{--                    alert('Please enter both email and password');--}%
%{--                    return false;--}%
%{--                }--}%

%{--                console.log('Login form submitted');--}%
%{--                return true;--}%
%{--            });--}%
%{--        }--}%

%{--        // إضافة تأثير عند التركيز على الحقول--}%
%{--        const inputs = document.querySelectorAll('.form-input');--}%
%{--        inputs.forEach(input => {--}%
%{--            input.addEventListener('focus', function() {--}%
%{--                this.parentElement.classList.add('focused');--}%
%{--            });--}%

%{--            input.addEventListener('blur', function() {--}%
%{--                this.parentElement.classList.remove('focused');--}%
%{--            });--}%
%{--        });--}%
%{--    });--}%
%{--</script>--}%

%{--</body>--}%
%{--</html>--}%

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
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

<!-- Login Form -->
    <form action="${createLink(controller: 'login', action: 'authenticate')}" method="POST" autocomplete="off">
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