<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Successful - Korporate Kitchen</title>
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
 
        .success-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            padding: 3rem;
            max-width: 500px;
            margin: 0 auto;
            text-align: center;
        }
 
        .success-icon {
            font-size: 4rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }
 
        .btn-success {
            background: var(--primary-color);
            border: none;
            padding: 1rem 2rem;
            border-radius: 12px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="success-card animate-profile">
        <i class="fas fa-check-circle success-icon"></i>
        <h2 class="mb-4" style="color: var(--dark-color);">Registration Successful
			
			
			<div> <a class="btn" href="${pageContext.request.contextPath}/delivery/login">Go to Login</a> </div>