package elaundry.JMSImp;

import java.util.Date;

public class Log {
	
	public void crud(String str){
		System.out.println("[INFO]--- "+ new Date() + " Called Service method =  " + str );
	}

}
