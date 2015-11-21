package elaundry.serviceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import elaundry.domain.LaundryItem;
import elaundry.repository.LaundryItemRepository;
import elaundry.service.LaundryItemService;

@Service
@Transactional
public class LaundryItemServiceImpl implements LaundryItemService {

	@Autowired
	private LaundryItemRepository laundryItemRepository;
	
	public void addLaundryItem(LaundryItem item) {
		laundryItemRepository.save(item);
	}

	public LaundryItem getLaundryItemById(int id) {
		return laundryItemRepository.findOne(id);
	}

	public List<LaundryItem> getLaundryItems() {
		return (List<LaundryItem>)laundryItemRepository.findAll();
	}
	
	public List<LaundryItem> getLaundryItemsByServiceId(int serviceId) {
		return laundryItemRepository.getLaundryItemsByServiceId(serviceId);
	}
}
