package elaundry.domain;

import java.io.Serializable;

public class ItemDummy implements Serializable {
	private int orderId;
	private int itemId;
	private int laundryItemId;
	private int serviceId;
	private String serviceName;
	private String itemName;
	private int quantity;
	private double price;
	private double totalPrice;

	private int sumTotalQuantity;
	private double sumTotalPrice;
	
	public ItemDummy() {
		super();
	}
	
	public ItemDummy(int orderId, int itemId, int serviceId, String serviceName, String itemName, int quantity) {
		this.orderId = orderId;
		this.itemId = itemId;
		this.serviceId = serviceId;
		this.serviceName = serviceName;
		this.itemName = itemName;
		this.quantity = quantity;
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getLaundryItemId() {
		return laundryItemId;
	}

	public void setLaundryItemId(int laundryItemId) {
		this.laundryItemId = laundryItemId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public int getSumTotalQuantity() {
		return sumTotalQuantity;
	}

	public void setSumTotalQuantity(int sumTotalQuantity) {
		this.sumTotalQuantity = sumTotalQuantity;
	}

	public double getSumTotalPrice() {
		return sumTotalPrice;
	}

	public void setSumTotalPrice(double sumTotalPrice) {
		this.sumTotalPrice = sumTotalPrice;
	}
}
