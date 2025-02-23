<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delivery Partner Profile - Korporate Kitchen</title>
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
            padding: 2rem;
        }
 
        .profile-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            max-width: 600px;
            margin: 0 auto;
            position: relative;
        }
 
        .profile-header {
            background: linear-gradient(45deg, var(--primary-color), #00e673);
            padding: 2rem;
            border-radius: 20px 20px 0 0;
            text-align: center;
            color: white;
        }
 
        .profile-avatar {
            width: 100px;
            height: 100px;
            background: white;
            border-radius: 50%;
            margin: -50px auto 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: var(--primary-color);
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
        }
 
        .detail-item {
            padding: 1.5rem;
            margin: 1rem;
            background: #f8f9fa;
            border-radius: 15px;
            display: flex;
            align-items: center;
        }
 
        .detail-icon {
            width: 40px;
            height: 40px;
            background: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin-right: 1rem;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="profile-card animate-profile">
        <div class="profile-header">
            <h2 class="mb-0">Delivery Partner Profile</h2>
        </div>
        
 
 
        <div class="profile-details p-4">
            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-user"></i>
                </div>
                <div>
                    <h5 class="mb-1">${agent.userName}</h5>
                    <small class="text-muted">Partner Name</small>
                </div>
            </div>
 
            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-envelope"></i>
                </div>
                <div>
                    <h5 class="mb-1">${agent.email}</h5>
                    <small class="text-muted">Email Address</small>
                </div>
            </div>
 
            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-phone"></i>
                </div>
                <div>
                    <h5 class="mb-1">${agent.contact}</h5>
                    <small class="text-muted">Contact Number</small>
                </div>
            </div>
 
            <a href="${pageContext.request.contextPath}/delivery/dashboard"
               class="btn btn-outline-secondary w-100 rounded-pill mt-3">
                <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
            </a>
        </div>
    </div>
</div>
</body>
</html>