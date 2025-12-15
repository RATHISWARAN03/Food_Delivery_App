package com.project;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import com.app.daoimpl.Cartimpl;
import com.app.daoimpl.OrderItemimpl;
import com.app.daoimpl.Ordersimpl;
import com.app.daoimpl.Restaurantimpl;
import com.pojo.CartItem;
import com.pojo.OrderItem;
import com.pojo.Orders;
import com.pojo.Restaurant;
import com.pojo.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class Checkout extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Ordersimpl ordersimpl;
	private OrderItemimpl orderItemimpl;

	@Override
	public void init() {
		ordersimpl = new Ordersimpl();
		orderItemimpl = new OrderItemimpl();
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		// FIXED → Correct session attribute name
		User user = (User) session.getAttribute("user");

		Cartimpl cart = (Cartimpl) session.getAttribute("cart");

		// Validate user & cart
		if (user == null) {
			resp.sendRedirect("Login.jsp");
			return;
		}

		if (cart == null || cart.getCartItems().isEmpty()) {
			resp.sendRedirect("cart.jsp");
			return;
		}

		// Read values from JSP
		String paymentMode = req.getParameter("paymentMode");
		String address = req.getParameter("address");
		String status = req.getParameter("status");
//		String name = req.getParameter("name");
//		String phonenumber = req.getParameter("phonenumber");

		String amount = req.getParameter("totalAmount");

		if (amount == null || amount.trim().isEmpty()) {
			amount = "0"; // or an error redirect
		}

		float total = Float.parseFloat(amount.trim());

		Object ridObj = session.getAttribute("restaurantId");

		if (ridObj == null) {
			System.out.println("restaurantId missing in session!");
			resp.sendRedirect("restaurant");
			return;
		}

		int restId = (int) ridObj;

		// Create Order
		Orders order = new Orders();
		order.setUserId(user.getUserId());
		order.setRestaurantId(restId);
		order.setOrderDate(new Timestamp(new Date().getTime()));
		order.setPaymentMode(paymentMode);
		order.setStatus(status);
		order.setAddress(address);
		order.setTotalAmount(total);

		// Insert into orders table and returns generated orderId
		int orderId = ordersimpl.addOrders(order);
		order.setOrderId(orderId);

		if (orderId == 0) {
			System.out.println("FAILED TO INSERT ORDER");
			resp.sendRedirect("cart.jsp");
			return;
		}

		// Insert Order Items
		for (CartItem item : cart.getCartItems().values()) {

			float itemTotal = item.getUnitPrice() * item.getQuantity();

			OrderItem orderItem = new OrderItem(orderId, item.getMenuId(), item.getQuantity(), itemTotal);

			orderItemimpl.addOrderItem(orderItem);
		}

		// Save items for confirmation page BEFORE clearing cart
		session.setAttribute("finalItems", cart.getCartItems());

		// Clear cart
		session.removeAttribute("cart");

		// Load restaurant and store in session for OrderConform.jsp
		Restaurantimpl rimpl = new Restaurantimpl();
		Restaurant rest = rimpl.getRestaurant(restId);

		session.setAttribute("restaurant", rest);

		// Set order object to use in confirmation page
		session.setAttribute("orders", order);

		// Redirect to confirmation page
		resp.sendRedirect("OrderConform.jsp");

	}
}
