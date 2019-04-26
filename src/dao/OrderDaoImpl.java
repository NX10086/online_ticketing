package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Bus;
import entity.Order;
import entity.OrderItem;
import entity.Ticket;
import util.Convert;
import util.DBconn;
import util.DateTime;

public class OrderDaoImpl implements OrderDao {

	public List<Order> queryAll(int uid, String source, String dest, Date date) {
		List<Order> ret = new ArrayList<Order>();
		
		ret.addAll(queryUnreturnable(uid, source, dest, date));
		ret.addAll(queryReturnable(uid, source, dest, date));
		return ret;
	}

	public List<Order> queryUnreturnable(int uid, String source, String dest, Date date) {
		return query(uid,source,dest,date,0);
	}

	public List<Order> queryReturnable(int uid, String source, String dest, Date date) {
		return query(uid,source,dest,date,1);
	}
	public List<Order> query(int uid,String source,String dest,Date date,int type) {
		List<Order> orderList = new ArrayList<Order>();
		List<Ticket> ticketList = new ArrayList<Ticket>();
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		List<Bus> busList = new BusDaoImpl().queryAllBySourAndDest(source, dest);
		String sql = "select * from `order` where uid = '" + uid + "' and date_format(date, '%Y-%m-%d') = '" +
				date.toString() + "';";
		DBconn.open();
		ResultSet rs = DBconn.select(sql);
		try {
			while(rs.next()) {
				int oid = rs.getInt("oid");
				double totalPrice = rs.getDouble("total_price");
				String d = rs.getString("date");
				int returnable = rs.getInt("returnable");
				Order order = new Order();
				order.setOid(oid);
				order.setUid(uid);
				order.setDate(new DateTime(d));
				order.setReturnable(returnable);
				order.setTotalPrice(totalPrice);
				if(type == returnable) {
					orderList.add(order);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		
		for(Bus bus:busList) {
			ticketList.addAll(new TicketDaoImpl().queryByBid(bus.getBid()));
		}
		for(Order order:orderList) {
			int oid = order.getOid();
			orderItemList.addAll(new OrderItemDaoImpl().query(oid));
		}
		List<Order> ret = new ArrayList<Order>();
		for(Ticket ticket:ticketList) {
			int tid = ticket.getTid();
			for(OrderItem orderItem:orderItemList) {
				if(tid == orderItem.getTid()) {
					int oid = orderItem.getOid();
					if(!ret.contains(new OrderDaoImpl().queryById(oid))) {
						ret.add(new OrderDaoImpl().queryById(oid));
					}
					
				}
			}
		}
		ArrayList<Order> tmp = new ArrayList<Order>();
		ArrayList<Integer> t = new ArrayList<Integer>();
		for(Order order:ret) {
			if(!t.contains(order.getOid())) {
				tmp.add(order);
				t.add(order.getOid());
			}
		}
		return tmp;
	}
	public double yearSummary(int year) {
		double ret = 0;
		String sql = "select sum(total_price) from `order` where year(date) = " + year + ";";
		ResultSet rs = null;
		DBconn.open();
		rs = DBconn.select(sql);
		try {
			if(rs.next()) {
				ret = rs.getDouble(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return ret;
	}

	public double seasonSummary(int year, int season) {
		double ret = 0;
		String sql = "select sum(total_price) from `order` where quarter(date) = " + season + " and year(date) = " + year + ";";
		ResultSet rs = null;
		DBconn.open();
		rs = DBconn.select(sql);
		try {
			if(rs.next()) {
				ret = rs.getDouble(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return ret;
	}

	public double monthSummary(int year, int month) {
		String date = Convert.convert(year, month, 0);
		double ret = 0;
		String sql = "select sum(total_price) from `order` where date_format(date,'%Y%m') = '" + date.substring(0, 6) + "';";
		ResultSet rs = null;
		DBconn.open();
		rs = DBconn.select(sql);
		try {
			if(rs.next()) {
				ret = rs.getDouble(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return ret;
	}

	public double daySummary(int year, int month, int day) {
		String date = Convert.convert(year, month, day);
		double ret = 0;
		
		String sql = "select sum(total_price) from `order` where date_format(date,'%Y%m%d') = '" + date + "';";
		ResultSet rs = null;
		DBconn.open();
		rs = DBconn.select(sql);
		try {
			if(rs.next()) {
				ret =  rs.getDouble(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return ret;
	}

	public boolean add(Order order) {
		int oid = order.getOid();
		double totalPrice = order.getTotalPrice();
		int uid = order.getUid();
		DateTime date = order.getDate();
		int returnable = order.getReturnable();
		
		String sql = "insert into `order`(total_price,uid,date,returnable) values('" + 
				totalPrice + "','" + uid + "','" + date.toString() + "','" + returnable + "');";
		int row = 0;
		DBconn.open();
		row = DBconn.insert(sql);
		DBconn.close();
		
		return (row > 0);
	}

	public boolean remove(int oid) {
		String sql = "delete from `order` where oid = '" + oid + "';";
		int row = 0;
		DBconn.open();
		row = DBconn.delete(sql);
		DBconn.close();
		return (row > 0);
	}

	public Order queryById(int oid) {
		String sql = "select * from `order` where oid = '" + oid + "';";
		DBconn.open();
		ResultSet rs = null;
		rs = DBconn.select(sql);
		Order order = new Order();
		try {
			if(rs.next()) {
				double totalPrice = rs.getDouble("total_price");
				int uid = rs.getInt("uid");
				String dateTime = rs.getString("date");
				int returnable = rs.getInt("returnable");
				order.setOid(oid);
				order.setTotalPrice(totalPrice);
				order.setUid(uid);
				order.setReturnable(returnable);
				order.setDate(new DateTime(dateTime));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return order;
	}

	public int queryByDateUid(String date, int uid) {
		String sql = "select oid from `order` where uid = '" + uid + "' and date_format(date,'%Y-%m-%d %H:%i:%S') = '" + date
					+ "';";
		ResultSet rs = null;
		DBconn.open();
		int oid = 0;
		rs = DBconn.select(sql);
		try {
			if(rs.next()) {
				oid = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return oid;
	}

}
