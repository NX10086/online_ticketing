package util;
import java.sql.*;

public class DBconn {
	
	private static String url = "jdbc:mysql://localhost:3306/ticket_purchase?useunicuee=true&serverTimezone=GMT%2B8&characterEncoding=utf-8";
	private static String user = "root";
	private static String password = "louiewang";
	private static Connection conn = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs = null;
	
	public static void open() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			
		} catch(Exception e) {
			System.out.println("���ݿ������쳣!");
			e.printStackTrace();
		}
	}
	
	public static void close() {
		try {
			conn.close();
		} catch(SQLException e) {
			System.out.println("���ݿ�ر��쳣!");
			e.printStackTrace();
		}
	}
	
	public static ResultSet select(String sql) {
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch(SQLException e) {
			System.out.println("���ݿ��ѯ�쳣");
			e.printStackTrace();
		}
		return rs;
	}
	
	public static int delete(String sql) {
		return insDelUpd(sql, 0);
	}
	
	public static int update(String sql) {
		return insDelUpd(sql, 1);
	}
	
	public static int insert(String sql) {
		return insDelUpd(sql,2);
	}
	
	private static int insDelUpd(String sql,int kind) {
		/*kind means the operation to the database
		*kind == 0 means delete
		*kind == 1 means update
		*else means insert*/
		
		int row = 0;
		try {
			ps = conn.prepareStatement(sql);
			row = ps.executeUpdate();
		} catch(SQLException e) {
			String message = null;
			if(kind == 0) message = "���ݿ�ɾ���쳣!";
			else if(kind == 1) message = "���ݿ�����쳣!";
			else message = "���ݿ�����쳣!";
			System.out.println(message);
			e.printStackTrace();
		}
		return row;
	}
	
}
