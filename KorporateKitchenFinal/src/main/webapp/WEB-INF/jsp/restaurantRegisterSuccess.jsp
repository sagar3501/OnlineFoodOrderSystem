<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Successful - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4ecdc4;
            --secondary-color: #ff6b6b;
            --success-color: #2ecc71;
        }

        body {
            background: linear-gradient(135deg, #f8fff4 0%, #fff5f5 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .success-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            text-align: center;
            padding: 2.5rem;
            max-width: 500px;
            margin: 0 auto;
            animation: cardEntrance 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }

        .checkmark-container {
            width: 80px;
            height: 80px;
            background: var(--success-color);
            border-radius: 50%;
            margin: -60px auto 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(46, 204, 113, 0.3);
            animation: checkmarkScale 0.6s ease-out;
        }

        .checkmark {
            color: white;
            font-size: 2.5rem;
            transform: rotate(20deg);
            animation: checkmarkDraw 0.6s ease-out;
        }

        @keyframes cardEntrance {
            from { opacity: 0; transform: translateY(40px) scale(0.96); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        @keyframes checkmarkScale {
            0% { transform: scale(0); }
            60% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        @keyframes checkmarkDraw {
            0% { transform: scale(0) rotate(-45deg); opacity: 0; }
            80% { transform: scale(1.2) rotate(5deg); }
            100% { transform: scale(1) rotate(0); }
        }
    </style>
</head>
<body>
    <div class="success-card">
        <div class="checkmark-container">
            <i class="fas fa-check checkmark"></i>
        </div>
        
        <h2 class="fw-bold mb-3" style="color: var(--success-color);">
            Registration Successful! 🎉
        </h2>
        
        <p class="text-muted mb-4">
            Your restaurant has been successfully registered. You can now log in to manage your account.
        </p>

        <a href="${pageContext.request.contextPath}/restaurant/login" 
           class="btn btn-lg btn-primary rounded-pill w-100 py-2">
           <i class="fas fa-sign-in-alt me-2"></i>Go to Login
        </a>
    </div>
</body>
</html>