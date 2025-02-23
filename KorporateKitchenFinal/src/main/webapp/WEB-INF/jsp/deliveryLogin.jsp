<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Delivery Agent Login - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #00cc66;
            --secondary-color: #ff9900;
            --dark-color: #2d3436;
        }
 
        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
 
        .login-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            padding: 2rem;
            max-width: 400px;
            margin: 0 auto;
            transform: translateY(0);
            transition: transform 0.3s ease;
        }
 
        .login-card:hover {
            transform: translateY(-5px);
        }
 
        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }
 
        .form-control {
            border-radius: 12px;
            padding: 1rem;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
 
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(0, 204, 102, 0.1);
        }
 
        .input-group-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
            z-index: 4;
        }
 
        .btn-primary {
            background: var(--primary-color);
            border: none;
            padding: 1rem;
            font-weight: 600;
            border-radius: 12px;
            transition: all 0.3s ease;
        }
 
        .btn-primary:hover {
            background: #00994d;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="login-card animate-profile">
        <div class="login-header">
            <h2 class="mb-3" style="color: var(--dark-color);">Delivery Partner Login</h2>
            
        </div>
 
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
 
        <form action="${pageContext.request.contextPath}/delivery/login" method="post">
            <div class="mb-3 position-relative">
                <i class="fas fa-envelope input-group-icon"></i>
                <input type="email" name="email" class="form-control ps-5" placeholder="Email" required>
            </div>
            
            <div class="mb-4 position-relative">
                <i class="fas fa-lock input-group-icon"></i>
                <input type="password" name="password" class="form-control ps-5" placeholder="Password" required>
            </div>
 
            <button type="submit" class="btn btn-primary w-100">
                <i class="fas fa-sign-in-alt me-2"></i>Sign In
            </button>
        </form>
 
        <div class="text-center mt-4">
            <p class="text-muted">New partner?
                <a href="${pageContext.request.contextPath}/delivery/register"
                   style="color: var(--primary-color); text-decoration: none;">
                    Create account
                </a>
            </p>
        </div>
    </div>
</div>
</body>
</html>