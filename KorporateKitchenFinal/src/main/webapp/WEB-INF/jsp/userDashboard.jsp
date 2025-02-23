
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Dashboard - Korporate Kitchen</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
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
            justify-content: center;
            margin: 0;
            padding: 20px;
        }

        .dashboard-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            padding: 2rem;
            width: 100%;
            max-width: 600px;
            position: relative;
            animation: cardEntrance 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .profile-avatar {
            width: 100px;
            height: 100px;
            background: linear-gradient(45deg, var(--primary-color), #ff8787);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            font-weight: bold;
            color: white;
            margin: 0 auto 1rem;
            box-shadow: 0 8px 24px rgba(255,107,107,0.2);
        }

        .detail-item {
            display: flex;
            align-items: center;
            padding: 1rem;
            margin: 1rem 0;
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
            background: var(--primary-color);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            margin-right: 1rem;
            flex-shrink: 0;
        }

        @keyframes cardEntrance {
            from { opacity: 0; transform: translateY(20px) scale(0.96); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        .action-buttons {
            margin-top: 2rem;
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .btn-edit {
            background: linear-gradient(45deg, var(--secondary-color), #63d9d1);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 30px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .btn-edit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(78,205,196,0.3);
        }
    </style>
</head>
<body>
    <div class="dashboard-card">
        <div class="profile-header">
            <div class="profile-avatar">
                ${user.userName.substring(0,1).toUpperCase()}
            </div>
            <h2>Welcome, ${user.userName} 👋</h2>
            <p class="text-muted">Your food journey starts here!</p>
        </div>

        <div class="profile-details">
            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-envelope"></i>
                </div>
                <div>
                    <h4 class="mb-0">${user.email}</h4>
                    <small class="text-muted">Email Address</small>
                </div>
            </div>

            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-phone"></i>
                </div>
                <div>
                    <h4 class="mb-0">${user.contact}</h4>
                    <small class="text-muted">Contact Number</small>
                </div>
            </div>

            <div class="detail-item">
                <div class="detail-icon">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <div>
                    <h4 class="mb-0">${user.address}</h4>
                    <small class="text-muted">Delivery Address</small>
                </div>
            </div>
        </div>

        <div class="action-buttons">
            <a href="${pageContext.request.contextPath}/user/home" 
               class="btn-edit">
               <i class="fas fa-arrow-left me-2"></i>Back to Home
            </a>
            <a href="${pageContext.request.contextPath}/user/profile/edit" 
               class="btn-edit">
               <i class="fas fa-edit me-2"></i>Edit Profile
            </a>
        </div>
    </div>
</body>
</html>
