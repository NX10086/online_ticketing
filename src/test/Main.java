package test;

import java.sql.Date;
import java.util.List;

import dao.OrderDaoImpl;
import dao.TypeDisDao;
import dao.TypeDisDaoImpl;
import dao.UserDao;
import dao.UserDaoImpl;
import entity.Order;
import entity.Passenger;
import entity.TypeDis;
import entity.User;
import util.DateTime;

public class Main {

	public static void main(String[] args) {
		List<Order> myList = null;
		OrderDaoImpl orderDaoImpl = new OrderDaoImpl();
		String source = "ÄÏ¾©";
		String dest = "Ìì½ò";
		Date date = Date.valueOf("2018-12-28");
		int uid = 1;
		
		myList = orderDaoImpl.queryAll(uid, source, dest, date);
		System.out.println(myList.size());
		for(Order order:myList) {
			System.out.println(order.getTotalPrice());
		}
	}

}
