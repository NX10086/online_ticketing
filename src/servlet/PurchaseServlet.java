package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDao;
import dao.OrderDaoImpl;
import dao.UserDao;
import dao.UserDaoImpl;
import entity.Passenger;
import entity.User;

public class PurchaseServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public PurchaseServlet() {
		super();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tid = Integer.parseInt(request.getParameter("tid"));
		int type = Integer.parseInt(request.getParameter("isReturnable"));
		request.setAttribute("isReturnable", type);
		User user = (User) request.getSession().getAttribute("user");
		@SuppressWarnings("unchecked")
		ArrayList<Passenger> myList = (ArrayList<Passenger>) request.getSession().getAttribute("passengerList");
		UserDao ud = new UserDaoImpl();
		ud.purchase(myList,type,tid,user.getUid());
		myList.clear();
		request.getRequestDispatcher("/index_after_login.jsp").forward(request, response);
	}

}
