package elaundry.service;

import java.util.List;

import elaundry.domain.LaundryItem;

public interface LaundryItemService {
	void addLaundryItem(LaundryItem item);
	LaundryItem getLaundryItemById(int id);
	List<LaundryItem> getLaundryItems();
	List<LaundryItem> getLaundryItemsByServiceId(int serviceId);
}
