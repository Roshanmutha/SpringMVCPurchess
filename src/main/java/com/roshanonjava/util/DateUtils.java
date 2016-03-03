package com.roshanonjava.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	public static Date convertToDate(String dateString) throws ParseException {
		// TODO Auto-generated method stub

		DateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
		return formatter1.parse(dateString);

	}

	public static String convertFromDate(Date date) {
		// TODO Auto-generated method stub
		String dateString = new SimpleDateFormat("yyyy-MM-dd").format(date);
		return dateString;
	}

}
