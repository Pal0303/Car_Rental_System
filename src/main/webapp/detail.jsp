<%@ include file="header.jsp"%>
<%@ page import="com.dao.CarDao" %>
<%@ page import="com.bean.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<body>
   
    <!-- Page Header Start -->
    <div class="container-fluid page-header">
        <h1 class="display-3 text-uppercase text-white mb-3">Car Detail</h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="">Home</a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0">Car Detail</h6>
        </div>
    </div>
    <!-- Page Header Start -->

<%
int cid=Integer.parseInt(request.getParameter("cid"));
Car c=CarDao.Specific_car(cid);
%>

    <!-- Detail Start -->
    <div class="container-fluid pt-5">
        <div class="container pt-5">
            <div class="row">
                <div class="col-lg-8 mb-5">
                    <h1 class="display-4 text-uppercase mb-5"><%=c.getCar_name() %></h1>
                    <div class="row mx-n2 mb-3">
                        <div class="col-md-3 col-6 px-2 pb-2">
                            <img class="img-fluid w-100" src="car_images/<%=c.getCar_img() %>">
                        </div>
                    </div>
                    <p><%=c.getCar_desc() %></p>
                    <div class="row pt-2">
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-car-side text-primary mr-2"></i>
                            <span>Model: <%=c.getCar_model() %></span>
                        </div>
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-cogs text-primary mr-2"></i>
                            <span>Gear: <%=c.getCar_gear() %></span>
                        </div>
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-gas-pump text-primary mr-2"></i>
                            <span>Fuel: <%=c.getFuel_type() %></span>
                        </div>
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-tachometer-alt text-primary mr-2"></i>
                            <span>Efficiency: <%=c.getFuel_eff() %> km/l</span>
                        </div>
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-users text-primary mr-2"></i>
                            <span>Capacity: <%=c.getPass_cap() %> persons</span>
                        </div>
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-suitcase text-primary mr-2"></i>
                            <span>Luggage: <%=c.getLugg_cap() %> L</span>
                        </div>
                        <div class="col-md-3 col-6 mb-2">
                            <i class="fa fa-rupee-sign text-primary mr-2"></i>
                            <span>Price: <%=c.getCar_ppd() %> per day</span>
                        </div>
                        
                       <div class="text-center mt-4">
                        <% if(u!=null){ %>
                            <a class="btn btn-info px-3 mr-2" href="booking.jsp?cid=<%=c.getCid() %>">Book Now</a>
                        <% } 
                        else { %>
                            <button class="btn btn-primary py-3 px-5" type="submit" name="submit" value="login.jsp">Login to Book</button>
                        <% } %>
                    </div>
                </div>
               </div>

                <div class="col-lg-4 mb-5">
                    <div class="bg-secondary p-5">
                        <h3 class="text-primary text-center mb-4">Check Availability</h3>
                        <div class="form-group">
                            <select class="custom-select px-4" style="height: 50px;">
                                <option selected>Pickup Location</option>
                                <option value="1">Location 1</option>
                                <option value="2">Location 2</option>
                                <option value="3">Location 3</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="custom-select px-4" style="height: 50px;">
                                <option selected>Drop Location</option>
                                <option value="1">Location 1</option>
                                <option value="2">Location 2</option>
                                <option value="3">Location 3</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="date" id="date1" data-target-input="nearest">
                                <input type="text" class="form-control p-4 datetimepicker-input" placeholder="Pickup Date"
                                    data-target="#date1" data-toggle="datetimepicker" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="time" id="time1" data-target-input="nearest">
                                <input type="text" class="form-control p-4 datetimepicker-input" placeholder="Pickup Time"
                                    data-target="#time1" data-toggle="datetimepicker" />
                            </div>
                        </div>
                        <div class="form-group">
                            <select class="custom-select px-4" style="height: 50px;">
                                <option selected>Select Person</option>
                                <option value="1">Person 1</option>
                                <option value="2">Person 2</option>
                                <option value="3">Person 3</option>
                            </select>
                        </div>
                        <div class="form-group mb-0">
                            <button class="btn btn-primary btn-block" type="submit" style="height: 50px;">Check Now</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Detail End -->

<%@ include file="footer.jsp"%>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="fa fa-angle-double-up"></i></a>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
