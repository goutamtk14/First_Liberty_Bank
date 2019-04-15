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
<div class="jumbotron text-center" style="margin-bottom:0">
  <a href="welcome.jsp"><img src="img/flblogo.png" alt="First Liberty Bank"></a>
</div>
<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
  <a class="navbar-brand" href="#">First Liberty Online Banking</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="register.jsp">Register</a>
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
</nav>
<p style="text-align:center" class="text-success">${register}</p>
<p style="text-align:center" class="text-primary">${logout }</p>

<form action="login" method="POST" onsubmit="return validation()" style="max-width:500px;margin:auto">
  <h5 class="text-center">Login</h5>
  <div class="input-container">
    <i class="fa fa-user icon"></i>
    <input class="input-field" type="text" placeholder="Username" name="username" id="username" required onchange="usernamevalidation()">
  </div>
  <p id="invalidusername" class="text-danger" style="text-align:center"></p>

  <div class="input-container">
    <i class="fa fa-key icon"></i>
    <input class="input-field" type="password" placeholder="Password" name="password" id="password" required onchange="passwordvalidation()">
  </div>
<p id="invalidpassword0" class="text-danger" style="text-align:center"></p>
<p class="text-danger" style="text-align:center">${Error}</p>
<p class="text-danger" style="text-align:center">${invalidPasswordCount}</p>
  <button type="submit" class="btn">Login</button>
</form><br>

<h6 class="text-center">Don't have a account? <a href="register.jsp">Register</a><br></h6>


<footer class="text-center">
<pre>
  <span><a href="contact.jsp">   Contact   </a></span><span><a href="aboutus.jsp">   About Us   </a></span>
</pre>
</footer>
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
