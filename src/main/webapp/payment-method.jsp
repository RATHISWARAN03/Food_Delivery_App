
<%
String method = request.getParameter("method");
if (method == null)
	method = "GPay";

String bgColor = "#4b75ff"; // GPay default
String highlight = "#3459e6";

if (method.equalsIgnoreCase("PhonePe")) {
	bgColor = "#5c2d91";
	highlight = "#7b4bc3";
} else if (method.equalsIgnoreCase("Paytm")) {
	bgColor = "#00baf2";
	highlight = "#0099c7";
}

String logo = "pay.png";
if (method.equals("GPay"))
	logo = "gpay.webp";
if (method.equals("PhonePe"))
	logo = "phonepe-logo-icon.webp";
if (method.equals("Paytm"))
	logo = "paytm-logo.webp";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Processing Payment</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;800&display=swap"
	rel="stylesheet">

<style>
html, body {
	margin: 0;
	padding: 0;
	background: transparent !important;
	overflow: hidden;
	font-family: "Poppins", sans-serif;
}

/* BACKGROUND OVERLAY */
.overlay {
	position: fixed;
	inset: 0;
	backdrop-filter: blur(8px);
	background: rgba(0, 0, 0, 0.35);
	z-index: 9998;
	animation: fadeInBg .4s ease;
}

@keyframes fadeInBg {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}


/* POPUP CARD */
.payment-popup {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(.85);
	z-index: 9999;
	animation: popupShow .55s cubic-bezier(.19, 1, .22, 1) forwards;
}

@keyframes popupShow {
    0% {
        opacity: 0;
        transform: translate(-50%, -60%) scale(0.85);
    }
    100% {
        opacity: 1;
        transform: translate(-50%, -50%) scale(1);
    }
}


/* CARD DESIGN */
.box {
	width: 430px;
	background: rgba(255, 255, 255, 0.92);
	backdrop-filter: blur(15px);
	padding: 35px;
	border-radius: 25px;
	text-align: center;
	box-shadow: 0 25px 50px rgba(0, 0, 0, 0.30);
}

/* FLOATING LOGO */
.pay-img {
	width: 110px;
	animation: float 2s infinite ease-in-out;
	margin-bottom: 12px;
}

@keyframes float {
    0% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-8px);
    }
    100% {
        transform: translateY(0);
    }
}


/* ADVANCED PROGRESS RING */
.progress-ring {
	width: 110px;
	height: 110px;
	margin: 20px auto;
	position: relative;
}

.progress-ring svg circle {
	fill: none;
	stroke-width: 10;
	stroke-linecap: round;
}

.ring-base {
	stroke: #d4d4d4;
}

.ring-progress {
	stroke: <%=highlight%>;
	stroke-dasharray: 440;
	stroke-dashoffset: 0;
	animation: ringSpin 1.4s linear infinite;
}

@keyframes ringSpin {
    from {
        stroke-dashoffset: 440;
    }
    to {
        stroke-dashoffset: -440;
    }
}


/* TIMER INSIDE */
.countdown {
	position: absolute;
	inset: 0;
	font-size: 26px;
	color: <%=highlight%>;
	font-weight: 700;
	display: flex;
	justify-content: center;
	align-items: center;
}

/* PAYMENT DETAILS */
.details {
	margin-top: 10px;
	padding: 14px;
	border-radius: 14px;
	background: rgba(255, 255, 255, 0.7);
	font-size: 14px;
}

.row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 6px;
}

.label {
	color: #555;
}

.value {
	font-weight: 600;
}

.status {
	margin-top: 10px;
	padding: 6px 14px;
	display: inline-block;
	background: rgba(76, 175, 80, 0.15);
	color: #147a32;
	border-radius: 20px;
	font-size: 12px;
	font-weight: 600;
}

.status img {
	padding-top: -2rem
}
</style>
</head>

<body>

	<!-- OVERLAY -->
	<div class="overlay"></div>

	<!-- POPUP CARD -->
	<div class="payment-popup">
		<div class="box">

			<img src="Image/<%=logo%>" class="pay-img" />

			<h2 style="font-weight: 800;">Processing Payment</h2>
			<p style="font-size: 15px; color: #444;">
				Please complete the payment using <b><%=method%></b>.
			</p>

			<!-- PREMIUM LOADER -->
			<div class="progress-ring">
				<svg width="110" height="110">
            <circle class="ring-base" cx="55" cy="55" r="50"></circle>
            <circle class="ring-progress" cx="55" cy="55" r="50"></circle>
        </svg>
				<div class="countdown" id="count">5</div>
			</div>

			<!-- PAYMENT DETAILS -->
			<div class="details">
				<div class="row">
					<span class="label">Payment Method</span><span class="value"><%=method%>
						UPI</span>
				</div>
				<div class="row">
					<span class="label">Merchant</span><span class="value">Feasto
						Food Services</span>
				</div>
				<div class="row">
					<span class="label">Transaction Ref</span><span class="value">UPI-<%=(int) (Math.random() * 999999)%></span>
				</div>
				<div class="row">
					<span class="label">Time</span><span class="value"><%=new java.util.Date().toString()%></span>
				</div>
			</div>

			<div class="status">
				<img src="https://cdn-icons-png.flaticon.com/128/6865/6865349.png"
					width="15rem" height="15rem"> Secure UPI Verification
			</div>

		</div>
	</div>

<script>
let counter = 5;

const timer = setInterval(() => {
    counter--;
    document.getElementById("count").textContent = counter;

    if (counter <= 0) {
        clearInterval(timer);
    }
}, 1000);

setTimeout(() => {
    window.location.href = "auto-submit.jsp";
}, 5000);
</script>


</body>
</html>
