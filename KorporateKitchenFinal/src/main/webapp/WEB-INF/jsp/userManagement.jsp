<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management - Korporate Kitchen</title>
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

        .management-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.08);
            overflow: hidden;
        }

        .user-table {
            --bs-table-bg: transparent;
            --bs-table-striped-bg: rgba(78, 205, 196, 0.05);
            margin-bottom: 0;
        }

        .user-table thead {
            background: var(--primary-color);
            color: white;
        }

        .user-table th {
            font-weight: 600;
            border-bottom: none;
        }

        .action-btn {
            transition: all 0.3s ease;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .delete-btn:hover {
            transform: rotate(15deg) scale(1.1);
        }

        @keyframes rowEntrance {
            from { opacity: 0; transform: translateX(20px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .user-row {
            animation: rowEntrance 0.4s ease-out;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="management-card">
        <!-- Header -->
        <div class="bg-primary text-white p-4">
            <h2 class="mb-0">
                <i class="fas fa-users-cog me-2"></i>👥 User Management
            </h2>
        </div>

        <!-- Table -->
        <div class="p-4">
            <div class="table-responsive">
                <table class="user-table table table-hover align-middle">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}" varStatus="loop">
                            <tr class="user-row" style="animation-delay: ${loop.index * 0.05}s">
                                <td class="fw-bold text-primary">#${user.userId}</td>
                                <td>
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="bg-primary text-white rounded-circle p-2">
                                            <i class="fas fa-user"></i>
                                        </div>
                                        ${user.userName}
                                    </div>
                                </td>
                                <td>${user.email}</td>
                                <td>${user.contact}</td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/admin/deleteUser" method="post" class="m-0">
                                        <input type="hidden" name="userId" value="${user.userId}" />
                                        <button type="submit" 
                                                class="btn btn-danger action-btn delete-btn rounded-circle"
                                                onclick="return confirm('Are you sure you want to delete this user?');">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Empty State -->
            <c:if test="${empty users}">
                <div class="text-center py-5">
                    <i class="fas fa-users-slash fa-3x text-muted mb-3"></i>
                    <h4 class="text-muted">No users found</h4>
                </div>
            </c:if>
        </div>
    </div>

    <!-- Footer Actions -->
    <div class="d-flex justify-content-between mt-4">
        <a href="${pageContext.request.contextPath}/admin/dashboard" 
           class="btn btn-outline-secondary rounded-pill">
           <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/admin/addUser" 
           class="btn btn-primary rounded-pill">
           <i class="fas fa-plus-circle me-2"></i>Add New User
        </a>
    </div>
</div>
</body>
</html>