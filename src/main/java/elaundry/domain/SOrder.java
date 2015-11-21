package elaundry.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "serviceorder")
public class SOrder implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="sorder_id")
	private int orderId;
	
	private String orderDate;
	private String expDeliveryDate;
	private String actDeliveryDate;
	private String orderStatus;
	private String customerName;
	private double price;
	
	public double getPrice() { return price; }
	public void setPrice(double price) { this.price = price; }
	
	public int getOrderId() { return orderId; }
	public void setOrderId(int orderId) { this.orderId = orderId; }
	
	public String getOrderDate() { return orderDate; }
	public void setOrderDate(String orderDate) { this.orderDate = orderDate; }

	public String getExpDeliveryDate() { return expDeliveryDate; }
	public void setExpDeliveryDate(String expDeliveryDate) { this.expDeliveryDate = expDeliveryDate; }
	
	public String getActDeliveryDate() { return actDeliveryDate; }
	public void setActDeliveryDate(String actDeliveryDate) { this.actDeliveryDate = actDeliveryDate; }
	
	public String getOrderStatus() { return orderStatus; }
	public void setOrderStatus(String orderStatus) { this.orderStatus = orderStatus; }
	
	public String getCustomerName() { return customerName; }
	public void setCustomerName(String customerName) { this.customerName = customerName; }
}