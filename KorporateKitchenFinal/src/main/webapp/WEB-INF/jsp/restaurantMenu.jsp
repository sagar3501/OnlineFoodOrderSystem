<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Restaurant Menu - Korporate Kitchen</title>
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
        }

        .menu-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.08);
        }

        .menu-item {
            border-left: 4px solid var(--primary-color);
            transition: all 0.3s ease;
        }

        .menu-item:hover {
            transform: translateX(10px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .item-badge {
            background: #f8f9fa;
            border-radius: 20px;
            padding: 0.25rem 0.75rem;
            margin: 0.25rem;
            display: inline-flex;
            align-items: center;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-item {
            animation: slideIn 0.4s ease-out;
        }
    </style>
</head>
<body class="py-4">
<div class="container">
    <div class="menu-card p-4 mb-4">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold mb-0" style="color: var(--primary-color);">
                    <i class="fas fa-utensils me-2"></i>📋 Menu for ${restaurant.restaurantName}
                </h2>
                <p class="text-muted mb-0">${menuItems.size()} items available</p>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/user/home" 
                   class="btn btn-outline-secondary rounded-pill">
                   <i class="fas fa-arrow-left me-2"></i>Back to Home
                </a>
            </div>
        </div>

        <!-- Menu Items -->
        <div class="row g-4">
            <c:forEach var="item" items="${menuItems}" varStatus="loop">
                <div class="col-12 animate-item" style="animation-delay: ${loop.index * 0.1}s">
                    <div class="menu-item card p-3">
                        <div class="row align-items-center">
                            <!-- Item Info -->
                            <div class="col-md-8">
                                <h5 class="mb-1">${item.itemName}</h5>
                                <p class="text-muted mb-2">${item.itemDescription}</p>
                                <h4 class="text-primary mb-0">$${item.price}</h4>
                            </div>

                            <!-- Actions -->
                            <div class="col-md-4 text-end">
                                <form action="${pageContext.request.contextPath}/user/addToCart" method="post" class="m-0">
                                    <input type="hidden" name="itemId" value="${item.itemId}" />
                                    <button type="submit" 
                                            class="btn btn-primary rounded-pill px-4">
                                        <i class="fas fa-cart-plus me-2"></i>Add to Cart
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Empty State -->
        <c:if test="${empty menuItems}">
            <div class="text-center py-5">
                <i class="fas fa-utensils fa-3x text-muted mb-3"></i>
                <h4 class="text-muted">No items in the menu yet</h4>
                <p class="text-muted">Check back later for delicious options!</p>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>