<%@include file="./header.jsp"%>
<body>
<%
if(session.getAttribute("username")==null){
	response.sendRedirect("login.jsp");
}
%>
<h3 class="text-center">First Liberty Bank</h3>
Welcome ${name}
${Error}
	<form action="transfer" method="POST" onsubmit="return transfervalidation()">
		Receiver Bank Account Number:<input type="number" name="receiveraccountno" id="receiveraccountno" required onchange="receiveraccountnovalidation()">
		<p id="invalidreceiveraccountno"></p>
		Amount:<input type="number" name="amount" id="amount" required onchange="amountvalidation()">
		<p id=invalidamount></p> 
		Add a Message(optional):<input type ="text" name="particulars"> 
		<input type="submit" value="Send">
	</form>
	<a href="logout">Logout</a>
<script type="text/javascript">
function receiveraccountnovalidation(){
	var receiveraccountno=document.getElementById("receiveraccountno").value;
	var values=/^[0-9]*$/;
	if(receiveraccountno.length!=8){
		document.getElementById("invalidreceiveraccountno").innerHTML="Please enter a valid 8 digit First Liberal Bank Account number.";
		return false;
	}
	else if(receiveraccountno.match(values)){
		document.getElementById("invalidreceiveraccountno").innerHTML="";
		return true;
	}
	else{
		document.getElementById("invalidreceiveraccountno").innerHTML="Invalid Account number.";
		return false;
	}
}

function amountvalidation(){
	var amount=document.getElementById("amount").value;
	if(amount<=0){
		document.getElementById("invalidamount").innerHTML="Invalid amount."
		return false;
	}
	else{
		document.getElementById("invalidamount").innerHTML=""
			return true;
	}
}

function transfervalidation(){
	if(receiveraccountnovalidation() && amountvalidation()){
		return true;
	}
	else{
		return false;
	}
}
</script>
<%@include file="./footer.jsp"%>