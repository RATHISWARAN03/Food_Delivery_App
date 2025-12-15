<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Card Payment</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;800&display=swap"
	rel="stylesheet">

<style>

/* BETTER BACKGROUND */
body {
	margin: 0;
	padding: 0;
	font-family: "Poppins", sans-serif;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, rgba(0, 0, 0, 0.6),
		rgba(0, 0, 70, 0.6));
	backdrop-filter: blur(12px);
}

/* CARD BOX – BRIGHT + SHADOW */
.card-box {
	width: 90%;
	max-width: 450px;
	background: rgba(255, 255, 255, 0.98);
	padding: 35px;
	border-radius: 28px;
	box-shadow: 0 18px 45px rgba(0, 0, 0, 0.35);
	animation: fadeInUp .7s ease;
}

/* CARD ANIMATION */
@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(40px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* TITLE */
.title {
	font-size: 26px;
	font-weight: 800;
	text-align: center;
	margin-bottom: 25px;
	color: #111;
	letter-spacing: 0.5px;
}

/* LABELS */
label {
	font-weight: 600;
	font-size: 15px;
	color: #222;
}

/* INPUTS */
input, select {
	width: 100%;
	padding: 14px;
	border-radius: 12px;
	border: 2px solid #d3d3d3;
	background: #fafafa;
	margin-top: 6px;
	margin-bottom: 18px;
	font-size: 16px;
	color: #000;
	transition: 0.25s ease;
}

input::placeholder {
	color: #777;
}

/* INPUT FOCUS EFFECT */
input:focus, select:focus {
	background: #fff;
	border-color: #00a2ff;
	box-shadow: 0 0 12px rgba(0, 162, 255, 0.45);
	outline: none;
	transform: scale(1.02);
}

/* FLEX ROW */
.row {
	display: flex;
	gap: 12px;
}

/* BUTTON */
.pay-btn {
	width: 100%;
	padding: 16px;
	margin-top: 10px;
	background: linear-gradient(135deg, #0066ff, #00d0ff);
	color: #fff;
	font-size: 19px;
	border-radius: 14px;
	border: none;
	cursor: pointer;
	font-weight: 700;
	transition: 0.25s ease;
}

.pay-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0px 12px 28px rgba(0, 132, 255, 0.55);
}

.pay-btn:active {
	transform: scale(0.96);
}

/* ERROR TEXT */
.error {
	color: #ff2e2e;
	font-size: 13px;
	margin-top: -12px;
	margin-bottom: 10px;
	display: none;
}
</style>

</head>

<body>

	<div class="card-box">

		<div class="title">Pay Using Card</div>

		<label>Bank Name</label> <select id="bank">
			<option value="">-- Select Bank --</option>
			<option>SBI</option>
			<option>HDFC Bank</option>
			<option>ICICI Bank</option>
			<option>Axis Bank</option>
			<option>Kotak Bank</option>
			<option>Yes Bank</option>
			<option>Canara Bank</option>
			<option>Punjab National Bank</option>
		</select>
		<div class="error" id="bankErr">Please select a bank</div>

		<label>Card Number</label> <input type="text" id="cardNumber"
			maxlength="19" placeholder="1234 5678 9012 3456">
		<div class="error" id="numErr">Enter a valid 16-digit card
			number</div>

		<label>Card Holder Name</label> <input type="text" id="holder"
			placeholder="Full Name">
		<div class="error" id="nameErr">Enter card holder name</div>

		<div class="row">
			<div style="flex: 1">
				<label>MM</label> <input type="text" id="mm" maxlength="2"
					placeholder="MM">
			</div>

			<div style="flex: 1">
				<label>YY</label> <input type="text" id="yy" maxlength="2"
					placeholder="YY">
			</div>

			<div style="flex: 1">
				<label>CVV</label> <input type="password" id="cvv" maxlength="3"
					placeholder="123">
			</div>
		</div>
		<div class="error" id="expErr">Enter valid expiry info & CVV</div>

		<button class="pay-btn" onclick="validateForm()">Pay Securely</button>

	</div>

	<script>

document.getElementById("cardNumber").addEventListener("input", e => {
    let val = e.target.value.replace(/\D/g, '').substring(0,16);
    e.target.value = val.replace(/(.{4})/g, '$1 ').trim();
});

function validateForm() {

    let bank  = document.getElementById("bank").value;
    let num   = document.getElementById("cardNumber").value.replace(/\s/g, '');
    let name  = document.getElementById("holder").value.trim();
    let mm    = document.getElementById("mm").value;
    let yy    = document.getElementById("yy").value;
    let cvv   = document.getElementById("cvv").value;

    let ok = true;

    if (!bank) { document.getElementById("bankErr").style.display="block"; ok=false; }
    else document.getElementById("bankErr").style.display="none";

    if (num.length !== 16) { document.getElementById("numErr").style.display="block"; ok=false; }
    else document.getElementById("numErr").style.display="none";

    if (name.length < 3) { document.getElementById("nameErr").style.display="block"; ok=false; }
    else document.getElementById("nameErr").style.display="none";

    if (mm < 1 || mm > 12 || yy.length !== 2 || cvv.length !== 3) {
        document.getElementById("expErr").style.display="block"; ok=false;
    } else document.getElementById("expErr").style.display="none";

    if (!ok) return;

    // ✔ VALIDATION PASSED → Redirect to submit page
    setTimeout(() => {
        window.location.href = "auto-submit.jsp";
    }, 500); // fast redirect after click
}

</script>

</body>
</html>
