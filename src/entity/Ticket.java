package entity;

import java.sql.Date;

public class Ticket {
	private int tid;
	private String bid;
	private Date date;
	private double returnablePrice;
	private double unReturnablePrice;
	private int rem;
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public double getReturnablePrice() {
		return returnablePrice;
	}
	public void setReturnablePrice(double returnablePrice) {
		this.returnablePrice = returnablePrice;
	}
	public double getUnReturnablePrice() {
		return unReturnablePrice;
	}
	public void setUnReturnablePrice(double unReturnablePrice) {
		this.unReturnablePrice = unReturnablePrice;
	}
	public int getRem() {
		return rem;
	}
	public void setRem(int rem) {
		this.rem = rem;
	}
	
}
