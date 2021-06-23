package com.hannahj.resort.dao;

import java.util.List;

import com.hannahj.resort.domain.Room;

public interface RoomDao {
//	void book(Booking booking);
//	void update(Booking booking);
	List<Room> selectAll();
//	List<Booking> selectMonth(String startDate, String endDate);
//	Booking select(int idx);
//	void delete(int idx);
}
