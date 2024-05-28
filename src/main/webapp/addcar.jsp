<%@ include file="owner_header.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AddCar</title>
</head>
<body>
 <div class="container-fluid page-header">
        <h1 class="display-3 text-uppercase text-white mb-3">Register Car</h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="">Home</a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0">Register Car</h6>
        </div>
    </div>
    
<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <h1 class="display-4 text-uppercase text-center mb-5">Register Car</h1>
        <div class="row justify-content-center">
            <div class="col-lg-12 mb-2">
                <div class="contact-form bg-light mb-4" style="padding: 30px;">
                
                <%
                if(request.getAttribute("msg")!=null){
                	out.println(request.getAttribute("msg"));
                }
                %>
                
                    <form name="frm" method="post" action="UserController" enctype="multipart/form-data">
                        <div class="row">
                            <div class="col-12 form-group">
                                <input type="text" class="form-control p-4" placeholder="Car Name" name="car_name" required="required">
                            </div>
                            <div class="col-12 form-group">
                                <input type="text" class="form-control p-4" placeholder="Car Description" name="car_desc" required="required">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="number" class="form-control p-4" placeholder="Car Model" name="car_model" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" placeholder="Gearbox type" name="car_gear" required="required">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" placeholder="Fuel efficiency(km/l)" name="fuel_eff" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" placeholder="Fuel Type" name="fuel_type" required="required">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="number" class="form-control p-4" placeholder="Passenger capacity " name="pass_cap" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="number" class="form-control p-4" placeholder="Luggage capacity " name="lugg_cap" required="required">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="number" class="form-control p-4" placeholder="Price Per Day(in INR)" name="car_ppd" required="required">
                            </div>
                            <div class="col-6 form-group">
                                <input type="file" class="form-control p-4" placeholder="Car Image" name="car_img" required="required">
                            </div>
                        </div>
                       
                        <div class="text-center">
                            <button class="btn btn-primary py-3 px-5" type="submit" name="submit" value="Register_Car">Register Car</button>
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