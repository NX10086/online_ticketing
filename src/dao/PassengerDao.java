package dao;

import entity.Passenger;

public interface PassengerDao {
	public boolean add(Passenger passenger);
	public boolean update(Passenger passenger);
	public Passenger queryPassengerById(String pid);
}
