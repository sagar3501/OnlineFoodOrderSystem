<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Menu Item - Restaurant Dashboard</title>
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
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .edit-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            transition: transform 0.3s ease;
        }

        .edit-card:hover {
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
            border: 2px solid transparent;
        }

        .type-badge.active {
            border-color: var(--primary-color);
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

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-form {
            animation: slideIn 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="edit-card p-4 animate-form">
                <div class="text-center mb-4">
                    <h2 class="fw-bold" style="color: var(--primary-color);">
                        <i class="fas fa-edit me-2"></i>📝 Edit Menu Item
                    </h2>
                    <p class="text-muted">Update your menu item details below</p>
                </div>

                <form action="${pageContext.request.contextPath}/restaurant/editMenuItem" method="post">
                    <input type="hidden" name="itemId" value="${menuItem.itemId}" />

                    <!-- Item Name -->
                    <div class="mb-4">
                        <label class="form-label">Item Name <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text bg-light">
                                <i class="fas fa-utensils text-primary"></i>
                            </span>
                            <input type="text" name="itemName" class="form-control" 
                                   value="${menuItem.itemName}" required>
                        </div>
                    </div>

                    <!-- Description -->
                    <div class="mb-4">
                        <label class="form-label">Description <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text bg-light align-items-start">
                                <i class="fas fa-pen text-primary mt-1"></i>
                            </span>
                            <textarea name="itemDescription" class="form-control" 
                                      rows="3" required>${menuItem.itemDescription}</textarea>
                        </div>
                    </div>

                    <!-- Price -->
                    <div class="mb-4">
                        <label class="form-label">Price <span class="text-danger">*</span></label>
                        <div class="input-group">
                            <span class="input-group-text bg-light">
                                <i class="fas fa-tag text-primary"></i>
                            </span>
                            <input type="number" name="price" class="form-control" 
                                   step="0.01" value="${menuItem.price}" required>
                        </div>
                    </div>

                    <!-- Item Type -->
                    <div class="mb-4">
                        <label class="form-label">Item Type</label>
                        <div class="d-flex gap-2 mb-2">
                            <div class="type-badge badge ${menuItem.itemType == 'Veg' ? 'active' : ''} bg-success px-3 py-2" 
                                 onclick="setItemType('Veg')">
                                🌱 Veg
                            </div>
                            <div class="type-badge badge ${menuItem.itemType == 'Non-Veg' ? 'active' : ''} bg-danger px-3 py-2" 
                                 onclick="setItemType('Non-Veg')">
                                🍗 Non-Veg
                            </div>
                        </div>
                        <input type="text" name="itemType" class="form-control" 
                               value="${menuItem.itemType}" placeholder="Custom Type">
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn submit-btn text-white">
                            <i class="fas fa-save me-2"></i>Update Menu Item
                        </button>
                        <a href="${pageContext.request.contextPath}/restaurant/manageMenu" 
                           class="btn btn-outline-secondary">
                           <i class="fas fa-arrow-left me-2"></i>Back to Manage Menu
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function setItemType(type) {
        document.querySelector('[name=itemType]').value = type;
        document.querySelectorAll('.type-badge').forEach(badge => {
            badge.classList.remove('active');
        });
        event.target.classList.add('active');
    }
    
    // Initialize active state based on existing value
    window.addEventListener('DOMContentLoaded', () => {
        const currentType = "${menuItem.itemType}";
        if(currentType === 'Veg' || currentType === 'Non-Veg') {
            document.querySelector(`.type-badge:contains('${currentType}')`).classList.add('active');
        }
    });
</script>
</body>
</html>