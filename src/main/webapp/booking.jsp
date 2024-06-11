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
        <h1 class="display-3 text-uppercase text-white mb-3">Car Booking</h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="">Home</a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0">Car Booking</h6>
        </div>
    </div>
    <!-- Page Header Start -->

    <%
    int cid = Integer.parseInt(request.getParameter("cid"));
    Car c = CarDao.Specific_car(cid);
    %>

    <!-- Detail Start -->
    <div class="container-fluid pt-5">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase mb-5"><%= c.getCar_name() %></h1>
            <div class="row align-items-center pb-2">
                <div class="col-lg-6 mb-4">
                    <img class="img-fluid" src="car_images/<%= c.getCar_img() %>">
                </div>
                <div class="col-lg-6 mb-4">
                    <h4 class="mb-2">Rs. <%= c.getCar_ppd() %>/Day</h4>
                    <div class="d-flex mb-3">
                        <h6 class="mr-2">Rating:</h6>
                        <div class="d-flex align-items-center justify-content-center mb-1">
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small class="fa fa-star-half-alt text-primary mr-1"></small>
                            <small>(250)</small>
                        </div>
                    </div>
                    <p><%= c.getCar_desc() %></p>
                </div>
            </div>
            <div class="row mt-n3 mt-lg-0 pb-4">
                <div class="col-md-3 col-6 mb-2">
                    <i class="fa fa-car-side text-primary mr-2"></i>
                    <span>Model: <%= c.getCar_model() %></span>
                </div>
                <div class="col-md-3 col-6 mb-2">
                    <i class="fa fa-cogs text-primary mr-2"></i>
                    <span>Gear: <%= c.getCar_gear() %></span>
                </div>
                <div class="col-md-3 col-6 mb-2">
                    <i class="fa fa-tachometer-alt text-primary mr-2"></i>
                    <span>Efficiency: <%= c.getFuel_eff() %> km/l</span>
                </div>
                <div class="col-md-3 col-6 mb-2">
                    <i class="fa fa-gas-pump text-primary mr-2"></i>
                    <span>Fuel: <%= c.getFuel_type() %></span>
                </div>
                <div class="col-md-3 col-6 mb-2">
                    <i class="fa fa-users text-primary mr-2"></i>
                    <span>Capacity: <%= c.getPass_cap() %> persons</span>
                </div>
                <div class="col-md-3 col-6 mb-2">
                    <i class="fa fa-suitcase text-primary mr-2"></i>
                    <span>Luggage: <%= c.getLugg_cap() %> L</span>
                </div>
            </div>
        </div>
    </div><br><br><br>
    <!-- Detail End -->

    <!-- Car Booking Start -->
    <div class="container-fluid pb-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <h2 class="mb-4">Personal Detail</h2>
                    <div class="mb-5">
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" value="<%= u.getName() %>" readonly>
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" value="<%= u.getEmail() %>" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6 form-group">
                                <input type="email" class="form-control p-4" value="<%= u.getMobile() %>" readonly>
                            </div>
                            <div class="col-6 form-group">
                                <input type="text" class="form-control p-4" value="<%= u.getAddress() %>" readonly>
                            </div>
                        </div>
                    </div>
                    <h2 class="mb-4">Booking Detail</h2>
                    <div class="mb-5">
                    <form name="frm" method="post" action="bookingController" enctype="multipart/form-data">
                        <input type="hidden" name="cid" value="<%= c.getCid() %>">
                        <input type="hidden" name="uid" value="<%= u.getUid() %>">
                        <input type="hidden" name="car_ppd" value="<%= c.getCar_ppd() %>">
                        
                        <div class="row">
                            <div class="col-6 form-group">
                                <div class="date" id="date2" data-target-input="nearest">
                                    <input type="date" class="form-control p-4 datetimepicker-input" name="from_date">
                                </div>
                            </div>
                            <div class="col-6 form-group">
                                <div class="date" id="date2" data-target-input="nearest">
                                    <input type="date" class="form-control p-4 datetimepicker-input" name="to_date">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                        <div class="col-6 form-group">
                                <input type="file" class="form-control p-4" name="document">
                            </div>
                        </div><br>
                        <div class="text-center">
                            <button class="btn btn-primary py-3 px-5" type="submit" name="submit" value="book_confirm">Confirm Booking</button>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="bg-secondary p-5 mb-5">
                        <h2 class="text-primary mb-4">Booking Rules & Policy</h2>
                        <ul class="list-unstyled">
                            <li>1. Car pickup and drop-off location will be at the car owner's address.</li>
                            <li>2. After submitting the car booking, the owner will verify your documents. The booking will be confirmed from the owner's side, after which the user can proceed with payment.</li>
                            <li>3. The car price per day is calculated from 10 AM to the next morning at 10 AM (24 hours).</li>
                            <li>4. The charge will be calculated based on the car price per day multiplied by the number of rental days.</li>
                            <li>5. Please provide original documents for verification. Any identification document that verifies the user's identity is acceptable.</li>
                            <li>6. If any damage is found after renting, the user will be liable to pay for it.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Car Booking End -->

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
    
    <script>
    var currentDate = new Date().toISOString().split('T')[0];
    document.getElementsByName('from_date')[0].setAttribute('min', currentDate);
    document.getElementsByName('from_date')[0].addEventListener('change', function() {
        var fromDate = new Date(this.value);
        fromDate.setDate(fromDate.getDate() + 1); // Increment fromDate by one day
        var minToDate = fromDate.toISOString().split('T')[0];
        document.getElementsByName('to_date')[0].setAttribute('min', minToDate);
    });
</script>


</body>

</html>
