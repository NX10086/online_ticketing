package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PassengerDao;
import dao.PassengerDaoImpl;
import dao.UserDao;
import dao.UserDaoImpl;
import entity.Passenger;
import entity.User;

public class UserRegisterServlet extends HttpServlet {

	
	
	private static final long serialVersionUID = 1L;


	public UserRegisterServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("Username");
		String email = request.getParameter("Email");
		String pwd = request.getParameter("Password");
		String phone = request.getParameter("Phone");
		String personId = request.getParameter("PersonId");
		String name = request.getParameter("Name");
		String type = request.getParameter("passenger_type");
		
		Passenger passenger = new Passenger();
		User user = new User();
		UserDao ud = new UserDaoImpl();
		PassengerDao pd = new PassengerDaoImpl();
		passenger.setName(name);
		passenger.setType(type);
		passenger.setPid(personId);
		pd.add(passenger);
		
		user.setMail(email);
		user.setPasswd(pwd);
		user.setPhone(phone);
		user.setUname(userName);
		user.setPid(personId);
		ud.add(user);
		user = ud.getUserByUname(userName);
		ArrayList<Passenger> passengerList = new ArrayList<Passenger>();
		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("passengerList", passengerList);
		request.getRequestDispatcher("/index_after_login.jsp").forward(request, response);
	}

}
