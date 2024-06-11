package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.bean.Car;
import com.bean.UserBean;
import com.dao.CarDao;

@MultipartConfig(
		   fileSizeThreshold = 1024*1024*512,
		   maxFileSize = 1024*1024*512,
		   maxRequestSize = 1024*1024*512
)
public class CarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 private String extractfilename(Part file) {
	      String cd = file.getHeader("content-disposition");
	      System.out.println(cd);
	      String[] items = cd.split(";");
	      for(String string: items) {
	    	  if(string.trim().startsWith("filename")) {
	    		  return string.substring(string.indexOf("=")+2, string.length()-1);
	    	  }
	      }

	      return "";
	   }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit=request.getParameter("submit");
		
		if(submit.equalsIgnoreCase("Register_Car")) {
			HttpSession session=request.getSession();
			UserBean u=(UserBean)session.getAttribute("u");
			Car c=new Car();
			c.setUid(u.getUid());
			c.setCar_name(request.getParameter("car_name"));
			c.setCar_desc(request.getParameter("car_desc"));
			c.setCar_model(Long.parseLong(request.getParameter("car_model")));
			c.setCar_gear(request.getParameter("car_gear"));
			c.setFuel_eff(request.getParameter("fuel_eff"));
			c.setFuel_type(request.getParameter("fuel_type"));
			c.setPass_cap(Integer.parseInt(request.getParameter("pass_cap")));
			c.setLugg_cap(Integer.parseInt(request.getParameter("lugg_cap")));
			c.setCar_ppd(Integer.parseInt(request.getParameter("car_ppd")));
			
			String savePath = "C:\\Users\\PAL DAVE\\eclipse-workspace\\CarRental\\src\\main\\webapp\\car_images";
	         File fileSaveDir = new File(savePath);
	         if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdir();
	         }

	         Part file1 = request.getPart("car_img");
	         String fileName = this.extractfilename(file1);
	         file1.write(savePath + File.separator + fileName);
	         String savePath2 = "C:\\Users\\PAL DAVE\\eclipse-workspace\\CarRental\\src\\main\\webapp\\car_images";
	         File imgSaveDir = new File(savePath2);
	         if (!imgSaveDir.exists()) {
	            imgSaveDir.mkdir();
	         }

	         c.setCar_img(fileName);
	         CarDao.AddCar(c);
	         request.setAttribute("msg", "Car Registered Successfully");
	         request.getRequestDispatcher("addcar.jsp").forward(request, response);
		}
		
		else if(submit.equalsIgnoreCase("update_Car")) {
			Car c=new Car();
			c.setCid(Integer.parseInt(request.getParameter("cid")));
			c.setCar_name(request.getParameter("car_name"));
			c.setCar_desc(request.getParameter("car_desc"));
			c.setCar_model(Long.parseLong(request.getParameter("car_model")));
			c.setCar_gear(request.getParameter("car_gear"));
			c.setFuel_eff(request.getParameter("fuel_eff"));
			c.setFuel_type(request.getParameter("fuel_type"));
			c.setPass_cap(Integer.parseInt(request.getParameter("pass_cap")));
			c.setLugg_cap(Integer.parseInt(request.getParameter("lugg_cap")));
			c.setCar_ppd(Integer.parseInt(request.getParameter("car_ppd")));
			
			String savePath = "C:\\Users\\PAL DAVE\\eclipse-workspace\\CarRental\\src\\main\\webapp\\car_images";
	         File fileSaveDir = new File(savePath);
	         if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdir();
	         }

	         Part file1 = request.getPart("car_img");
	         String fileName = this.extractfilename(file1);
	         file1.write(savePath + File.separator + fileName);
	         String savePath2 = "C:\\Users\\PAL DAVE\\eclipse-workspace\\CarRental\\src\\main\\webapp\\car_images";
	         File imgSaveDir = new File(savePath2);
	         if (!imgSaveDir.exists()) {
	            imgSaveDir.mkdir();
	         }

	         c.setCar_img(fileName);
	         
			CarDao.update_car(c);
			request.setAttribute("msg", "Car Updated Successfully");
	        request.getRequestDispatcher("viewcar.jsp").forward(request, response);
		}
		
	}
}
