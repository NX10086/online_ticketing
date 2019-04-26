package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusDaoImpl;
import dao.TicketDaoImpl;
import entity.Bus;
import entity.Ticket;

/**
 * Servlet implementation class statistics_do
 */
@WebServlet("/statistics_do")
public class statistics_do extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public statistics_do() {
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
		String bid = (String)request.getParameter("bid");
		String date = (String)request.getParameter("date");
		
		if(bid.isEmpty()&&date.isEmpty()){
			request.setAttribute("status",500);
			request.getRequestDispatcher("/statistics.jsp").forward(request, response);
		}else{
			Bus bus = new BusDaoImpl().queryAllBybid(bid);
			Ticket ticket = new TicketDaoImpl().query(bid, Date.valueOf(date));
			try{
				if(!bus.getBid().isEmpty()&&!ticket.getBid().isEmpty()){
					request.setAttribute("bid", bid);	
					request.setAttribute("date", date);	
					int count =  bus.getSeats()-ticket.getRem();
					request.setAttribute("count",count);	
					request.setAttribute("status",200);
					request.getRequestDispatcher("/statistics.jsp").forward(request, response);
				}
			}catch(NullPointerException e){
				request.setAttribute("status",400);
				request.getRequestDispatcher("/statistics.jsp").forward(request, response);
			}
			
			
		}
	}

}
