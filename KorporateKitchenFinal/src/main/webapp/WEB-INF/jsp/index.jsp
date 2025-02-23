<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Korporate Kitchen - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #4ecdc4;
            --accent-color: #ffe66d;
        }

        body {
            background: linear-gradient(135deg, #fff5f5 0%, #f8fff4 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            margin: 0;
            overflow-x: hidden;
        }

        .hero-section {
            position: relative;
            padding: 8rem 0;
            text-align: center;
        }

        .floating-logo {
            font-size: 4rem;
            animation: float 3s ease-in-out infinite;
            margin-bottom: 2rem;
        }

        .cta-buttons .btn {
            padding: 1.2rem 2.5rem;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            border: none;
        }

        .cta-buttons .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255,255,255,0.1);
            transform: translateX(-100%);
            transition: all 0.4s ease;
        }

        .cta-buttons .btn:hover::before {
            transform: translateX(0);
        }

        .btn-login {
            background: linear-gradient(45deg, var(--primary-color), #ff8787);
        }

        .btn-register {
            background: linear-gradient(45deg, var(--secondary-color), #63d9d1);
        }

        .deco-circle {
            position: absolute;
            border-radius: 50%;
            background: rgba(255,107,107,0.1);
            z-index: -1;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        @keyframes scaleIn {
            from { opacity: 0; transform: scale(0.8); }
            to { opacity: 1; transform: scale(1); }
        }

        .animate-scale {
            animation: scaleIn 0.8s cubic-bezier(0.23, 1, 0.32, 1);
        }
    </style>
</head>
<body>
    <div class="hero-section">
        <!-- Decorative elements -->
        <div class="deco-circle" style="width: 300px; height: 300px; top: -150px; right: -150px;"></div>
        <div class="deco-circle" style="width: 200px; height: 200px; bottom: -100px; left: -100px;"></div>

        <div class="container">
            <div class="animate-scale">
                <div class="floating-logo">
                    🍔🍟🥗
                </div>
                <h1 class="display-3 fw-bold mb-4" style="color: var(--primary-color);">
                    Welcome to <span class="text-dark">Korporate</span> Kitchen
                </h1>
                <p class="lead mb-5 text-muted">
                    Your gateway to delicious corporate meals delivered fast!
                </p>

                <div class="cta-buttons d-flex flex-column flex-md-row gap-3 justify-content-center">
                    <a href="${pageContext.request.contextPath}/login" 
                       class="btn btn-login text-white">
                       <i class="fas fa-sign-in-alt me-2"></i>Login
                    </a>
                    <a href="${pageContext.request.contextPath}/register" 
                       class="btn btn-register text-white">
                       <i class="fas fa-user-plus me-2"></i>Register
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Animated Background Elements -->
    <div class="deco-circle" style="width: 150px; height: 150px; top: 50%; left: 20%;"></div>
    <div class="deco-circle" style="width: 100px; height: 100px; top: 30%; right: 25%;"></div>
</body>
</html>