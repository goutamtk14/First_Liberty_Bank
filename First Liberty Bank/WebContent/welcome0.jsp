<%@include file="./header.jsp"%>
<body>
<%
if(session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
}
%>
<h3 class="text-center">First Liberty Bank</h3>
Welcome ${name}
${success}

<a href="transfer.jsp">Money Transfer</a>
<a href="balance.jsp">Account Balance</a>
<a href="passbook">Account Passbook</a>
<a href="logout">Logout</a>
<a href="aboutus.jsp">About Us</a>
<%@include file="./footer.jsp"%>