<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard - Korporate Kitchen</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    :root {
      --primary-color: #ff6b6b;
      --secondary-color: #4ecdc4;
      --dark-color: #2d3436;
      --glass-bg: rgba(255, 255, 255, 0.95);
    }

    body {
      background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
      font-family: 'Poppins', sans-serif;
      min-height: 100vh;
    }

    .header {
      background: linear-gradient(45deg, var(--dark-color), #34495e);
      color: #fff;
      padding: 1rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      position: relative;
    }

    .sidebar {
      background: var(--glass-bg);
      backdrop-filter: blur(10px);
      box-shadow: 4px 0 12px rgba(0,0,0,0.1);
    }

    .sidebar a {
      color: var(--dark-color);
      padding: 1rem 1.5rem;
      margin: 0.5rem;
      border-radius: 8px;
      transition: all 0.3s ease;
    }

    .sidebar a:hover {
      background: var(--primary-color);
      color: white;
      transform: translateX(8px);
    }

    .stats-card {
      background: var(--glass-bg);
      border-radius: 15px;
      padding: 1.5rem;
      margin: 1rem;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
    }

    .stats-card:hover {
      transform: translateY(-5px);
    }

    .stat-icon {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.5rem;
    }

    @keyframes cardEntrance {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .animate-stat {
      animation: cardEntrance 0.6s cubic-bezier(0.23, 1, 0.32, 1);
    }
  </style>
</head>
<body>
  <div class="header">
    <h2 class="text-center mb-0"><i class="fas fa-user-shield me-2"></i>Admin Dashboard</h2>
  </div>
  
  <!-- Sidebar -->
  <div id="mySidebar" class="sidebar">
    <div class="p-3">
      <a href="${pageContext.request.contextPath}/admin/profile" class="d-block mb-2">
        <i class="fas fa-user-cog me-2"></i>Profile
      </a>
      <a href="${pageContext.request.contextPath}/admin/users" class="d-block mb-2">
        <i class="fas fa-users me-2"></i>Users
      </a>
      <a href="${pageContext.request.contextPath}/admin/restaurants" class="d-block mb-2">
        <i class="fas fa-utensils me-2"></i>Restaurants
      </a>
      <a href="${pageContext.request.contextPath}/admin/delivery" class="d-block">
        <i class="fas fa-motorcycle me-2"></i>Delivery Agents
      </a>
    </div>
  </div>

  <!-- Main Content -->
  <div class="container-fluid p-4">
    <div class="row g-4">
      <div class="col-md-4 animate-stat">
        <div class="stats-card">
          <div class="d-flex align-items-center">
            <div class="stat-icon bg-primary text-white me-3">
              <i class="fas fa-utensils"></i>
            </div>
            <div>
              <h3 class="mb-0">${totalRestaurants}</h3>
              <small class="text-muted">Total Restaurants</small>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-md-4 animate-stat" style="animation-delay: 0.2s">
        <div class="stats-card">
          <div class="d-flex align-items-center">
            <div class="stat-icon bg-success text-white me-3">
              <i class="fas fa-users"></i>
            </div>
            <div>
              <h3 class="mb-0">${totalUsers}</h3>
              <small class="text-muted">Total Users</small>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-4 animate-stat" style="animation-delay: 0.4s">
        <div class="stats-card">
          <div class="d-flex align-items-center">
            <div class="stat-icon bg-warning text-white me-3">
              <i class="fas fa-motorcycle"></i>
            </div>
            <div>
              <h3 class="mb-0">${totalDeliveryAgents}</h3>
              <small class="text-muted">Delivery Agents</small>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>