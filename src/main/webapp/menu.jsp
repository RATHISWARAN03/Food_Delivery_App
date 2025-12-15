<%@page import="com.app.daoimpl.Cartimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.pojo.Menu,com.pojo.Restaurant"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feasto</title>
<link rel="icon" type="image/png" href="Image/logo2.png">
<style type="text/css">

/* ========== STYLE B – SWIGGY FAST MOTION ========== */
:root {
	--bg: #f7f4ef;
	--white: #ffffff;
	--primary: #fc7a1e;
	--text-main: #111827;
	--text-muted: #6b7280;
	--border-soft: #e5e7eb;
	--radius-lg: 16px;
	--radius-md: 12px;
	--shadow-soft: 0 4px 14px rgba(0, 0, 0, 0.10);
	--shadow-hover: 0 14px 30px rgba(0, 0, 0, 0.18);
}

body {
	margin: 0;
	font-family: "Segoe UI", system-ui, sans-serif;
	background: var(--bg);
	color: var(--text-main);
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
	margin-left: -3rem;
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
	margin-right: 2rem;
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

/* GENERIC CONTAINER */
.container, .menu .container {
	max-width: 1200px;
	margin: auto;
	padding: 0 18px;
}

<%List<Restaurant> allrestaurants = (List<Restaurant>) request.getAttribute("allRestaurant");

if (allrestaurants != null && !allrestaurants.isEmpty()) {
	for (Restaurant restaurants : allrestaurants) {
		String image = restaurants.getImagePath();%>
	/* BANNER */
	/* MAIN BANNER WRAPPER (Full width like BookMyShow) */ .restaurant-banner
	{ margin-top:5rem;
	display: flex;
	align-items: center;
	gap: 40px;
	padding: 40px;
	position: relative;
	max-width: 1400px;
	left: 1.2rem;
	border-radius: 18px;
	background: linear-gradient(to right, rgba(0, 0, 0, 0.85),
		rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.3)), url('<%=image%>');
	background-size: cover;
	background-position: center;
	margin-bottom: 40px;
}

<%}
}%>

/* LEFT POSTER IMAGE */
.restaurant-cover {
	width: 250px;
	height: 340px;
	object-fit: cover;
	border-radius: 20px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.5);
}

/* TEXT AREA */
.restaurant-info {
	display: flex;
	flex-direction: column;
	color: #fff;
	max-width: 600px;
}

/* TITLE LIKE BOOKMYSHOW */
.rest-name {
	font-size: 42px;
	font-weight: 800;
	margin-bottom: 20px;
	margin-top: -2rem;
}

/* META INFO ROW */
.rest-meta {
	display: flex;
	align-items: center;
	gap: 12px;
	margin-bottom: 30px;
}

/* Glass rating pill */
.rest-rating {
	padding: 6px 14px;
	background: rgba(255, 102, 0, 0.9);
	border-radius: 10px;
	font-weight: 700;
	font-size: 16px;
	color: #fff;
}

/* ETA + Distance */
.rest-meta-text {
	font-size: 16px;
	font-weight: 500;
	color: #e0e0e0;
}

/* Cuisine like BMS tags */
.rest-tags span {
	background: rgba(255, 255, 255, 0.12);
	padding: 6px 14px;
	border-radius: 10px;
	font-size: 14px;
	font-weight: 500;
	color: black;
	margin-right: 10px;
	display: inline-block;
}

.offer-item {
	border-radius: 1rem;
	padding: 0.5rem 1rem;
	background: #ffffff;
}

.rest-tags span {
	padding: 3px 9px;
	border-radius: 999px;
	background: #f3f4f6;
	font-size: .8rem;
}

.rest-offers {
	margin-top: 8px;
	display: flex;
	flex-wrap: wrap;
	gap: 8px;
}

.offer-card {
	flex: 0 0 auto;
	padding: 8px 14px;
	background: #fff;
	border-radius: 999px;
	font-size: .83rem;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.offer-marquee {
	width: 100%;
	overflow: hidden;
	background: #f7f4ef;
	padding: 12px 0;
	position: relative;
}

.offer-track {
	display: flex;
	gap: 18px;
	white-space: nowrap;
	animation: scrollLeft 25s linear infinite;
}

@
keyframes scrollLeft {from { transform:translateX(0);
	
}

to {
	transform: translateX(-50%);
}

}

/* OFFER PILL */
.offer-pill {
	padding: 10px 18px;
	background: #ffffff;
	border-radius: 999px;
	font-size: .92rem;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
	cursor: pointer;
	transition: all .25s ease;
	border: 1px solid #f0f0f0;
}

.offer-pill:hover {
	background: #fc7a1e;
	color: #fff;
	transform: translateY(-3px) scale(1.05);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.18);
}

/* PAUSE SCROLL ON HOVER */
.offer-marquee:hover .offer-track {
	animation-play-state: paused;
}

/* COPY TOAST */
#copyToast {
	position: fixed;
	bottom: 30px;
	right: 30px;
	background: #111827;
	color: #fff;
	padding: 10px 16px;
	border-radius: 8px;
	opacity: 0;
	pointer-events: none;
	transition: .3s;
	font-weight: 600;
	font-size: .9rem;
}

/* WRAPS BOTH ROWS */
.menu-top-wrapper {
	max-width: 1200px;
	margin: auto;
	display: flex;
	flex-direction: column;
	gap: 16px;
}

/* FILTER + SEARCH ARE ALWAYS SEPARATE ROW */
.filter-search-wrap {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 12px;
	width: 100%;
}

/* FILTER BAR DOES NOT TOUCH OFFERS */
.filter-bar {
	flex: 1;
	display: flex;
	gap: 12px;
	overflow-x: auto;
	white-space: nowrap;
}

/* SEARCH BAR FIXED SIZE */
.menu-search-box {
	width: 280px;
	flex-shrink: 0;
}

.filter-btn {
	padding: 8px 18px;
	border-radius: 999px;
	border: 1px solid #dedede;
	background: var(--bg);
	cursor: pointer;
	font-size: .88rem;
	white-space: nowrap;
	position: relative;
	transition: all .25s ease;
}

.filter-btn:hover {
	transform: translateY(-3px);
}

.filter-btn.active {
	background: #fc7a1e;
	color: #fff;
	border-color: #fc7a1e;
	transform: translateY(-3px);
}

.filter-btn::after {
	content: "";
	position: absolute;
	bottom: -6px;
	left: 50%;
	width: 0;
	height: 3px;
	background: #fc7a1e;
	border-radius: 2px;
	transform: translateX(-50%);
	transition: width .25s ease;
}

.filter-btn.active::after {
	width: 60%;
}

.filter-search-wrap {
	max-width: 1200px;
	margin: 16px auto;
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 12px;
}

/* FILTER BAR */
.filter-bar {
	display: flex;
	gap: 10px;
	overflow-x: auto;
	padding-bottom: 4px;
	padding: 0.5rem 0;
}

/* FILTER BUTTON ANIMATION */
.filter-btn {
	padding: 7px 16px;
	border-radius: 999px;
	border: 1px solid #d4d4d9;
	background: #fff;
	cursor: pointer;
	transition: background 0.2s ease, transform 0.2s ease, box-shadow 0.2s
		ease;
}

.filter-btn:hover {
	transform: translateY(-3px);
}

.filter-btn.active {
	background: #fc7a1e;
	color: white;
	border-color: #fc7a1e;
	transform: translateY(-3px);
}

/* ⭐ SEARCH BAR MOVED TO RIGHT */
.menu-search-box {
	min-width: 280px;
	max-width: 360px;
	flex-shrink: 0;
}

.menu-search-box input {
	width: 100%;
	padding: 10px 12px;
	border-radius: 999px;
	border: 1px solid #d4d4d8;
	font-size: 0.9rem;
	transition: 0.20s ease;
}

.menu-search-box input:focus {
	border-color: #fc7a1e;
	box-shadow: 0 0 0 3px rgba(252, 122, 30, 0.25);
}

/* ⭐ FILTER RESULT CARD ANIMATION */
.menu-item {
	display: block;
	opacity: 1;
	transition: opacity .18s ease;
}

.menu-item.hidden {
	opacity: 0;
	display: none !important;
}

.menu-item.hide {
	transform: scale(0.92);
	opacity: 0;
	pointer-events: none;
	height: 0;
	margin: 0;
	padding: 0;
	overflow: hidden;
	display: none !important;
}

.menu-item.show {
	display: block !important;
	opacity: 1;
	transform: scale(1);
}

/* SECTION TITLE */
.section-title {
	max-width: 1200px;
	margin: 18px auto 10px;
	font-size: 1.3rem;
	font-weight: 700;
}

/* MENU GRID */
.menu-grid {
	max-width: 1200px;
	margin: auto;
	display: grid !important;
	grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
	grid-auto-flow: dense;
	gap: 20px;
	align-items: start;
}

/* CARD */
.menu-item {
	width: 100%;
	max-width: 280px;
	justify-self: center;
	background: #fff;
	border-radius: var(--radius-lg);
	box-shadow: var(--shadow-soft);
	overflow: hidden;
	transform: translateY(16px);
	opacity: 0;
	transition: transform .18s ease-out, box-shadow .18s ease-out;
}

.menu-item.hidden {
	display: none !important;
}

.menu-item.is-visible {
	opacity: 1;
	transform: translateY(0);
}

.menu-item:hover {
	transform: translateY(-4px) scale(1.01);
	box-shadow: var(--shadow-hover);
}

/* IMAGE */
.menu-img {
	height: 165px;
	overflow: hidden;
}

.menu-img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	transition: transform .2s ease-out;
}

.menu-item:hover .menu-img img {
	transform: scale(1.05);
}

/* DETAILS */
.menu-details {
	padding: 1rem 1.1rem 1.1rem;
}

.menu-name {
	font-size: 1.1rem;
	font-weight: 600;
}

.menu-description {
	font-size: .86rem;
	margin: 4px 0 12px;
	color: var(--text-muted);
}

/* FOOTER */
.menu-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.menu-price {
	font-size: 1.15rem;
	font-weight: 700;
	color: black;
}

/* BUTTON */
.add-button {
	padding: .4rem 1.1rem;
	border-radius: 999px;
	border: none;
	background: var(--primary);
	color: #fff;
	font-size: .9rem;
	cursor: pointer;
	transition: transform .1s, box-shadow .1s, background .1s;
}

.add-button:hover {
	background: #ea580c;
	transform: translateY(-1px);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.18);
}

.add-button:active {
	transform: scale(.95);
}

/* CAROUSELS / BELOW SECTION */
.carousel {
	max-width: 1200px;
	margin: 8px auto 18px;
	display: flex;
	gap: 10px;
	overflow-x: auto;
}

.carousel-item {
	flex: 0 0 auto;
	min-width: 160px;
	padding: 10px 12px;
	border-radius: var(--radius-md);
	background: #fff;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
	font-size: .87rem;
	text-align: center;
	transform: translateY(12px);
	opacity: 0;
	transition: transform .16s, opacity .16s;
}

.carousel-item.is-visible {
	opacity: 1;
	transform: translateY(0);
}

/* LOAD MORE & FOOTER */
.load-more-container {
	max-width: 1200px;
	margin: 18px auto 10px;
	text-align: center;
}

#loadMoreBtn {
	padding: 9px 22px;
	border-radius: 999px;
	border: 1px solid #d4d4d8;
	background: #fff;
	cursor: pointer;
	font-size: .88rem;
}

#loadMoreBtn:hover {
	transform: translateY(-1px);
}

.footer {
	margin-top: 20px;
	padding: 16px;
	text-align: center;
	background: #fff;
	font-size: .85rem;
	color: var(--text-muted);
	box-shadow: 0 -2px 8px rgba(0, 0, 0, 0.05);
}

@media ( max-width :768px) {
	.restaurant-banner {
		flex-direction: column;
	}
	.restaurant-cover {
		width: 100%;
		height: 160px;
	}
}

.offer-container-wrapper {
	position: relative;
	width: 100%;
	padding: 30px 0;
	z-index: 1000;
	margin-top: -3rem;
	margin-bottom: -3rem;
}

/* Scrolling area */
.offer-container {
	display: flex;
	gap: 20px;
	overflow-x: auto;
	scroll-behavior: smooth;
	padding: 10px 40px;
	z-index: 5;
}

.offer-container::-webkit-scrollbar {
	display: none;
}

/* Offer chip clean UI */
.offer-chip {
	padding: 14px 28px;
	background: #fff;
	border: 2px solid #FF6600;
	border-radius: 14px;
	color: #222;
	font-weight: 600;
	white-space: nowrap;
	transition: 0.3s ease;
}

/* Hover effect */
.offer-chip:hover {
	transform: translateY(-3px);
	box-shadow: 0 8px 22px rgba(0, 0, 0, 0.15);
}

/* Arrow buttons OUTSIDE container */
.arrow-btn {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background: #FF6600;
	color: #fff;
	border: none;
	width: 45px;
	height: 45px;
	font-size: 22px;
	cursor: pointer;
	border-radius: 50%;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25);
	z-index: 20;
}

/* Left arrow OUTSIDE (pull left) */
.arrow-btn.left {
	left: 0; /* pulls arrow OUTSIDE */
}

/* Right arrow OUTSIDE (pull right) */
.arrow-btn.right {
	right: 0; /* pulls arrow OUTSIDE */
}

/* Hover effect */
.arrow-btn:hover {
	background: #e25500;
	transform: translateY(-50%) scale(1.08);
}

.offer-tittle {
	margin-top: -1rem;
	font-size: 15px;
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

	<%
	List<Restaurant> allrestaurant = (List<Restaurant>) request.getAttribute("allRestaurant");

	if (allrestaurant != null && !allrestaurant.isEmpty()) {
		for (Restaurant restaurant : allrestaurant) {
	%>
	<!-- ⭐ RESTAURANT BANNER -->
	<div class="restaurant-banner">
		<img src="<%=restaurant.getImagePath()%>" class="restaurant-cover" />


		<div class="restaurant-info">
			<h1 class="rest-name"><%=restaurant.getName()%></h1>

			<div class="rest-meta">
				<span class="rest-rating">⭐ <%=restaurant.getRating()%></span> <span
					class="rest-meta-text"> • <%=restaurant.getEta()%> mins • <%=restaurant.getDistance()%>
					km
				</span>
			</div>

			<div class="rest-tags">
				<span><%=restaurant.getCusineType()%></span>
			</div>


		</div>
	</div>
	<%
	}
	}
	%>



	<div class="menu-top-wrapper">

		<div class="offer-tittle">
			<h2>Deals for You</h2>
		</div>
		<!-- row 1 - offer slider -->
		<div class="offer-marquee" id="offerMarquee">
			<div class="offer-container-wrapper">
				<span><button class="arrow-btn left" id="leftArrow">&#10094;</button></span>

				<div class="offer-container" id="offerScroll">


					<div class="offer-chip">Festive Offer – ₹80 OFF</div>
					<div class="offer-chip">UPI Special – ₹60 OFF</div>
					<div class="offer-chip">Get 10% Instant Cashback</div>
					<div class="offer-chip">Flash Deal – 20% OFF</div>
					<div class="offer-chip">Free Delivery Above ₹199</div>
					<div class="offer-chip">Buy 1 Get 1 Free</div>
					<div class="offer-chip">Extra ₹40 OFF Today</div>

				</div>

				<span><button class="arrow-btn right" id="rightArrow">&#10095;</button></span>

			</div>


		</div>

		<div>
			<h2 class="section-title">Best Menu for You</h2>
		</div>

		<!-- row 2 - filter + search -->
		<div class="filter-search-wrap">

			<div class="filter-bar">
				<button class="filter-btn active" data-filter="all">All</button>
				<button class="filter-btn" data-filter="veg">Veg</button>
				<button class="filter-btn" data-filter="nonveg">Non-Veg</button>
				<button class="filter-btn" data-filter="popular">Popular</button>
				<button class="filter-btn" data-filter="new">New</button>
				<button class="filter-btn" data-filter="recommended">Recommended</button>
			</div>

			<div class="menu-search-box">
				<input type="text" id="menuSearchInput" placeholder="Search menu…">
			</div>

		</div>

	</div>



	<!-- menu items -->
	<!-- card 1 -->
	<section id="menu" class="menu">
		<div class="container">
			<div class="menu-grid">
				<%
				List<Menu> allMenu = (List<Menu>) request.getAttribute("allMenu");

				for (Menu menu : allMenu) {
				%>

				<!-- card 1 -->
				<div class="menu-item">
					<div class="menu-img">
						<img src="<%=menu.getImagePath()%>" alt="" />
					</div>
					<div class="menu-details">
						<div class="menu-name"><%=menu.getItemName()%></div>

						<div class="menu-description">
							<%=menu.getDescription()%>
						</div>
						<div class="menu-footer">
							<div class="menu-price">
								&#8360;
								<%=menu.getPrice()%></div>


							<form action="cart">
								<input type="hidden" name="itemId" value="<%=menu.getMenuId()%>">
								<input type="hidden" name="quantity" value="1"> <input
									type="hidden" name="restaurantId"
									value="<%=menu.getRestaurantId()%>"> <input
									type="hidden" name="action" value="add"> <input
									type="submit" class="add-button" value="Add to Cart">
							</form>




						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>

	</section>

	<!-- ⭐ LOAD MORE -->
	<div class="load-more-container">
		<button id="loadMoreBtn">Load More</button>
	</div>

	<!-- ⭐ CHEF SPECIAL -->
	<h2 class="section-title">Chef Special</h2>

	<div class="carousel">
		<div class="carousel-item">Paneer Butter Masala</div>
		<div class="carousel-item">Special Dosa</div>
		<div class="carousel-item">Chicken Fry</div>
		<div class="carousel-item">Veg Kothu Parotta</div>
	</div>

	<!-- ⭐ PEOPLE ALSO ORDERED -->
	<h2 class="section-title">People Also Ordered</h2>

	<div class="carousel">
		<div class="carousel-item">Curd Rice</div>
		<div class="carousel-item">Chapati & Kurma</div>
		<div class="carousel-item">Sambar Vada</div>
		<div class="carousel-item">Ghee Dosa</div>
	</div>

	<h2 class="section-title">Recently Viewed</h2>

	<div class="carousel">
		<div class="carousel-item">Chicken Biryani</div>
		<div class="carousel-item">Idly Set</div>
		<div class="carousel-item">Lemon Rice</div>
	</div>

	<footer class="footer">
		<div>© 2025 Feasto • All Rights Reserved</div>
	</footer>

	<script>
	// ⭐ DEFINE menuItems (IMPORTANT)
	const menuItems = document.querySelectorAll(".menu-item");

	// Scroll reveal for menu cards & carousels
	const observer = new IntersectionObserver((entries)=>{
	  entries.forEach(e=>{
	    if(e.isIntersecting){
	      e.target.classList.add("is-visible");
	      observer.unobserve(e.target);
	    }
	  });
	},{threshold:0.15});

	document.querySelectorAll(".menu-item, .carousel-item").forEach(el=>observer.observe(el));


	// ⭐ FILTER FUNCTION
	document.querySelectorAll(".filter-btn").forEach(btn => {
	    btn.addEventListener("click", () => {

	        document.querySelectorAll(".filter-btn")
	            .forEach(b => b.classList.remove("active"));
	        btn.classList.add("active");

	        const filter = btn.dataset.filter;

	        menuItems.forEach(item => {
	            const name = item.querySelector(".menu-name").innerText.toLowerCase();

	            const isVeg = name.includes("veg");
	            const isNonVeg = !isVeg;

	            item.classList.remove("show", "hide");

	            setTimeout(() => {
	                if (filter === "all") item.classList.add("show");
	                else if (filter === "veg" && isVeg) item.classList.add("show");
	                else if (filter === "nonveg" && isNonVeg) item.classList.add("show");
	                else item.classList.add("hide");
	            }, 20);
	        });
	    });
	});


	// ⭐ SEARCH FUNCTION
	const searchInput = document.getElementById("menuSearchInput");

searchInput.addEventListener("input", () => {
    const query = searchInput.value.toLowerCase().trim();

    menuItems.forEach(item => {
        const name = item.querySelector(".menu-name").innerText.toLowerCase();

        if (name.includes(query)) {
            item.classList.remove("hidden");
        } else {
            item.classList.add("hidden");
        }
    });
});

//COPY ON CLICK
document.querySelectorAll(".offer-pill").forEach(pill => {
    pill.addEventListener("click", () => {
        const code = pill.dataset.code;
        navigator.clipboard.writeText(code);

        const toast = document.getElementById("copyToast");
        toast.innerText = "Copied: " + code;
        toast.style.opacity = "1";

        setTimeout(() => {
            toast.style.opacity = "0";
        }, 1400);
    });
});


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

	<script>
    const scrollBox = document.getElementById("offerScroll");
    const leftArrow = document.getElementById("leftArrow");
    const rightArrow = document.getElementById("rightArrow");

    rightArrow.onclick = () => {
        scrollBox.scrollBy({ left: 300, behavior: 'smooth' });
    };

    leftArrow.onclick = () => {
        scrollBox.scrollBy({ left: -300, behavior: 'smooth' });
    };
</script>


</body>
</html>






