<%@ include file="profile_header.jsp"%>
<%@ page import="com.bean.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
</head>
<body>
 <div class="container-fluid page-header">
        <h1 class="display-3 text-uppercase text-white mb-3">Edit Profile</h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="">Home</a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0">Edit Profile</h6>
        </div>
    </div>
    
    <%
UserBean u = (UserBean)session.getAttribute("u");
if (u == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

    
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <h1 class="display-4 text-uppercase text-center mb-5">Edit Profile</h1>
        <div class="row justify-content-center">
            <div class="col-lg-9 mb-2">
                <div class="contact-form bg-light mb-4" style="padding: 30px;">
                
                <%
                if(request.getAttribute("msg")!=null){
                	out.println(request.getAttribute("msg"));
                }
                %>
                
                    <form name="frm" method="post" action="UserController">
                        <div class="row">
                         <input type="hidden" name="uid" value="<%=u.getUid() %>">
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" value="<%=u.getName() %>" name="name" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="email" class="form-control p-4" value="<%=u.getEmail() %>" name="email" required="required">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" value="<%=u.getMobile() %>" name="mobile" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" value="<%=u.getAddress() %>" name="address" required="required">
                            </div>
                        </div>
                        
                        <div class="text-center">
                            <button class="btn btn-primary py-3 px-5" type="submit" name="submit" value="update_profile">Update Profile</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

    
<%@ include file="footer.jsp"%>
</body>
</html>