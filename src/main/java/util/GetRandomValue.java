package util;

import java.util.Date;

public class GetRandomValue {
	private static Long value;
	
	static{
		value = (long) (new Date().getTime()*13.5+Math.random()*782.4);
	}
	
	public static Long getValue() {
		return value;
	}
}
