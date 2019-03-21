<%@page import="com.flb.dao.DaoFactory"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>First Liberty Bank</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%
if(session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
}
%>
<h3 class="text-center">First Liberty Bank</h3>
Welcome ${name}
Your account balance is <%=DaoFactory.getBalance((long)session.getAttribute("accountno")) %>
<table>
<thead>
<tr>
<th>Date</th>
<th>Particulars</th>
<th>Credit</th>
<th>Debit</th>
<th>Balance</th>
</tr>
</thead>
<tbody>
<c:forEach items="${entries }" var="entry">
<tr>
<td><c:out value="${entry.date}"></c:out></td>
<td><c:out value="${entry.particulars}"></c:out></td>
<td><c:out value="${entry.credit}"></c:out></td>
<td><c:out value="${entry.debit}"></c:out></td>
<td><c:out value="${entry.balance}"></c:out></td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>