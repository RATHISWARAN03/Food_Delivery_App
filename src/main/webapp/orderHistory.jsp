<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, com.pojo.OrderItem, com.pojo.Orders, com.pojo.User"%>

<!DOCTYPE html>
<html>
<head>
<title>Order History – Feasto</title>

<style>
:root {
	--accent: #ff6600;
	--bg: #fafafa;
	--card: #ffffff;
	--text-dark: #111;
	--muted: #6b6b6b;
	--radius: 22px;
	--shadow: 0 6px 25px rgba(0, 0, 0, 0.12);
}

/* GLOBAL */
body {
	margin: 0;
	padding: 0;
	background: var(--bg);
	font-family: "Segoe UI", sans-serif;
}

.page-wrapper {
	max-width: 1100px;
	margin: auto;
	padding: 30px 22px 60px;
}

/* TITLE */
.title {
	font-size: 34px;
	font-weight: 800;
	margin-bottom: 20px;
	background: linear-gradient(90deg, #ff6600, #ff3d00);
	-webkit-background-clip: text;
	color: transparent;
}

/* ORDER CARD */
.order-card {
	background: var(--card);
	padding: 22px 26px;
	margin-bottom: 22px;
	border-radius: var(--radius);
	box-shadow: var(--shadow);
	transition: .25s;
	position: relative;
	overflow: hidden;
}

/* Hover animation */
.order-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 14px 35px rgba(255, 102, 0, 0.3);
}

/* Animated left stripe */
.order-card::before {
	content: "";
	position: absolute;
	top: 0;
	left: -100%;
	width: 12px;
	height: 100%;
	background: var(--accent);
	border-radius: 8px;
	animation: slideStripe 1.2s ease forwards;
}

@
keyframes slideStripe {to { left:0;
	
}

}

/* ORDER GRID */
.order-top {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.order-id {
	font-size: 18px;
	font-weight: 700;
}

.order-status {
	font-weight: 700;
	padding: 6px 14px;
	border-radius: 12px;
	font-size: .85rem;
}

/* Status Colors */
.delivered {
	background: #d1fae5;
	color: #065f46;
}

.cancelled {
	background: #fee2e2;
	color: #991b1b;
}

.preparing {
	background: #fef3c7;
	color: #92400e;
}

.onway {
	background: #dbeafe;
	color: #1e40af;
}

/* Details */
.order-body {
	margin-top: 12px;
	font-size: 15px;
	color: #444;
}

.order-body p {
	margin: 5px 0;
}

/* ITEMS LIST */
.items-box {
	margin-top: 12px;
	background: #f8f8f8;
	padding: 14px;
	border-radius: 14px;
}

.items-box li {
	margin-bottom: 6px;
	font-size: 15px;
}

/* BACK BUTTON */
.back-btn {
	margin-top: 30px;
	display: inline-block;
	padding: 12px 26px;
	background: var(--accent);
	color: white;
	border-radius: 12px;
	font-size: 16px;
	font-weight: 700;
	text-decoration: none;
	box-shadow: 0 10px 25px rgba(255, 102, 0, 0.35);
	transition: .25s;
}

.back-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 14px 35px rgba(255, 102, 0, 0.55);
}

/* NO ORDERS UI */
.no-orders {
	text-align: center;
	padding: 60px 20px;
}

.no-orders img {
	width: 240px;
	opacity: .8;
}

.no-orders h2 {
	margin-top: 12px;
	font-size: 26px;
}

.no-orders p {
	color: #666;
	margin-top: 6px;
}
</style>
</head>

<body>

	<div class="page-wrapper">

		<h1 class="title">Your Orders</h1>

		<%
		// Pull order list from session (you can change this according to your backend)
		List<Orders> orderList = (List<Orders>) session.getAttribute("orderHistory");

		if (orderList == null || orderList.isEmpty()) {
		%>

		<div class="no-orders">
			<img src="Image/empty-box.png">
			<h2>No Orders Yet</h2>
			<p>Looks like you haven’t ordered anything. Start exploring
				delicious food!</p>
		</div>


		<%
		} else {
		for (Orders od : orderList) {
			String statusClass = "";

			if ("Delivered".equalsIgnoreCase(od.getStatus()))
				statusClass = "delivered";
			else if ("Cancelled".equalsIgnoreCase(od.getStatus()))
				statusClass = "cancelled";
			else if ("Preparing".equalsIgnoreCase(od.getStatus()))
				statusClass = "preparing";
			else
				statusClass = "onway";
		%>

		<div class="order-card">

			<div class="order-top">
				<div class="order-id">
					Order #<%=od.getOrderId()%></div>
				<div class="order-status <%=statusClass%>"><%=od.getStatus()%></div>
			</div>

			<div class="order-body">
				<p>
					<b>Date:</b>
					<%=od.getOrderDate()%></p>
				<p>
					<b>Total Amount:</b> ₹<%=od.getTotalAmount()%></p>
				<p>
					<b>Payment:</b>
					<%=od.getPaymentMode()%></p>
				<p>
					<b>Address:</b>
					<%=od.getAddress()%></p>
			</div>

			<div class="items-box">
				<b>Items:</b>
				<ul>
					<%
					com.app.daoimpl.Menuimpl menuDao = new com.app.daoimpl.Menuimpl();

					List<OrderItem> items = od.getOrderItems();
					for (OrderItem it : items) {
						String itemName = menuDao.getMenu(it.getMenuId()).getItemName();
					%>
					<li><%=itemName%> × <%=it.getQuantity()%></li>
					<%
					}
					%>
				</ul>
			</div>

		</div>

		<%
		}
		}
		%>

		<a href="restaurant_servlet" class="back-btn">← Back to Home</a>

	</div>

</body>
</html>
