package dao;

import java.sql.Date;
import java.util.List;

import entity.Ticket;

public interface TicketDao {
	public boolean update(String bid, double returnable_price, double unreturnable_price);
	public Ticket query(String bid,Date date);
	public Ticket queryById(int tid);
	public List<Ticket> queryByBid(String bid);
	boolean addTicket(Ticket t);
}
