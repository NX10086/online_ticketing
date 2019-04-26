package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.OrderItem;
import entity.Ticket;
import util.DBconn;

public class OrderItemDaoImpl implements OrderItemDao {

	public List<OrderItem> query(int oid) {
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		
		String sql = "select * from order_item where oid = '" + oid + "';";
		ResultSet rs = null;
		DBconn.open();
		rs = DBconn.select(sql);
		try {
			while(rs.next()) {
				OrderItem orderItem = new OrderItem();
				int oiid = rs.getInt("oiid");
				String pid = rs.getString("pid");
				int tid = rs.getInt("tid");
				double price = rs.getDouble("price");
				orderItem.setOid(oid);
				orderItem.setOiid(oiid);
				orderItem.setPid(pid);
				orderItem.setTid(tid);
				orderItem.setPrice(price);
				orderItemList.add(orderItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		
		return orderItemList;
	}

	public boolean removeAll(int oid) {
		String sql = "delete from order_item where oid = '" + oid + "';";
		int row = 0;
		DBconn.open();
		DBconn.close();
		
		return (row > 0);
	}

	public boolean add(int oid,String pid,int tid,double price) {
		TicketDao ticketDaoImpl = new TicketDaoImpl();
		Ticket ticket = ticketDaoImpl.queryById(tid);
		
		String sql = "insert into order_item(`oid`,`pid`,`tid`,`price`) values('" + oid + "','" + 
				pid + "','" + tid + "','" + price + "');";
		int row = 0;
		DBconn.open();
		row = DBconn.insert(sql);
		DBconn.close();
		
		return (row > 0);
	}

}
