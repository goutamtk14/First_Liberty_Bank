<%@include file="./header.jsp"%>
<body>
<h3 class="text-center">First Liberty Bank</h3>

<form action="deposit" method="POST" onsubmit="return depositvalidation()">
Account Number:<input type="number" name="accountno" id="accountno" required onchange="accountnovalidation()">
<p id="invalidaccountno"></p>
Amount:<input type="number" name="amount" id="amount" required onchange="amountvalidation()">
<p id="invalidamount"></p>
<input type="submit" value="Deposit">
</form>
<script type="text/javascript">
function accountnovalidation(){
	var receiveraccountno=document.getElementById("accountno").value;
	var values=/^[0-9]*$/;
	if(receiveraccountno.length!=8){
		document.getElementById("invalidaccountno").innerHTML="Please enter a valid 8 digit First Liberal Bank Account number.";
		return false;
	}
	else if(receiveraccountno.match(values)){
		document.getElementById("invalidaccountno").innerHTML="";
		return true;
	}
	else{
		document.getElementById("invalidaccountno").innerHTML="Invalid Account number.";
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

function depositvalidation(){
	if(accountnovalidation() && amountvalidation()){
		return true;
	}
	else{
		return false;
	}
}
</script>
<a href="logout">Logout</a>
<%@include file="./footer.jsp"%>