package dao;

import java.util.List;

import entity.NumberDis;

public interface NumberDisDao {
	public NumberDis queryDisByNum(int num);

	public boolean UpdateDisByNum(int num,double discount);

	public boolean InsertNumDis(NumberDis nd); 
	public List<NumberDis> queryAll();
}
