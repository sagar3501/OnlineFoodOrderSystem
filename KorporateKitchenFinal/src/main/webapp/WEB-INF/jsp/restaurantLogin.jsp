<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Restaurant Login - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #4ecdc4;
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
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            padding: 2rem;
            max-width: 500px;
            margin: 0 auto;
            animation: cardEntrance 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }

        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 12px 20px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 8px rgba(255, 107, 107, 0.2);
        }

        .submit-btn {
            background: linear-gradient(45deg, var(--primary-color), #ff8787);
            border: none;
            padding: 12px 0;
            border-radius: 10px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
        }

        .error-alert {
            border-left: 4px solid #dc3545;
            animation: shake 0.4s ease;
        }

        @keyframes cardEntrance {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20% { transform: translateX(-10px); }
            40% { transform: translateX(10px); }
            60% { transform: translateX(-5px); }
            80% { transform: translateX(5px); }
        }
    </style>
</head>
<body>
    <div class="login-card">
        <div class="text-center mb-4">
            <h2 class="fw-bold" style="color: var(--primary-color);">
                <i class="fas fa-sign-in-alt me-2"></i>Restaurant Login
            </h2>
            <p class="text-muted">Welcome back! Please login to continue</p>
        </div>

        <c:if test="${not empty error}">
            <div class="alert error-alert alert-danger d-flex align-items-center" role="alert">
                <i class="fas fa-exclamation-circle me-2"></i>
                ${error}
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/restaurant/login" method="post">
            <!-- Email Input -->
            <div class="mb-4">
                <div class="input-group">
                    <span class="input-group-text bg-light">
                        <i class="fas fa-envelope text-primary"></i>
                    </span>
                    <input type="email" name="email" class="form-control" 
                           placeholder="Enter your email" required>
                </div>
            </div>

            <!-- Password Input -->
            <div class="mb-4">
                <div class="input-group">
                    <span class="input-group-text bg-light">
                        <i class="fas fa-lock text-primary"></i>
                    </span>
                    <input type="password" name="password" class="form-control" 
                           placeholder="Enter your password" required>
                </div>
            </div>

            <button type="submit" class="btn submit-btn text-white w-100">
                <i class="fas fa-sign-in-alt me-2"></i>Login
            </button>

            <div class="text-center mt-4">
                <p class="text-muted">Don't have an account? 
                    <a href="${pageContext.request.contextPath}/restaurant/register" 
                       class="text-primary text-decoration-none">
                       Register Here
                    </a>
                </p>
            </div>
        </form>
    </div>
</body>
</html>