package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
