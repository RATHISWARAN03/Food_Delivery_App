<!DOCTYPE html>
<%@page import="com.sun.mail.imap.protocol.Item"%>
<%@page import="com.app.daoimpl.Cartimpl"%>
<%@page import="com.pojo.CartItem"%>
<%@page import="com.pojo.User"%>
<%@page import="com.pojo.Orders"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Feasto</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" href="Image/logo2.png">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;900&display=swap"
	rel="stylesheet">

<style>
:root {
	--primary: #ff7a00;
	--primary-dark: #e56900;
	--primary-light: #fff3e5;
	--bg: #f7f4ef;
	--card: #ffffff;
	--text-dark: #222;
	--text-light: #777;
	--border: #dedede;
	--radius: 16px;
}

body {
	margin: 0;
	background: var(--bg);
	font-family: "Poppins", sans-serif;
}

.container {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
}
/* --- STICKY NAVIGATION BAR (Combined) --- */
:root {
	--white: #ffffff;
	--primary-color: #A258E0;
	--light-color: #e5e7eb;
	--border-radius: 12px;
	--shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

/* Sticky Header */
.header {
	width: 100%;
	background: white;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
	position: fixed;
	top: 0;
	left: 0;
	z-index: 9999;
	padding: 10px 0;
}

/* Header inner content */
.header-container {
	max-width: 1200px;
	margin: auto;
	padding: 0 25px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo-image img {
	height: 48px;
	width: auto;
	display: block;
	margin-left: -3rem;
	margin-right: 6rem;
}

.location {
	display: flex;
	align-items: center;
	gap: 6px;
	font-size: .95rem;
	color: #6b7280;
	white-space: nowrap;
	margin-left: -7rem;
	margin-right: 3rem;
}

.loc-icon-img {
	width: 20px;
}

.search-container {
	flex: 1;
	max-width: 450px;
	position: relative;
	margin-right: 2rem;
}

.search {
	width: 100%;
	padding: 11px 42px 11px 16px;
	border-radius: 999px;
	border: 1px solid #e5e7eb;
	font-size: .95rem;
	transition: border-color .2s, box-shadow .2s, transform .15s;
	background: #f9fafb;
	margin-left: -6rem;
}

.search:focus {
	outline: none;
	border-color: #A44CE6;
	box-shadow: 0 0 0 2px rgba(164, 76, 230, 0.35);
	background: #fff;
	transform: translateY(-1px);
}

.cart-container {
	position: relative;
	margin-right: 8px;
	margin-left: -8rem;
}

.cart-icon {
	position: relative;
	font-size: 1.85rem;
	text-decoration: none;
}

.cart-icon-img {
	width: 30px;
}

.cart-count {
	position: absolute;
	top: -6px;
	right: -10px;
	background: #ef4444;
	color: #fff;
	font-size: .7rem;
	padding: 2px 6px;
	border-radius: 999px;
}

/* PROFILE ICON */
.profile-icon-wrap {
	position: relative;
	cursor: pointer;
	margin-right: -1rem;
}

.profile-icon {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: #3f3f46;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: 700;
	color: #fff;
	font-size: 15px;
}

.profile-icon img {
	width: 22px;
	opacity: 0.9;
}

/* DROPDOWN */
.profile-dropdown {
	position: absolute;
	top: 52px;
	left: 50%;
	transform: translateX(-50%);
	width: 230px;
	background: #fff;
	border-radius: 14px;
	box-shadow: 0 10px 35px rgba(0, 0, 0, 0.15);
	padding: 12px 0;
	display: none;
	z-index: 3000;
	opacity: 0;
	transition: opacity 0.15s ease-out;
}

/* Centered arrow */
.profile-dropdown::before {
	content: "";
	position: absolute;
	top: -10px;
	left: 50%;
	transform: translateX(-50%);
	border-width: 0 10px 10px 10px;
	border-style: solid;
	border-color: transparent transparent #fff transparent;
}

@
keyframes drop {from { opacity:0;
	transform: translateY(-10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* Dropdown header */
.profile-header {
	padding: 10px 16px;
	border-bottom: 1px solid #eee;
	font-size: 14px;
	font-weight: 700;
	color: #ff6600;
}

/* Dropdown items */
.profile-item {
	padding: 12px 18px;
	font-size: 15px;
	cursor: pointer;
	transition: 0.2s;
	color: #333;
}

.profile-item:hover {
	background: #f8f8f8;
	padding-left: 22px;
}

/* Divider line */
.profile-divider {
	height: 1px;
	background: #eee;
	margin: 6px 0;
}

#logout {
	font-weight: 800;
}

#logout:hover {
	color: red;
}

/* TITLE SECTION */
.title-box {
	background: var(--card);
	padding: 60px 20px;
	border-radius: var(--radius);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	margin-bottom: 30px;
	text-align: center;
	position: relative;
	margin-top: 4rem;
}

.title-flex {
	display: inline-flex;
	align-items: center;
	gap: 40px;
}

/* FOOD IMAGES */
.food-img {
	width: 175px;
	animation: float 3s ease-in-out infinite;
	position: relative;
	filter: drop-shadow(0px 22px 25px rgba(0, 0, 0, 0.28));
}

.food-img::after {
	content: "";
	position: absolute;
	bottom: -16px;
	left: 50%;
	transform: translateX(-50%);
	width: 75%;
	height: 10px;
	background: radial-gradient(ellipse, rgba(0, 0, 0, 0.35), transparent);
	border-radius: 50%;
	filter: blur(6px);
	animation: float-shadow 3s ease-in-out infinite;
}

@keyframes float {
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


/* SHINY TEXT */
.shiny-text {
	font-size: 42px;
	font-weight: 900;
	margin: 0rem 2rem;
	margin-top: -3.5rem;
	color: var(--primary);
	position: relative;
	display: inline-block;
	overflow: hidden;
}

.shiny-text::after {
	content: "";
	position: absolute;
	top: 0;
	left: -120%;
	width: 120%;
	height: 100%;
	background: linear-gradient(120deg, transparent 0%, rgba(255, 255, 255, 0.7)
		50%, transparent 100%);
	animation: shine 2s infinite;
}

@
keyframes shine { 0% {
	left: -120%;
}

50
%
{
left
:
120%;
}
100
%
{
left
:
120%;
}
}

/* GRID */
.grid {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 25px;
}

/* CARD */
.card {
	background: var(--card);
	padding: 25px;
	border-radius: var(--radius);
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
}

/* INPUT FIELDS */
.input-row {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 15px;
	margin-bottom: 15px;
}

.input-box {
	width: 100%;
}

label {
	font-weight: 600;
	margin-bottom: 8px;
	display: block;
}

input {
	width: 100%;
	padding: 13px;
	border-radius: 10px;
	border: 1px solid var(--border);
	font-size: 15px;
	box-sizing: border-box;
}

input:focus {
	border-color: var(--primary);
	outline: none;
}

/* PAYMENT METHOD */
.section-title {
	margin: 25px 0 10px;
	font-size: 20px;
	font-weight: 700;
}

.pay-row {
	display: flex;
	gap: 15px;
	margin-bottom: 15px;
}

.pay-card {
	flex: 1;
	padding: 18px;
	border: 2px solid var(--border);
	background: #fff;
	border-radius: var(--radius);
	cursor: pointer;
	font-weight: 600;
	display: flex;
	align-items: center;
	justify-content: center;
	gap: 8px;
	transition: .25s;
}

.pay-card img {
	width: 4rem;
}

.pay-card #img1 {
	width: 3rem;
}

/* ACTIVE PAYMENT */
.pay-card.active {
	border-color: var(--primary);
	background: var(--primary-light);
	box-shadow: 0 6px 18px rgba(255, 122, 0, 0.25);
}

/* DISABLED */
.pay-card.disabled {
	opacity: 0.45;
	pointer-events: none;
}

/* SUMMARY */
.summary-item {
	display: flex;
	gap: 15px;
	padding-bottom: 12px;
	border-bottom: 1px solid var(--border);
	margin-bottom: 15px;
}

.summary-item img {
	width: 70px;
	height: 70px;
	border-radius: 12px;
}

.item-title {
	font-weight: 700;
}

.price {
	color: var(--primary);
	font-weight: 700;
}

.total-row {
	display: flex;
	justify-content: space-between;
	margin-top: 12px;
	font-size: 22px;
	font-weight: 700;
	color: var(--primary);
}

/* BUTTON */
.pay-btn {
	width: 100%;
	padding: 18px;
	margin-top: 20px;
	border-radius: var(--radius);
	background: var(--primary);
	color: #fff;
	font-size: 18px;
	border: none;
	cursor: pointer;
	font-weight: 700;
	transition: .3s;
}

.pay-btn:hover {
	background: var(--primary-dark);
}

/* RESPONSIVE */
@media ( max-width :900px) {
	.grid {
		grid-template-columns: 1fr;
	}
	.title-flex {
		flex-direction: column;
	}
}

/* BILL BOX */
.bill-box {
	width: 100%;
	background: #fff;
	padding: 20px;
	border-radius: 10px;
	border: 1px solid #eee;
	font-family: "Segoe UI", sans-serif;
}

.bill-title {
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 12px;
	color: #333;
}

.bill-row {
	display: flex;
	justify-content: space-between;
	padding: 6px 0;
	font-size: 15px;
	color: #444;
}

.bill-row span:last-child {
	font-weight: 600;
}

/* TOTAL ROW */
.bill-row.total {
	border-top: 1px solid #ddd;
	margin-top: 10px;
	padding-top: 10px;
	font-size: 16px;
	font-weight: 700;
	color: #222;
}

/* GRAND TOTAL */
.grand-total {
	margin-top: 15px;
	font-size: 22px;
	font-weight: 800;
	color: #ff7a00;
	font-family: "Poppins", sans-serif;
}

.grand-total span {
	float: right;
}

.bill-header {
	position: relative;
}

.bill-tag {
	position: absolute;
	border-radius: 8px;
	font-size: 10px;
	right: 0;
	padding: 0.2rem 0.3rem;
	background: #E7E2E2;
}

.bill-container {
	margin-top: 3rem;
}
</style>
</head>

<body>


	<!-- NAVIGATION BAR -->
	<%
	Cartimpl cart = (Cartimpl) session.getAttribute("cart");
	int cartCount = 0;
	if (cart != null && cart.getCartItems() != null) {
		cartCount = cart.getCartItems().size();
	}
	%>

	<!-- Header for the website -->
	<header class="header" id="main">
		<div class="header-container">
			<a href="${pageContext.request.contextPath}/home">
				<div class="logo-image">
					<img src="Image/logo.png" alt="not found" />
				</div>
			</a>

			<div class="location">
				<span class="loc-icon"><img src="Image/pin.png"
					class="loc-icon-img"></span> <span class="loc-text">Delivered
					to <b>Bengaluru 560076</b>
				</span>
			</div>
			<div class="search-container">
				<input type="text" class="search" id="search"
					placeholder="Search for your favourite Restaurant" />
			</div>
			<div class="cart-container">
				<a href="cart.jsp" class="cart-icon"><img
					src="Image/shopping-cart.png" class="cart-icon-img"> <span
					class="cart-count"><%=cartCount%></span> </a>
			</div>
			<div class="auth-area">

				<%
				com.pojo.User userObj = (com.pojo.User) session.getAttribute("user");

				if (userObj == null) {
				%>

				<a href="Login.jsp" class="btn login-btn">Login</a>

				<%
				} else {
				%>

				<div class="profile-icon-wrap" id="profileMenu">
					<%
					String fullName = userObj.getName();
					String initials = "";

					if (fullName != null && fullName.trim().length() > 0) {
						String[] parts = fullName.trim().split(" ");

						if (parts.length >= 2) {
							initials = parts[0].substring(0, 1).toUpperCase() + parts[1].substring(0, 1).toUpperCase();
						} else {
							initials = fullName.substring(0, Math.min(2, fullName.length())).toUpperCase();
						}
					}
					%>

					<div class="profile-icon">
						<span class="initials"><%=initials%></span>
					</div>


					<!-- DROPDOWN -->
					<div class="profile-dropdown" id="dropdownBox">

						<div class="profile-header">
							Hi,
							<%=userObj.getName()%>
						</div>

						<div class="profile-item"
							onclick="window.location.href='profile.jsp'">Profile</div>

						<div class="profile-item"
							onclick="window.location.href='#categories'">Categories</div>

						<div class="profile-item"
							onclick="window.location.href='restaurant'">Restaurants</div>

						<div class="profile-item"
							onclick="window.location.href='orderHistory.jsp'">Order
							History</div>

						<div class="profile-divider"></div>

						<div class="profile-item" id="logout"
							onclick="window.location.href='logout'">Logout</div>

					</div>
				</div>

				<%
				}
				%>

			</div>
		</div>
	</header>
	<div class="container">

		<!-- TITLE -->
		<div class="title-box">

			<div class="title-flex">
				<!-- Biryani -->
				<img class="food-img" src="Image/burger.avif">

				<!-- Shiny Heading -->
				<h1 class="shiny-text">Complete Your Order</h1>

				<!-- Chicken -->
				<img class="food-img" src="Image/briyani.png">
			</div>

			<p style="color: var(--text-light); margin-top: -4rem;">Just a
				few steps away from your delicious meal</p>

		</div>

		<%
		HttpSession sessions = request.getSession();
		User user = (User) sessions.getAttribute("login");
		Orders order = new Orders();

		// ===== SUBTOTAL, GST, DELIVERY, TOTAL =====
		float subtotal = 0;

		if (cart != null && cart.getCartItems() != null && !cart.getCartItems().isEmpty()) {
			for (CartItem item : cart.getCartItems().values()) {
				subtotal += item.getPrice();
			}
		}

		float gst = (subtotal > 0) ? subtotal * 0.05f : 0;
		float delivery = (subtotal > 0) ? 29 : 0;
		float totalPay = subtotal + gst + delivery;
		%>

		<!-- GRID -->
		<div class="grid">

			<!-- LEFT -->
			<form id="checkoutForm" action="checkout" method="post">

				<input type="hidden" name="paymentMode" id="paymentMode"> <input
					type="hidden" name="totalAmount" id="totalAmount"
					value="<%=totalPay%>"> <input type="hidden" name="status"
					value="Delivered">
				<div class="card">

					<h2>Delivery Information</h2>


					<div class="input-row">
						<div class="input-box">
							<label>Full Name</label> <input type="text" name="name"
								placeholder="Enter your FullName">
						</div>
						<div class="input-box">
							<label>Phone Number</label> <input type="text" name="phonenumber"
								placeholder="Enter your Number">
						</div>
					</div>

					<div class="input-box">
						<label>Address</label> <input type="text" name="address"
							placeholder="Street, apartment, city, postal code">
					</div>

					<!-- PAYMENT -->

					<h2 class="section-title">Payment Method</h2>

					<h3>UPI</h3>
					<div class="pay-row">
						<div class="pay-card" data-mode="GPay">
							<img src="Image/gpay.webp">
							<div>GPay</div>
						</div>

						<div class="pay-card" data-mode="PhonePe">
							<img id="img1" src="Image/phonepe-logo-icon.webp">
							<div>PhonePe</div>
						</div>

						<div class="pay-card" data-mode="Paytm">
							<img src="Image/paytm-logo.webp">
							<div>Paytm</div>
						</div>
					</div>

					<h3>Cards</h3>
					<div class="pay-row">
						<div class="pay-card" data-mode="Debit Card">Debit Card</div>
						<div class="pay-card" data-mode="Credit Card">Credit Card</div>
					</div>

					<h3>Other</h3>
					<div class="pay-card" data-mode="COD">Cash on Delivery</div>

					<button class="pay-btn" type="button" onclick="submitPayment()">Proceed
						to Pay</button>
				</div>
			</form>
			<!-- RIGHT -->

			<div class="card">
				<h2>Order Summary</h2>

				<!-- ===== LOOP ONLY ITEMS ===== -->
				<%
				if (cart != null && cart.getCartItems() != null) {
					for (CartItem items : cart.getCartItems().values()) {
				%>

				<div class="summary-item">
					<img src="<%=items.getImagePath()%>" width="90">
					<div>
						<div class="item-title"><%=items.getItemName()%></div>

						<div>
							<%=items.getQuantity()%>x&#8377;<%=items.getUnitPrice()%>
						</div>

						<div class="price">
							&#8377;<%=items.getQuantity() * items.getUnitPrice()%>
						</div>
					</div>
				</div>

				<%
				}
				}
				%>
				<div class="bill-header">
					<div class="bill-tag">Inclusive of all charges</div>
				</div>
				<div class="bill-container">

					<div class="bill-row">
						<span>Item Total</span> <span> &#x20B9; <%=subtotal%></span>
					</div>

					<div class="bill-row">
						<span>Delivery Fee</span> <span> &#x20B9; <%=delivery%></span>
					</div>

					<div class="bill-row">
						<span>GST (5%)</span> <span> &#x20B9; <%=gst%></span>
					</div>

				</div>

				<!-- FINAL TOTAL -->
				<input type="hidden" name="totalAmount" id="totalAmount"
					value="<%=totalPay%>">
				<div class="total-row">
					<span>Total</span> <span>&#8377;<%=totalPay%></span>
				</div>

			</div>


			<!-- PAYMENT JS -->
			<script>
document.addEventListener("DOMContentLoaded", function () {

    const cards = document.querySelectorAll(".pay-card");
    const paymentModeInput = document.getElementById("paymentMode");

    cards.forEach(card => {
        card.addEventListener("click", function () {

            // remove previous selected style
            cards.forEach(c => c.classList.remove("active"));

            // add active style to clicked one
            this.classList.add("active");

            // set hidden value
            paymentModeInput.value = this.dataset.mode;

            console.log("Selected Payment Mode =", paymentModeInput.value);
        });
    });

});

// submit
function submitPayment() {
    let mode = document.getElementById("paymentMode").value;
    let addr = document.querySelector("input[name='address']").value;
    let total = document.getElementById("totalAmount").value;

    if (!mode) {
        alert("Please select a payment method!");
        return;
    }

    if (!addr || addr.trim().length < 3) {
        alert("Please enter your delivery address!");
        return;
    }

    document.getElementById("checkoutForm").submit();
    // STORE INTO SESSION STORAGE ✔
    sessionStorage.setItem("paymentMode", mode);
    sessionStorage.setItem("address", addr);
    sessionStorage.setItem("totalAmount", total);

    // redirect to animation page
    if (mode === "COD") {
        window.location.href = "cod-animation.jsp";
    }
    else if (mode === "Debit Card" || mode === "Credit Card") {
        window.location.href = "card-payment.jsp?method=" + mode;
    }
    else {
        window.location.href = "payment-method.jsp?method=" + mode;
    }

}

</script>

<script>
const profileMenu = document.getElementById("profileMenu");
const dropdown = document.getElementById("dropdownBox");

profileMenu.addEventListener("mouseenter", () => {
    dropdown.style.display = "block";
    requestAnimationFrame(() => {
        dropdown.style.opacity = "1";
    });
});

profileMenu.addEventListener("mouseleave", () => {
    dropdown.style.opacity = "0";
    setTimeout(() => {
        dropdown.style.display = "none";
    }, 150);
});

</script>
</body>
</html>
