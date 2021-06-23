package com.hannahj.resort.domain;

public class Room {
	private int roomId;
	private String roomName;
	private Long defPrice;
	public static final int NO_OF_ROOMS = 3;
	
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}	
	public Long getDefPrice() {
		return defPrice;
	}
	public void setDefPrice(Long defPrice) {
		this.defPrice = defPrice;
	}

	public Room(int roomId) {
		this.roomId = roomId;
	}
	/**
	 * @param roomId: auto increment at DB
	 * @param roomName 
	 * @param defPrice: default price in USD
	 */
	public Room(int roomId, String roomName, Long defPrice) {
		this(roomId);
		this.roomName = roomName;
		this.defPrice = defPrice;
	}
	
}
