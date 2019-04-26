package entity;


import util.DateTime;

public class Order {
	private int oid;
	private double totalPrice;
	private int uid;
	private DateTime date;
	private int returnable;
	public int getReturnable() {
		return returnable;
	}
	public void setReturnable(int returnable) {
		this.returnable = returnable;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public DateTime getDate() {
		return date;
	}
	public void setDate(DateTime date) {
		this.date = date;
	}
	public String toString() {
		return oid + " " + totalPrice + " " + uid + " " + date.toString() + " " + returnable;
	}
	
}
