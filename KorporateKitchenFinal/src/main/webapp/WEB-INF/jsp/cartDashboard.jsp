<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart Dashboard - Korporate Kitchen</title>
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
        }

        .cart-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 15px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .cart-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 32px rgba(0,0,0,0.12);
        }

        .quantity-control {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .quantity-btn {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            border: none;
            background: var(--primary-color);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
        }

        .quantity-btn:hover {
            transform: scale(1.1);
            background: #ff5252;
        }

        .remove-btn {
            transition: all 0.3s ease;
            color: #ff6b6b !important;
        }

        .remove-btn:hover {
            transform: rotate(15deg);
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateX(20px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .cart-item-animate {
            animation: slideIn 0.4s ease-out;
        }
    </style>
</head>
<body class="py-4">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="cart-card p-4 mb-4">
                <h2 class="fw-bold mb-4">
                    <i class="fas fa-shopping-cart me-2"></i>🛒 Your Cart
                </h2>

                <c:forEach var="item" items="${cartItems}" varStatus="loop">
                    <div class="cart-item-animate mb-4 p-3 rounded-3" style="animation-delay: ${loop.index * 0.1}s">
                        <div class="d-flex align-items-center justify-content-between">
                            <!-- Item Info -->
                            <div class="d-flex align-items-center gap-3">
                                <div class="bg-primary text-white rounded-2 p-2">
                                    <i class="fas fa-utensils fa-lg"></i>
                                </div>
                                <div>
                                    <h5 class="mb-0">${item.itemName}</h5>
                                    <small class="text-muted">$${item.itemPrice} each</small>
                                </div>
                            </div>

                            <!-- Quantity Controls -->
                            <div class="d-flex align-items-center gap-3">
                                <div class="quantity-control bg-light rounded-pill px-3 py-1">
                                    <form action="${pageContext.request.contextPath}/user/decreaseQuantity" method="post" class="m-0">
                                        <input type="hidden" name="cartId" value="${item.cartId}" />
                                        <button type="submit" class="quantity-btn">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                    </form>
                                    
                                    <span class="fw-bold fs-5">${item.quantity}</span>
                                    
                                    <form action="${pageContext.request.contextPath}/user/increaseQuantity" method="post" class="m-0">
                                        <input type="hidden" name="cartId" value="${item.cartId}" />
                                        <button type="submit" class="quantity-btn">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </form>
                                </div>

                                <!-- Remove Button -->
                                <form action="${pageContext.request.contextPath}/user/removeFromCart" method="post" class="m-0">
                                    <input type="hidden" name="cartId" value="${item.cartId}" />
                                    <button type="submit" class="remove-btn btn btn-link text-danger p-0">
                                        <i class="fas fa-trash fa-lg"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- Total & Actions -->
                <div class="border-top pt-4 mt-3">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="mb-0">Total:</h3>
                        <h2 class="mb-0 text-primary">$${totalPrice}</h2>
                    </div>

                    <div class="d-flex gap-3">
                        <a href="${pageContext.request.contextPath}/user/home" 
                           class="btn btn-lg btn-outline-secondary w-50 rounded-pill">
                            <i class="fas fa-chevron-left me-2"></i>Continue Shopping
                        </a>
                        <a href="${pageContext.request.contextPath}/user/payment" 
                           class="btn btn-lg btn-primary w-50 rounded-pill">
                            Checkout Now <i class="fas fa-arrow-right ms-2"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>