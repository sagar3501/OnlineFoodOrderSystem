<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Bank Details - Korporate Kitchen</title>
    <style>
      body {
        background: #f9f9f9;
        font-family: 'Arial', sans-serif;
        padding: 20px;
      }
      .container {
        max-width: 900px;
        margin: 0 auto;
        background: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        padding: 30px;
      }
      h2 {
        text-align: center;
        color: #27ae60;
        margin-bottom: 30px;
      }
      table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
      }
      th, td {
        padding: 12px;
        border: 1px solid #ddd;
        text-align: center;
      }
      .btn-back {
        display: inline-block;
        margin-top: 20px;
        background: #3498db;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        transition: background 0.3s ease;
      }
      .btn-back:hover {
        background: #2980b9;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h2>Bank Details for Your Restaurant</h2>
      <table>
        <tr>
          <th>Bank ID</th>
          <th>Transaction ID</th>
          <th>Total Price</th>
          <th>Order Date</th>
        </tr>
        <c:forEach var="bank" items="${bankDetails}">
          <tr>
            <td>${bank.bankId}</td>
            <td>${bank.transactionId}</td>
            <td>$${bank.totalPrice}</td>
            <td>${bank.orderDate}</td>
          </tr>
        </c:forEach>
      </table>
      <div style="text-align: center;">
        <a class="btn-back" href="${pageContext.request.contextPath}/restaurant/dashboard">Back to Dashboard</a>
      </div>
    </div>
  </body>
</html>

