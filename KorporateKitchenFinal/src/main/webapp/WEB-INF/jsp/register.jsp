<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Register - Korporate Kitchen</title>
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
        }
 
        .register-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            transition: transform 0.3s ease;
        }
 
        .register-card:hover {
            transform: translateY(-5px);
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
 
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
 
        .animate-form {
            animation: slideIn 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }
</style>
</head>
<body>
<div class="container">
<div class="row justify-content-center">
<div class="col-md-6 col-lg-5">
<div class="register-card p-4 animate-form">
<div class="text-center mb-4">
<h2 class="fw-bold" style="color: var(--primary-color);">
<i class="fas fa-user-plus me-2"></i>Join Us!
</h2>
<p class="text-muted">Create your account</p>
</div>
<form action="${pageContext.request.contextPath}/user/register" method="post">
<div class="mb-3">
<div class="input-group">
<span class="input-group-text bg-light">
<i class="fas fa-user text-primary"></i>
</span>
<input type="text" name="userName" class="form-control" placeholder="Name" required>
</div>
</div>
<div class="mb-3">
<div class="input-group">
<span class="input-group-text bg-light">
<i class="fas fa-envelope text-primary"></i>
</span>
<input type="email" name="email" class="form-control" placeholder="Email" required>
</div>
</div>
<div class="mb-3">
<div class="input-group">
<span class="input-group-text bg-light">
<i class="fas fa-lock text-primary"></i>
</span>
<input type="password" name="password" class="form-control" placeholder="Password" required>
</div>
</div>
<div class="mb-3">
<div class="input-group">
<span class="input-group-text bg-light">
<i class="fas fa-phone text-primary"></i>
</span>
<input type="text" name="contact" class="form-control" placeholder="Contact">
</div>
</div>
<div class="mb-3">
<div class="input-group">
<span class="input-group-text bg-light">
<i class="fas fa-map-marker-alt text-primary"></i>
</span>
<textarea name="address" class="form-control" placeholder="Address"></textarea>
</div>
</div>
<button type="submit" class="btn submit-btn text-white w-100">
<i class="fas fa-user-plus me-2"></i>Register
</button>
<div class="text-center mt-4">
<p class="text-muted">Already have an account?
<a href="${pageContext.request.contextPath}/login" 
                               class="text-primary text-decoration-none">
                               Login here
</a>
</p>
</div>
</form>
</div>
</div>
</div>
</div>
</body>
</html>