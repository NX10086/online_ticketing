package dao;

import java.sql.Date;
import java.util.List;

import entity.Order;

public interface OrderDao {
	public List<Order> queryAll(int uid,String source,String dest,Date date);
	public List<Order> queryUnreturnable(int uid,String source,String dest,Date date);
	public List<Order> queryReturnable(int uid,String source,String dest,Date date);
	public Order queryById(int oid);
	public int queryByDateUid(String date,int uid);
	public double yearSummary(int year);
	public double seasonSummary(int year,int season);
	public double monthSummary(int year,int month);
	public double daySummary(int year,int month,int day);
	public boolean add(Order order);
	public boolean remove(int oid);
}
