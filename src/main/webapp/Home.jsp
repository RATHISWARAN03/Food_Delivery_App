<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.pojo.Restaurant,com.pojo.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Feasto</title>
<link rel="stylesheet" href="Home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="icon" type="image/png" href="Image/logo2.png">
<style>
:root {
    --primary: #A44CE6;
    --accent: #ff6600;
    --bg: #f7f4ef;
    --dark: #111827;
    --muted: #6b7280;
    --soft-border: #e5e7eb;
    --card-radius: 18px;
    --shadow-soft: 0 6px 18px rgba(15, 23, 42, 0.12);
}

/* GLOBAL */
* {
    box-sizing: border-box;
}
body {
    margin: 0;
    font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
    background: #fff;
    color: var(--dark);
}

a{
	text-decoration: none;
}
/* ===== HEADER (your header, but styled & animated) ===== */
.app-header {
    position: sticky;
    top: 0;
    z-index: 2000;
    background: rgba(255,255,255,0.96);
    backdrop-filter: blur(14px);
    box-shadow: 0 2px 10px rgba(15,23,42,0.06);
    transition: box-shadow .2s ease, transform .2s ease, background .2s ease;
}
.app-header.scrolled {
    box-shadow: 0 10px 35px rgba(15,23,42,0.18);
    transform: translateY(-1px);
}
.header-inner {
    max-width: 1280px;
    margin: auto;
    padding: 10px 24px;
    display: flex;
    align-items: center;
    gap: 20px;
}

/* logo */
.logo-box {
    display: flex;
    align-items: center;
    gap: 8px;
}
.logo-icon {
    height: 44px;
    margin-left: -2rem;
    margin-right: 1rem;
}

/* location */
.location-box {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: .95rem;
    color: var(--muted);
    white-space: nowrap;
}

/* search in header */
.search-box {
    flex: 1;
    max-width: 520px;
    position: relative;
}
.search-box input {
    width: 100%;
    padding: 11px 42px 11px 16px;
    border-radius: 999px;
    border: 1px solid var(--soft-border);
    font-size: .95rem;
    transition: border-color .2s, box-shadow .2s, transform .15s;
    background: #f9fafb;
}
.search-box input:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 2px rgba(164,76,230,0.35);
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

/* cart */
.cart-wrap {
    position: relative;
    margin-right: 8px;
}
.cart-icon {
    position: relative;
    font-size: 1.85rem;
    text-decoration: none;
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

.cart-icon-img {
    width: 30px;
}


/* auth */
.auth-area {
    display: flex;
    align-items: center;
    gap: 10px;
}
.btn {
    padding: 8px 18px;
    border-radius: 24px;
    font-size: .88rem;
    font-weight: 600;
    text-decoration: none;
    border: 2px solid transparent;
    cursor: pointer;
    transition: background .2s, color .2s, transform .15s, box-shadow .2s;
}
.login-btn {
    border-color: #111827;
    color: #111827;
    background: transparent;
}
.login-btn:hover {
    background: #111827;
    color: #fff;
    transform: translateY(-1px);
}
.signup-btn {
    background: var(--accent);
    color: #fff;
    border-color: var(--accent);
}
.signup-btn:hover {
    background: #fff;
    color: var(--accent);
    box-shadow: 0 10px 25px rgba(249,115,22,0.35);
    transform: translateY(-1px);
}

/* ===== MAIN LAYOUT WRAPPER ===== */
.main-wrap {
    max-width: 100%;
    padding: 18px 24px 40px;
}

/* ===== HERO BANNER ===== */

.hero-wrapper {
    width: 100%;
    display: flex;
    justify-content: center;
    margin-top: 40px;
}

.hero-container-new {
    width: 100%;
    max-width: 100%;
    display: flex;
    padding: 40px;
    border-radius: 30px;
    background: #fff;
    box-shadow: 0 20px 60px rgba(0,0,0,0.12);
    align-items: center;
    gap: 40px;
}

/* LEFT */
.hero-left {
    flex: 1;
    display: flex;
    justify-content: center;
}

.hero-3d {
    width: 420px;
    animation: floatFood 4s ease-in-out infinite;
}

@keyframes floatFood {
    0%,100% { transform: translateY(0px); }
    50% { transform: translateY(-18px); }
}

/* RIGHT */
.hero-right {
    flex: 1;
}

.hero-kicker-new {
    font-size: 0.9rem;
    font-weight: 700;
    letter-spacing: 4px;
    opacity: 0.6;
    margin-bottom: 10px;
}

.hero-title-animate span {
    font-size: 2.8rem;
    font-weight: 900;
    display: inline-block;
    background: linear-gradient(90deg, #ff6a00, #ff3d00);
    -webkit-background-clip: text;
    color: transparent;

    animation: slideIn 1s cubic-bezier(.68,-0.55,.27,1.55);
}

@keyframes slideIn {
    from { opacity: 0; transform: translateY(30px) scale(0.95); }
    to { opacity: 1; transform: translateY(0) scale(1); }
}

.hero-desc {
    font-size: 1.1rem;
    margin-top: 18px;
    color: #555;
    line-height: 1.6;
}

.hero-buttons {
    margin-top: 25px;
}

.hero-order-btn {
    background: #ff6600;
    color: #fff;
    padding: 13px 26px;
    font-size: 1rem;
    border-radius: 50px;
    border: none;
    cursor: pointer;
    font-weight: 700;

    box-shadow: 0 12px 25px rgba(255,102,0,0.45);
    transition: 0.3s ease;
}

.hero-order-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 16px 35px rgba(255,102,0,0.65);
}

.hero-badges {
    margin-top: 25px;
    display: flex;
    gap: 12px;
    flex-wrap: wrap;
}

.hero-badge {
    background: #f1f5f9;
    padding: 8px 14px;
    border-radius: 20px;
    font-size: 0.9rem;
    font-weight: 600;
    color: #334155;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}
	

/* ===== CATEGORY CAROUSEL - "What's on your mind?" ===== */
.food-section {
    margin-top: 50px;
    text-align: center;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}

.food-title {
    font-size: 32px;
    font-weight: 700;
    margin-bottom: 30px;
}

.cat-wrapper {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
}

.cat-slider {
    display: flex;
    gap: 40px;
    overflow: hidden;
    scroll-behavior: smooth;
    padding: 20px 0;
    max-width: 1050px;
}

.cat-card {
    min-width: 150px;
    height: 150px;
    background: rgba(255,255,255,0.75);
    backdrop-filter: blur(12px);
    border-radius: 50%;
    box-shadow: 0 8px 30px rgba(0,0,0,0.08);
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    transition: 0.3s ease;
    cursor: pointer;
    position: relative;
}

.cat-card img {
    width: 100px;
    height: 100px;
    object-fit: contain;
    margin-bottom: 8px;
    animation: float 3s ease-in-out infinite;
}

.cat-card:hover {
    transform: translateY(-8px) scale(1.05);
    box-shadow: 0px 15px 35px rgba(255, 140, 0, 0.35);
}

.cat-card span {
    font-size: 18px;
    font-weight: 600;
    color: #222;
}

/* Arrow Buttons */
.arrow-btn {
    width: 38px;
    height: 38px;
    border-radius: 50%;
    border: none;
    background: white;
    box-shadow: 0 5px 20px rgba(0,0,0,0.15);
    font-size: 20px;
    cursor: pointer;
    transition: 0.2s ease;
    z-index: 10;
}

.arrow-btn:hover {
    background: #ff6600;
    color: white;
    transform: scale(1.1);
}

/* Floating Animation */
@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-10px); }
    100% { transform: translateY(0px); }
}


/* ===== TOP RESTAURANT CHAINS SLIDER ===== */
.chains-strip {
    margin-top: 32px;
}
.chains-row {
    display: flex;
    gap: 24px;
    overflow-x: auto;
    padding-bottom: 6px;
    scroll-behavior: smooth;
}
.chains-row::-webkit-scrollbar {
    height: 0;
}
.chain-card {
    flex: 0 0 280px;
    background: #fff;
    border-radius: var(--card-radius);
    box-shadow: var(--shadow-soft);
    overflow: hidden;
    cursor: pointer;
    transition: transform .2s, box-shadow .2s;
}
.chain-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 18px 40px rgba(15,23,42,0.35);
}
.chain-img {
    height: 170px;
    width: 100%;
    object-fit: cover;
}
.chain-body {
    padding: 14px 14px 16px;
}
.chain-name {
    font-weight: 700;
    margin-bottom: 4px;
}
.chain-meta {
    font-size: .85rem;
    color: var(--muted);
}
.chain-meta span {
    margin-right: 6px;
}

/* ===== RESTAURANT GRID (your loop) ===== */
.restaurants-block {
    margin-top: 34px;
}
.restaurant-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
    gap: 22px;
}
.restaurant-card {
    background: #fff;
    border-radius: var(--card-radius);
    box-shadow: var(--shadow-soft);
    overflow: hidden;
    display: flex;
    flex-direction: column;
    transition: transform .2s, box-shadow .2s;
}
.restaurant-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 18px 40px rgba(15,23,42,0.35);
}
.restaurant-img img {
    width: 100%;
    height: 170px;
    object-fit: cover;
}
.restaurant-details {
    padding: 12px 14px 14px;
}
.restaurant-name {
    font-size: 1.05rem;
    font-weight: 700;
    margin-bottom: 4px;
}
.restaurant-cuisine {
    font-size: .9rem;
    color: var(--muted);
    margin-bottom: 8px;
}
.restaurant-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: .88rem;
}
.rating {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    padding: 3px 8px;
    border-radius: 999px;
    background: #16a34a1a;
    color: #15803d;
}

/* ===== NO RESULTS ANIMATION ===== */
.no-results-wrapper {
    display: none;
    margin-top: 24px;
    text-align: center;
}
.no-results-wrapper.show {
    display: block;
}
.no-result-card {
    display: inline-flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
    padding: 16px 22px;
    border-radius: 18px;
    background: linear-gradient(135deg,#fef3c7,#fee2e2);
    box-shadow: 0 12px 30px rgba(248,165,65,0.45);
}
.no-food-icon {
    font-size: 2.4rem;
    animation: floatPlate 1.3s ease-in-out infinite;
}
@keyframes floatPlate {
    0%,100% { transform: translateY(0); }
    50% { transform: translateY(-7px); }
}
.no-result-title {
    font-weight: 700;
}
.no-result-sub {
    font-size: .9rem;
    color: #6b7280;
}

/* ===== POPULAR DISHES SECTION ===== */
.popular-dishes {
    margin-top: 40px;
}
.dish-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(210px, 1fr));
    gap: 16px;
}
.dish-pill {
    border-radius: 999px;
    padding: 10px 18px;
    text-align: center;
    border: 1px solid #e5e7eb;
    background: #fff;
    font-weight: 500;
    cursor: pointer;
    transition: transform .15s, box-shadow .15s, border-color .15s;
}
.dish-pill:hover {
    transform: translateY(-2px);
    border-color: var(--accent);
    box-shadow: 0 12px 25px rgba(15,23,42,0.15);
}

/* FOOTER CTA STRIP (like Swiggy app strip) */
.app-strip {
    margin-top: 50px;
    border-radius: 24px;
    padding: 26px 26px;
    background: #020617;
    color: #e5e7eb;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.app-strip h3 {
    margin: 0 0 6px;
    font-size: 1.6rem;
}
.app-strip p {
    margin: 0;
    font-size: .95rem;
    color: #9ca3af;
}
.app-strip-btn {
    padding: 10px 20px;
    border-radius: 999px;
    border: none;
    background: var(--accent);
    color: #fff;
    font-weight: 700;
    cursor: pointer;
    transition: transform .15s, box-shadow .15s;
}
.app-strip-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 14px 30px rgba(248,113,22,0.7);
}

/* small screens */
@media (max-width: 900px) {
    .header-inner {
        flex-wrap: wrap;
        gap: 10px;
    }
    .location-box {
        display: none;
    }
    .hero-card {
        height: auto;
        flex-direction: column;
    }
    .hero-content {
        width: 100%;
    }
    .hero-badge-row {
        position: static;
        margin-top: 16px;
    }
}

.footer {
    background: #cfcfcf;
    padding: 60px 0;
    margin-top: 50px;
    font-family: "Segoe UI", sans-serif;
}

.footer-container {
    max-width: 1300px;
    margin: auto;
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 40px;
}

/* LOGO */

.footer-logo img {
    width: 10rem;
    margin-left: -0.5rem;
}


.copy {
    margin-top: 10px;
    color: #444;
    font-size: 14px;
}

/* COLUMNS */
.footer-col h3 {
    font-size: 18px;
    font-weight: 700;
    margin-bottom: 18px;
}

.footer-col a {
    display: block;
    margin-bottom: 10px;
    color: #555;
    font-size: 15px;
    text-decoration: none;
    transition: 0.2s;
}

.footer-col a:hover {
    color: #ff6600;
    transform: translateX(4px);
}

/* DROPDOWN */
.city-select {
    margin-top: 10px;
    padding: 8px 12px;
    border-radius: 6px;
    border: 1px solid #ccc;
    background: white;
    font-size: 15px;
    cursor: pointer;
}

/* SOCIAL ICONS */
.social-icons {
    display: flex;
    gap: 15px;
    margin-top: 10px;
}

.social-icons i {
    font-size: 20px;
    color: #555;
    cursor: pointer;
    transition: 0.2s;
}

.social-icons i:hover {
    color: #ff6600;
    transform: scale(1.2);
}

/* RESPONSIVE */
@media (max-width: 1000px) {
    .footer-container {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 600px) {
    .footer-container {
        grid-template-columns: 1fr;
        text-align: left;
    }
}

/* Load more section */

.load-more-wrapper {
    text-align: center;
    margin: 40px 0;
}

.load-more-btn {
    padding: 14px 40px;
    font-size: 18px;
    font-weight: 600;
    border-radius: 12px;
    border: 1px solid #ccc;
    background: white;
    cursor: pointer;
    transition: 0.3s ease;
    position: relative;
    overflow: hidden;
}

.load-more-btn:hover {
    background: #f5f5f5;
}

/* Hide loader initially */
.loader {
    display: none;
    width: 22px;
    height: 22px;
    border: 3px solid #ff6600;
    border-top-color: transparent;
    border-radius: 50%;
    animation: spin 0.8s linear infinite;
    margin: auto;
}

@keyframes spin {
    100% { transform: rotate(360deg); }
}

.load-more-btn.loading .btn-text {
    display: none;
}

.load-more-btn.loading .loader {
    display: inline-block;
}


</style>
</head>

<body>
<%
    com.pojo.User name = (com.pojo.User) session.getAttribute("user");
%>
<%
    com.app.daoimpl.Cartimpl cart =
        (com.app.daoimpl.Cartimpl) session.getAttribute("cart");

    int cartCount = 0;
    if (cart != null && cart.getCartItems() != null) {
        cartCount = cart.getCartItems().size();
    }

    com.pojo.User userObj =
        (com.pojo.User) session.getAttribute("user");
%>

<!-- ===== HEADER (unchanged JSP, new classes only) ===== -->
<header class="app-header">
    <div class="header-inner">

        <!-- Logo -->
        <div class="logo-box">
            <img src="Image/logo.png" class="logo-icon">
        </div>

        <!-- Location -->
        <div class="location-box">
            <span class="loc-icon">📍</span>
            <span class="loc-text">Delivered to <b>Bengaluru 560076</b></span>
        </div>

        <!-- Search -->
        <div class="search-box">
            <!-- IMPORTANT: id used by JS for live search -->
            <input type="text" id="globalSearch"
                   placeholder="Search for restaurants or dishes…">
            <i class="search-icon"></i>
        </div>

        <!-- Cart -->
        <div class="cart-wrap">
            <a href="Login.jsp" class="cart-icon">
                <img src="Image/shopping-cart.png" class="cart-icon-img">
                <span class="cart-count"><%= cartCount %></span>
            </a>
        </div>

        <!-- AUTH AREA -->
        <div class="auth-area">
        
            <a href="Login.jsp" class="btn login-btn">Sign In</a>
            <a href="register.jsp" class="btn signup-btn">Sign Up</a>
       
        </div>
    </div>
</header>

<!-- ===== MAIN CONTENT WRAP ===== -->
<div class="main-wrap">

    <!-- ==== HERO (replaces your videos) ==== -->
   <!-- ==== HERO SECTION (1200px width, animated) ==== -->
<section class="hero-wrapper">

    <div class="hero-container-new">

        <!-- LEFT SIDE – 3D Animation (Replace with your animation GIF / Lottie) -->
        <div class="hero-left">
            <img src="Image/demo2.png" alt="Food Animation" class="hero-3d">
        </div>

        <!-- RIGHT SIDE – Animated Text -->
        <div class="hero-right">
            <h3 class="hero-kicker-new">FEASTO DELIVERY</h3>

            <h1 class="hero-title-animate">
                <span>Order Food Online in Bengaluru</span>
            </h1>

            <p class="hero-desc">
                Delicious Indian foods delivered fresh in under 30 minutes.
                Track orders live, pay easily, and enjoy premium experience.
            </p>

            <div class="hero-buttons">
                <a href="#restaurant"><button class="hero-order-btn">Order Now</button></a>
            </div>

            <div class="hero-badges">
                <span class="hero-badge">🍽 4000+ Restaurants</span>
                <span class="hero-badge">📍 Live Tracking</span>
                <span class="hero-badge">🛡 Safe & Hygienic</span>
            </div>
        </div>

    </div>

</section>


    <!-- ==== CATEGORIES "What's on your mind?" ==== -->
    <div class="food-section">
    <h2 class="food-title">Foody, what's on your mind?</h2>

    <div class="cat-wrapper">
        <button id="leftBtn" class="arrow-btn">‹</button>

        <div class="cat-slider" id="slider">
            <!-- 1 -->
            <div class="cat-card">
                <img src="Image/cat-briyani-removebg-preview.png" alt="">
                <span>Biryani</span>
            </div>

            <!-- 2 -->
            <div class="cat-card">
                <img src="Image/cat-fried.png" alt="">
                <span>Fried Rice</span>
            </div>

            <!-- 3 -->
            <div class="cat-card">
                <img src="Image/cat-itly-removebg-preview.png" alt="">
                <span>Idly & Dosa</span>
            </div>

            <!-- 4 -->
            <div class="cat-card">
                <img src="Image/cat-paratto.webp" alt="">
                <span>Parotta</span>
            </div>

            <!-- 5 -->
            <div class="cat-card">
                <img src="Image/cat-cake-removebg-preview.png" alt="">
                <span>Cakes</span>
            </div>

            <!-- 6 -->
            <div class="cat-card">
                <img src="Image/cat-pizza-removebg-preview.png" alt="">
                <span>Pizza</span>
            </div>

            <!-- 7 -->
            <div class="cat-card">
                <img src="Image/cat-role.webp" alt="">
                <span>Rolls</span>
            </div>

            <!-- Add more categories if needed -->
        </div>

        <button id="rightBtn" class="arrow-btn">›</button>
    </div>
</div>
    

    <!-- ===== NO RESULTS AREA (shown when search has nothing) ===== -->
    <div class="no-results-wrapper" id="noResultsBox">
        <div class="no-result-card">
            <div class="no-food-icon">🍽️</div>
            <div class="no-result-title">No restaurants or dishes found</div>
            <div class="no-result-sub">
                Try a different spellings like “biryani”, “pizza”, “dosa” or “burger”.
            </div>
        </div>
    </div>

    <!-- ===== RESTAURANT SECTION (YOUR JSP LOOP, UNCHANGED) ===== -->
    <section class="restaurants restaurants-block" id="restaurant">
        <div class="container">
            <h2 class="section-title">Top Restaurants Near you</h2>
            <div class="restaurant-grid">
                <!-- card 1 -->
                <%
                List<Restaurant> allRestaurant = (List<Restaurant>) request.getAttribute("allRestaurant");

                if (allRestaurant != null && !allRestaurant.isEmpty()) {
                    for (Restaurant restaurant : allRestaurant) {
                %>

                <%
    User loggedIn = (User) session.getAttribute("user");
%>

<a href="<%= (loggedIn == null) 
            ? "Login.jsp" 
            : "menu?restaurantId=" + restaurant.getRestaurantId() %>">
                    <div class="restaurant-card">
                        <div class="restaurant-img">
                            <img src="<%=restaurant.getImagePath()%>" alt="" />
                        </div>
                        <div class="restaurant-details">
                            <div class="restaurant-name"><%=restaurant.getName()%></div>
                            <div class="restaurant-cuisine"><%=restaurant.getCusineType()%></div>
                            <div class="restaurant-info">
                                <div class="rating">
                                    ⭐️ <%=restaurant.getRating()%>
                                </div>
                                <div class="delivery-time">
                                    <%=restaurant.getEta()%> mins
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
                <%
                    }
                }
                %>
            </div>
        </div>
    </section>
    
    <!-- Load more restaurant -->
    <div class="load-more-wrapper">
    <button id="loadMoreBtn" class="load-more-btn">
        <span class="btn-text">Show more</span>
        <span class="loader"></span>
    </button>
</div>
    

    <!-- ===== POPULAR DISHES ===== -->
    <section class="popular-dishes">
        <h2 class="section-title">Order popular dishes in Bengaluru</h2>
        <div class="dish-grid">
            <div class="dish-pill">Rasam</div>
            <div class="dish-pill">Cheese Pizza</div>
            <div class="dish-pill">Veg Hakka Noodles</div>
            <div class="dish-pill">Kadai Chicken</div>
            <div class="dish-pill">Paneer Roll</div>
            <div class="dish-pill">Peri Peri Fries</div>
            <div class="dish-pill">Laccha Paratha</div>
            <div class="dish-pill">Tomato Rice</div>
        </div>
    </section>

    <!-- ===== APP STRIP / FOOTER CTA ===== -->
    <section class="app-strip">
        <div>
            <h3>Get the Feasto App now!</h3>
            <p>Track orders live, unlock app-only offers and re-order in one tap.</p>
        </div>
        <button class="app-strip-btn">Send app link to my phone</button>
    </section>
</div>

<footer class="footer">
    <div class="footer-container">

        <!-- LOGO + COPYRIGHT -->
        <div class="footer-col">
            <div class="footer-logo">
                <img src="Image/logo.png" alt="Feasto Logo">
            </div>
            <p class="copy">© 2025 Feasto Limited</p>
        </div>

        <!-- COMPANY -->
        <div class="footer-col">
            <h3>Company</h3>
            <a href="#">About Us</a>
            <a href="#">Corporate</a>
            <a href="#">Careers</a>
            <a href="#">Team</a>
            <a href="#">Feasto One</a>
            <a href="#">Instant</a>
            <a href="#">Dineout</a>
        </div>

        <!-- CONTACT -->
        <div class="footer-col">
            <h3>Contact us</h3>
            <a href="#">Help & Support</a>
            <a href="#">Partner with us</a>
            <a href="#">Ride with us</a>

            <h3 style="margin-top:20px;">Legal</h3>
            <a href="#">Terms & Conditions</a>
            <a href="#">Cookie Policy</a>
            <a href="#">Privacy Policy</a>
            <a href="#">Investor Relations</a>
        </div>

        <!-- CITIES -->
        <div class="footer-col">
            <h3>Available in:</h3>
            <a href="#">Bangalore</a>
            <a href="#">Gurgaon</a>
            <a href="#">Hyderabad</a>
            <a href="#">Delhi</a>
            <a href="#">Mumbai</a>
            <a href="#">Pune</a>

        </div>

        <!-- LIFE AT FEASTO -->
        <div class="footer-col">
            <h3>Life at Feasto</h3>
            <a href="#">Explore with Feasto</a>
            <a href="#">Feasto News</a>
            <a href="#">Snackables</a>

            <h3 style="margin-top:20px;">Social Links</h3>
            <div class="social-icons">
                <i class="fa-brands fa-linkedin"></i>
                <i class="fa-brands fa-instagram"></i>
                <i class="fa-brands fa-facebook"></i>
                <i class="fa-brands fa-pinterest"></i>
                <i class="fa-brands fa-twitter"></i>
            </div>
        </div>

    </div>
</footer>


<!-- ===== JS: header scroll, category scroll, search with animation ===== -->
<script>
// header shadow on scroll
window.addEventListener("scroll", () => {
    const h = document.querySelector(".app-header");
    if (!h) return;
    h.classList.toggle("scrolled", window.scrollY > 10);
});

// category arrows
function scrollCategories(dir) {
    const row = document.getElementById("categoryRow");
    if (!row) return;
    const amount = 260; // px
    row.scrollBy({ left: dir * amount, behavior: "smooth" });
}

// clicking a category triggers search for that keyword
document.querySelectorAll(".category-card").forEach(card => {
    card.addEventListener("click", () => {
        const key = card.getAttribute("data-key") || "";
        const input = document.getElementById("globalSearch");
        if (input) {
            input.value = key;
            applySearch();
        }
    });
});

// ===== LIVE SEARCH (restaurant + "dish names" via cuisine text) =====
const searchInput = document.getElementById("globalSearch");
const noResultsBox = document.getElementById("noResultsBox");

// all <a> wrappers containing restaurant-card
const restaurantLinks = document.querySelectorAll(".restaurant-grid > a");

function applySearch() {
    const q = (searchInput?.value || "").trim().toLowerCase();
    let visibleCount = 0;

    restaurantLinks.forEach(link => {
        const card = link.querySelector(".restaurant-card");
        if (!card) return;

        const name = (card.querySelector(".restaurant-name")?.innerText || "").toLowerCase();
        const cuisine = (card.querySelector(".restaurant-cuisine")?.innerText || "").toLowerCase();

        const match = !q || name.includes(q) || cuisine.includes(q);

        link.style.display = match ? "block" : "none";
        if (match) visibleCount++;
    });

    if (q && visibleCount === 0) {
        noResultsBox.classList.add("show");
    } else {
        noResultsBox.classList.remove("show");
    }
}

// small debounce so typing feels smooth
let searchTimer;
if (searchInput) {
    searchInput.addEventListener("input", () => {
        clearTimeout(searchTimer);
        searchTimer = setTimeout(applySearch, 120);
    });
}

// run once on load (show all)
applySearch();

//scroll

const slider = document.getElementById("slider");
const leftBtn = document.getElementById("leftBtn");
const rightBtn = document.getElementById("rightBtn");

rightBtn.onclick = () => {
    slider.scrollBy({
        left: 350,
        behavior: "smooth"
    });
};

leftBtn.onclick = () => {
    slider.scrollBy({
        left: -350,
        behavior: "smooth"
    });
};

// Loading more  restaurant 

document.addEventListener("DOMContentLoaded", () => {

    const cards = Array.from(document.querySelectorAll(".restaurant-card"));
    const btn = document.getElementById("loadMoreBtn");

    const BATCH = 8;         // show 8 at a time
    let current = 0;         // how many are currently visible

    // Initially show first 8
    showNextBatch();

    btn.addEventListener("click", () => {

        // Start loading animation
        btn.classList.add("loading");

        setTimeout(() => {
            showNextBatch();

            // Stop loading animation
            btn.classList.remove("loading");

            // Hide button if all loaded
            if (current >= cards.length) {
                btn.style.display = "none";
            }

        }, 3000); // 3 sec loading
    });

    function showNextBatch() {

        const next = current + BATCH;

        cards.forEach((card, index) => {
            if (index < next) {
                card.style.display = "block";    // reveal
                card.style.opacity = "1";         // fade effect
                card.style.transform = "translateY(0)";
            }
        });

        current = next;
    }
});
</script>


</body>
</html>
