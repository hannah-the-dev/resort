package com.hannahj.resort.domain;

public enum BookingColumns {
	IN_DATE	(1, "in_date", "Check-in"),
	OUT_DATE(2, "out_date", "Check-out"),
	ROOM_ID	(3, "room_id", "Room"), 
	PRICE	(4, "price", "Room Price(USD)"), 
	MEMBER	(5, "member", "Member"), 
	USER_ID	(6, "user_id", "ID"), 
	USER_NAME(7, "user_name", "Name"),
	EMAIL	(8, "email", "e-mail"),
	PHONE	(9, "phone", "Contact"),
	PAID	(10, "paid", "Payment"),
	MSG		(11, "msg", "Message"),
	IDX		(12, "idx", "Reservation Code");
	public final int order;
	public final String column;
	public final String alias;
	
	private BookingColumns(int order, String column, String alias) {
		this.order = order;
		this.column = column;
		this.alias = alias;
		// TODO Auto-generated constructor stub
	}
	
	public static int getOrder(BookingColumns item) {
		return item.order;
	}
	
	public static String getColumn(BookingColumns item) {
		return item.alias;
	}
}
