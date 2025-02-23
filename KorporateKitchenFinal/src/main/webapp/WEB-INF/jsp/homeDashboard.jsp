<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Dashboard - Korporate Kitchen</title>
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
 
        .header {
            background: var(--primary-color);
            color: white;
            padding: 2rem;
            border-radius: 20px;
            text-align: center;
            margin-bottom: 2rem;
        }
 
        .nav {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-bottom: 2rem;
            flex-wrap: wrap;
        }
 
        .nav a {
            background: var(--secondary-color);
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            text-decoration: none;
            transition: all 0.3s ease;
        }
 
        .nav a:hover {
            background: #e68a00;
            transform: translateY(-2px);
        }
 
        .restaurant-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
        }
 
        .restaurant-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            padding: 1.5rem;
            text-align: center;
            transition: all 0.3s ease;
        }
 
        .restaurant-card:hover {
            transform: translateY(-5px);
        }
 
        .restaurant-card h3 {
            color: var(--dark-color);
            margin-bottom: 1rem;
        }
 
        .restaurant-card a {
            background: var(--primary-color);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 12px;
            text-decoration: none;
            transition: all 0.3s ease;
        }
 
        .restaurant-card a:hover {
            background: #00994d;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Welcome, ${user.userName}!</h1>
    </div>
 
    <div class="nav">
        <a href="${pageContext.request.contextPath}/user/profile"><i class="fas fa-user me-2"></i>Profile</a>
        <a href="${pageContext.request.contextPath}/user/orders"><i class="fas fa-clipboard-list me-2"></i>Orders</a>
        <a href="${pageContext.request.contextPath}/user/cart"><i class="fas fa-shopping-cart me-2"></i>Cart</a>
        <a href="${pageContext.request.contextPath}/user/remarks"><i class="fas fa-comment me-2"></i>Remarks</a>
        <a href="${pageContext.request.contextPath}/user/logout"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
    </div>
 
    <h2 class="text-center mb-4" style="color: var(--dark-color);">Available Restaurants</h2>
    <div class="restaurant-list">
        <c:forEach var="restaurant" items="${restaurants}">
            <div class="restaurant-card">
                <h3>${restaurant.restaurantName}</h3>
                <p>${restaurant.address}</p>
                <a href="${pageContext.request.contextPath}/user/restaurantMenu?restaurantId=${restaurant.restaurantId}">
                    <i class="fas fa-utensils me-2"></i>View Menu
                </a>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>