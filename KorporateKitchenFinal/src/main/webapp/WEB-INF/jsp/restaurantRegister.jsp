<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Restaurant Registration - Korporate Kitchen</title>
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

        .register-card {
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

        @keyframes cardEntrance {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="register-card">
        <h2 class="fw-bold mb-4" style="color: var(--primary-color);">
            <i class="fas fa-utensils me-2"></i>Restaurant Registration
        </h2>

        <form action="${pageContext.request.contextPath}/restaurant/register" method="post">
            <div class="mb-3">
                <label class="form-label">Restaurant Name</label>
                <input type="text" name="restaurantName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="userName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Contact</label>
                <input type="text" name="contact" class="form-control">
            </div>
            <div class="mb-4">
                <label class="form-label">Address</label>
                <textarea name="address" class="form-control" rows="3"></textarea>
            </div>

            <button type="submit" class="btn submit-btn text-white w-100">
                <i class="fas fa-user-plus me-2"></i>Register
            </button>
        </form>
    </div>
</body>
</html>