package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDaoImpl;

/**
 * Servlet implementation class myorder_delete
 */
@WebServlet("/myorder_delete")
public class myorder_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myorder_delete() {
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
		Integer oid =Integer.parseInt((String)request.getParameter("oid")) ;
		boolean bool=new OrderDaoImpl().remove(oid);
		if(bool){
			request.setAttribute("status", 300);
			request.getRequestDispatcher("/myorder.jsp").forward(request, response);
		}else{
			request.setAttribute("status", 301);
			request.getRequestDispatcher("/myorder.jsp").forward(request, response);
		}
	}

}
