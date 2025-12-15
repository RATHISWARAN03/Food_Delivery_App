package com.project;

import java.io.IOException;

import com.app.daoimpl.Userimpl;
import com.pojo.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Get user input from registration form
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String role = request.getParameter("role");
		String password = request.getParameter("password"); // plain password

		// Validate password
		if (password == null || password.isEmpty()) {
			throw new RuntimeException("Password is missing from form.");
		}

		// CREATE USER OBJECT
		User user = new User();
		user.setName(name);
		user.setUsername(username);
		user.setEmail(email);
		user.setPhone(phone);
		user.setAddress(address);
		user.setRole(role);
		user.setPassword(password); // store plain password

		// SAVE USER
		Userimpl dao = new Userimpl();
		boolean saved = dao.addUser(user);

		if (saved) {
			response.sendRedirect("Login.jsp");
		} else {
			response.sendRedirect("register.jsp?error=1");
		}
	}
}
