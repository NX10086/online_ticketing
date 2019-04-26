package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDaoImpl;
import entity.Passenger;
import entity.User;

public class UserLoginServlet extends HttpServlet {

	
	
	private static final long serialVersionUID = 1L;


	public UserLoginServlet() {
		super();
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("Email");
		String pwd = request.getParameter("Password");
		UserDaoImpl ud = new UserDaoImpl();
		
		if(ud.login(name, pwd)) {
			User user = ud.getUserByUname(name);
			ArrayList<Passenger> passengerList = new ArrayList<Passenger>();
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("passengerList", passengerList);
			request.getRequestDispatcher("/index_after_login.jsp").forward(request, response);
		} else {
			response.sendRedirect("index.jsp");
		}
		
	}

}
