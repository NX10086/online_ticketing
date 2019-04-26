package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.NumberDis;
import util.DBconn;

public class NumberDisDaoImpl implements NumberDisDao{

	public NumberDis queryDisByNum(int num) {
		DBconn.open();
		
		String sql = "select * from number_dis where  num = '"+num+"'";
		ResultSet set =DBconn.select(sql);
		NumberDis dis = new NumberDis();
		try {
			if(set.next()){
				dis.setNum(set.getInt("num"));
				dis.setDiscount(set.getDouble("discount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return dis;
	}

	public boolean UpdateDisByNum(int num, double discount) {
		DBconn.open();
		int  bool = -1;
		
		String sql = "update number_dis set discount = '"+discount+"' where num = '"+num+"'";
		bool=DBconn.update(sql);
	
		DBconn.close();
		return bool>0;
	}

	public boolean InsertNumDis(NumberDis nd) {
		DBconn.open();
		
		String sql = "insert into number_dis(num,discount) values('"+nd.getNum()+"','"+nd.getDiscount()+"')";
		int bool = DBconn.insert(sql);
		DBconn.close();
		return bool>0;
	}
	
	public List<NumberDis> queryAll() {
		DBconn.open();
		List<NumberDis> list = new ArrayList<>();
		String sql = "select * from number_dis";
		ResultSet set = DBconn.select(sql);
		try {
			while(set.next()){
				NumberDis dis = new NumberDis();
				dis.setNum(set.getInt("num"));
				dis.setDiscount(set.getDouble("discount"));
				list.add(dis);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		DBconn.close();
		return list;
	}


}
