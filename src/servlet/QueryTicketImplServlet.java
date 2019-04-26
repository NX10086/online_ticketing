package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusDaoImpl;
import dao.TicketDaoImpl;
import entity.Bus;
import entity.Ticket;

public class QueryTicketImplServlet extends HttpServlet {

	
	
	private static final long serialVersionUID = 1L;


	public QueryTicketImplServlet() {
		super();
	}

	
	public void destroy() {
		super.destroy(); 
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String source = request.getParameter("fangyuanEntity.fyXqCode");
		String dest = request.getParameter("fangyuanEntity.fyDhCode");
		String date = request.getParameter("date");
		if(source.isEmpty() || dest.isEmpty() || date.isEmpty()) {
			request.getRequestDispatcher("/house_list.jsp").forward(request, response);
		} else {
			System.out.println(source + " " + dest + " " + date);
			String year = date.substring(6, 10);
			String month = date.substring(0, 2);
			String day = date.substring(3,5);
			Date leaveDate = Date.valueOf(year + "-" + month + "-" + day);
			BusDaoImpl bus = new BusDaoImpl();
			ArrayList<Bus> busList = (ArrayList<Bus>) bus.queryAllBySourAndDest(source, dest);
			ArrayList<Ticket> ticketList = new ArrayList<Ticket>();
			
			TicketDaoImpl ticket = new TicketDaoImpl();
			for(Bus myBus:busList) {
				Ticket myTicket = ticket.query(myBus.getBid(), leaveDate);
				if(myTicket.getTid() != 0) {
					ticketList.add(myTicket);
				}
			}
			
			request.setAttribute("source", source);
			request.setAttribute("dest", dest);
			request.setAttribute("date", date);
			request.setAttribute("allTicket", ticketList);
			request.getRequestDispatcher("/house_list.jsp").forward(request, response);
		}
		
		
	}

	
	public void init() throws ServletException {
		
	}

}
