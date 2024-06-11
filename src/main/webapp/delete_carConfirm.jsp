<%@ page import="com.dao.CarDao" %>
<%
int cid = Integer.parseInt(request.getParameter("cid"));
CarDao.delete_car(cid);
response.sendRedirect("viewcar.jsp");
%>
