package com.project;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import com.app.daoimpl.Menuimpl;
import com.app.daoimpl.Restaurantimpl;
import com.pojo.Menu;
import com.pojo.Restaurant;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/menu")
public class menu extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Menuimpl menuimpl = new Menuimpl();

		// ✔ SAFE extraction of restaurantId
		String ridStr = req.getParameter("restaurantId");

		if (ridStr == null || ridStr.equals("null") || ridStr.trim().equals("")) {
			resp.sendRedirect("Home.jsp");
			return;
		}

		int restaurantId = 0;
		try {
			restaurantId = Integer.parseInt(ridStr);
		} catch (Exception e) {
			resp.sendRedirect("Home.jsp");
			return;
		}

		// ❗ Corrected – pass INT not String
		List<Menu> allMenu = menuimpl.getAllMenuByRestaurant(restaurantId);

		req.setAttribute("allMenu", allMenu);

		HttpSession session = req.getSession();

		session.setAttribute("allMenu", allMenu);

		Restaurantimpl restaurantimpl = new Restaurantimpl();
		Restaurant restaurant = restaurantimpl.getRestaurant(restaurantId);

		List<Restaurant> restaurants = new ArrayList<>();
		restaurants.add(restaurant);

		req.setAttribute("allRestaurant", restaurants);
		req.getRequestDispatcher("menu.jsp").forward(req, resp);

	}
}
