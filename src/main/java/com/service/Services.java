package com.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Services {

	public static void sendMail(String emailid,int otp){
		final String username  = "paldave1903@gmail.com";//Sender Email
		final String password   = "evil xjpq ddto dwpk";//Sender Password
		
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(emailid));//to mail address.
			message.setSubject("OTP For Forgot Password");
			
			String emailBody = "Dear User,\n\n" +
	                   "Your OTP for password recovery is: " + otp + "\n\n" +
	                   "Please use this code to reset your password. The code is valid for the next 10 minutes.\n\n" +
	                   "If you did not request this, please ignore this email.\n\n" +
	                   "Best regards,\n" +
	                   "FlexiRide";

	        message.setText(emailBody);

 
			Transport.send(message);
 
			System.out.println("Email Send Successfully");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}		
	}
	public static void sendMail1(String emailid,int otp){
		final String username  = "paldave1903@gmail.com";//Sender Email
		final String password   = "evil xjpq ddto dwpk";//Sender Password
		
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(emailid));//to mail address.
			message.setSubject("OTP For Forgot Password");
			
			String emailBody = "Dear User,\n\n" +
	                   "Your OTP for password recovery is: " + otp + "\n\n" +
	                   "Please use this code to reset your password. The code is valid for the next 10 minutes.\n\n" +
	                   "If you did not request this, please ignore this email.\n\n" +
	                   "Best regards,\n" +
	                   "FlexiRide";

	        message.setText(emailBody);

 
			Transport.send(message);
 
			System.out.println("Email Send Successfully");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}		
	}
}
