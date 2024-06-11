<%@ include file="owner_header.jsp"%>
<%@ page import="com.dao.CarDao" %>
<%@ page import="com.bean.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EditCar</title>
</head>
<body>
 <div class="container-fluid page-header">
        <h1 class="display-3 text-uppercase text-white mb-3">Edit Car</h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="owner_index.jsp">Home</a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0">Edit Car</h6>
        </div>
    </div>
    
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <h1 class="display-4 text-uppercase text-center mb-5">Edit Car</h1>
        <div class="row justify-content-center">
            <div class="col-lg-12 mb-2">
                <div class="contact-form bg-light mb-4" style="padding: 30px;">
                
                <%
                int cid=Integer.parseInt(request.getParameter("cid"));
                Car c=CarDao.Specific_car(cid);
                if(request.getAttribute("msg")!=null){
                	out.println(request.getAttribute("msg"));
                }
                %>
                
                    <form name="frm" method="post" action="CarController" enctype="multipart/form-data">
                        <div class="row">
                        <input type="hidden" name="cid" value="<%=c.getCid() %>">
                            <div class="col-12 form-group">
                                <input type="text" class="form-control p-4" value="<%=c.getCar_name() %>" name="car_name" required="required">
                            </div>
                            <div class="col-12 form-group">
                                <input type="text" class="form-control p-4" value="<%=c.getCar_desc() %>" name="car_desc" required="required">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="number" class="form-control p-4" value="<%=c.getCar_model() %>" name="car_model" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" value="<%=c.getCar_gear() %>" name="car_gear" required="required">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" value="<%=c.getFuel_eff() %>" name="fuel_eff" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" value="<%=c.getFuel_type() %>" name="fuel_type" required="required">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="number" class="form-control p-4" value="<%=c.getPass_cap() %>" name="pass_cap" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="number" class="form-control p-4" value="<%=c.getLugg_cap() %>" name="lugg_cap" required="required">
                            </div>
                        </div>
<div class="row">
    <div class="col">
        <!-- Input for Car Price Per Day -->
        <div class="form-group">
            <input type="number" class="form-control p-4" value="<%=c.getCar_ppd() %>" name="car_ppd" required="required">
        </div>
    </div>
    <div class="col">
        <!-- Input for Car Image -->
        <div class="form-group d-flex align-items-center">
            <input type="file" class="form-control p-4" name="car_img" required="required">
            <!-- Image Preview -->
            <img src="car_images/<%=c.getCar_img() %>" style="width:100px; height:100px; margin-left: 10px;">
        </div>
    </div>
</div>



                       
                        <div class="text-center">
                            <button class="btn btn-primary py-3 px-5" type="submit" name="submit" value="update_Car">Update Car</button>
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