<%@include file="./header.jsp"%>
<body>
<h3 class="text-center">First Liberty Bank</h3>

<form action="deposit" method="POST">
Account Number:<input type="number" name="accountno" required>
Amount:<input type="number" name="amount" required>
<input type="submit" value="Deposit">
</form>
<a href="logout">Logout</a>
<%@include file="./footer.jsp"%>