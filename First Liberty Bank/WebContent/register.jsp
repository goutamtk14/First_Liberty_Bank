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
<body>
<div class="jumbotron text-center" style="margin-bottom:0">
  <a href="welcome.jsp"><img src="img/flblogo.png" alt="First Liberty Bank"></a>
</div>
<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
  <a class="navbar-brand" href="#">Register</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="login.jsp">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="transfer.jsp">Money Transfer</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="balance.jsp">Account Balance</a>
      </li>  
      <li class="nav-item">
        <a class="nav-link" href="passbook.jsp">Account Passbook</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="contact.jsp">Contact</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="aboutus.jsp">About Us</a>
      </li>     
    </ul>
  </div>  
</nav><br>
<form action="register" method="POST" onsubmit="return registervalidation()" style="max-width:500px;margin:auto">
<h5 class="text-center">Register</h5>
 <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text" placeholder="Full Name" name="name" id="name" required onchange="namevalidation()">
  </div>
  <p id="invalidname" class="text-danger" style="text-align:center"></p>

  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="email" placeholder="Email-Id" name="email" id="email" required onchange="emailvalidation()">
  </div>
<p id="invalidemail" class="text-danger" style="text-align:center"></p>
 <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="number" placeholder="Mobile Number" name="mobile" id="mobile" required onchange="mobilevalidation()">
  </div>
  <p id="invalidmobile" class="text-danger" style="text-align:center"></p>
  <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text" placeholder="Username" name="username" id="username" required onchange="usernamevalidation()">
  </div>
  <p id="invalidusername" class="text-danger" style="text-align:center"></p>

  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Password" name="password" id="password" required onchange="passwordvalidation()">
  </div>
<p id="invalidpassword0" class="text-primary" style="text-align:center"></p>
<p id="invalidpassword1" class="text-danger" style="text-align:center"></p>
<p id="invalidpassword2" class="text-danger" style="text-align:center"></p>
<p id="invalidpassword3" class="text-danger" style="text-align:center"></p>
<p id="invalidpassword4" class="text-danger" style="text-align:center"></p>
<p id="invalidpassword5" class="text-danger" style="text-align:center"></p>
<p id="invalidpassword6" class="text-danger" style="text-align:center"></p>

  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Confirm Password" name="confirmpassword" id="confirmpassword" required onchange="confirmpasswordvalidation()">
  </div>
<p id="invalidconfirmpassword" class="text-danger" style="text-align:center"></p>
<p class="text-danger" style="text-align:center">${Error}</p>
<p class="text-danger" style="text-align:center">${invalidPasswordCount}</p>
  <button type="submit" class="btn">Login</button>

</form><br>
<footer class="text-center">
<pre>
  <span><a href="contact.jsp">   Contact   </a></span><span><a href="aboutus.jsp">   About Us   </a></span>
</pre>
</footer>
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