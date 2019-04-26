package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Passenger;

public class AddPassengerServlet extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	public AddPassengerServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int isReturnable = Integer.parseInt(request.getParameter("isReturnable"));
		request.setAttribute("isReturnable", isReturnable);
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		Passenger passenger = new Passenger();
		passenger.setPid(id);
		passenger.setType(type);
		@SuppressWarnings("unchecked")
		ArrayList<Passenger> passengerList = (ArrayList<Passenger>) request.getSession().getAttribute("passengerList");
		passengerList.add(passenger);
		request.getRequestDispatcher("/add_passenger.jsp").forward(request, response);
	}

}
