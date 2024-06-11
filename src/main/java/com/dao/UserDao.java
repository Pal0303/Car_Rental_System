package com.dao;

import java.sql.*;

import com.bean.Car;
import com.bean.UserBean;
import com.util.UserUtil;

public class UserDao {
	public static void Signup_User(UserBean u){
		try {
			Connection conn=UserUtil.getConnect();
			String sql="insert into user(name, email, address, mobile, usertype, password) values(?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, u.getName());
			pst.setString(2, u.getEmail());
			pst.setString(3, u.getAddress());
			pst.setLong(4, u.getMobile());
			pst.setString(5, u.getUsertype());
			pst.setString(6, u.getPassword());
			pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static boolean checkEmail(String email) {
		boolean flag=false;
		try {
			Connection conn=UserUtil.getConnect();
			String sql="select * from user where email=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1,email);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				flag=true;
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public static UserBean loginUser(String email) {
		UserBean u=null;
		try {
			Connection conn=UserUtil.getConnect();
			String sql="select * from user where email=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1,email);
			ResultSet rs=pst.executeQuery();
			if(rs.next()) {
				u=new UserBean();
				u.setUid(rs.getInt("uid"));
				u.setName(rs.getString("name"));
				u.setEmail(rs.getString("email"));
				u.setAddress(rs.getString("address"));
				u.setMobile(rs.getLong("mobile"));
				u.setPassword(rs.getString("password"));
				u.setUsertype(rs.getString("usertype"));
				
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public static void changePassword(String email, String password) {
		try {
			Connection conn=UserUtil.getConnect();
			String sql="update user set password=? where email=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, password);
			pst.setString(2, email);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void update_user(UserBean u) {
		try {
			Connection conn=UserUtil.getConnect();
			String sql="update user set name=?, email=?, address=?, mobile=? where uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, u.getName());
			pst.setString(2, u.getEmail());
			pst.setString(3, u.getAddress());
			pst.setLong(4, u.getMobile());
			pst.setInt(5, u.getUid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void delete_user(int uid) {
		try {
			Connection conn=UserUtil.getConnect();
			String sql="delete from user where uid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, uid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
