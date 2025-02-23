<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Menu Item - Restaurant Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #4ecdc4;
            --accent-color: #ffe66d;
            --dark-color: #2d3436;
        }

        body {
            background: linear-gradient(135deg, #fff5f5 0%, #f8fff4 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
        }

        .form-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            transition: transform 0.3s ease;
        }

        .form-card:hover {
            transform: translateY(-5px);
        }

        .form-label {
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 0.5rem;
        }

        .form-control {
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            padding: 12px 20px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 8px rgba(255, 107, 107, 0.2);
        }

        .type-badge {
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .type-badge:hover {
            transform: scale(1.05);
        }

        .submit-btn {
            background: linear-gradient(45deg, var(--primary-color), #ff8787);
            border: none;
            padding: 12px 0;
            border-radius: 10px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-form {
            animation: slideIn 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }
    </style>
</head>
<body class="d-flex align-items-center">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="form-card p-4 animate-form">
                <div class="text-center mb-4">
                    <h2 class="fw-bold mb-3" style="color: var(--primary-color);">
                        <i class="fas fa-utensils me-2"></i>🍽️ Add New Menu Item
                    </h2>
                    <p class="text-muted">Fill in the details to add a new delicious item to your menu</p>
                </div>

                <form action="${pageContext.request.contextPath}/restaurant/addMenuItem" method="post">
                    <!-- Item Name -->
                    <div class="mb-4">
                        <label class="form-label">Item Name <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0">
                                <i class="fas fa-utensils text-primary"></i>
                            </span>
                            <input type="text" name="itemName" class="form-control" 
                                   placeholder="Enter item name" required>
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="mb-4">
                        <label class="form-label">Description <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0">
                                <i class="fas fa-pen text-primary"></i>
                            </span>
                            <textarea name="itemDescription" class="form-control" 
                                      rows="3" placeholder="Describe your delicious item..." required></textarea>
                        </div>
                    </div>

                    <!-- Price -->
                    <div class="mb-4">
                        <label class="form-label">Price <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0">
                                <i class="fas fa-tag text-primary"></i>
                            </span>
                            <input type="number" name="price" class="form-control" 
                                   step="0.01" placeholder="0.00" required>
                        </div>
                    </div>

                    <!-- Item Type -->
                    <div class="mb-4">
                        <label class="form-label">Item Type</label>
                        <div class="d-flex gap-2">
                            <div class="type-badge badge bg-success px-3 py-2" 
                                 onclick="document.querySelector('[name=itemType]').value = 'Veg'">
                                🌱 Veg
                            </div>
                            <div class="type-badge badge bg-danger px-3 py-2" 
                                 onclick="document.querySelector('[name=itemType]').value = 'Non-Veg'">
                                🍗 Non-Veg
                            </div>
                        </div>
                        <input type="text" name="itemType" class="form-control mt-2" 
                               placeholder="Or enter custom type" style="display: none;">
                    </div>

                    <button type="submit" class="btn submit-btn text-white w-100 mb-3">
                        <i class="fas fa-plus-circle me-2"></i>Add Menu Item
                    </button>
                    
                    <a href="${pageContext.request.contextPath}/restaurant/manageMenu" 
                       class="btn btn-outline-secondary w-100">
                        <i class="fas fa-arrow-left me-2"></i>Back to Manage Menu
                    </a>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    // Show custom type input if badges not selected
    document.querySelectorAll('.type-badge').forEach(badge => {
        badge.addEventListener('click', () => {
            document.querySelector('[name=itemType]').style.display = 'block';
        });
    });
</script>
</body>
</html>