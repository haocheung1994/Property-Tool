package com.job.utils;

import java.text.SimpleDateFormat;
import java.util.Date;


public class GetLocalTimes
{
	public static String getNowTime()
	{
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return dateFormat.format(now);
	}
}
