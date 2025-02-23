<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Portal - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #e67e22;
            --secondary-color: #d35400;
            --dark-color: #2c3e50;
        }

        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #fff5f5 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .portal-container {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.08);
            padding: 40px;
            text-align: center;
            max-width: 600px;
            width: 100%;
        }

        .portal-title {
            color: var(--dark-color);
            font-weight: 700;
            margin-bottom: 30px;
        }

        .btn-portal {
            background-color: var(--primary-color);
            color: #fff;
            border: none;
            padding: 12px 24px;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
            margin: 10px;
            width: 200px;
        }

        .btn-portal:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="portal-container">
        <h1 class="portal-title">Admin Portal</h1>
        <a href="${pageContext.request.contextPath}/admin/login" class="btn btn-portal">
            <i class="fas fa-sign-in-alt me-2"></i>Login
        </a>
        <a href="${pageContext.request.contextPath}/admin/register" class="btn btn-portal">
            <i class="fas fa-user-plus me-2"></i>Register
        </a>
    </div>
</body>
</html>