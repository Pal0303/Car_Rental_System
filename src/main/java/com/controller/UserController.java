package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Random;

import com.bean.UserBean;
import com.dao.UserDao;
import com.service.Services;

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String submit=request.getParameter("submit");
		if(submit.equalsIgnoreCase("sign up")) {
			boolean flag=UserDao.checkEmail(request.getParameter("email"));
			if(flag==false) {
				if(request.getParameter("password").equals(request.getParameter("cpassword"))) {
					UserBean u=new UserBean();
					u.setName(request.getParameter("name"));
					u.setEmail(request.getParameter("email"));
					u.setMobile(Long.parseLong(request.getParameter("mobile")));
					u.setUsertype(request.getParameter("usertype"));
					u.setAddress(request.getParameter("address"));
					u.setPassword(request.getParameter("password"));
					UserDao.Signup_User(u);
					request.setAttribute("msg", "User Registered Successfully");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				else {
					request.setAttribute("msg", "Passwords do not match");
					request.getRequestDispatcher("signup.jsp").forward(request, response);
				}
			}
			else {
				request.setAttribute("msg", "Email Already Exist");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		}
		
		else if(submit.equalsIgnoreCase("login")) {
			UserBean u=UserDao.loginUser(request.getParameter("email"));
			if(u!=null) {
				if(u.getPassword().equals(request.getParameter("password"))) {
					HttpSession session=request.getSession();
					session.setAttribute("u",u);
					if(u.getUsertype().equals("owner")) {
						request.getRequestDispatcher("owner_index.jsp").forward(request, response);
					}
					else {
					request.getRequestDispatcher("index.jsp").forward(request, response);
					}
				}
				else {
					request.setAttribute("msg", "Incorrect Password");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}
			else {
				request.setAttribute("msg", "Incorrect Email");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		
		else if(submit.equalsIgnoreCase("change password")) {
			HttpSession session=request.getSession();
			UserBean u=(UserBean)session.getAttribute("u");
			if(u.getPassword().equals(request.getParameter("old_password"))) {
				if(request.getParameter("new_password").equals(request.getParameter("cnew_password"))) {
					UserDao.changePassword(u.getEmail(), request.getParameter("new_password"));
					session.removeAttribute("u");
					session.invalidate();
					request.setAttribute("msg", "Password Updated Successfully");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				else {
					request.setAttribute("msg", "Passwords do not match");
					request.getRequestDispatcher("change_pwd.jsp").forward(request, response);
				}
			}
			else {
				request.setAttribute("msg", "Incorrect Password");
				request.getRequestDispatcher("change_pwd.jsp").forward(request, response);
			}
		}
		
		else if(submit.equalsIgnoreCase("Send OTP")) {
			boolean flag=UserDao.checkEmail(request.getParameter("email"));
			if(flag==true) {
				Random t=new Random();
				int minRange=1000, maxRange=9999;
				int otp=t.nextInt(maxRange-minRange)+minRange;
				Services.sendMail(request.getParameter("email"), otp);
				request.setAttribute("otp1", otp);
				request.setAttribute("email", request.getParameter("email"));
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg", "Incorrect Email");
				request.getRequestDispatcher("forget-password.jsp").forward(request, response);
			}
		}
		
		else if(submit.equalsIgnoreCase("Verify OTP")) {
			int otp1=Integer.parseInt(request.getParameter("otp1"));
			int otp2=Integer.parseInt(request.getParameter("otp2"));
			String email=request.getParameter("email");
			if(otp1==otp2) {
				request.setAttribute("email", request.getParameter("email"));
				request.getRequestDispatcher("new-password.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg", "Incorrect OTP");
				request.setAttribute("otp1", otp1);
				request.setAttribute("email", request.getParameter("email"));
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
		}
		
		else if(submit.equalsIgnoreCase("update password")) {
			String email=request.getParameter("email");
			if(request.getParameter("new_password").equals(request.getParameter("cnew_password"))) {
				UserDao.changePassword(email, request.getParameter("cnew_password"));
				request.setAttribute("msg", "Password Updated Successfully");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else {
				request.setAttribute("msg", "Passwords do not match");
				request.setAttribute("email", request.getParameter("email"));
				request.getRequestDispatcher("new-password.jsp").forward(request, response);
			}
		}
		
		else if(submit.equalsIgnoreCase("update_profile")) {
			UserBean u=new UserBean();
			u.setUid(Integer.parseInt(request.getParameter("uid"))); 
			u.setName(request.getParameter("name"));
			u.setEmail(request.getParameter("email"));
			u.setMobile(Long.parseLong(request.getParameter("mobile")));
			u.setAddress(request.getParameter("address"));
			UserDao.update_user(u);
			request.setAttribute("msg", "User Updated Successfully");
	        request.getRequestDispatcher("editprofile.jsp").forward(request, response);
		}
	}

}
