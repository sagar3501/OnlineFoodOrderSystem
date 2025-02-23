<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Gateway - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4ecdc4;
            --secondary-color: #ff6b6b;
            --dark-color: #2d3436;
        }
 
        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
 
        .payment-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            padding: 2rem;
            max-width: 500px;
            animation: cardEntrance 0.6s ease;
        }
 
        .payment-method {
            border: 2px solid #eee;
            border-radius: 15px;
            padding: 1.5rem;
            margin: 1rem 0;
            transition: all 0.3s ease;
            cursor: pointer;
        }
 
        .payment-method:hover {
            border-color: var(--primary-color);
            transform: translateY(-3px);
        }
 
        @keyframes cardEntrance {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
 
        .modal {
            display: none;
            position: fixed;
            z-index: 100;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.5);
        }
 
        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 2rem;
            border-radius: 15px;
            max-width: 400px;
        }
 
        .checkmark {
            width: 60px;
            height: 60px;
            background: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
        }
    </style>
</head>
<body>
    <div class="payment-card">
        <h2 class="text-center mb-4"><i class="fas fa-credit-card me-2"></i>Payment Gateway</h2>
        <div class="text-center mb-4 fs-4 fw-bold text-primary">Total Amount: ₹${totalPrice}</div>
 
        <div class="payment-method" onclick="openModal('cardModal')">
            <div class="d-flex align-items-center">
                <i class="fas fa-credit-card fa-2x me-3"></i>
                <div>
                    <h5 class="mb-0">Credit/Debit Card</h5>
                    <small class="text-muted">Secure card payment</small>
                </div>
            </div>
        </div>
 
        <div class="payment-method" onclick="openModal('upiModal')">
            <div class="d-flex align-items-center">
                <i class="fas fa-mobile-alt fa-2x me-3"></i>
                <div>
                    <h5 class="mb-0">UPI Payment</h5>
                    <small class="text-muted">Instant UPI transaction</small>
                </div>
            </div>
        </div>
 
        <button class="btn btn-secondary w-100 mt-4" onclick="location.href='${pageContext.request.contextPath}/user/cart'">
            <i class="fas fa-arrow-left me-2"></i>Cancel Payment
        </button>
    </div>
 
    <!-- Card Payment Modal -->
    <div id="cardModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('cardModal')">&times;</span>
            <h3 class="text-center mb-4">Card Payment</h3>
            <div class="mb-3">
                <label>Card Number</label>
                <input type="text" id="cardNumber" class="form-control" placeholder="4242 4242 4242 4242" maxlength="16" required>
            </div>
            <div class="mb-3">
                <label>Name on Card</label>
                <input type="text" id="cardName" class="form-control" placeholder="John Doe" required>
            </div>
            <div class="row g-3 mb-3">
                <div class="col-md-6">
                    <label>Expiry Date</label>
                    <input type="month" id="cardExpiry" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label>CVV</label>
                    <input type="number" id="cardCVV" class="form-control" placeholder="123" maxlength="3" required>
                </div>
            </div>
            <button class="btn btn-primary w-100" onclick="payCard()">
                Pay ${totalPrice} <i class="fas fa-lock ms-2"></i>
            </button>
        </div>
    </div>
 
    <!-- UPI Payment Modal -->
    <div id="upiModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('upiModal')">&times;</span>
            <h3 class="text-center mb-4">UPI Payment</h3>
            <div class="mb-3">
                <label>UPI ID</label>
                <input type="text" id="upiNumber" class="form-control" placeholder="username@upi" required>
            </div>
            <button class="btn btn-primary w-100" onclick="payUPI()">
                Pay ₹${totalPrice} <i class="fas fa-mobile-alt ms-2"></i>
            </button>
        </div>
    </div>
 
    <!-- Success Modal -->
    <div id="successModal" class="modal">
        <div class="modal-content text-center p-4">
            <div class="checkmark">
                <i class="fas fa-check text-white fa-2x"></i>
            </div>
            <h3 class="mt-3">Payment Successful!</h3>
            <p>Your order is being processed</p>
            <button class="btn btn-primary" onclick="redirectToConfirm()">
                Continue <i class="fas fa-arrow-right ms-2"></i>
            </button>
        </div>
    </div>
 
    <script>
        function openModal(modalId) {
            document.getElementById(modalId).style.display = "block";
        }
 
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = "none";
        }
 
        function payUPI() {
            const upi = document.getElementById("upiNumber").value;
            if(upi.trim() === "") {
                alert("Please enter your UPI ID");
                return;
            }
            closeModal('upiModal');
            openModal('successModal');
        }
 
        function payCard() {
            const name = document.getElementById("cardName").value;
            const cardNumber = document.getElementById("cardNumber").value;
            const cvv = document.getElementById("cardCVV").value;
            const expiry = document.getElementById("cardExpiry").value;
 
            if(!name || !cardNumber || !cvv || !expiry) {
                alert("Please fill all card details");
                return;
            }
 
            if(cardNumber.length !== 16 || isNaN(cardNumber)) {
                alert("Please enter a valid 16-digit card number");
                return;
            }
 
            if(cvv.length !== 3 || isNaN(cvv)) {
                alert("Please enter a valid 3-digit CVV");
                return;
            }
 
            closeModal('cardModal');
            openModal('successModal');
        }
 
        function redirectToConfirm() {
            closeModal('successModal');
            window.location.href = "${pageContext.request.contextPath}/user/confirmPayment";
        }
 
        // Close modal when clicking outside
        window.onclick = function(event) {
            if (event.target.className === 'modal') {
                event.target.style.display = 'none';
            }
        }
    </script>
</body>
</html>