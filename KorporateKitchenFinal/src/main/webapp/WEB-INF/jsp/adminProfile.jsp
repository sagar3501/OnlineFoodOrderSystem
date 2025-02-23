<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Profile - Korporate Kitchen</title>
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
            padding: 2rem;
        }

        .profile-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            transition: transform 0.3s ease;
        }

        .profile-card:hover {
            transform: translateY(-5px);
        }

        .profile-header {
            position: relative;
            text-align: center;
            padding: 2rem 0;
            background: linear-gradient(45deg, var(--primary-color), #ff8787);
            border-radius: 20px 20px 0 0;
        }

        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background: white;
            margin: -60px auto 1rem;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            font-weight: bold;
            color: var(--primary-color);
        }

        .profile-details {
            padding: 2rem;
        }

        .detail-item {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
            padding: 1rem;
            background: #f8f9fa;
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .detail-item:hover {
            transform: translateX(10px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
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
            margin-right: 1rem;
            flex-shrink: 0;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-profile {
            animation: fadeInUp 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }
    </style>
</head>
<body class="d-flex align-items-center">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="profile-card animate-profile">
                <div class="profile-header">
                    <h2 class="text-white mb-0">Admin Profile</h2>
                </div>
                
               

                <div class="profile-details">
                    <div class="detail-item">
                        <div class="detail-icon">
                            <i class="fas fa-user"></i>
                        </div>
                        <div>
                            <h5 class="mb-1">${admin.userName}</h5>
                            <small class="text-muted">Username</small>
                        </div>
                    </div>

                    <div class="detail-item">
                        <div class="detail-icon">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            <h5 class="mb-1">${admin.email}</h5>
                            <small class="text-muted">Email Address</small>
                        </div>
                    </div>

                    <div class="detail-item">
                        <div class="detail-icon">
                            <i class="fas fa-phone"></i>
                        </div>
                        <div>
                            <h5 class="mb-1">${admin.contact}</h5>
                            <small class="text-muted">Contact Number</small>
                        </div>
                    </div>

                    <a href="${pageContext.request.contextPath}/admin/dashboard" 
                       class="btn btn-lg btn-outline-primary w-100 rounded-pill mt-4">
                        <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>