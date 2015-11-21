package elaundry.domain;

import java.io.Serializable;
import java.util.List;

public class OrderDummy implements Serializable{
	private int orderId;
	private String orderDate;
	private String expDeliveryDate;
	private String actDeliveryDate;
	private double totalPrice;
	private String orderStatus;
	private int customerId;
	private String customerName;
	
	private String itemList;
	
	private List<OrderItem> orderItems;
	
	public String getItemList() { return itemList; }
	public void setItemList(String itemList) { this.itemList = itemList; }
	
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
	
	public double getTotalPrice() { return totalPrice; }
	public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }
	
	public List<OrderItem> getOrderItems() { return orderItems; }
	public void setOrderItems(List<OrderItem> orderItems) { this.orderItems = orderItems; }
	
	public int getCustomerId() { return customerId; }
	public void setCustomerId(int customerId) { this.customerId = customerId; }
	
	public String getCustomerName() { return customerName; }
	public void setCustomerName(String customerName) { this.customerName = customerName; }
}
