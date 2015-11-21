package elaundry.domain;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.validation.Valid;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@XmlRootElement
@Entity(name="customer")
public class Customer {
	
	@Id
	private int id;
	
	@NotEmpty
	@Size(min=4, max=50)
	private String firstName;
	private String middleName;
	@NotEmpty
	private String lastName;
	/*@NotNull
 	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date dateOfBirth;*/
	@NotEmpty
	String dateOfBirth;
	@NotEmpty
	@Email
	private String email;
	@NotEmpty
	@Pattern(regexp="\\(?([0-9]{3})\\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$", message="Invalid phone format")
	private String phone;
	private String gender;
	@Valid
	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Address address;

	@OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private User users;
	
	public User getUser() {
		return users;
	}

	public void setUser(User user) {
		this.users = user;
	}

	public Customer() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

}
