package elaundry.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.validator.constraints.NotEmpty;

@Entity(name = "laundryservice")
public class LaundryService {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="service_id")
	private int serviceId;

	@NotEmpty(message = "{Pattern.LaundryService.Name.NotEmpty}")
	private String name;
	
	private String status;
	
	public int getServiceId() { return serviceId; }
	public void setServiceId(int serviceId) { this.serviceId = serviceId; }
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public String getStatus() { return status; }
	public void setStatus(String status) { this.status = status; }
}
