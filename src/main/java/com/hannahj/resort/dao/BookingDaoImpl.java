package com.hannahj.resort.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.hannahj.resort.domain.Booking;
import com.hannahj.resort.domain.BookingColumns;

public class BookingDaoImpl implements BookingDao{
	String query;
	ResultSet rset;
	
	public BookingDaoImpl() {
	}
	
	@Override
	//this method must be done after checking availability
	public void book(Booking booking) {
		try (Connection conn = ConnectionPool.getConnection()) {
			query = "insert into booking values ("
					+ "?, ?, ?, ?, ?, ?, ?, ?, ?, null, ?);";
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setDate(BookingColumns.IN_DATE.order, booking.getInDate());
			stmt.setDate(BookingColumns.OUT_DATE.order, booking.getOutDate());
			stmt.setInt(BookingColumns.ROOM_ID.order, booking.getRoomId());
			stmt.setLong(BookingColumns.PRICE.order, booking.getPrice());
			stmt.setBoolean(BookingColumns.MEMBER.order, booking.isMember());
			stmt.setString(BookingColumns.USER_ID.order, booking.getUserId());
			stmt.setString(BookingColumns.USER_NAME.order, booking.getUserName());
			stmt.setString(BookingColumns.EMAIL.order, booking.getEmail());
			stmt.setString(BookingColumns.PHONE.order, booking.getPhone());
			stmt.setBoolean(BookingColumns.PAID.order, booking.isPaid());
			stmt.setString(BookingColumns.MSG.order, booking.getMsg());
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	//this method must be done after checking availability
	public void update(Booking booking) {
		try (Connection conn = ConnectionPool.getConnection()) {
			query = String.format(
					"update booking set "
					+ "%s = ?, %s = ?, %s = ?, %s = ?, "
					+ "%s = ?, %s = ?, %s = ?, %s = ? "
					+ "where idx = ?;", 
					BookingColumns.IN_DATE.column,
					BookingColumns.OUT_DATE.column,
					BookingColumns.ROOM_ID.column,
					BookingColumns.USER_NAME.column,
					BookingColumns.EMAIL.column,
					BookingColumns.PHONE.column,
					BookingColumns.PAID.column,
					BookingColumns.MSG.column,
					BookingColumns.IDX.column
					);
			PreparedStatement stmt = conn.prepareStatement(query);
			
			stmt.setDate(1, booking.getInDate());
			stmt.setDate(2, booking.getOutDate());
			stmt.setInt(3, booking.getRoomId());
			stmt.setString(4, booking.getUserName());
			stmt.setString(5, booking.getEmail());
			stmt.setString(6, booking.getPhone());
			stmt.setBoolean(7, booking.isPaid());
			stmt.setString(8, booking.getMsg());
			stmt.setString(9, booking.getMsg());
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Booking> selectAll(String startDate, String endDate) {
		List<Booking> bookings = new ArrayList<Booking>();
		try (Connection conn = ConnectionPool.getConnection()) {
			query = String.format("select * from booking "
					+ "where in_date between %s and %s "
					+ "or out_date between %s and %s;",
					startDate, endDate, startDate, endDate);	
			Statement stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while (rset.next()) {
				Booking booking = new Booking(
				rset.getDate(BookingColumns.IN_DATE.order),
				rset.getDate(BookingColumns.OUT_DATE.order),
				rset.getInt(BookingColumns.ROOM_ID.order),
				rset.getLong(BookingColumns.PRICE.order),
				rset.getBoolean(BookingColumns.MEMBER.order),
				rset.getString(BookingColumns.USER_ID.order),
				rset.getString(BookingColumns.USER_NAME.order),
				rset.getString(BookingColumns.EMAIL.order),
				rset.getString(BookingColumns.PHONE.order),
				rset.getBoolean(BookingColumns.PAID.order),
				rset.getString(BookingColumns.MSG.order),
				rset.getInt(BookingColumns.IDX.order)
				);
				bookings.add(booking);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings;
	}

	@SuppressWarnings("null")
	@Override
	public Booking select(int idx) {
		Booking booking = null;
		try (Connection conn = ConnectionPool.getConnection()) {
			query = String.format("select * from booking where idx=%s;", idx);	
			Statement stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			rset.next();
				booking.setInDate(rset.getDate(BookingColumns.IN_DATE.order));
				booking.setInDate(rset.getDate(BookingColumns.OUT_DATE.order));
				booking.setRoomId(rset.getInt(BookingColumns.ROOM_ID.order));
				booking.setPrice(rset.getLong(BookingColumns.PRICE.order));
				booking.setMember(rset.getBoolean(BookingColumns.MEMBER.order));
				booking.setUserId(rset.getString(BookingColumns.USER_ID.order));
				booking.setUserName(rset.getString(BookingColumns.USER_NAME.order));
				booking.setEmail(rset.getString(BookingColumns.EMAIL.order));
				booking.setPhone(rset.getString(BookingColumns.PHONE.order));
				booking.setPaid(rset.getBoolean(BookingColumns.PAID.order));
				booking.setMsg(rset.getString(BookingColumns.MSG.order));
				booking.setIdx(rset.getInt(BookingColumns.IDX.order));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return booking;
	}

	@Override
	public void delete(int idx) {
		try (Connection conn = ConnectionPool.getConnection()) {
			query = String.format("delete from booking where idx=%s;", idx);		
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Booking> selectMonth(String startDate, String endDate) {
		List<Booking> bookings = new ArrayList<Booking>();
		try (Connection conn = ConnectionPool.getConnection()) {
			query = String.format("select * from booking "
					+ "where in_date between %s and %s "
					+ "or out_date between %s and %s;",
					startDate, endDate, startDate, endDate);	
			Statement stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while (rset.next()) {
				Booking booking = new Booking(
				rset.getDate(BookingColumns.IN_DATE.order),
				rset.getDate(BookingColumns.OUT_DATE.order),
				rset.getInt(BookingColumns.ROOM_ID.order),
				rset.getLong(BookingColumns.PRICE.order),
				rset.getBoolean(BookingColumns.MEMBER.order),
				rset.getString(BookingColumns.USER_ID.order),
				rset.getString(BookingColumns.USER_NAME.order),
				rset.getString(BookingColumns.EMAIL.order),
				rset.getString(BookingColumns.PHONE.order),
				rset.getBoolean(BookingColumns.PAID.order),
				rset.getString(BookingColumns.MSG.order),
				rset.getInt(BookingColumns.IDX.order)
				);
				bookings.add(booking);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookings;
	}
}
