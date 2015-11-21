package elaundry.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import elaundry.domain.LaundryItem;
import elaundry.domain.LaundryService;
import elaundry.service.LaundryItemService;
import elaundry.service.LaundryServiceService;

@Controller
@RequestMapping("services")
public class LaundryServiceController {
	
	@Autowired
	private LaundryServiceService laundryServiceService;
	
	@Autowired
	private LaundryItemService laundryItemService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String LoadService(Model model, HttpServletRequest request) {
		request.setAttribute("selectedService", new LaundryService());
		model.addAttribute("services", laundryServiceService.getLaundryServcies());
		return "serviceAndItem";
	}
	
	@RequestMapping(value = "/items/{serviceId}", method = RequestMethod.GET)
	public @ResponseBody List<LaundryItem> getLaundryItemsByServiceId(@PathVariable(value = "serviceId") int serviceId) {
		return laundryItemService.getLaundryItemsByServiceId(serviceId);
	}
	
	@RequestMapping(value = "/item/{itemId}", method = RequestMethod.GET)
	public @ResponseBody LaundryItem getLaundryItemById(@PathVariable(value = "itemId") int itemId) {
		return laundryItemService.getLaundryItemById(itemId);
	}
}
