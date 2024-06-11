package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Car;
import com.util.UserUtil;

public class CarDao {
	public static void AddCar(Car c) {
		try {
			Connection conn=UserUtil.getConnect();
			String sql="insert into car_table(uid, car_name, car_desc, car_model, car_gear, fuel_eff, fuel_type, pass_cap, lugg_cap, car_ppd, car_img) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, c.getUid());
			pst.setString(2, c.getCar_name());
			pst.setString(3, c.getCar_desc());
			pst.setLong(4, c.getCar_model());
			pst.setString(5, c.getCar_gear());
			pst.setString(6, c.getFuel_eff());
			pst.setString(7, c.getFuel_type());
			pst.setInt(8, c.getPass_cap());
			pst.setInt(9, c.getLugg_cap());
			pst.setInt(10, c.getCar_ppd());
			pst.setString(11, c.getCar_img());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<Car> GetCar(int uid) {
	    List<Car> list = new ArrayList<Car>();
	    try {
	        Connection conn = UserUtil.getConnect();
	        String sql = "select * from car_table where uid=?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setInt(1, uid);
	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            Car c = new Car();
	            c.setCid(rs.getInt("cid"));
	            c.setCar_name(rs.getString("car_name"));
	            c.setCar_desc(rs.getString("car_desc"));
	            c.setCar_gear(rs.getString("car_gear"));
	            c.setCar_model(rs.getInt("car_model"));
	            c.setCar_img(rs.getString("car_img"));
	            c.setCar_ppd(rs.getInt("car_ppd"));
	            c.setFuel_eff(rs.getString("fuel_eff"));
	            c.setFuel_type(rs.getString("fuel_type"));
	            c.setPass_cap(rs.getInt("pass_cap"));
	            c.setLugg_cap(rs.getInt("lugg_cap"));
	            list.add(c);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}
	
	public static Car Specific_car(int cid) {
	    Car c=null;
	    try {
	        Connection conn = UserUtil.getConnect();
	        String sql = "select * from car_table where cid=?";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        pst.setInt(1, cid);
	        ResultSet rs = pst.executeQuery();
	        if (rs.next()) {
	            c = new Car();
	            c.setCid(rs.getInt("cid"));
	            c.setCar_name(rs.getString("car_name"));
	            c.setCar_desc(rs.getString("car_desc"));
	            c.setCar_gear(rs.getString("car_gear"));
	            c.setCar_model(rs.getInt("car_model"));
	            c.setCar_img(rs.getString("car_img"));
	            c.setCar_ppd(rs.getInt("car_ppd"));
	            c.setFuel_eff(rs.getString("fuel_eff"));
	            c.setFuel_type(rs.getString("fuel_type"));
	            c.setPass_cap(rs.getInt("pass_cap"));
	            c.setLugg_cap(rs.getInt("lugg_cap"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return c;
	}
	
	public static void update_car(Car c) {
		try {
			Connection conn=UserUtil.getConnect();
			String sql="update car_table set car_name=?, car_desc=?, car_model=?, car_gear=?, fuel_eff=?, fuel_type=?, pass_cap=?, lugg_cap=?, car_ppd=?, car_img=? where cid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setString(1, c.getCar_name());
			pst.setString(2, c.getCar_desc());
			pst.setLong(3, c.getCar_model());
			pst.setString(4, c.getCar_gear());
			pst.setString(5, c.getFuel_eff());
			pst.setString(6, c.getFuel_type());
			pst.setInt(7, c.getPass_cap());
			pst.setInt(8, c.getLugg_cap());
			pst.setInt(9, c.getCar_ppd());
			pst.setString(10, c.getCar_img());
			pst.setInt(11, c.getCid());
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void delete_car(int cid) {
		try {
			Connection conn=UserUtil.getConnect();
			String sql="delete from car_table where cid=?";
			PreparedStatement pst=conn.prepareStatement(sql);
			pst.setInt(1, cid);
			pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static List<Car> GetAllCar() {
	    List<Car> list = new ArrayList<Car>();
	    try {
	        Connection conn = UserUtil.getConnect();
	        String sql = "select * from car_table";
	        PreparedStatement pst = conn.prepareStatement(sql);
	        ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            Car c = new Car();
	            c.setCid(rs.getInt("cid"));
	            c.setCar_name(rs.getString("car_name"));
	            c.setCar_desc(rs.getString("car_desc"));
	            c.setCar_gear(rs.getString("car_gear"));
	            c.setCar_model(rs.getInt("car_model"));
	            c.setCar_img(rs.getString("car_img"));
	            c.setCar_ppd(rs.getInt("car_ppd"));
	            c.setFuel_eff(rs.getString("fuel_eff"));
	            c.setFuel_type(rs.getString("fuel_type"));
	            c.setPass_cap(rs.getInt("pass_cap"));
	            c.setLugg_cap(rs.getInt("lugg_cap"));
	            list.add(c);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

}
