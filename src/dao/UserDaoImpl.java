package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import entity.NumberDis;
import entity.Order;
import entity.OrderItem;
import entity.Passenger;
import entity.SeasonDis;
import entity.Ticket;
import entity.TypeDis;
import entity.User;
import util.DBconn;
import util.DateTime;

public class UserDaoImpl implements UserDao {

	public boolean login(String name, String pwd) {
		boolean flag = false;
		DBconn.open();
		String sql = "select passwd from user where uname = '" + name + "'";
		ResultSet rs = DBconn.select(sql);
		try {
			while(rs.next()) {
				flag = true;
				break;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return flag;
	}

	public boolean register(User user, Passenger passenger) {
		PassengerDao pd = new PassengerDaoImpl();
		boolean passenger_row = pd.add(passenger);
		int uid = user.getUid();
		String pid = user.getPid();
		String mail = user.getPasswd();
		String phone = user.getPhone();
		String uname = user.getUname();
		String passwd = user.getPasswd();
		String sql = "insert into user values('" + uid + "','" + pid + "','" + mail + "','" + phone
				+ "','" + uname + "','" + passwd + "');";
		DBconn.open();
		int user_row = 0;
		user_row = DBconn.insert(sql);
		DBconn.close();
		
		
		
		return (user_row > 0) && passenger_row;
	}

	public boolean update(User user, Passenger passenger) {
		PassengerDao pd = new PassengerDaoImpl();
		boolean passenger_row = pd.update(passenger);
		int uid = user.getUid();
		String mail = user.getPasswd();
		String phone = user.getPhone();
		String uname = user.getUname();
		String passwd = user.getPasswd();
		String sql = "update user set " +  "mail = '" + mail
				+ "',phone = '" + phone + "',uname = '" + uname + "',passwd = '" + passwd + "' where "
				+ "uid = '" + uid + "';";
		
		DBconn.open();
		int user_row = 0;
		user_row = DBconn.update(sql);
		DBconn.close();
		
		
		
		return (user_row > 0) && passenger_row;
	}

	public boolean add(User user) {
		int row = 0;
		String pid = user.getPid();
		String mail = user.getMail();
		String passwd = user.getPasswd();
		String phone = user.getPhone();
		String uname = user.getUname();
		String sql = "insert into user(pid,mail,phone,uname,passwd) values('" + pid + "','" + 
				mail + "','" + phone + "','" + uname + "','" + passwd + "');";
		DBconn.open();
		row = DBconn.insert(sql);
		DBconn.close();
		
		return (row > 0);
	}

	public User getUserByUname(String uname) {
		User user = new User();
		String sql = "select * from user where uname = '" + uname + "';";
		ResultSet rs = null;
		DBconn.open();
		rs = DBconn.select(sql);
		try {
			if(rs.next()) {
				int uid = rs.getInt("uid");
				String pid = rs.getString("pid");
				String mail = rs.getString("mail");
				String phone = rs.getString("phone");
				String pwd = rs.getString("passwd");
				user.setMail(mail);
				user.setPasswd(pwd);
				user.setPhone(phone);
				user.setPid(pid);
				user.setUid(uid);
				user.setUname(uname);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		
		return user;
	}

	public boolean purchase(ArrayList<Passenger> list,int isReturnable,int tid,int uid) {
		double totalPrice = 0.0;
		Ticket ticket = new TicketDaoImpl().queryById(tid);
		ArrayList<OrderItem> buffer = new ArrayList<OrderItem>();
		double originPrice = 0;
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentDate = df.format(new Date());
		DateTime date = new DateTime(currentDate);
		int month = Integer.parseInt(currentDate.substring(5, 7));
		int s = month%4;
		String currentSeason = null;
		if(s == 0) currentSeason = "´º";
		else if(s == 1) currentSeason = "ÏÄ";
		else if(s == 2) currentSeason = "Çï";
		else currentSeason = "¶¬";
		SeasonDis seasonDis = new SeasonDisDaoImpl().queryDisBySeanson(currentSeason);
		
		double disSeason = seasonDis.getDiscount();
		int size = list.size();
		NumberDis numberDis = null;
		double disCount = 0;
		NumberDisDao nd = new NumberDisDaoImpl();
		if(size >= 3 && size < 5) numberDis = nd.queryDisByNum(3);
		else if(size < 8) numberDis = nd.queryDisByNum(5);
		else if(size >= 8) numberDis = nd.queryDisByNum(8);
		disCount = numberDis.getDiscount();
		
		if(isReturnable == 1) {
			originPrice = ticket.getReturnablePrice();
		} else {
			originPrice = ticket.getUnReturnablePrice();
		}
		Order order = new Order();
		for(Passenger passenger:list) {
			String pid = passenger.getPid();
			String type = passenger.getType();
			TypeDisDao td = new TypeDisDaoImpl();
			TypeDis typeDis = td.queryDisByType(type);
			double disType = typeDis.getDiscount();
			totalPrice += originPrice * disType * disSeason * disCount;
			
			OrderItem orderItem = new OrderItem();
			orderItem.setPid(pid);
			orderItem.setPrice(originPrice*disType*disSeason*disCount);
			orderItem.setTid(tid);
			buffer.add(orderItem);
		}
		order.setDate(date);
		order.setReturnable(isReturnable);
		order.setTotalPrice(totalPrice);
		order.setUid(uid);
		OrderDao od = new OrderDaoImpl();
		
		od.add(order);
		int oid = od.queryByDateUid(date.toString(), uid);
		OrderItemDao odd = new OrderItemDaoImpl();
		for(OrderItem orderItem:buffer) {
			odd.add(oid,orderItem.getPid(), orderItem.getTid(), orderItem.getPrice());
		}
		return true;
	}

	

}
