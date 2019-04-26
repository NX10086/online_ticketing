package servlet;

import java.io.IOException;
import java.io.PrintWriter;

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

public class UpdatePersonInfoServlet extends HttpServlet {

	public UpdatePersonInfoServlet() {
		super();
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String uname = request.getParameter("uname");
		String phone = request.getParameter("phone");
		String mail = request.getParameter("mail");
		String type = request.getParameter("type");
		String pwd = request.getParameter("password");
		
		UserDao ud = new UserDaoImpl();
		PassengerDao pd = new PassengerDaoImpl();
		
		User user = ud.getUserByUname(uname);
		Passenger passenger = pd.queryPassengerById(user.getPid());
		passenger.setType(type);
		user.setMail(mail);
		user.setPasswd(pwd);
		user.setPhone(phone);
		user.setPid(user.getPid());
		
		ud.update(user, passenger);
		
	}

}
