package com.hannahj.resort.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.hannahj.resort.dao.BookingDaoImpl;
import com.hannahj.resort.dao.RoomDaoImpl;
import com.hannahj.resort.domain.Booking;
import com.hannahj.resort.domain.Room;

public class BookingServiceImpl implements BookingService {
	BookingDaoImpl bookDao = new BookingDaoImpl();
	RoomDaoImpl roomDao = new RoomDaoImpl();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	
	@Override
	public void book(Booking booking) {
		bookDao.book(booking);
	}

	@Override
	public void update(Booking booking) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Booking> selectAll(Date startDate, Date endDate) {
		return bookDao.selectAll(sdf.format(startDate), sdf.format(endDate));
	}
	@Override
	public List<Room> roomInfo() {
		return roomDao.selectAll();
	}

	@Override
	public List<Booking> selectMonth(Date startDate) {
		String[] dates = addAMonthToString(startDate);
		bookDao.selectMonth(dates[0], dates[1]);
		return null;
	}

	@Override
	public Booking select(int idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int idx) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String[] addAMonthToString(Date startDate) {
		String[] dates = new String[2];
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		dates[0] = sdf.format(startDate);
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		cal.add(Calendar.MONTH, 1);
		dates[1] = sdf.format(cal.getTime());
		return dates;
	}
		
	public Date toDate(String dateStr) {
		Date date = null;
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
		}
		return date;
	}
	
	public List<Date> getDateList(Date startDate, Date endDate) {
		List<Date> dateList = new ArrayList<Date>() ;
		Calendar cal = Calendar.getInstance();
		cal.setTime(startDate);
		System.out.println(startDate);

		for (Date i = startDate; i.before(endDate); i = cal.getTime()) {
			dateList.add(i);
			cal.add(Calendar.DATE, 1);
		}
		return dateList;
	}
	
	public Map<Date, String[]> getStatus(Date startDate, Date endDate) {
		List<Date> dateList = getDateList(startDate, endDate);
		Map<Date, String[]> bookStatus = new LinkedHashMap<Date, String[]>();
		List<Booking> bookings = selectAll(startDate, endDate);
		
		for (Date date : dateList) {
			String[] bookers = new String[Room.NO_OF_ROOMS];
			for (Booking booking : bookings) {
				if ((booking.getInDate().before(date)
					|| booking.getInDate().equals(date))
						&& (booking.getOutDate().after(date))
						) {
					bookers[booking.getRoomId()-1] = booking.getUserName();
				}
			}
			bookStatus.put(date, bookers);
		}
		return bookStatus;
	}
	
	
//	@SuppressWarnings("deprecation")
	public int getNights(Date startDate, Date endDate) {
		Calendar endCal = Calendar.getInstance();
		endCal.setTime(endDate);
		Calendar startCal = Calendar.getInstance();
		startCal.setTime(startDate);
//		Calendar startCal = new GregorianCalendar(
//				startDate.getYear(), startDate.getMonth(), startDate.getDate());//  
		 
		long diffSec = (endCal.getTimeInMillis() - startCal.getTimeInMillis());
		int diffDays = (int) (diffSec / (24*60*60*1000));
		 
		return diffDays;
	}

}
