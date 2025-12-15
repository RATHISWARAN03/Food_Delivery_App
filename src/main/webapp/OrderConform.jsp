<%@page import="com.pojo.Restaurant"%>
<%@page import="com.pojo.CartItem"%>
<%@page import="com.app.daoimpl.Cartimpl"%>
<%@page import="com.pojo.Orders,java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Order Confirmed</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- LOTTIE (for tiny bike badge on map) -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lottie-web/5.9.6/lottie.min.js"></script>

<style>

/* ==================== RESET ==================== */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	background: #f6f5f2; /* soft theme */
	font-family: "Segoe UI", sans-serif;
	padding: 25px;
	display: flex;
	justify-content: center;
	align-items: center;
	overflow-x: hidden;
	overflow-y: auto;
}

/* ==================== MAIN CARD ==================== */
.card {
	width: 620px;
	background: #ffffff;
	border-radius: 24px;
	padding: 32px;
	animation: cardFade .7s ease-out;
	box-shadow: 0 20px 45px rgba(0, 0, 0, 0.12);
	position: relative;
	overflow: hidden;
}

@keyframes cardFade {
    from {
        opacity: 0;
        transform: translateY(20px) scale(0.95);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }
}

/* Floating emojis */
.float {
	position: absolute;
	font-size: 46px;
	opacity: .10;
	animation: floatAnim 4.5s infinite ease-in-out;
}

.f1 {
	top: -10px;
	right: -20px;
}

.f2 {
	bottom: -10px;
	left: -15px;
	animation-delay: 1s;
}

@keyframes floatAnim {
    0% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-12px);
    }
    100% {
        transform: translateY(0);
    }
}

/* ==================== TICK ICON (smaller + subtle) ==================== */
.tick-box {
	width: 105px;
	height: 105px;
	border-radius: 50%;
	border: 3px solid #3bb54a;
	background: #eaf8ec;
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	animation: pulseTick 2s ease-in-out infinite;
}

@keyframes pulseTick {
    0% {
        box-shadow: 0 0 0 0 rgba(59, 181, 74, 0.35);
    }
    70% {
        box-shadow: 0 0 0 18px rgba(59, 181, 74, 0);
    }
    100% {
        box-shadow: 0 0 0 0 rgba(59, 181, 74, 0);
    }
}

.tick-icon {
	font-size: 34px;
	color: #3bb54a;
	animation: tickFloat 1.6s ease-in-out infinite;
}

@keyframes tickFloat {
    0% {
        transform: scale(0.9);
        opacity: 0.9;
    }
    50% {
        transform: scale(1);
        opacity: 1;
    }
    100% {
        transform: scale(0.95);
        opacity: 0.95;
    }
}


/* ==================== TITLES ==================== */
.title {
	text-align: center;
	font-size: 26px;
	font-weight: 700;
	color: #333;
	margin-top: 12px;
}

.subtitle {
	text-align: center;
	font-size: 14px;
	color: #666;
	margin: 6px 0 14px;
}

/* ORDER ID */
.order-id {
	background: #f4f4ff;
	color: #5863d1;
	padding: 7px 18px;
	border-radius: 50px;
	font-weight: 600;
	margin: auto;
	display: block;
	width: fit-content;
}

/* ETA */
.eta {
	text-align: center;
	margin-top: 12px;
	font-size: 14px;
	font-weight: 600;
	color: #444;
}

/* ==================== EXTRA DETAILS (from checkout) ==================== */
.details-grid {
	margin-top: 18px;
	display: grid;
	grid-template-columns: repeat(2, minmax(0, 1fr));
	gap: 10px;
}

.detail-card {
	background: #fafafa;
	border-radius: 12px;
	padding: 10px 12px;
	font-size: 13px;
}

.detail-label {
	color: #888;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: .4px;
	margin-bottom: 2px;
}

.detail-value {
	color: #333;
	font-weight: 600;
}

/* ==================== MAP BOX (with iframe) ==================== */
.map-box {
	background: #fafafa;
	border-radius: 18px;
	padding: 14px;
	margin-top: 20px;
	box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.04);
	position: relative;
	overflow: hidden;
}

.map-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 8px;
	font-size: 13px;
	color: #555;
}

.map-header span strong {
	font-size: 14px;
}

.map-iframe {
	width: 100%;
	height: 220px;
	border: none;
	border-radius: 14px;
}

/* small bike badge */
.bike-badge {
	position: absolute;
	top: 20px;
	right: 20px;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background: #ffffffdd;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.12);
}

/* ==================== ITEMS ==================== */
.items-box {
	margin-top: 20px;
	padding: 16px;
	background: #fffdf9;
	border-radius: 16px;
}

.items-box h3 {
	font-size: 16px;
	font-weight: 700;
	margin-bottom: 10px;
}

.item-row {
	display: flex;
	justify-content: space-between;
	margin-bottom: 11px;
}

.item-left {
	display: flex;
	align-items: center;
}

.item-row img {
	width: 50px;
	height: 50px;
	border-radius: 12px;
	margin-right: 10px;
}

.item-name {
	font-size: 14px;
	font-weight: 600;
}

.item-qty {
	font-size: 12px;
	color: #666;
}

.item-price {
	font-size: 14px;
	font-weight: 700;
	color: #333;
}

/* ==================== BILL ==================== */
.bill {
	margin-top: 18px;
	background: #fffdf6;
	padding: 16px;
	border-radius: 16px;
	border: 1px dashed #e3cfa5;
}

.bill-row {
	display: flex;
	justify-content: space-between;
	margin: 6px 0;
	font-size: 14px;
}

.bill-row.total {
	font-size: 17px;
	font-weight: 700;
	color: #444;
	padding-top: 10px;
	border-top: 1px solid #e6d7bd;
}

/* ==================== BUTTONS ==================== */
.button-row {
	display: flex;
	gap: 14px;
	margin-top: 24px;
}

.btn {
	flex: 1;
	padding: 13px;
	border-radius: 50px;
	font-weight: 700;
	border: none;
	cursor: pointer;
	transition: .2s;
	font-size: 14px;
}

.btn-history {
	background: #5863d1;
	color: #fff;
}

.btn-history:hover {
	background: #4751b7;
	transform: translateY(-2px);
}

.btn-outline {
	background: #fff;
	border: 2px solid #5863d1;
	color: #5863d1;
}

.btn-outline:hover {
	background: #eef0ff;
}

/* ==================== CONFETTI ==================== */
.confetti {
	position: fixed;
	width: 10px;
	height: 10px;
	top: -10px;
	border-radius: 3px;
	animation: confDrop 3s linear forwards;
}

@
keyframes confDrop {
	from {transform: translateY(-20px) rotate(0);
	opacity: 1;
}

to {
	transform: translateY(110vh) rotate(360deg);
	opacity: 0;
}
}
</style>
</head>

<body>

	<%
	Orders order = (Orders) session.getAttribute("orders");
	Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
	%>

	<!-- SOUND (soft pop once) -->
	<audio id="pop"
		src="https://assets.mixkit.co/active_storage/sfx/2007/2007-preview.mp3"></audio>

	<div class="card">

		<!-- FLOAT EMOJIS -->
		<div class="float f1">🍔</div>
		<div class="float f2">🍕</div>

		<!-- TICK -->
		<div class="tick-box">
			<div class="tick-icon">✔</div>
		</div>

		<div class="title">Order Confirmed</div>
		<div class="subtitle">We’ve sent your order to the restaurant
			and started processing it.</div>

		<div class="order-id">
			Order ID: #<%=order.getOrderId()%></div>

		<div class="eta">
			Estimated delivery in <span id="eta"><%=restaurant.getEta()%></span>
			mins
		</div>

		<!-- EXTRA DETAILS (from checkout-style info) -->
		<div class="details-grid">
			<div class="detail-card">
				<div class="detail-label">Restaurant</div>
				<div class="detail-value"><%=restaurant.getName()%></div>
			</div>
			<div class="detail-card">
				<div class="detail-label">Payment Mode</div>
				<div class="detail-value"><%=order.getPaymentMode()%></div>
			</div>
			<div class="detail-card">
				<div class="detail-label">Delivery To</div>
				<div class="detail-value"><%=order.getAddress()%>
				</div>
			</div>
			<div class="detail-card">
				<div class="detail-label">Restaurant Contact</div>
				<div class="detail-value"><%=restaurant.getPhone()%></div>
			</div>
		</div>

		<!-- MAP -->
		<div class="map-box">
			<div class="map-header">
				<span><strong>Live route :</strong> Restaurant ➝ Your
					Location</span> <span style="font-size: 12px; color: #777;">Map
					preview only</span>
			</div>

			<!-- DUMMY MAP USING IFRAME (Bengaluru area example) -->
			<iframe class="map-iframe" loading="lazy"
				referrerpolicy="no-referrer-when-downgrade"
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3888.903829576682!2d77.610116!3d12.914141!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae15d927e3c0d3%3A0x8e9b1b35c50a7611!2sKoramangala%2C%20Bengaluru!5e0!3m2!1sen!2sin!4v1700000000000">
			</iframe>

			<!-- small animated bike badge on map -->
			<div class="bike-badge" id="bikeBadge"></div>
		</div>
		<!-- ITEMS -->

		<div class="items-box">
			<h3>Your Items</h3>
			<%
			Map<Integer, CartItem> finalItems = (Map<Integer, CartItem>) session.getAttribute("finalItems");

			float itemTotal = 0;

			if (finalItems != null) {
				for (CartItem ci : finalItems.values()) {
					itemTotal += ci.getUnitPrice() * ci.getQuantity();
				}
			}

			float gst = itemTotal * 0.05f;
			float delivery = 29; // fixed or dynamic
			float grandTotal = itemTotal + gst + delivery;
			%>

			<%
			if (finalItems != null) {
				for (CartItem items : finalItems.values()) {
			%>

			<div class="item-row">
				<div class="item-left">
					<img src="<%=items.getImagePath()%>">
					<div>
						<div class="item-name"><%=items.getItemName()%></div>
						<div class="item-qty">
							x
							<%=items.getQuantity()%></div>
					</div>
				</div>
				<div class="item-price">
					₹
					<%=items.getUnitPrice() * items.getQuantity()%></div>
			</div>

			<%
			}
			}
			%>

		</div>

		<!-- BILL -->
		<div class="bill">
			<div class="bill-row">
				<span>Item Total</span><span>₹ <%=itemTotal%></span>
			</div>
			<div class="bill-row">
				<span>GST (5%)</span><span>₹ <%=gst%></span>
			</div>
			<div class="bill-row">
				<span>Delivery Fee</span><span>₹<%=delivery%></span>
			</div>
			<div class="bill-row total">
				<span>Grand Total</span><span>₹ <%=grandTotal%></span>
			</div>
		</div>

		<!-- BUTTONS -->
		<div class="button-row">

			<button class="btn btn-outline"
				onclick="window.location.href='restaurant_servlet'">Back to
				Home</button>
		</div>

	</div>

	<script>
/* soft pop when page loads */
const pop = document.getElementById("pop");
if(pop){ pop.play().catch(()=>{}); }

/* tiny bike lottie on map */
lottie.loadAnimation({
    container: document.getElementById("bikeBadge"),
    renderer: "svg",
    loop: true,
    autoplay: true,
    path: "https://lottie.host/6cd25685-2101-41a0-b740-07c3e5aea0a1/LnUixMiaQb.json"
});

/* colorful confetti every 5 seconds */
function confetti(){
    for(let i=0;i<35;i++){
        const c=document.createElement("div");
        c.classList.add("confetti");
        c.style.left=Math.random()*100+"%";
        c.style.background=["#ff5e00","#ffbb00","#ffc300","#7dd87d","#ff7aa2"][Math.floor(Math.random()*5)];
        c.style.animationDuration=(2+Math.random()*2)+"s";
        document.body.appendChild(c);
        setTimeout(()=>c.remove(),3000);
    }
}
confetti();
setInterval(confetti,5000);

/* ETA countdown (dummy) */
let eta=32;
setInterval(()=>{
    if(eta>1){
        eta--;
        document.getElementById("eta").innerText=eta;
    }
},60000);
</script>

</body>
</html>
