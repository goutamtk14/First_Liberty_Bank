<%@include file="./header.jsp"%>
<body>
<h3 class="text-center">First Liberty Bank</h3>
<form action="register" method="POST">
Name:<input type="text" name="name" required>
Email:<input type="email" name="email" required>
Mobile number:<input type="number" name="mobile" required>
Username:<input type="text" name="username" required>
Password:<input type="password" name="password" required>
Confirm Password:<input type="password" required>
<input type="submit" value="Register">
</form>
<%@include file="./footer.jsp"%>