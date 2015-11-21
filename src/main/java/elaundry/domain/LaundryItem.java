package elaundry.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "laundryitem")
public class LaundryItem implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="item_id")
	private int itemId;

	private String name;
	private String description;
	private double price;	
	private String status;
	
	@Column(name="service_id")
	private int serviceId;
		
	public int getItemId() { return itemId; }
	public void setItemId(int itemId) { this.itemId = itemId; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getDescription() { return description; }
	public void setDescription(String description) { this.description = description; }
	
	public double getPrice() { return price; }
	public void setPrice(double  price) { this.price = price; }
	
	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }
	
	public int getServiceId() { return serviceId; }
	public void setServiceId(int serviceId) { this.serviceId = serviceId; }
}
