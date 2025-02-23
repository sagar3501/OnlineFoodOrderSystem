<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Registration Successful - Korporate Kitchen</title>
    <style>
      body {
        background: #f8f8f8;
        font-family: 'Helvetica', sans-serif;
        margin: 0;
        padding: 20px;
        text-align: center;
      }
      .container {
        margin: 50px auto;
        padding: 30px;
        background: #fff;
        width: 50%;
        border: 1px solid #ddd;
        border-radius: 8px;
      }
      h2 {
        color: #27ae60;
      }
      .btn {
        background-color: #e67e22;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        margin-top: 20px;
      }
      .btn:hover {
        background-color: #d35400;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h2>User Registered Successfully! 🎉</h2>
      <a class="btn" href="${pageContext.request.contextPath}/login">Go to Login</a>
    </div>
  </body>
</html>
