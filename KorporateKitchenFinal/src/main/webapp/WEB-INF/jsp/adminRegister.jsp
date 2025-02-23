<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Admin Registration - Korporate Kitchen</title>
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

        .register-container {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.08);
            padding: 40px;
            max-width: 500px;
            width: 100%;
        }

        .register-title {
            color: var(--dark-color);
            font-weight: 700;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-control {
            border-radius: 10px;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 5px rgba(230, 126, 34, 0.5);
        }

        .btn-register {
            background-color: var(--primary-color);
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 25px;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
            width: 100%;
        }

        .btn-register:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2 class="register-title">Admin Registration</h2>
        <form action="${pageContext.request.contextPath}/admin/register" method="post">
            <input type="text" name="userName" class="form-control" placeholder="Name" required />
            <input type="email" name="email" class="form-control" placeholder="Email" required />
            <input type="password" name="password" class="form-control" placeholder="Password" required />
            <input type="text" name="contact" class="form-control" placeholder="Contact" required />
            <button type="submit" class="btn btn-register">Register</button>
        </form>
    </div>
</body>
</html>