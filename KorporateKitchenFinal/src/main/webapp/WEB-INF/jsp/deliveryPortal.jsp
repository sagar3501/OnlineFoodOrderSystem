<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delivery Partner Portal - Korporate Kitchen</title>
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
 
        .portal-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            padding: 3rem;
            max-width: 500px;
            margin: 0 auto;
            text-align: center;
        }
 
        .portal-header img {
            width: 120px;
            margin-bottom: 1.5rem;
        }
 
        .portal-btn {
            background: var(--primary-color);
            border: none;
            padding: 1rem 2rem;
            border-radius: 15px;
            color: white;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
            margin: 1rem 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
 
        .portal-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 204, 102, 0.3);
        }
 
        .portal-btn i {
            margin-right: 10px;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="portal-card animate-profile">
        <div class="portal-header">
 
            <h1 class="mb-4" style="color: var(--dark-color);">Delivery Partner Portal</h1>
        </div>
        
        <a href="${pageContext.request.contextPath}/delivery/login" class="btn portal-btn">
            <i class="fas fa-sign-in-alt"></i>Partner Login
        </a>
        
        <a href="${pageContext.request.contextPath}/delivery/register" class="btn portal-btn"
           style="background: var(--secondary-color);">
            <i class="fas fa-user-plus"></i>New Partner Registration
        </a>
    </div>
</div>
</body>
</html>