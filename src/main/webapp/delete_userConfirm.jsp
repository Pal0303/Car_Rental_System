<%@ page import="com.dao.*" %>
<%@ page import="com.bean.*" %>
<%
UserBean u = (UserBean) session.getAttribute("u");
if (u != null) {
    int uid = u.getUid();
    UserDao.delete_user(uid);
    session.removeAttribute("u"); 
    response.sendRedirect("signup.jsp");
}
%>
