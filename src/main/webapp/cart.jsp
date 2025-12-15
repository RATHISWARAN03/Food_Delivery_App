<%@page import="java.awt.event.ItemEvent"%>
<%@page import="com.project.menu"%>
<%@page import="com.pojo.CartItem"%>
<%@page import="com.app.daoimpl.Cartimpl"%>
<%@page import="com.project.CartServlet"%>
<%@page import="com.pojo.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feasto</title>
<link rel="icon" type="image/png" href="Image/logo2.png">

<!-- Lottie Player for Elegant Empty Cart Animation -->
<script
	src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

<style>
* {
	box-sizing: border-box;
}

body {
	font-family: "Segoe UI", sans-serif;
	margin: 0;
	padding: 30px 0 100px;
	display: flex;
	justify-content: center;
	background: #ffffff;
	color: #0f172a;
}
/* --- STICKY NAVIGATION BAR (Combined) --- */
:root {
	--white: #ffffff;
	--primary-color: #A258E0;
	--light-color: #e5e7eb;
	--border-radius: 12px;
	--shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

/* HEADER */
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

.auth-area {
	display: flex;
	align-items: center;
	gap: 10px;
}

.logo-box {
	display: flex;
	align-items: center;
	margin-left: -4rem;
}

.logo-icon {
	height: 48px;
	width: auto;
	display: block;
	margin-right: 3rem;
}

.location {
	display: flex;
	align-items: center;
	gap: 6px;
	font-size: .95rem;
	color: #6b7280;
	white-space: nowrap;
	margin-left: -1.5rem;
}

/* search in header */
.search-box {
	flex: 1;
	position: relative;
	max-width: 480px;
	height: 17.6px;
	display: flex;
	align-items: center;
	margin-left: 1rem;
}

.search-box input {
	width: 100%;
	padding: 11px 42px 11px 16px;
	border-radius: 999px;
	border: 1px solid #e5e7eb;
	font-size: .95rem;
	transition: border-color .2s, box-shadow .2s, transform .15s;
	background: #f9fafb;
}

.search-box input:focus {
	outline: none;
	border-color: var(--primary);
	box-shadow: 0 0 0 2px rgba(164, 76, 230, 0.35);
	background: #fff;
	transform: translateY(-1px);
}

.search-icon {
	position: absolute;
	right: 14px;
	top: 9px;
	font-size: 1.1rem;
	opacity: 0.55;
}

.cart-container {
	position: relative;
	margin-left: 3rem;
	margin-right: 3rem;
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
	background: #ff6600;
	color: #fff;
	font-size: .7rem;
	padding: 2px 6px;
	border-radius: 999px;
}

/* PROFILE ICON */
.profile-icon-wrap {
	position: relative;
	cursor: pointer;
	margin-right: -3rem;
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

/* Push cart container down (important!) */
.container {
	margin-top: 3rem !important;
}

/* MAIN WRAPPER */
.container {
	width: 100%;
	max-width: 1200px;
	background: #ffffff;
	padding: 24px 26px 120px;
	border-radius: 18px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	backdrop-filter: blur(16px);
	position: relative;
	overflow: hidden;
	animation: containerFade 0.6s ease-out forwards;
}

.container::before {
	content: "";
	position: absolute;
	inset: -120px;
	background: radial-gradient(circle at 0% 0%, rgba(59, 130, 246, 0.08),
		transparent 60%),
		radial-gradient(circle at 100% 0%, rgba(34, 197, 94, 0.08),
		transparent 55%);
	pointer-events: none;
	z-index: -1;
}

.header-row {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 18px;
}

.page-title {
	font-size: 24px;
	font-weight: 700;
	color: #020617;
}

.page-subtitle {
	font-size: 14px;
	color: #6b7280;
}

.cart-badge {
	padding: 6px 12px;
	border-radius: 999px;
	font-size: 12px;
	font-weight: 600;
	background: rgba(22, 163, 74, 0.08);
	color: #15803d;
	border: 1px solid rgba(22, 163, 74, 0.25);
}

/* ITEM CARD */
.item-card {
	display: flex;
	justify-content: space-between;
	padding: 20px 0;
	border-bottom: 1px solid rgba(148, 163, 184, 0.35);
	animation: fadeUp 0.45s ease-out forwards;
}

.item-card:last-of-type {
	border-bottom: none;
}

.left {
	width: 65%;
}

.left h2 {
	margin: 0 0 6px;
	font-size: 20px;
	font-weight: 600;
	color: #020617;
}

.price {
	font-size: 18px;
	margin: 0 0 4px;
	font-weight: 600;
	color: #111827;
}

.desc {
	color: #6b7280;
	line-height: 1.4;
	max-width: 90%;
	font-size: 14px;
}

/* REMOVE BUTTON */
.remove-btn {
	margin-top: 14px;
	background: linear-gradient(135deg, #f97373, #ef4444);
	color: white;
	padding: 7px 16px;
	font-size: 13px;
	border: none;
	border-radius: 999px;
	cursor: pointer;
	font-weight: 600;
	transition: transform 0.18s ease, box-shadow 0.18s ease, opacity 0.18s;
}

.remove-btn:hover {
	transform: translateY(-1px);
	opacity: 0.95;
}

/* RIGHT ITEM IMAGE + QTY */
.right {
	width: 30%;
	position: relative;
	text-align: center;
	display: flex;
	justify-content: flex-end;
	align-items: center;
}

.item-image-wrapper {
	position: relative;
	display: inline-block;
	padding: 10px;
	border-radius: 18px;
	background: radial-gradient(circle at 20% 0%, rgba(252, 211, 77, 0.12),
		transparent 60%),
		radial-gradient(circle at 80% 100%, rgba(248, 113, 113, 0.11),
		transparent 65%);
	transform-origin: center;
	animation: subtleFloat 4s ease-in-out infinite;
}

.right img {
	width: 120px;
	height: 120px;
	border-radius: 14px;
	object-fit: cover;
	display: block;
}

/* QUANTITY BOX */
.qty-box {
	position: absolute;
	bottom: -16px;
	left: 50%;
	transform: translateX(-50%);
	display: flex;
	background: #f9fafb;
	border-radius: 999px;
	overflow: hidden;
	border: 1px solid rgba(148, 163, 184, 0.8);
	align-items: center;
}

.qty-box button {
	width: 30px;
	height: 32px;
	border: none;
	background: transparent;
	font-size: 18px;
	cursor: pointer;
	font-weight: 700;
	transition: background 0.15s ease, transform 0.15s ease;
}

.qty-box button:enabled:hover {
	background: rgba(148, 163, 184, 0.18);
	transform: translateY(-1px);
}

.qty-box span {
	padding: 6px 14px;
	font-weight: 600;
	font-size: 15px;
	color: #111827;
	min-width: 36px;
}

.quantity-btn[disabled] {
	opacity: 0.45;
	cursor: default;
}

/* BILL BOX */
.bill-container {
	width: 100%;
	margin-top: 32px;
	padding: 20px 22px;
	background: #ffffff;
	border-radius: 16px;
	border: 1px solid rgba(148, 163, 184, 0.4);
	position: relative;
	overflow: hidden;
}

.bill-container::before {
	content: "";
	position: absolute;
	inset: -120px;
	background: radial-gradient(circle at 0 0, rgba(59, 130, 246, 0.17),
		transparent 58%);
	opacity: 0.5;
	pointer-events: none;
}

.bill-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 12px;
	position: relative;
	z-index: 1;
}

.bill-container h3 {
	margin: 0;
	font-size: 18px;
	font-weight: 700;
	color: #020617;
}

.bill-tag {
	padding: 4px 10px;
	border-radius: 999px;
	font-size: 11px;
	text-transform: uppercase;
	letter-spacing: 0.06em;
	border: 1px solid rgba(37, 99, 235, 0.5);
	background: rgba(191, 219, 254, 0.35);
	color: #1d4ed8;
}

.bill-row {
	display: flex;
	justify-content: space-between;
	margin: 10px 0;
	font-size: 15px;
	color: #4b5563;
	position: relative;
	z-index: 1;
}

.bill-row span:first-child {
	font-weight: 500;
}

.total-pay {
	margin-top: 14px;
	padding-top: 14px;
	border-top: 1px solid #111827;
	display: flex;
	justify-content: space-between;
	font-weight: 700;
	font-size: 20px;
	color: #020617;
	position: relative;
	z-index: 1;
}

.total-label {
	display: flex;
	flex-direction: column;
}

.total-subtext {
	font-size: 11px;
	font-weight: 500;
	color: #6b7280;
	text-transform: uppercase;
	letter-spacing: 0.14em;
}

/* EMPTY CART STATE */
.empty-cart {
	margin-top: 20px;
	padding: 50px 20px 40px;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	animation: fadeUp 0.45s ease-out forwards;
}

.empty-title {
	font-size: 20px;
	font-weight: 700;
	color: #020617;
	margin-top: 10px;
	margin-bottom: 4px;
}

.empty-subtitle {
	font-size: 14px;
	color: #6b7280;
	max-width: 360px;
}

.empty-chip {
	margin-top: 14px;
	padding: 6px 14px;
	border-radius: 999px;
	font-size: 12px;
	border: 1px dashed rgba(148, 163, 184, 0.9);
	color: #6b7280;
	background: rgba(248, 250, 252, 0.9);
}

/* BOTTOM BUTTON BAR */
.button-row {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
	background: #f7f4ef;
	padding: 16px 24px 18px;
	display: flex;
	justify-content: center;
	gap: 18px;
	box-shadow: 0 4px 25px rgba(0, 0, 0, 0.1);
	z-index: 999;
	backdrop-filter: blur(18px);
}

.checkout-btn, .addmore-btn {
	flex: 1;
	max-width: 420px;
	padding: 14px 18px;
	font-size: 16px;
	font-weight: 600;
	border-radius: 999px;
	border: none;
	cursor: pointer;
	transition: transform 0.16s ease, box-shadow 0.16s ease, background
		0.16s ease;
	display: inline-flex;
	align-items: center;
	justify-content: center;
	white-space: nowrap;
}

.checkout-btn {
	background: #ff6600;
	color: white;
}

.checkout-btn:hover {
	transform: translateY(-2px);
}

.addmore-btn {
	background: black;
	color: white;
	padding: 0.85rem 2.5rem;
}

.addmore-btn:hover {
	transform: translateY(-2px);
}

/* ICON-LIKE TEXT INSIDE BUTTON */
.btn-label-main {
	margin-right: 6px;
}

.btn-label-sub {
	font-size: 12px;
	opacity: 0.85;
}

/* ANIMATIONS */
@
keyframes fadeUp {from { opacity:0;
	transform: translateY(14px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@
keyframes containerFade {from { opacity:0;
	transform: translateY(16px) scale(0.98);
}

to {
	opacity: 1;
	transform: translateY(0) scale(1);
}

}
@
keyframes subtleFloat { 0% {
	transform: translateY(0);
}

50


%
{
transform


:


translateY
(


-6px


)
;


}
100


%
{
transform


:


translateY
(


0


)
;


}
}

/* RESPONSIVE */
@media ( max-width : 768px) {
	body {
		padding: 16px 0 100px;
		background: #020617;
	}
	.container {
		margin: 0 10px;
		padding: 18px 16px 110px;
		border-radius: 16px;
	}
	.item-card {
		flex-direction: row;
		align-items: flex-start;
		gap: 18px;
	}
	.left {
		width: 60%;
	}
	.right {
		width: 40%;
		justify-content: center;
	}
}

.desc {
	padding: 0.2rem 0 0.5rem 0;
}
</style>
</head>
<body>
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
			<a href="${pageContext.request.contextPath}/home1">
				<div class="logo-box">
					<img src="Image/logo.png" class="logo-icon">
				</div>
			</a>
			<div class="location">
				<span class="loc-icon">📍</span> <span class="loc-text">Delivered
					to <b>Bengaluru 560076</b>
				</span>
			</div>
			<!-- Search -->
			<div class="search-box">
				<!-- IMPORTANT: id used by JS for live search -->
				<input type="text" id="globalSearch"
					placeholder="Search for restaurants or dishes…">

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

		<!-- Header -->
		<div class="header-row">
			<div>
				<div class="page-title">Your Cart</div>
				<div class="page-subtitle">Review your order before checkout.</div>
			</div>
			<div class="cart-badge">Live Bill · Updated in real time</div>
		</div>

		<!-- ITEMS -->
		<%
		Menu menu = new Menu();
		Integer restaurantId = (Integer) session.getAttribute("restaurantId");

		if (cart != null && cart.getCartItems() != null && !cart.getCartItems().isEmpty()) {
			for (CartItem items : cart.getCartItems().values()) {
		%>
		<div class="item-card">
			<div class="left">
				<h2><%=items.getItemName()%></h2>
				<div class="desc">
					<%=items.getDescription()%>
				</div>
				<div class="price">
					₹<%=items.getPrice()%></div>


				<form action="cart" method="post">
					<input type="hidden" name="itemId" value="<%=items.getMenuId()%>">
					<input type="hidden" name="restaurantId"
						value="<%=items.getRestaurantId()%>"> <input type="hidden"
						name="action" value="remove">
					<button type="submit" class="remove-btn">Remove</button>
				</form>
			</div>

			<div class="right">
				<div class="item-image-wrapper">
					<img src="<%=items.getImagePath()%>" />
					<div class="qty-box">
						<form action="cart" method="post" style="display: inline;">
							<input type="hidden" name="itemId" value="<%=items.getMenuId()%>">
							<input type="hidden" name="restaurantId"
								value="<%=items.getRestaurantId()%>"> <input
								type="hidden" name="action" value="update"> <input
								type="hidden" name="quantity"
								value="<%=items.getQuantity() - 1%>">
							<button type="submit" class="quantity-btn"
								<%if (items.getQuantity() == 1) {%> disabled <%}%>>-</button>
						</form>
						<span><%=items.getQuantity()%></span>
						<form action="cart" method="post" style="display: inline;">
							<input type="hidden" name="itemId" value="<%=items.getMenuId()%>">
							<input type="hidden" name="restaurantId"
								value="<%=items.getRestaurantId()%>"> <input
								type="hidden" name="action" value="update"> <input
								type="hidden" name="quantity"
								value="<%=items.getQuantity() + 1%>">
							<button type="submit" class="quantity-btn">+</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%
		}
		}
		%>

		<%
		float subtotal = 0;

		if (cart != null && cart.getCartItems() != null && !cart.getCartItems().isEmpty()) {
			for (CartItem item : cart.getCartItems().values()) {
				subtotal += item.getPrice();
			}
		}

		float gst = 0, delivery = 0, totalPay = 0;

		if (subtotal > 0) {
			gst = subtotal * 0.05f;
			delivery = 29;
			totalPay = subtotal + gst + delivery;
		}

		boolean isEmptyCart = (cart == null || cart.getCartItems() == null || cart.getCartItems().isEmpty());
		%>

		<!-- BILL OR EMPTY STATE -->
		<%
		if (!isEmptyCart) {
		%>
		<div class="bill-container">
			<div class="bill-header">
				<h3>Bill Details</h3>
				<div class="bill-tag">Inclusive of all charges</div>
			</div>

			<div class="bill-row">
				<span>Item Total</span> <span>₹ <%=subtotal%></span>
			</div>

			<div class="bill-row">
				<span>Delivery Fee</span> <span>₹ <%=delivery%></span>
			</div>

			<div class="bill-row">
				<span>GST (5%)</span> <span>₹ <%=gst%></span>
			</div>

			<div class="total-pay">
				<div class="total-label">
					<span>TO PAY</span> <span class="total-subtext">after taxes
						& charges</span>
				</div>
				<span>₹ <%=totalPay%></span>
			</div>
		</div>
		<%
		} else {
		%>
		<div class="empty-cart">
			<lottie-player
				src="https://assets7.lottiefiles.com/packages/lf20_qh5z2fdq.json"
				background="transparent" speed="1" style="width:260px;height:260px;"
				loop autoplay> </lottie-player>

			<div class="empty-title">Your cart is feeling a little light</div>
			<div class="empty-subtitle">Looks like you haven’t added
				anything yet. Explore delicious dishes and we’ll keep your bill
				updated here in real time.</div>
			<div class="empty-chip">Tip: Add items from your favourite
				restaurant to unlock offers.</div>
		</div>
		<%
		}
		%>

	</div>
	<!-- /container -->

	<!-- BOTTOM BUTTONS -->
	<div class="button-row">
		<%
		if (cart != null && cart.getCartItems() != null && !cart.getCartItems().isEmpty()) {
		%>
		<form action="checkout.jsp" method="post">
			<input type="hidden" name="subtotal" value="<%=subtotal%>"> <input
				type="hidden" name="gst" value="<%=gst%>"> <input
				type="hidden" name="delivery" value="<%=delivery%>"> <input
				type="hidden" name="totalPay" value="<%=totalPay%>">
			<button class="checkout-btn">
				<span class="btn-label-main">Proceed to Checkout</span>
			</button>
		</form>
		<%
		}
		%>

		<form action="menu" method="post">
			<%
			Object restaurantid = session.getAttribute("restaurantId");
			if (restaurantid != null) {
			%>
			<input type="hidden" name="restaurantId" value="<%=restaurantid%>">
			<%
			}
			%>
			<button class="addmore-btn">
				<span class="btn-label-main">Add More Items</span>
			</button>
		</form>
	</div>
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
