package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.SeasonDis;
import util.DBconn;

public class SeasonDisDaoImpl implements SeasonDisDao{

	public SeasonDis queryDisBySeanson(String season) {
		DBconn.open();
		
		String sql = "select * from season_dis where season = '"+season+"'";
		ResultSet set =DBconn.select(sql);
		SeasonDis dis = new SeasonDis();
		try {
			if(set.next()){
				dis.setSeason(set.getString("season"));
				dis.setDiscount(set.getDouble("discount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBconn.close();
		return dis;
		
	}
	
	public List<SeasonDis> queryAll() {
		DBconn.open();
		List<SeasonDis> list = new ArrayList<SeasonDis>();
		String sql = "select * from season_dis";
		ResultSet set = DBconn.select(sql);
		try {
			while(set.next()){
				SeasonDis dis = new SeasonDis();
				dis.setSeason(set.getString("season"));
				dis.setDiscount(set.getDouble("discount"));
				list.add(dis);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		DBconn.close();
		return list;
	}


	public boolean UpdateDisBySeanson(String season, double discount) {
		DBconn.open();
		int  bool= -1;
		String sql = "update season_dis set discount = '"+discount+"' where season = '"+season+"'";
		bool=DBconn.update(sql);
		
		DBconn.close();
		return bool>0;
	}

	public boolean InsertSeansonDis(SeasonDis sd) {
		DBconn.open();
		
		String sql = "insert into season_dis(season,discount) values('"+sd.getSeason()+"','"+sd.getDiscount()+"')";
		int bool = DBconn.insert(sql);
		DBconn.close();
		return bool>0;
	}

}
