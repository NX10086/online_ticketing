package entity;

public class OrderItem {
	private int oiid;
	private int oid;
	private int tid;
	private String pid;
	private double price;
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public int getOiid() {
		return oiid;
	}
	public void setOiid(int oiid) {
		this.oiid = oiid;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
