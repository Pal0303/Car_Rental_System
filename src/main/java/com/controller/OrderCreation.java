 package com.controller;

import com.bean.*;
import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import org.json.JSONObject;

@WebServlet({"/OrderCreation"})
public class OrderCreation extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      RazorpayClient client = null;
      String orderId = null;
      System.out.println(request.getParameter("amount"));

      try {
         client = new RazorpayClient("rzp_test_t6fNhqRquJafiS", "9MNPBnNj74pro4U9Z4jXypnJ");
         JSONObject options = new JSONObject();
         options.put("amount", request.getParameter("amount"));
         options.put("currency", "INR");
         options.put("receipt", "zxr456");
         options.put("payment_capture", true);
         Order order = client.orders.create(options);
         orderId = (String)order.get("id");
         System.out.println("Order Id : " + orderId);
      } catch (Exception var7) {
         System.out.println(var7);
      }

      response.getWriter().append(orderId);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Object var3 = null;

      try {
         new RazorpayClient("rzp_test_t6fNhqRquJafiS", "9MNPBnNj74pro4U9Z4jXypnJ");
         JSONObject options = new JSONObject();
         options.put("razorpay_payment_id", request.getParameter("razorpay_payment_id"));
         options.put("razorpay_order_id", request.getParameter("razorpay_order_id"));
         options.put("razorpay_signature", request.getParameter("razorpay_signature"));
         boolean SigRes = Utils.verifyPaymentSignature(options, "Secret");
         if (SigRes) {
            HttpSession session = request.getSession();
            UserBean u = (UserBean)session.getAttribute("u");
            System.out.println(u.getName());
            response.getWriter().append("Payment Successfull");
         } else {
            response.getWriter().append("Payment Failed");
         }
      } catch (Exception var8) {
         var8.printStackTrace();
      }

   }
}