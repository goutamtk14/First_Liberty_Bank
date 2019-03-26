<%@include file="./header.jsp"%>
<body>
<h3 class="text-center">First Liberty Bank</h3>
${Error }
<form action="register" method="POST" onsubmit="return registervalidation()">
Name:<input type="text" name="name" id="name" required onchange="namevalidation()">
<p id="invalidname"></p>
Email:<input type="email" name="email" id="email" required onchange="emailvalidation()">
<p id="invalidemail"></p>
Mobile number:<input type="number" name="mobile" id="mobile" required onchange="mobilevalidation()">
<p id="invalidmobile"></p>
Username:<input type="text" name="username" id="username" required onchange="usernamevalidation()">
<p id="invalidusername"></p>
Password:<input type="password" name="password" id="password" required onchange="passwordvalidation()">
<p id="invalidpassword0"></p>
<p id="invalidpassword1"></p>
<p id="invalidpassword2"></p>
<p id="invalidpassword3"></p>
<p id="invalidpassword4"></p>
<p id="invalidpassword5"></p>
<p id="invalidpassword6"></p>
Confirm Password:<input type="password" id="confirmpassword" required onchange="confirmpasswordvalidation()">
<p id="invalidconfirmpassword"></p>
<input type="submit" value="Register">

</form>
<script type="text/javascript">
function namevalidation(){
	var names=document.getElementById("name").value;
	var values=/^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/;
	if(names.length<=2){
		document.getElementById("invalidname").innerHTML="Minimum length: Enter 3 or more characters.";
		return false;
	}
	else if(names.match(values)){
		document.getElementById("invalidname").innerHTML="";
		return true;
	}
	else{
		document.getElementById("invalidname").innerHTML="Name can contain only alphabets.";
		return false;
	}
}
function emailvalidation(){
	var email=document.getElementById("email").value;
	var emailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(email.match(emailformat)){
		document.getElementById("invalidemail").innerHTML="";
		return true;
	}
	else{
		document.getElementById("invalidemail").innerHTML="Invalid e-mail address.";
		return false;
	}
}

function mobilevalidation(){
	var mobile=document.getElementById("mobile").value;
	var values=/^[0-9]*$/;
	if(mobile.length!=10){
		document.getElementById("invalidmobile").innerHTML="Please enter a valid 10 digit mobile number.";
		return false;
	}
	else if(mobile.match(values)){
		document.getElementById("invalidmobile").innerHTML="";
		return true;
	}
	else{
		document.getElementById("invalidmobile").innerHTML="Invalid mobile number.";
		return false;
	}
}
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
		document.getElementById("invalidpassword0").innerHTML="";
		document.getElementById("invalidpassword1").innerHTML="";
		document.getElementById("invalidpassword2").innerHTML="";
		document.getElementById("invalidpassword3").innerHTML="";
		document.getElementById("invalidpassword4").innerHTML="";
		document.getElementById("invalidpassword5").innerHTML="";
		document.getElementById("invalidpassword6").innerHTML="";
		return true;
	}
	else{
		document.getElementById("invalidpassword0").innerHTML="Password must contain the following:";
		document.getElementById("invalidpassword1").innerHTML="1. A uppercase letter.";
		document.getElementById("invalidpassword2").innerHTML="2. A lowercase letter.";
		document.getElementById("invalidpassword3").innerHTML="3. Minimum 8 characters.";
		document.getElementById("invalidpassword4").innerHTML="4. Maximum 20 characters.";
		document.getElementById("invalidpassword5").innerHTML="5. A numeric digit.";
		document.getElementById("invalidpassword6").innerHTML="6. A special character.";

		return false;
	}
}

function confirmpasswordvalidation(){
	var password=document.getElementById("password").value;
	var confirmpassword=document.getElementById("confirmpassword").value;
	if(password!=confirmpassword){
		document.getElementById("invalidconfirmpassword").innerHTML="Password does not match.";
		return false;
	}
	else{
		document.getElementById("invalidconfirmpassword").innerHTML="";
		return true;
	}
	
}

function registervalidation(){
	if(usernamevalidation() && passwordvalidation() && confirmpasswordvalidation() && namevalidation() && emailvalidation() && mobilevalidation()){
		return true;
	}
	else{
		return false;
	}
}

</script>

<%@include file="./footer.jsp"%>