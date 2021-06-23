package com.hannahj.resort.service;

import java.util.Date;
import java.util.List;

import com.hannahj.resort.domain.*;

public interface BookingService {
	void book(Booking booking);
	void update(Booking booking);
	List<Booking> selectAll(Date startDate, Date endDate);
	List<Room> roomInfo();
	List<Booking> selectMonth(Date startDate);
	Booking select(int idx);
	void delete(int idx);
	String[] addAMonthToString(Date startDate);
}
