<%@page import="com.flb.dao.DaoFactory"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>First Liberty Bank</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

.input-container {
  display: -ms-flexbox;
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.icon {
  padding: 10px;
  background: dodgerblue;
  color: white;
  min-width: 50px;
  text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

.btn {
  background-color: dodgerblue;
  color: white;
  font-weight: bold;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}

.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   color: black;
   
}
body  {
  background-image: url(img/background.jpg);
  background-repeat: no-repeat;
  background-attachment: fixed;
}
</style>
</head>

<body>
<%
if(session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
	return;
}
%>
<div class="jumbotron text-center" style="margin-bottom:0">
  <a href="welcome.jsp"><img src="img/flblogo.png" alt="First Liberty Bank"></a>
</div>
<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
  <a class="navbar-brand" href="#">Account Passbook</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="welcome.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="transfer.jsp">Money Transfer</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="balance.jsp">Account Balance</a>
      </li>  
      <li class="nav-item">
        <a class="nav-link" href="contact.jsp">Contact</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="aboutus.jsp">About Us</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="logout">Logout</a>
      </li>     
    </ul>
</div>  
</nav><br>
<h3 class="text-center">Welcome ${name}</h3>
<p style="text-align:center">Your account balance is <%=DaoFactory.getBalance((long)session.getAttribute("accountno")) %>
</p>
<div class="container">
<table class="table table-hover">
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
</div>
<footer class="text-center">
<pre>
  <span><a href="contact.jsp">   Contact   </a></span><span><a href="aboutus.jsp">   About Us   </a></span>
</pre>
</footer>
<%@include file="./footer.jsp"%>