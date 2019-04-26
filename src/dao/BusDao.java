package dao;



import java.util.List;

import entity.Bus;

public interface BusDao {
	public Bus queryAllBybid (String bid);


	public boolean updateBybid(String bid,Bus bus);

	public boolean insertBus(Bus bus);

	public boolean deleteBus(String bid);
	
	public List<Bus> queryAllBySourAndDest(String source,String dest);


}
