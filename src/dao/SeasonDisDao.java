package dao;

import java.util.List;

import entity.SeasonDis;

public interface SeasonDisDao {
	public SeasonDis queryDisBySeanson(String season);

	public boolean UpdateDisBySeanson(String season,double discount);

	public boolean InsertSeansonDis(SeasonDis sd); 
	public List<SeasonDis> queryAll();
}
