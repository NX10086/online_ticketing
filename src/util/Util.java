package util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Util {
public static String getSeason(int n){
	String ret="";
	switch(n){
	case 1:
		ret="´º¼¾";
		break;
	case 2:
		ret="ÏÄ¼¾";
		break;
	case 3:
		ret="Çï¼¾";
		break;
	case 4:
		ret="¶¬¼¾";
		break;
	}
	return ret;
}
public static String getFetureDate(int past) {  
    Calendar calendar = Calendar.getInstance();  
    calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) + past);  
    Date today = calendar.getTime();  
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
    String result = format.format(today);  
    return result;  
}  
}
