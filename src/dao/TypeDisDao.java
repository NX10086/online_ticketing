package dao;

import java.util.List;

import entity.TypeDis;

public interface TypeDisDao {
	public TypeDis queryDisByType(String type);

	public boolean UpdateDisByType(String type,double discount);
	public List<TypeDis> queryAll();

	public boolean InsertTypeDis(TypeDis td); 
}
