package servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDaoImpl;
import dao.UserDaoImpl;
import entity.Order;
import entity.User;

/**
 * Servlet implementation class myorder_search
 */
@WebServlet("/myorder_search")
public class myorder_search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myorder_search() {
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
		String source = (String)request.getParameter("source");
		String dest =(String)request.getParameter("dest");
		String date = (String)request.getParameter("date");
		if(source.isEmpty()||dest.isEmpty()||date.isEmpty()){
			request.getRequestDispatcher("/myorder.jsp").forward(request, response);	
		}else{
			
		
		String s[] = date.split("/");
		String n_date=s[2]+"-"+s[0]+"-"+s[1];
		
		User user = (User)request.getSession().getAttribute("user");
		
		if(!source.isEmpty()&&!dest.isEmpty()&&!date.isEmpty()){
			List<Order> all_list = new OrderDaoImpl().queryAll(user.getUid(), source, dest, Date.valueOf(n_date));
			List<Order>re_list=new OrderDaoImpl().queryReturnable(user.getUid(), source, dest, Date.valueOf(n_date));
			List<Order>unre_list=new OrderDaoImpl().queryUnreturnable(user.getUid(), source, dest, Date.valueOf(n_date));
			
			
			
			request.setAttribute("all_list", all_list);
			request.setAttribute("re_list", re_list);
			request.setAttribute("unre_list", unre_list);
			request.setAttribute("status", 200);
			request.setAttribute("username", user.getUname());
			request.setAttribute("source",source );
			request.setAttribute("dest",dest );
			request.getRequestDispatcher("/myorder.jsp").forward(request, response);
			
			
			
		}else{
			request.setAttribute("status", 500);
			request.getRequestDispatcher("/myorder.jsp").forward(request, response);
		}
		}
	}

}
