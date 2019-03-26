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
<p id="invalidpassword0"></p>

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
	if(password.length>=8){
		document.getElementById("invalidpassword0").innerHTML="";
		return true;
	}
	else{
		document.getElementById("invalidpassword0").innerHTML="Invalid password.";
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
