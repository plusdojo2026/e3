package dto;

import java.io.Serializable;

public class MyPageDTO implements Serializable {

	private String userId;
	private String passwordNow;
	private String passwordNew;

	public MyPageDTO(String userId, String passwordNow, String passwordNew) {
		this.userId = userId;
		this.passwordNow = passwordNow;
		this.passwordNew = passwordNew;
	}

	public MyPageDTO() {
		this("", "", "");
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPasswordNow() {
		return passwordNow;
	}

	public void setPasswordNow(String passwordNow) {
		this.passwordNow = passwordNow;
	}

	public String getPasswordNew() {
		return passwordNew;
	}

	public void setPasswordNew(String passwordNew) {
		this.passwordNew = passwordNew;
	}

}
