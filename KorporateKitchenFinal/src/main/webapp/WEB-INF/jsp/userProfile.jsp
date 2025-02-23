<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile - Korporate Kitchen</title>
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

        .profile-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            overflow: hidden;
        }

        .profile-header {
            background: linear-gradient(45deg, var(--primary-color), #ff8787);
            padding: 2rem;
            text-align: center;
            position: relative;
        }

        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: white;
            margin: -75px auto 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            font-weight: bold;
            color: var(--primary-color);
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
        }

        .detail-item {
            display: flex;
            align-items: center;
            padding: 1.5rem;
            border-bottom: 1px solid #eee;
            transition: all 0.3s ease;
        }

        .detail-item:hover {
            background: #f8f9fa;
            transform: translateX(10px);
        }

        .detail-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin-right: 1.5rem;
            flex-shrink: 0;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-profile {
            animation: slideIn 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="profile-card animate-profile">
                <div class="profile-header">
                    <h2 class="text-white mb-0">User Profile</h2>
                </div>
                
                <div class="profile-pic">
                    ${user.userName.substring(0,1).toUpperCase()}
                </div>

                <div class="profile-details">
                    <div class="detail-item">
                        <div class="detail-icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <h5 class="mb-1">${user.userName}</h5>
                            <small class="text-muted">Username</small>
                        </div>
                    </div>

                    <div class="detail-item">
                        <div class="detail-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            <h5 class="mb-1">${user.email}</h5>
                            <small class="text-muted">Email Address</small>
                        </div>
                    </div>

                    <div class="detail-item">
                        <div class="detail-icon">
                            <i class="fas fa-phone"></i>
                        </div>
                        <div>
                            <h5 class="mb-1">${user.contact}</h5>
                            <small class="text-muted">Contact Number</small>
                        </div>
                    </div>

                    <div class="detail-item">
                        <div class="detail-icon">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <div>
                            <h5 class="mb-1">${user.address}</h5>
                            <small class="text-muted">Delivery Address</small>
                        </div>
                    </div>
                </div>

                <div class="text-center p-4">
                    <a href="${pageContext.request.contextPath}/user/home" 
                       class="btn btn-primary rounded-pill px-4">
                       <i class="fas fa-arrow-left me-2"></i>Back to Home
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>