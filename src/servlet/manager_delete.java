package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BusDaoImpl;

/**
 * Servlet implementation class manager_delete
 */
@WebServlet("/manager_delete")
public class manager_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public manager_delete() {
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
		boolean d=new BusDaoImpl().deleteBus(bid);
		if(d){
			request.setAttribute("action", "delete");
			request.setAttribute("status", 200);
			request.getRequestDispatcher("/manager.jsp").forward(request, response);
		}else{
			request.setAttribute("action", "delete");
			request.setAttribute("status", 500);
			request.getRequestDispatcher("/manager.jsp").forward(request, response);
		}
	}

}
