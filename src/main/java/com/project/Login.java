package com.project;
import java.io.IOException;
import com.app.daoimpl.Userimpl;
import com.pojo.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

//		String hashedPass = PasswordHash.hash(password);

		Userimpl userimpl = new Userimpl();

		User login = userimpl.login(email, password);

		System.out.println(login);

		if (login != null) {
			HttpSession session = req.getSession();
			session.setAttribute("user", login);
			resp.sendRedirect("restaurant_servlet");
		} else {
			req.setAttribute("isError", true);
			req.setAttribute("error", "Invalid email or password" + "");
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
		}
	}
}
