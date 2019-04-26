package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDaoImpl;

/**
 * Servlet implementation class finance_do
 */
@WebServlet("/finance_do")
public class finance_do extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public finance_do() {
     
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
	     String way = (String) request.getParameter("way");
	     String year=(String)request.getParameter("year");
	     String quarter=(String)request.getParameter("quarter");
	     String month=(String)request.getParameter("month");
	     if(way.equals("按年结算")){
	    	 double total_price = new OrderDaoImpl().yearSummary(Integer.parseInt(year));
	    	 List<Double> year_list=new ArrayList<>();
	    	 for(int i=1;i<=4;i++){
	    		 double price=new OrderDaoImpl().seasonSummary(Integer.parseInt(year), i);
	    		 year_list.add(price);
	    	 }
	    	 request.setAttribute("status", 1);
	    	 request.setAttribute("year_list",year_list);
	    	 request.setAttribute("total_price", total_price);
	    	 request.setAttribute("year", year);
	    	 request.getRequestDispatcher("/finance.jsp").forward(request, response);
	     }else if(way.equals("按季结算")){
	    	 int n=1;
	    	 switch(quarter){
	    	 case "春":
	    		 n=1;
	    		 break;
	    	 case "夏":
	    		 n=2;
	    		 break;
	    	 case "秋":
	    		 n=3;
	    		 break;
	    	 case "冬":
	    		 n=4;
	    		 break;
	    	 }
	    	 List<Double> season_list = new ArrayList<>();
	    	 double total_price = new OrderDaoImpl().seasonSummary(Integer.parseInt(year), n);
	    	 for(int i =1;i<=12;i++){
	    		 double price = new OrderDaoImpl().monthSummary(Integer.parseInt(year), i);
	    		 season_list.add(price);
	    	 }
	    	 request.setAttribute("status", 2);
	    	 request.setAttribute("season_list",season_list);
	    	 request.setAttribute("total_price", total_price);
	    	 request.setAttribute("year", year);
	    	 request.setAttribute("quarter",quarter);
	    	 request.getRequestDispatcher("/finance.jsp").forward(request, response);
	     }else {
	    	 List<Double> month_list=new ArrayList<>();
	    	 double total_price = new OrderDaoImpl().monthSummary(Integer.parseInt(year), Integer.parseInt(month));
	    	 for(int i=1;i<=30;i++){
	    		 double price = new OrderDaoImpl().daySummary(Integer.parseInt(year), Integer.parseInt(month), i);
	    		 month_list.add(price);
	    	 }
	    	 request.setAttribute("status", 3);
	    	 request.setAttribute("month_list",month_list);
	    	 request.setAttribute("total_price", total_price);
	    	 request.setAttribute("year", year);
	    	 request.setAttribute("quarter",quarter);
	    	 request.setAttribute("month",month);
	    	 request.getRequestDispatcher("/finance.jsp").forward(request, response);
	    	 
	     }

	}

}
