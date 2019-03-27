<%@page import="com.flb.dao.DaoFactory"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<a href="logout">Logout</a>
<%@include file="./footer.jsp"%>