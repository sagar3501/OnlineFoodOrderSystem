<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Restaurant Portal - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #4ecdc4;
            --dark-color: #2d3436;
        }

        body {
            background: linear-gradient(135deg, #fff5f5 0%, #f8fff4 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .portal-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            padding: 2.5rem;
            text-align: center;
            max-width: 500px;
            animation: cardEntrance 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }

        .portal-card h1 {
            color: var(--primary-color);
            font-weight: 700;
        }

        .btn-portal {
            background: linear-gradient(45deg, var(--primary-color), #ff8787);
            border: none;
            padding: 12px 24px;
            border-radius: 50px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            margin: 10px;
        }

        .btn-portal:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
        }

        @keyframes cardEntrance {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="portal-card">
        <h1 class="mb-4">Restaurant Portal 🍽️</h1>
        <a href="${pageContext.request.contextPath}/restaurant/login" 
           class="btn btn-portal text-white">
           <i class="fas fa-sign-in-alt me-2"></i>Restaurant Login
        </a>
        <a href="${pageContext.request.contextPath}/restaurant/register" 
           class="btn btn-portal text-white">
           <i class="fas fa-user-plus me-2"></i>Restaurant Register
        </a>
    </div>
</body>
</html>