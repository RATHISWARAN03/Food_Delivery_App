package com.project;
import java.io.IOException;
import java.util.List;
import com.app.daoimpl.OrderItemimpl;
import com.app.daoimpl.Ordersimpl;
import com.pojo.OrderItem;
import com.pojo.Orders;
import com.pojo.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderHistory")
public class OrderDetails extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private Ordersimpl ordersimpl;
	private OrderItemimpl orderItemimpl;

	@Override
	public void init() {
		ordersimpl = new Ordersimpl();
		orderItemimpl = new OrderItemimpl();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		// User not logged in
		if (session == null || session.getAttribute("user") == null) {
			resp.sendRedirect("Login.jsp");
			return;
		}

		User user = (User) session.getAttribute("user");

		// Fetch all orders for this user
		List<Orders> ordersList = ordersimpl.getOrdersByUserId(user.getUserId());

		// Fetch items for each order
		if (ordersList != null) {
			for (Orders order : ordersList) {
				List<OrderItem> items = orderItemimpl.getOrderItemsByOrderId(order.getOrderId());
				order.setOrderItems(items);
			}
		}
		System.out.println("Logged User ID: " + user.getUserId());
		System.out.println("Fetched Orders Count: " + ordersList.size());

		for (Orders o : ordersList) {
			System.out.println("Order loaded: " + o.getOrderId());
		}

		// Save to session
		session.setAttribute("orderHistory", ordersList);

		// Redirect
		resp.sendRedirect("orderHistory.jsp");
	}
}
