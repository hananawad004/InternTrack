<%--
  Created by IntelliJ IDEA.
  User: Eng.Hanan Awad
  Date: 2/7/2026
  Time: 9:38 AM
--%>

%{--<%@ page contentType="text/html;charset=UTF-8" %>--}%
%{--<html>--}%
%{--<head>--}%
%{--    <title></title>--}%
%{--</head>--}%

%{--<body>--}%
%{--<h2>Access Denied</h2>--}%
%{--<p>You do not have permission to access this page.</p>--}%
%{--<a href="${request.contextPath}/login/auth">Back to Login</a>--}%

%{--</body>--}%
%{--</html>--}%


<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Access Denied - InternTrack</title>

    <style>
    .denied-container {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 60vh;
        padding: 20px;
    }

    .denied-card {
        background: white;
        border-radius: 16px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        padding: 50px 40px;
        max-width: 500px;
        width: 100%;
        text-align: center;
    }

    .denied-icon {
        font-size: 80px;
        color: #E74C3C;
        margin-bottom: 20px;
    }

    .denied-title {
        font-size: 32px;
        font-weight: 800;
        color: #2C3E50;
        margin-bottom: 15px;
    }

    .denied-message {
        font-size: 16px;
        color: #7F8C8D;
        margin-bottom: 30px;
        line-height: 1.6;
    }

    .btn-back {
        display: inline-block;
        padding: 12px 30px;
        background: #1ABC9C;
        color: white;
        text-decoration: none;
        border-radius: 8px;
        font-weight: 600;
        transition: all 0.3s;
    }

    .btn-back:hover {
        background: #16A085;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(26, 188, 156, 0.3);
    }
    </style>
</head>
<body>
<div class="denied-container">
    <div class="denied-card">
        <div class="denied-icon">
            <i class="fas fa-shield-alt"></i>
        </div>
        <h1 class="denied-title">Access Denied</h1>
        <p class="denied-message">
            You don't have permission to access this page.<br>
            Please contact your supervisor or system administrator.
        </p>
        <a href="${createLink(uri: '/')}" class="btn-back">
            <i class="fas fa-home me-2"></i> Return to Home
        </a>
    </div>
</div>
</body>
</html>