package com.project;

import java.io.IOException;
import java.util.List;

import com.app.daoimpl.Restaurantimpl;
import com.pojo.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/restaurant_servlet")
public class Restaurant_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. Read form values
		int id = Integer.parseInt(req.getParameter("restaurantId"));
		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String phone = req.getParameter("phone");
		String rating = req.getParameter("rating");
		String cuisine = req.getParameter("cusineType");
		String isActive = req.getParameter("isActive");
		String eta = req.getParameter("eta");
		int adminUserId = Integer.parseInt(req.getParameter("adminUserId"));
		String imagePath = req.getParameter("imagePath");
		float distance = Float.parseFloat(req.getParameter("distance"));

		// 2. Set POJO
		Restaurant r = new Restaurant(id, name, address, phone, rating, cuisine, isActive, eta, adminUserId, imagePath,
				distance);

		// 3. Insert into DB
		Restaurantimpl impl = new Restaurantimpl();
		impl.addRestaurant(r);

		HttpSession session = req.getSession();
		session.setAttribute("restaurant", r);
		// 4. Redirect to refresh page
		resp.sendRedirect("restaurant_servlet");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Restaurantimpl impl = new Restaurantimpl();
		List<Restaurant> list = impl.getAllRestaurant();

		req.setAttribute("allRestaurant", list);
		req.getRequestDispatcher("restaurant.jsp").forward(req, resp);
	}
}
