package servlet;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class manager_search
 */
@WebServlet("/manager_search")
public class manager_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manager_search() {
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
		String search = (String)request.getParameter("search");
		if(search.isEmpty()){
			request.setAttribute("action","search");
			request.setAttribute("status",400);
			request.getRequestDispatcher("/manager.jsp").forward(request, response);
		}
		Bus bus = new BusDaoImpl().queryAllBybid(search);
		List <Ticket> list= new TicketDaoImpl().queryByBid(search);
		Ticket ticket = null;
		if(list.size()>0){
			 ticket = list.get(0);
			 request.setAttribute("bus", bus);
				request.setAttribute("ticket",ticket );
				request.setAttribute("action", "search");
				request.setAttribute("status", 200);
				request.getRequestDispatcher("/manager.jsp").forward(request, response);
		}else {
			System.out.print("нч╫А╧Ш");
			request.setAttribute("action", "search");
			request.setAttribute("status", 401);
			request.getRequestDispatcher("/manager.jsp").forward(request, response);
		}
		
		
		
		
	}

}
