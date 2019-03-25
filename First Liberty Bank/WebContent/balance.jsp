<%@page import="com.flb.dao.DaoFactory"%>
<%@include file="./header.jsp"%>
<body>
<%
if(session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
}
%>
<h3 class="text-center">First Liberty Bank</h3>
Welcome ${name}
Your account balance is <%=DaoFactory.getBalance((long)session.getAttribute("accountno")) %>
<a href="logout">Logout</a>
<%@include file="./footer.jsp"%>