package com.project;
import java.io.IOException;
import com.pojo.CartItem;
import com.pojo.Menu;
import com.app.daoimpl.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		Cartimpl cart = (Cartimpl) session.getAttribute("cart");

		Integer currentRestauranId = (Integer) session.getAttribute("restaurantId");

		int newrestaurantId = Integer.parseInt(req.getParameter("restaurantId"));

		if (cart == null || currentRestauranId != newrestaurantId) {
			cart = new Cartimpl();
			session.setAttribute("cart", cart);
			session.setAttribute("restaurantId", newrestaurantId);
		}

		String action = req.getParameter("action");

		if ("add".equals(action)) {
			addItemToCart(req, cart);
		} else if ("update".equals(action)) {
			updateCartItem(req, cart);
		} else if ("remove".equals(action)) {
			removeItemFromCart(req, cart);
		}
		resp.sendRedirect("cart.jsp");
	}

	private void addItemToCart(HttpServletRequest req, Cartimpl cartItem) {

		int itemId = Integer.parseInt(req.getParameter("itemId"));

		int quantity = Integer.parseInt(req.getParameter("quantity"));

		Menuimpl menuimpl = new Menuimpl();

		Menu menu = menuimpl.getMenu(itemId);

		if (menu != null) {
			CartItem item = new CartItem(menu.getMenuId(), menu.getRestaurantId(), menu.getItemName(), menu.getPrice(),
					quantity, menu.getImagePath(), menu.getDescription());

			cartItem.addToCart(item);

		}
	}

	private void removeItemFromCart(HttpServletRequest req, Cartimpl cart) {
		int itemId = Integer.parseInt(req.getParameter("itemId"));
		cart.deleteTheCart(itemId);
	}

	private void updateCartItem(HttpServletRequest req, Cartimpl cart) {
		int itemId = Integer.parseInt(req.getParameter("itemId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		cart.updateTheCart(itemId, quantity);

	}
}
