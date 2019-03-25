<%@include file="./header.jsp"%>
<body>
<h3 class="text-center">First Liberty Bank</h3>
${register}
${logout }
${Error}
${invalidPasswordCount}
<form action="login" method="POST" onsubmit="return validation()">
Username:<input type="text" name="username" id="username" required onchange="usernamevalidation()">
<p id="invalidusername"></p>
Password:<input type="password" name="password" id="password" required onchange="passwordvalidation()">
<p id="invalidpassword"></p>
<input type="submit" value="Login">
</form>
Don't have a account? <a href="register.jsp">Register</a>

<a href="aboutus.jsp">About Us</a>
<script type="text/javascript">


function usernamevalidation(){
	var username=document.getElementById("username").value;
	var values=/^[A-Za-z]\w{4,14}$/;
	
    if(username.match(values)){
		document.getElementById("invalidusername").innerHTML="";
		return true;
	}
	
	else{
		document.getElementById("invalidusername").innerHTML="Invalid username.";
		return false;
	}
}

function passwordvalidation(){
	var password=document.getElementById("password").value;
	var values=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;
	if(password.match(values)){
		document.getElementById("invalidpassword").innerHTML="";
		return true;
	}
	else{
		document.getElementById("invalidpassword").innerHTML="Password must contain the following: 1. A uppercase letter. 2. A lowercase letter.	3. Minimum 8 characters. 4. Maximum 20 characters.	5. A numeric digit. 6. A special character.";
		return false;
	}
}

function validation(){
	if(usernamevalidation() && passwordvalidation()){
		return true;
	}
	else{
		return false;
	}
}

</script>
<%@include file="./footer.jsp"%>
