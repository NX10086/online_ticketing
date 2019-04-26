package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBconn;

public class ManagerDaoImpl implements ManagerDao{
	

	public boolean login(String id, String password) {
		DBconn.open();
		boolean bool = false;
		String sql = "select * from manager where mid = '" + id + "' and passwd = '"+password+"'";
		ResultSet set =DBconn.select(sql);
		try {
			if(set.next()){
				bool=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return bool;
	}

}
