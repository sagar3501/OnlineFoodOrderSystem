<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>User Remarks - Korporate Kitchen</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
      body {
        background: linear-gradient(135deg, #f9f9f9, #eef2f3);
        font-family: 'Poppins', sans-serif;
      }
      .container {
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }
      h2 {
        text-align: center;
        color: #ff5733;
      }
      .table {
        margin-top: 20px;
      }
      .btn-custom {
        background: #28a745;
        color: #fff;
        border-radius: 5px;
      }
      .btn-custom:hover {
        background: #218838;
      }
</style>
</head>
<body>
<div class="container">
<h2>Your Remarks</h2>
<a class="btn btn-custom" href="${pageContext.request.contextPath}/user/addRemark">Add New Remark</a>
<table class="table table-striped table-bordered">
<thead>
<tr>
<th>Remark</th>
<th>Date</th>
</tr>
</thead>
<tbody>
<c:forEach var="remark" items="${remarks}">
<tr>
<td>${remark.userRemark}</td>
<td>${remark.remarkDate}</td>
</tr>
</c:forEach>
</tbody>
</table>
<a class="btn btn-secondary" href="${pageContext.request.contextPath}/user/home">Back to Home</a>
</div>
</body>
</html>