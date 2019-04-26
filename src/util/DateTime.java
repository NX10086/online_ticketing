package util;

import java.sql.Date;
import java.sql.Time;

public class DateTime {
	private Date date;
	private Time time;
	public DateTime(Date date,Time time) {
		this.date = date;
		this.time = time;
	}
	public DateTime(String dateTime) {
		date = Date.valueOf(dateTime.substring(0, 10));
		time = Time.valueOf(dateTime.substring(11,19));
	}
	public String toString() {
		return date.toString() + " " + time.toString();
	}
}
