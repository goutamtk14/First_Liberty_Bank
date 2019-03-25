<%@include file="./header.jsp"%>
<body>
<%
if(session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
}
%>
<h3 class="text-center">First Liberty Bank</h3>
Welcome ${name}
${Error}
	<form action="transfer" method="POST">
		Receiver Bank Account Number:<input type="number" name="receiveraccountno" required>
		Amount:<input type="number" name="amount" required> 
		Add a Message(optional):<input type ="text" name="particulars"> 
		<input type="submit" value="Send">
	</form>
	<a href="logout">Logout</a>
<%@include file="./footer.jsp"%>