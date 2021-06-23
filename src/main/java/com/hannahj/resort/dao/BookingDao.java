package com.hannahj.resort.dao;

import java.util.List;

import com.hannahj.resort.domain.Booking;

public interface BookingDao {
	void book(Booking booking);
	void update(Booking booking);
	List<Booking> selectAll(String startDate, String endDate);
	List<Booking> selectMonth(String startDate, String endDate);
	Booking select(int idx);
	void delete(int idx);
}
