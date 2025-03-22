package crud.entities;

public class Newsletters {
	private String email;
	private boolean enabled;
	
	public Newsletters() {

	}

	
	public Newsletters(String email, boolean enabled) {
		super();
		this.email = email;
		this.enabled = enabled;
	}


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
}
