package crud.entities;

import java.util.Date;

public class Users {
	private String id;
	private String password;
	private String fullName;
	private Date birthDay;
	private boolean gender;
	private String moble;
	private String email;
	private boolean role;

	public Users() {

	}

	public Users(String id, String password, String fullName, Date birthDay, boolean gender, String moble, String email,
			boolean role) {
		super();
		this.id = id;
		this.password = password;
		this.fullName = fullName;
		this.birthDay = birthDay;
		this.gender = gender;
		this.moble = moble;
		this.email = email;
		this.role = role;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public String getMoble() {
		return moble;
	}

	public void setMoble(String moble) {
		this.moble = moble;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isRole() {
		return role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}
}
