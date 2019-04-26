package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import entity.TypeDis;
import util.DBconn;

public class TypeDisDaoImpl implements TypeDisDao{

	public TypeDis queryDisByType(String type) {
		DBconn.open();
		
		String sql = "select * from type_dis where type = '"+type+"'";
		ResultSet set =DBconn.select(sql);
		TypeDis dis = new TypeDis();
		try {
			if(set.next()){
				dis.setType(set.getString("type"));
				dis.setDiscount(set.getDouble("discount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return dis;
	}

	public boolean UpdateDisByType(String type, double discount) {
		DBconn.open();
		int  bool= -1;
		
		String sql = "update type_dis set discount = '"+discount+"' where type = '"+type+"'";
		bool=DBconn.update(sql);
	
		DBconn.close();
		return bool>0;
	}

	public boolean InsertTypeDis(TypeDis td) {
		DBconn.open();
		
		String sql = "insert into type_dis(type,discount) values('"+td.getType()+"','"+td.getDiscount()+"')";
		int bool = DBconn.insert(sql);
		DBconn.close();
		return bool>0;
	}

	@Override
	public List<TypeDis> queryAll() {
		DBconn.open();
		List<TypeDis> list = new ArrayList<>();
		String sql = "select * from type_dis";
		ResultSet set = DBconn.select(sql);
		try {
			while(set.next()){
				TypeDis dis = new TypeDis();
				dis.setType(set.getString("type"));
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
