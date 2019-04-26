package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import entity.Bus;
import util.DBconn;

public class BusDaoImpl implements BusDao{

	public Bus queryAllBybid(String bid) {
		DBconn.open();
		
		String sql = "select * from bus where bid = '"+bid+"'";
		
		ResultSet set = DBconn.select(sql);
		Bus bus = new Bus();
		try {
			if(set.next()){
				bus.setBid(set.getString("bid"));
				bus.setDest(set.getString("dest"));
				bus.setSource(set.getString("source"));
				bus.setTime(set.getTime("time"));
				bus.setSeats(set.getInt("seats"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DBconn.close();
		return bus;
	}

	public boolean updateBybid(String bid, Bus bus) {
		DBconn.open();
		
		String sql = "update bus set source = '"+bus.getSource()+"',"
				+"dest = '"+bus.getDest()+"',time = '"+bus.getTime()+"',seats = '"+bus.getSeats()+"' where bid = '"+bid+"'"
				;
		int bool = DBconn.update(sql);
		DBconn.close();
		return bool>0;
	}

	public boolean insertBus(Bus bus) {
		DBconn.open();
		
		String sql = "insert into bus values('"+bus.getBid()+"','"+bus.getSource()+"','"
		+bus.getDest()+"','"+bus.getTime()+"','"+bus.getSeats()+"')";
		int bool = DBconn.insert(sql);
		DBconn.close();
		return bool>0;
	}

	public boolean deleteBus(String bid) {
		DBconn.open();
		
		String sql = "delete from bus where bid = '"+bid+"' ";
		int bool = DBconn.delete(sql);
		DBconn.close();
		
		return bool>0;
	}

	public List<Bus> queryAllBySourAndDest(String source, String dest) {
		List<Bus> busList = new ArrayList<Bus>();
		String sql = "select * from bus where source = '" + source + "' and dest = '" + dest + "';";
		ResultSet rs = null;
		DBconn.open();
		rs = DBconn.select(sql);
		try {
			while(rs.next()) {
				Bus bus = new Bus();
				String bid = rs.getString("bid");
				Time time = rs.getTime("time");
				int seats = rs.getInt("seats");
				bus.setBid(bid);
				bus.setSource(source);
				bus.setDest(dest);
				bus.setTime(time);
				bus.setSeats(seats);
				busList.add(bus);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return busList;
	}

}
