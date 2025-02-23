<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delivery Agent Dashboard - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4ecdc4;
            --secondary-color: #ff6b6b;
            --success-color: #2ecc71;
        }

        body {
            background: linear-gradient(135deg, #f8fff4 0%, #e9f7ff 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
        }

        .dashboard-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .order-card {
            border-left: 4px solid var(--primary-color);
            transition: all 0.3s ease;
            position: relative;
        }

        .order-card:hover {
            transform: translateX(10px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .order-status {
            position: absolute;
            top: 1rem;
            right: 1rem;
            font-size: 0.9rem;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
        }

        .item-badge {
            background: #f8f9fa;
            border-radius: 20px;
            padding: 0.25rem 0.75rem;
            margin: 0.25rem;
            display: inline-flex;
            align-items: center;
        }

        .action-btn {
            min-width: 100px;
            transition: all 0.3s ease;
        }

        .accept-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(46, 204, 113, 0.3);
        }

        .reject-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(255, 107, 107, 0.3);
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-order {
            animation: slideIn 0.4s ease-out;
        }
    </style>
</head>
<body class="py-4">
<div class="container">
    <div class="dashboard-card p-4 mb-4">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="mb-0">
                    <i class="fas fa-motorcycle me-2"></i>🚚 Delivery Dashboard
                </h2>
                <p class="text-muted mb-0">Welcome back, ${agentName}</p>
            </div>
            <div class="d-flex gap-2">
                <span class="badge bg-primary p-2">
                    Active Orders: ${activeOrderCount}
                </span>
                <a href="${pageContext.request.contextPath}/delivery/dashboard" 
                   class="btn btn-outline-primary rounded-circle">
                   <i class="fas fa-sync"></i>
                </a>
            </div>
        </div>

        <!-- Orders -->
        <h4 class="mb-3">📦 Orders Ready for Delivery</h4>
        <div class="row g-4">
            <c:forEach var="order" items="${orders}" varStatus="loop">
                <div class="col-12 animate-order" style="animation-delay: ${loop.index * 0.1}s">
                    <div class="order-card card p-3">
                        <div class="order-status bg-success text-white">
                            Ready for Pickup
                        </div>
                        
                        <div class="row">
                            <!-- Order Info -->
                            <div class="col-md-8">
                                <div class="d-flex align-items-center gap-3 mb-3">
                                    <div class="bg-primary text-white rounded-circle p-2">
                                        #${order.orderId}
                                    </div>
                                    <div>
                                        <h5 class="mb-0">${order.user.userName}</h5>
                                        <small class="text-muted">${order.user.address}</small>
                                    </div>
                                </div>
                                
                                <div class="mb-3">
                                    <div class="d-flex flex-wrap">
                                        <c:forEach var="item" items="${order.items}">
                                            <div class="item-badge">
                                                <span class="me-2">${item.name}</span>
                                                <span class="text-muted">x${item.quantity}</span>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>

                            <!-- Actions -->
                            <div class="col-md-4 border-start">
                                <div class="d-flex flex-column h-100 justify-content-between">
                                    <div class="text-end">
                                        <h3 class="text-success">$${order.totalPrice}</h3>
                                        <small class="text-muted">Total Amount</small>
                                    </div>
                                    
                                    <div class="d-grid gap-2">
                                        <form action="${pageContext.request.contextPath}/delivery/acceptOrder" method="post">
                                            <input type="hidden" name="orderId" value="${order.orderId}" />
                                            <button type="submit" 
                                                    class="btn btn-success action-btn accept-btn rounded-pill">
                                                <i class="fas fa-check-circle me-2"></i>Accept
                                            </button>
                                        </form>
                                        <form action="${pageContext.request.contextPath}/delivery/rejectOrder" method="post">
                                            <input type="hidden" name="orderId" value="${order.orderId}" />
                                            <button type="submit" 
                                                    class="btn btn-danger action-btn reject-btn rounded-pill">
                                                <i class="fas fa-times-circle me-2"></i>Reject
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Empty State -->
        <c:if test="${empty orders}">
            <div class="text-center py-5">
                <i class="fas fa-clipboard-check fa-3x text-muted mb-3"></i>
                <h4 class="text-muted">No pending orders available</h4>
                <p class="text-muted">New orders will appear here when available</p>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>