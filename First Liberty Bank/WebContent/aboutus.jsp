<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>First Liberty Bank</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

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

.carousel-inner img {
	width: 100%;
	height: 100%;
}

body {
	background-image:
		url(img/background.jpg);
	background-repeat: no-repeat;
	background-attachment: fixed;
}
</style>
</head>

<body>
	<div class="jumbotron text-center" style="margin-bottom: 0">
		<a href="welcome.jsp"><img
			src="img/flblogo.png"
			alt="First Liberty Bank"></a>
	</div>
	<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
		<a class="navbar-brand" href="#">First Liberty Online Banking</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="welcome.jsp">Home</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="transfer.jsp">Money
						Transfer</a></li>
				<li class="nav-item"><a class="nav-link" href="balance.jsp">Account
						Balance</a></li>
				<li class="nav-item"><a class="nav-link" href="passbook.jsp">Account
						Passbook</a></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="aboutus.jsp">About
						Us</a></li>
			</ul>
		</div>
	</nav>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://cdn2.alphr.com/sites/alphr/files/2015/11/remote_working-_working_from_home_hero.jpg"
					alt="FLB" width="1100" height="500">
				<div class="carousel-caption">
					<h3>First Liberty Bank</h3>
					<p>Our story is not what you would typically expect of your
						average bank. Our story is simple. It started as POC by
						Goutamkumar Kalburgi under Ramyashree Govinda at SLK.</p>
				</div>
			</div>

			<div class="carousel-item">
				<img
					src="https://cdn.pixabay.com/photo/2014/12/11/11/26/computer-564136_960_720.jpg"
					alt="FLB" width="1100" height="500">
				<div class="carousel-caption">
					<h3>Just a POC??</h3>
					<p>We offer fastest services. First Liberty offers Instant
						Money Transfer, Online Passbook, Instant Credit Card etc. We
						believe in making banking faster and easier.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img
					src="https://ak7.picdn.net/shutterstock/videos/7902127/thumb/1.jpg?i10c=img.resize(height:160)"
					alt="FLB" width="1100" height="500">
				<div class="carousel-caption">
					<h3>Why First Liberty?</h3>
					<p>Our customers are our best friends. 90% of First Liberty
						Customers are happy with the Services.</p>
				</div>
			</div>
		</div><br><br>
<h3 class="text-center">Management Team</h3>
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon"></span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon"></span>
		</a>
	</div>
	<div class="row">
		<div class="col-sm-4"><p style="text-align:center">
			<img src="/images/1.jpg" class="rounded" alt="CEO"
				width="250" height="250"></p><p style="text-align:center">Goutamkumar Kalburgi</p><p style="text-align:center">CEO</p>
		</div>
		<div class="col-sm-4"><p style="text-align:center">
			<img src="/images/2.jpg" class="rounded" alt="CEO"
				width="250" height="250"></p><p style="text-align:center">Shankar Jogi</p><p style="text-align:center">COO</p>
		</div>
		<div class="col-sm-4"><p style="text-align:center">
			<img src="/images/3.png" class="rounded" alt="CEO"
				width="250" height="250"></p><p style="text-align:center">Pratik Malawade</p><p style="text-align:center">CTO</p>
		</div>
	</div>
</body>
</html>
