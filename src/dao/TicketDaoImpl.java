package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.Ticket;
import util.DBconn;

public class TicketDaoImpl implements TicketDao{


	public boolean update(String bid, double returnable_price, double unreturnable_price) {
		DBconn.open();
		int bool = -1;
		String sql = "update ticket set returnable_price = '"+returnable_price+"', unreturnable_price = '"+unreturnable_price+"' where bid = '"+bid+"' ";
		bool=DBconn.update(sql);
		DBconn.close();
		return bool>1;
	}

	public Ticket query(String bid, Date date) {
		
		DBconn.open();
		String sql = "select * from ticket where bid = '"+bid+"' and date = '"+date+"'";
		Ticket t = new Ticket();
		ResultSet set =DBconn.select(sql);
		try {
			while(set.next()){
				
				t.setBid(set.getString("bid"));
				t.setDate(set.getDate("date"));
				t.setTid(set.getInt("tid"));
				t.setReturnablePrice(set.getDouble("returnable_price"));
				t.setUnReturnablePrice(set.getDouble("unreturnable_price"));
				t.setRem(set.getInt("rem"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return t;
	}

	public Ticket queryById(int tid) {
		DBconn.open();
		String sql = "select * from ticket where tid = '" + tid + "'";
		Ticket t = new Ticket();
		ResultSet set =DBconn.select(sql);
		try {
			while(set.next()){
				
				t.setBid(set.getString("bid"));
				t.setDate(set.getDate("date"));
				t.setTid(set.getInt("tid"));
				t.setReturnablePrice(set.getDouble("returnable_price"));
				t.setUnReturnablePrice(set.getDouble("unreturnable_price"));
				t.setRem(set.getInt("rem"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		
		return t;	
	}

	public List<Ticket> queryByBid(String bid) {
		List<Ticket> ticketList = new ArrayList<Ticket>();
		ResultSet rs = null;
		DBconn.open();
		String sql = "select * from ticket where bid = '" + bid + "';";
		rs = DBconn.select(sql);
		try {
			while(rs.next()) {
				Ticket ticket = new Ticket();
				int tid = rs.getInt("tid");
				Date da = rs.getDate("date");
				double returnablePrice = rs.getDouble("returnable_price");
				double unReturnablePrice = rs.getDouble("unreturnable_price");
				ticket.setBid(bid);
				ticket.setDate(da);
				ticket.setTid(tid);
				ticket.setReturnablePrice(returnablePrice);
				ticket.setUnReturnablePrice(unReturnablePrice);
				ticketList.add(ticket);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return ticketList;
	}
	
	@Override
	public boolean addTicket(Ticket t) {
		DBconn.open();
		int  bool =-1;
		String sql="insert into ticket(bid,date,returnable_price,unreturnable_price,rem) values('"+t.getBid()+"','"+t.getDate()+"','"+t.getReturnablePrice()+"','"+t.getUnReturnablePrice()+"','"+t.getRem()+"')";
		bool=DBconn.insert(sql);
		DBconn.close();
		return bool>0;
	}

}
