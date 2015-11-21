package elaundry.exception;

public class CustomerNotFoundException extends RuntimeException{
	private static final long serialVersionUID = 9060751397339719682L;
	
	private String message = "Customer not found";
	
	
	public CustomerNotFoundException() {}
	
	public CustomerNotFoundException(String message) {
		if (message != null) this.message = message;		
		
	}
	
	public String getFullMessage() {
		return (message);
	}
	
	
	
}
