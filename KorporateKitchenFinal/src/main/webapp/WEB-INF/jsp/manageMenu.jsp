

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manage Menu - Restaurant Dashboard</title>
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
        }

        .menu-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 15px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }

        .menu-item {
            border-left: 4px solid var(--primary-color);
            transition: all 0.3s ease;
        }

        .menu-item:hover {
            transform: translateX(10px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .type-badge {
            font-size: 0.9rem;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
        }

        .action-btn {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            transform: rotate(15deg) scale(1.1);
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
                    <i class="fas fa-utensils me-2"></i>📋 Menu Management
                </h2>
                <p class="text-muted mb-0">${menuItems.size()} items in your menu</p>
            </div>
            <div class="d-flex gap-2">
                <a href="${pageContext.request.contextPath}/restaurant/addMenuItem" 
                   class="btn btn-primary rounded-pill">
                   <i class="fas fa-plus-circle me-2"></i>Add New Item
                </a>
            </div>
        </div>

        <!-- Search and Filters -->
        <div class="row mb-4">
            <div class="col-md-6">
                <div class="input-group">
                    <span class="input-group-text bg-light">
                        <i class="fas fa-search text-primary"></i>
                    </span>
                    <input type="text" class="form-control" placeholder="Search menu items...">
                </div>
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
                                <div class="d-flex align-items-center gap-3 mb-2">
                                    <h5 class="mb-0">${item.itemName}</h5>
                                    <span class="type-badge ${item.itemType == 'Veg' ? 'bg-success' : 'bg-danger'}">
                                        ${item.itemType == 'Veg' ? '🌱 Veg' : '🍗 Non-Veg'}
                                    </span>
                                </div>
                                <p class="text-muted mb-2">${item.itemDescription}</p>
                                <h4 class="text-primary mb-0">$${item.price}</h4>
                            </div>

                            <!-- Actions -->
                            <div class="col-md-4 text-end">
                                <div class="d-flex gap-2 justify-content-end">
                                    <a href="${pageContext.request.contextPath}/restaurant/editMenuItem?itemId=${item.itemId}" 
                                       class="btn btn-outline-primary action-btn rounded-circle">
                                       <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="${pageContext.request.contextPath}/restaurant/deleteMenuItem" method="post" class="m-0">
                                        <input type="hidden" name="itemId" value="${item.itemId}" />
                                        <button type="submit" 
                                                class="btn btn-outline-danger action-btn delete-btn rounded-circle"
                                                onclick="return confirm('Are you sure you want to delete this item?');">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </div>
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
                <h4 class="text-muted">No items in your menu yet</h4>
                <p class="text-muted">Start by adding your first menu item</p>
            </div>
        </c:if>
    </div>

    <a href="${pageContext.request.contextPath}/restaurant/dashboard" 
       class="btn btn-outline-secondary rounded-pill">
       <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
    </a>
</div>
</body>
</html>
