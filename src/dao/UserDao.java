package dao;

import java.util.ArrayList;

import entity.Passenger;
import entity.User;

public interface UserDao {
	public boolean login(String name,String pwd);
	public boolean register(User user,Passenger passenger);
	public boolean update(User user,Passenger pasenger);
	public boolean add(User user);
	public boolean purchase(ArrayList<Passenger> list,int isReturnable,int tid,int uid);
	public User getUserByUname(String uname);
}