<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Confirmation - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4ecdc4;
            --secondary-color: #ff6b6b;
            --success-color: #2ecc71;
        }

        body {
            background: linear-gradient(135deg, #f8fff4 0%, #fff5f5 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .confirmation-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            padding: 2.5rem;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            text-align: center;
            max-width: 500px;
            animation: cardEntrance 0.6s cubic-bezier(0.23, 1, 0.32, 1);
        }

        .checkmark-container {
            width: 80px;
            height: 80px;
            background: var(--success-color);
            border-radius: 50%;
            margin: -60px auto 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(46, 204, 113, 0.3);
            animation: checkmarkScale 0.6s ease-out;
        }

        .checkmark {
            color: white;
            font-size: 2.5rem;
            transform: rotate(20deg);
            animation: checkmarkDraw 0.6s ease-out;
        }

        @keyframes cardEntrance {
            from { opacity: 0; transform: translateY(40px) scale(0.96); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        @keyframes checkmarkScale {
            0% { transform: scale(0); }
            60% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        @keyframes checkmarkDraw {
            0% { transform: scale(0) rotate(-45deg); opacity: 0; }
            80% { transform: scale(1.2) rotate(5deg); }
            100% { transform: scale(1) rotate(0); }
        }

        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: var(--secondary-color);
            border-radius: 50%;
            animation: confettiFall 1.2s ease-out forwards;
        }

        @keyframes confettiFall {
            0% { transform: translateY(-100vh) rotate(0deg); opacity: 1; }
            100% { transform: translateY(100vh) rotate(360deg); opacity: 0; }
        }
    </style>
</head>
<body>
    <!-- Confetti elements -->
    <div class="confetti" style="left:10%; animation-delay:0.2s"></div>
    <div class="confetti" style="left:30%; animation-delay:0.5s"></div>
    <div class="confetti" style="left:50%; animation-delay:0.8s"></div>
    <div class="confetti" style="left:70%; animation-delay:1.1s"></div>
    <div class="confetti" style="left:90%; animation-delay:1.4s"></div>

    <div class="confirmation-card">
        <div class="checkmark-container">
            <i class="fas fa-check checkmark"></i>
        </div>
        
        <h2 class="fw-bold mb-3" style="color: var(--success-color);">
            Payment Successful! 🎉
        </h2>
        
        <div class="alert alert-success fw-bold" role="alert">
            <i class="fas fa-receipt me-2"></i> ${message}
        </div>

        <div class="d-flex justify-content-between mb-3">
            <span>Payment Method:</span>
            <strong>Card/UPI</strong>
        </div>

        <!-- Button to redirect to the orders page -->
        <a href="${pageContext.request.contextPath}/user/orders" class="btn btn-primary mt-3">
            <i class="fas fa-box"></i> View My Orders
        </a>
    </div>
</body>
</html>
