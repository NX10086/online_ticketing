package dao;

import java.util.List;

import entity.OrderItem;

public interface OrderItemDao {
	public List<OrderItem> query(int oid);
	public boolean removeAll(int oid);
	public boolean add(int oid,String pid,int tid,double price);
}
