package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.Duration;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import com.bean.Booking;
import com.dao.BookingDao;

@MultipartConfig(
		   fileSizeThreshold = 1024*1024*512,
		   maxFileSize = 1024*1024*512,
		   maxRequestSize = 1024*1024*512
)

public class bookingController extends HttpServlet {
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
	
	public static long getDifferenceDays(Date d1, Date d2) {
		long diff= d2.getTime()- d1.getTime();
		return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit=request.getParameter("submit");
		
		if(submit.equalsIgnoreCase("book_confirm")) {
			Date date1=null;
			Date date2=null;
			
			try {
				date1= new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("from_date"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				date2= new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("to_date"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			long dd=getDifferenceDays(date1,date2);
			int ppd=Integer.parseInt(request.getParameter("car_ppd"));
			int total_amt=(int) (dd*ppd);
			
			Booking b=new Booking();
			b.setCid(Integer.parseInt(request.getParameter("cid")));
			b.setUid(Integer.parseInt(request.getParameter("uid")));
			b.setFrom_date(request.getParameter("from_date"));
			b.setTo_date(request.getParameter("to_date"));
			b.setPayment_status("Pending");
			b.setBooking_status("Not Confirm");
			b.setTotal_amt(total_amt);
			
			String savePath = "C:\\Users\\PAL DAVE\\eclipse-workspace\\CarRental\\src\\main\\webapp\\user_document";
	         File fileSaveDir = new File(savePath);
	         if (!fileSaveDir.exists()) {
	            fileSaveDir.mkdir();
	         }

	         Part file1 = request.getPart("document");
	         String fileName = this.extractfilename(file1);
	         file1.write(savePath + File.separator + fileName);
	         String savePath2 = "C:\\Users\\PAL DAVE\\eclipse-workspace\\CarRental\\src\\main\\webapp\\user_document";
	         File imgSaveDir = new File(savePath2);
	         if (!imgSaveDir.exists()) {
	            imgSaveDir.mkdir();
	         }
	         
	         b.setDocument(fileName);
	         BookingDao.addBooking(b);
			 response.sendRedirect("car.jsp");
		}
	}

}
