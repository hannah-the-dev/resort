package com.hannahj.resort.domain;

import java.sql.Date;

public class Booking {
	private Date inDate; 	//editable
	private Date outDate; 	//editable
	private int roomId; 	//editable
	private Long price; 
	private boolean member;
	private String userId;
	private String userName;//editable
	private String email;	//editable
	private String phone;	//editable
	private boolean paid;	//editable
	private String msg;		//editable
	private int idx; 	
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public Date getOutDate() {
		return outDate;
	}
	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public boolean isMember() {
		return member;
	}
	public void setMember(boolean member) {
		this.member = member;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
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
	public boolean isPaid() {
		return paid;
	}
	public void setPaid(boolean paid) {
		this.paid = paid;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	/**
	 * this constructor is for non-member only
	 */
	public Booking(Date inDate, Date outDate, int roomId, Long price, String userName,
			String email, String phone, boolean paid, String msg, int idx) {
		super();
		this.inDate = inDate;
		this.outDate = outDate;
		this.roomId = roomId;
		this.price = price;
		this.member = false;
		this.userName = userName;
		this.email = email;
		this.phone = phone;
		this.paid = paid;
		this.msg = msg;
		this.idx = idx;
	}
	
	/**
	 * this constructor is for member only
	 */
	public Booking(Date inDate, Date outDate, int roomId, Long price, String userId, String userName,
			String email, String phone, boolean paid, String msg, int idx) {
		this(inDate, outDate, roomId, price, userName, email, phone, paid, msg, idx);
		this.member = true;
		this.userId = userId;
	}

public Booking(Date inDate, Date outDate, int roomId, Long price, boolean member, String userId, String userName,
			String email, String phone, boolean paid, String msg, int idx) {
		this(inDate, outDate, roomId, price, userId, userName, email, phone, paid, msg, idx);
		this.member = member;
	}
	
	
}
