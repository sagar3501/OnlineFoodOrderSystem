
 
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Restaurant Dashboard - Korporate Kitchen</title>
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
 
        .dashboard-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            padding: 2rem;
            max-width: 800px;
            margin: 0 auto;
        }
 
        .dashboard-header {
            text-align: center;
            margin-bottom: 2rem;
        }
 
        .dashboard-header h2 {
            color: var(--dark-color);
            font-weight: 600;
        }
 
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }
 
        .dashboard-btn {
            background: var(--primary-color);
            border: none;
            padding: 1.5rem;
            border-radius: 15px;
            color: white;
            font-weight: 600;
            text-decoration: none;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            min-height: 150px;
        }
 
        .dashboard-btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
        }
 
        .dashboard-btn i {
            font-size: 2rem;
            margin-bottom: 1rem;
        }
 
        .btn-logout {
            background: var(--secondary-color);
            margin-top: 2rem;
            width: 100%;
        }
 
        .btn-logout:hover {
            background: #3bb4ad;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="dashboard-card animate-profile">
        <div class="dashboard-header">
            <h2>Restaurant Dashboard</h2>
            <img src="https://cdn-icons-png.flaticon.com/512/706/706164.png" width="100" alt="Restaurant">
        </div>
 
        <div class="dashboard-grid">
            <a href="${pageContext.request.contextPath}/restaurant/manageMenu" class="dashboard-btn">
                <i class="fas fa-utensils"></i>
                Manage Menu
            </a>
 
            <a href="${pageContext.request.contextPath}/restaurant/orders" class="dashboard-btn">
                <i class="fas fa-clipboard-list"></i>
                View Orders
            </a>
 
            <a href="${pageContext.request.contextPath}/restaurant/bank" class="dashboard-btn">
                <i class="fas fa-coins"></i>
                Bank Details
            </a>
        </div>
 
        <a href="${pageContext.request.contextPath}/restaurant/logout" class="dashboard-btn btn-logout">
            <i class="fas fa-sign-out-alt"></i>
            Logout
        </a>
    </div>
</div>
</body>
</html>