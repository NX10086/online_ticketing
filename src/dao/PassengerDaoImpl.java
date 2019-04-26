package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import entity.Passenger;
import util.DBconn;

public class PassengerDaoImpl implements PassengerDao {

	public boolean add(Passenger passenger) {
		String pid = passenger.getPid();
		String name = passenger.getName();
		String type = passenger.getType();
		String sql = "insert into passenger values('" + pid + "','" + name + "','" + type + "');";
		DBconn.open();
		int row = 0;
		row = DBconn.insert(sql);
		DBconn.close();
		return (row > 0);
	}

	public boolean update(Passenger passenger) {
		String pid = passenger.getPid();
		String type = passenger.getType();
		String sql = "update passenger set type = '" + type + "' where pid = '" + pid + "';";
		DBconn.open();
		int row = 0;
		row = DBconn.update(sql);
		DBconn.close();
		
		return (row > 0);
	}

	public Passenger queryPassengerById(String pid) {
		Passenger passenger = new Passenger();
		String sql = "select * from passenger where pid = '" + pid + "';";
		ResultSet rs = null;
		DBconn.open();
		rs = DBconn.select(sql);
		try {
			if(rs.next()) {
				String name = rs.getString("name");
				String type = rs.getString("type");
				passenger.setPid(pid);
				passenger.setName(name);
				passenger.setType(type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		
		return passenger;
	}

	

}
