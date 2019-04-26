package servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NumberDisDaoImpl;
import dao.SeasonDisDaoImpl;
import dao.TypeDisDaoImpl;

/**
 * Servlet implementation class discount_update
 */
@WebServlet("/discount_update")
public class discount_update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public discount_update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#getServletConfig()
	 */
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
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
		
		String type = (String) request.getParameter("type");
		String season = (String) request.getParameter("season");
		String number = (String) request.getParameter("number");
		String type_dis=(String) request.getParameter("type_dis");
		String season_dis=(String) request.getParameter("season_dis");
		String number_dis=(String) request.getParameter("number_dis");
		
		String n_type = type.substring(0,2);
		String n_season=season.substring(0,1);
		int n_number=Integer.parseInt(number.substring(1,2));
		double n_type_dis=Double.parseDouble(type_dis);
		double n_season_dis=Double.parseDouble(season_dis);
		double n_number_dis=Double.parseDouble(number_dis);
		
		boolean t = new TypeDisDaoImpl().UpdateDisByType(n_type, n_type_dis);
		boolean s = new SeasonDisDaoImpl().UpdateDisBySeanson(n_season, n_season_dis);
		boolean n = new NumberDisDaoImpl().UpdateDisByNum(n_number, n_number_dis);
		if(t&&s&&n){
			request.setAttribute("status", 200);
			request.getRequestDispatcher("/discount.jsp").forward(request, response);
		}else {
			request.setAttribute("status", 500);
			request.getRequestDispatcher("/discount.jsp").forward(request, response);
		}
		
	}

}
