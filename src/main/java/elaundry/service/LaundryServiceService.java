package elaundry.service;

import java.util.List;
import elaundry.domain.LaundryService;

public interface LaundryServiceService {
	void addLaundryService(LaundryService service);
	LaundryService getLaundryServiceById(int id);
	List<LaundryService> getLaundryServcies();
}
