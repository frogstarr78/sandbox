import java.util.*;
import java.text.*;
class TimeTest
{ 
	public static void main(String args[])
	{
		Date now = new Date();
		DateFormat df = DateFormat.getDateInstance();
		Calendar cal = Calendar.getInstance();
		System.out.println("\n TIME ZONE :"+ cal.getTimeZone().getDisplayName());
		long nowLong = now.getTime();
		String s = now.toString();
		System.out.println("Value of milliseconds  since Epoch is " + nowLong);
		System.out.println("Value of s  in readable format is " + s);

	}
}
