<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>View Orders - Restaurant Dashboard</title>
    <style>
      body {
        background: #f7f7f7;
        font-family: 'Segoe UI', sans-serif;
        padding: 20px;
      }
      h2 {
        color: #e74c3c;
      }
      p {
        font-size: 1.2em;
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
    <h2>View Orders</h2>
    <p>This page is under construction. Here, you will see orders placed by customers for your restaurant.</p>
    <a class="btn" href="${pageContext.request.contextPath}/restaurant/dashboard">Back to Dashboard</a>
  </body>
</html>
