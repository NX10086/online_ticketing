package servlet;

import java.io.IOException;import java.sql.Date;
import java.sql.Time;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusDaoImpl;
import dao.TicketDaoImpl;
import entity.Bus;
import entity.Ticket;
import util.Util;

/**
 * Servlet implementation class manager_add
 */
@WebServlet("/manager_add")
public class manager_add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manager_add() {
        super();
       
    }

	/**
	 * @see Servlet#getServletConfig()
	 */
	public ServletConfig getServletConfig() {
		
		return null;
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
		System.out.println(returnable_price);
		System.out.println(unreturnable_price);
		Bus bus = new Bus();
		bus.setBid(bid);
		bus.setSeats(seats);
		bus.setSource(source);
		bus.setDest(dest);
		bus.setTime(Time.valueOf(time));
		
		boolean i = new BusDaoImpl().insertBus(bus);
		/**
		 * Ìí¼Ó
		 */
		for(int n=1;n<=7;n++){
			Ticket ticket = new Ticket();
			ticket.setBid(bid);
			ticket.setDate(Date.valueOf(Util.getFetureDate(n)));
			ticket.setRem(seats);
			ticket.setReturnablePrice(returnable_price);
			ticket.setUnReturnablePrice(unreturnable_price);
			new TicketDaoImpl().addTicket(ticket);
		}
		
		if(i){
			request.setAttribute("action", "add");
			request.setAttribute("status", 200);
			request.getRequestDispatcher("/manager.jsp").forward(request, response);;
		}else{
			request.setAttribute("action", "add");
			request.setAttribute("status", 500);
			request.getRequestDispatcher("/manager.jsp").forward(request, response);;
		}
		
	}

}
