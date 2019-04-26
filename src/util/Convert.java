package util;

public class Convert {
	public static String convert(int year,int month,int day) {
		String y = String.valueOf(year);
		String m = String.valueOf(month);
		String d = String.valueOf(day);
		if(m.length() < 2) m = "0" + m;
		if(d.length() < 2) d = "0" + d;
		return y + m + d;
	}
}
