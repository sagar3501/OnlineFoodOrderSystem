<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Forgot Password - Korporate Kitchen</title>
    <style>
      body {
        background: #eef2f3;
        font-family: 'Verdana', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
      }
      .container {
        width: 400px;
        background: #fff;
        padding: 30px;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        text-align: center;
      }
      h2 {
        color: #e74c3c;
        margin-bottom: 20px;
      }
      input[type="email"],
      input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 5px;
      }
      input[type="submit"] {
        background-color: #e67e22;
        color: #fff;
        border: none;
        padding: 10px;
        width: 100%;
        border-radius: 5px;
        cursor: pointer;
      }
      input[type="submit"]:hover {
        background-color: #d35400;
      }
      .error {
        color: red;
        margin-bottom: 10px;
      }
      .link {
        margin-top: 20px;
        display: block;
        text-decoration: none;
        color: #3498db;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h2>Forgot Password</h2>
      <c:if test="${not empty error}">
        <p class="error">${error}</p>
      </c:if>
      <form action="${pageContext.request.contextPath}/user/forgotPassword" method="post">
        Email: <input type="email" name="email" placeholder="Enter your email" required /><br/>
        New Password: <input type="password" name="newPassword" placeholder="Enter new password" required /><br/>
        Confirm Password: <input type="password" name="confirmPassword" placeholder="Confirm new password" required /><br/>
        <input type="submit" value="Reset Password" />
      </form>
      <a class="link" href="${pageContext.request.contextPath}/login">Back to Login</a>
    </div>
  </body>
</html>
