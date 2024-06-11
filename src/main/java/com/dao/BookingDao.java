package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.bean.Booking;
import com.bean.Car;
import com.util.UserUtil;

public class BookingDao {
	public static void addBooking(Booking b) {
		try {
			Connection conn=UserUtil.getConnect();
			String sql="insert into booking(uid, cid, from_date, to_date, document, payment_status, total_amt, booking_status) values (?,?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, b.getUid());
			pst.setInt(2, b.getCid());
			pst.setString(3, b.getFrom_date());
			pst.setString(4, b.getTo_date());
			pst.setString(5, b.getDocument());
			pst.setString(6, b.getPayment_status());
			pst.setInt(7, b.getTotal_amt());
			pst.setString(8, b.getBooking_status());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<Booking> GetAllBooking(int uid) {
	    List<Booking> list = new ArrayList<Booking>();
	    try {
	        Connection conn = UserUtil.getConnect();
	        String sql = "select * from booking where uid=?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setInt(1, uid);
	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            Booking b=new Booking();
	            b.setBid(rs.getInt("bid"));
	            b.setCid(rs.getInt("cid"));
	            b.setUid(rs.getInt("uid"));
	            b.setDocument(rs.getString("document"));
	            b.setFrom_date(rs.getString("from_date"));
	            b.setTo_date(rs.getString("to_date"));
	            b.setPayment_status(rs.getString("payment_status"));
	            b.setTotal_amt(rs.getInt("total_amt"));
	            b.setBooking_status(rs.getString("booking_status"));
	            list.add(b);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	public static Booking Get_Specific_Booking(int bid) {
		Booking b=null;
	    try {
	        Connection conn = UserUtil.getConnect();
	        String sql = "select * from booking where bid=?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setInt(1, bid);
	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            b=new Booking();
	            b.setBid(rs.getInt("bid"));
	            b.setCid(rs.getInt("cid"));
	            b.setUid(rs.getInt("uid"));
	            b.setDocument(rs.getString("document"));
	            b.setFrom_date(rs.getString("from_date"));
	            b.setTo_date(rs.getString("to_date"));
	            b.setPayment_status(rs.getString("payment_status"));
	            b.setTotal_amt(rs.getInt("total_amt"));
	            b.setBooking_status(rs.getString("booking_status"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return b;
	}
	
	public static void updatePaymentStatus(int bid) {
		String payment_status="Paid";
		try {
			Connection conn = UserUtil.getConnect();
	        String sql = "update booking set payment_status=? where bid=?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setString(1, payment_status);
	        pst.setInt(2, bid);
	        pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<Booking> SpecificBookingOwner(int uid) {
		List<Booking> list = new ArrayList<Booking>();
	    try {
	        Connection conn = UserUtil.getConnect();
	        String sql = "Select * from booking b inner join car_table c on b.cid = c.cid where c.uid = ?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setInt(1, uid);
	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            Booking b = new Booking();
	            b.setBid(rs.getInt("bid"));
	            b.setCid(rs.getInt("cid"));
	            b.setUid(rs.getInt("uid"));
	            b.setDocument(rs.getString("document"));
	            b.setFrom_date(rs.getString("from_date"));
	            b.setTo_date(rs.getString("to_date"));
	            b.setPayment_status(rs.getString("payment_status"));
	            b.setTotal_amt(rs.getInt("total_amt"));
	            b.setBooking_status(rs.getString("booking_status"));
	            list.add(b);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	public static void updateBookingStatus(int bid) {
		String booking_status="Confirm";
		try {
			Connection conn = UserUtil.getConnect();
	        String sql = "update booking set booking_status=? where bid=?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setString(1, booking_status);
	        pst.setInt(2, bid);
	        pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
