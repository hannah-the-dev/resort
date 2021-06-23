package com.hannahj.resort.domain;

public class User {
	private String userId;
	private String userPw;
	private String userName;
	private String email;
	private String phone;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUser_pw() {
		return userPw;
	}
	public void setUser_pw(String userPw) {
		this.userPw = userPw;
	}
	public String getUser_name() {
		return userName;
	}
	public void setUser_name(String userName) {
		this.userName = userName;
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
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public User(String userId, String userPw, String userName, String email, String phone) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
	}
}
