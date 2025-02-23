<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Delivery Partner Registration - Korporate Kitchen</title>
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
 
        .register-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            padding: 2.5rem;
            max-width: 500px;
            margin: 0 auto;
        }
 
        .register-header {
            text-align: center;
            margin-bottom: 2rem;
        }
 
        .form-control {
            border-radius: 12px;
            padding: 1rem;
            border: 2px solid #e9ecef;
            transition: all 0.3s ease;
        }
 
        .input-group-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
            z-index: 4;
        }
 
        .btn-register {
            background: var(--primary-color);
            border: none;
            padding: 1rem;
            font-weight: 600;
            border-radius: 12px;
            transition: all 0.3s ease;
        }
</style>
</head>
<body>
<div class="container">
<div class="register-card animate-profile">
<div class="register-header">
<h2 class="mb-3" style="color: var(--dark-color);">
<i class="fas fa-biking me-2"></i>Partner Registration
</h2>
</div>
 
        <form action="${pageContext.request.contextPath}/delivery/register" method="post">
<div class="mb-3 position-relative">
<i class="fas fa-user input-group-icon"></i>
<input type="text" name="userName" class="form-control ps-5" placeholder="Full Name" required>
</div>
 
            <div class="mb-3 position-relative">
<i class="fas fa-envelope input-group-icon"></i>
<input type="email" name="email" class="form-control ps-5" placeholder="Email Address" required>
</div>
 
            <div class="mb-3 position-relative">
<i class="fas fa-lock input-group-icon"></i>
<input type="password" name="password" class="form-control ps-5" placeholder="Password" required>
</div>
 
            <div class="mb-4 position-relative">
<i class="fas fa-phone input-group-icon"></i>
<input type="text" name="contact" class="form-control ps-5" placeholder="Contact Number" required>
</div>
 
            <button type="submit" class="btn btn-register w-100">
<i class="fas fa-user-plus me-2"></i>Register Now
</button>
</form>
 
        <div class="text-center mt-4">
<p class="text-muted">Already have an account? 
<a href="${pageContext.request.contextPath}/delivery/login" 
                   style="color: var(--primary-color); text-decoration: none;">
                    Sign In Here
</a>
</p>
</div>
</div>
</div>
</body>
</html>