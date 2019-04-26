package servlet;

import java.io.IOException;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusDaoImpl;
import dao.TicketDaoImpl;
import entity.Bus;

/**
 * Servlet implementation class manager_update
 */
@WebServlet("/manager_update")
public class manager_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manager_update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bid =(String) request.getParameter("bid");
		String source=(String)  request.getParameter("source");
		String dest=(String) request.getParameter("dest");
		int seats=Integer.parseInt((String) request.getParameter("seats"));
		String time = (String) request.getParameter("time");
		double returnable_price = Double.parseDouble((String)request.getParameter("returnable_price"));
		double unreturnable_price = Double.parseDouble((String)request.getParameter("unreturnable_price"));
		Bus bus = new Bus();
		bus.setBid(bid);
		bus.setSeats(seats);
		bus.setSource(source);
		bus.setDest(dest);
		bus.setTime(Time.valueOf(time));
		
		boolean i = new BusDaoImpl().updateBybid(bid, bus);
		boolean u = new TicketDaoImpl().update(bid, returnable_price, unreturnable_price);
		if(i||u){
			request.setAttribute("action", "update");
			request.setAttribute("status", 200);
			request.getRequestDispatcher("/manager.jsp").forward(request, response);
		}else{
			request.setAttribute("action", "update");
			request.setAttribute("status", 500);
			request.getRequestDispatcher("/manager.jsp").forward(request, response);
		}
	}

}
