<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>User Orders - Korporate Kitchen</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #ff6b6b;
      --secondary-color: #4ecdc4;
      --dark-color: #2d3436;
    }
    body {
      background: linear-gradient(135deg, #f8f9fa 0%, #fff5f5 100%);
      font-family: 'Poppins', sans-serif;
    }
    .orders-card {
      background: rgba(255, 255, 255, 0.98);
      border-radius: 20px;
      box-shadow: 0 4px 24px rgba(0,0,0,0.08);
      padding: 2rem;
      margin-bottom: 2rem;
    }
    .order-card {
      border-left: 4px solid var(--primary-color);
      transition: all 0.3s ease;
      margin-bottom: 1rem;
    }
    .order-card:hover {
      transform: translateX(10px);
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .status-badge {
      padding: 0.25rem 0.75rem;
      border-radius: 20px;
      font-size: 0.9rem;
    }
    .status-delivered {
      background: #d1fae5;
      color: #065f46;
    }
    .status-pending {
      background: #fef3c7;
      color: #92400e;
    }
    .status-cancelled {
      background: #fee2e2;
      color: #991b1b;
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
    .animate-order {
      animation: slideIn 0.4s ease-out;
    }
    .back-btn {
      margin-top: 20px;
    }
  </style>
</head>
<body class="py-4">
  <div class="container">
    <div class="orders-card">
      <!-- Header -->
      <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
          <h2 class="fw-bold mb-0" style="color: var(--primary-color);">
            <i class="fas fa-receipt me-2"></i>📋 Your Orders
          </h2>
          <p class="text-muted mb-0">${orders.size()} orders placed</p>
        </div>
        <div>
          <a href="${pageContext.request.contextPath}/user/home" class="btn btn-outline-secondary rounded-pill">
            <i class="fas fa-arrow-left me-2"></i>Back to Home
          </a>
        </div>
      </div>
      
      <!-- Orders List -->
      <div class="row g-4">
        <c:forEach var="order" items="${orders}" varStatus="loop">
          <div class="col-12 animate-order" style="animation-delay: ${loop.index * 0.1}s">
            <div class="order-card card p-3">
              <div class="row align-items-center">
                <!-- Order Info -->
                <div class="col-md-8">
                  <div class="d-flex justify-content-between align-items-center mb-3">
                    <h5 class="mb-0">Order #${order.orderId}</h5>
                    <span class="status-badge 
                      ${order.order_status == 'completed' ? 'status-delivered' : 
                      order.order_status == 'pending' ? 'status-pending' : 'status-cancelled'}">
                      ${order.order_status}
                    </span>
                  </div>
                  <div class="mb-3">
                    <p><strong>Items:</strong> ${order.items}</p>
                  </div>
                  <div class="d-flex gap-4">
                    <div>
                      <small class="text-muted">Total</small>
                      <h4 class="text-primary mb-0">$${order.totalPrice}</h4>
                    </div>
                    <div>
                      <small class="text-muted">Order Date</small>
                      <h6 class="mb-0">${order.orderDate}</h6>
                    </div>
                  </div>
                </div>
                
                <!-- Actions -->
                <div class="col-md-4 text-end">
                  <a href="${pageContext.request.contextPath}/user/repeatOrder?orderId=${order.orderId}" class="btn btn-primary rounded-pill px-4">
                    <i class="fas fa-redo-alt me-2"></i>Repeat Order
                  </a>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
      
      <!-- Empty State -->
      <c:if test="${empty orders}">
        <div class="text-center py-5">
          <i class="fas fa-shopping-basket fa-3x text-muted mb-3"></i>
          <h4 class="text-muted">No orders found</h4>
          <p class="text-muted">Your orders will appear here once you place them</p>
        </div>
      </c:if>
    </div>
  </div>
</body>
</html>
