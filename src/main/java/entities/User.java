package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_id")
	private Long userId;
	
	@Column(name="user_name")
	private String name;
	
	@Column(name="user_email")
	private String email;
	
	@Column(name="user_pseudo")
	private String pseudo;
	
	@Column
	private String pdpURL;
	
	public String getPdpURL() {
		return pdpURL;
	}

	public void setPdpURL(String i) {
		this.pdpURL = i;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(name="user_password")
	private String password;
	
	@Column(name="user_phone")
	private String phoneNumber;
	
	public User() {
	}

	public User(String name, String email, String pseudo, String password, String phoneNumber) {
		this.name = name;
		this.email = email;
		this.pseudo = pseudo;
		this.password = password;
		this.phoneNumber = phoneNumber;
	}
	
	public Long getUserId() {
		return userId;
	}

}
