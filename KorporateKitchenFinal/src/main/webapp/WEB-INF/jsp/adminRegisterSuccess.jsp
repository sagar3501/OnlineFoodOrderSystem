<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Registration Successful - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #27ae60;
            --secondary-color: #2ecc71;
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

        .success-container {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.08);
            padding: 40px;
            text-align: center;
            max-width: 500px;
            width: 100%;
        }

        .success-title {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 30px;
        }

        .btn-success {
            background-color: var(--primary-color);
            color: #fff;
            border: none;
            padding: 12px 24px;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-success:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="success-container">
        <h2 class="success-title">Registration Successful! 🎉</h2>
        <a href="${pageContext.request.contextPath}/admin/login" class="btn btn-success">
            <i class="fas fa-sign-in-alt me-2"></i>Go to Login
        </a>
    </div>
</body>
</html>