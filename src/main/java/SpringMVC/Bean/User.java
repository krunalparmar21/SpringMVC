package SpringMVC.Bean;

import java.io.InputStream;
import java.sql.Date;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Component
@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

	//@Column(nullable = false)
	private String firstname;

	//@Column(nullable = false)
	private String lastname;

	//@Column(nullable = false)
	private String dob;

	//@Column(nullable = false)
	private String mobileno;

	//@Column(nullable = false,unique = true)
	private String email;

	//@Column(nullable = false)
	private String password;

	//@Column(nullable = false)
	private String passwordConfirm;

	//@Column(nullable = false)
	private String gender;

	//@Column(nullable = false)
	private String hobby;

	//@Column(nullable = false)
	
	@Lob
	private byte[] imagebyte;


    //@Column(nullable = true)
	private int status;
    

	@Transient
	private CommonsMultipartFile image;
	@Transient
	private String imageBase64;
	
	@OneToMany(mappedBy = "user",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
	List<Address> address;
	
	
	public void setAddress(List<Address> address) {
		this.address = address;
	}

	public List<Address> getAddress() {
		return address;
	}
	
	public User(int id, String firstname, String lastname, String dob, String mobileno, String email, String password,
			String passwordConfirm, String gender, String hobby, int status) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.mobileno = mobileno;
		this.email = email;
		this.password = password;
		this.passwordConfirm = passwordConfirm;
		this.gender = gender;
		this.hobby = hobby;
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", dob=" + dob + ", mobileno="
				+ mobileno + ", email=" + email + ", password=" + password + ", passwordConfirm=" + passwordConfirm
				+ ", gender=" + gender + ", hobby=" + hobby + ", imagebyte=" + imagebyte.length + ", status="
				+ status + ", imageBase64=" +  getImageBase64().length() + ", address=" + address + "]";
	}
	
	
	public String getImageBase64() {
		return Base64.getEncoder().encodeToString(imagebyte);
	}

	public void setImageBase64(String imageBase64) {
		this.imageBase64 = imageBase64;
	}
	public byte[] getImagebyte() {
		return imagebyte;
	}

	public void setImagebyte(byte[] imagebyte) {
		this.imagebyte = imagebyte;
	}

	public CommonsMultipartFile getImage() {
		return image;
	}

	public void setImage(CommonsMultipartFile image) {
		this.imagebyte = image.getBytes();
		
	}


	public User() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	
	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getMobileno() {
		return mobileno;
	}

	public void setMobileno(String mobileno) {
		this.mobileno = mobileno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}


	public User(int id, String firstname, String lastname, String dob, String mobileno, String email, String password,
			String passwordConfirm, String gender, String hobby, byte[] imagebyte, int status,
			CommonsMultipartFile image, String imageBase64) {
		super();
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.dob = dob;
		this.mobileno = mobileno;
		this.email = email;
		this.password = password;
		this.passwordConfirm = passwordConfirm;
		this.gender = gender;
		this.hobby = hobby;
		this.imagebyte = imagebyte;
		this.status = status;
		this.image = image;
		this.imageBase64 = imageBase64;
	}
		

	
}
