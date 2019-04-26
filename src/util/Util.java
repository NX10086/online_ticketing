package util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Util {
public static String getSeason(int n){
	String ret="";
	switch(n){
	case 1:
		ret="����";
		break;
	case 2:
		ret="�ļ�";
		break;
	case 3:
		ret="�＾";
		break;
	case 4:
		ret="����";
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
