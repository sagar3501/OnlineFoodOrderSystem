<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Add Remark - Korporate Kitchen</title>
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
            display: flex;
            align-items: center;
        }
 
        .remark-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            padding: 2rem;
            max-width: 500px;
            margin: 0 auto;
        }
 
        .remark-card h2 {
            color: var(--dark-color);
            margin-bottom: 1.5rem;
        }
 
        textarea {
            width: 100%;
            padding: 1rem;
            border-radius: 12px;
            border: 2px solid #e9ecef;
            margin-bottom: 1rem;
        }
 
        .btn-submit {
            background: var(--primary-color);
            color: white;
            padding: 1rem;
            border-radius: 12px;
            border: none;
            transition: all 0.3s ease;
        }
 
        .btn-submit:hover {
            background: #00994d;
            transform: translateY(-2px);
        }
 
        .btn-back {
            background: var(--secondary-color);
            color: white;
            padding: 1rem;
            border-radius: 12px;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 1rem;
        }
 
        .btn-back:hover {
            background: #e68a00;
        }
</style>
</head>
<body>
<div class="container">
<div class="remark-card animate-profile">
<h2>Add New Remark</h2>
<form action="${pageContext.request.contextPath}/user/addRemark" method="post">
<textarea name="userRemark" placeholder="Enter your remark here..." required></textarea>
<button type="submit" class="btn-submit w-100">
<i class="fas fa-paper-plane me-2"></i>Submit Remark
</button>
</form>
<a href="${pageContext.request.contextPath}/user/remarks" class="btn-back">
<i class="fas fa-arrow-left me-2"></i>Back to Remarks
</a>
</div>
</div>
</body>
</html>