<%@ include file="owner_header.jsp"%>
<%@ page import="com.dao.CarDao" %>
<%@ page import="com.bean.*" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html lang="en">
<body>

    <!-- Page Header Start -->
    <div class="container-fluid page-header">
        <h1 class="display-3 text-uppercase text-white mb-3">View Car</h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="owner_index.jsp">Home</a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0">View Car</h6>
        </div>
    </div>
    <!-- Page Header Start -->

    <!-- Rent A Car Start -->
    <div class="container-fluid py-5">
        <div class="container pt-5 pb-3">
            <h1 class="display-4 text-uppercase text-center mb-5">View Your Car</h1>
            
            <%
                if(request.getAttribute("msg")!=null){
                	out.println(request.getAttribute("msg"));
                }
                %>
            <div class="row">
            
            <% List<Car> list=CarDao.GetCar(u.getUid());
            for(Car c:list){
            %>
<div class="col-lg-4 col-md-6 mb-2">
    <div class="rent-item mb-4">
        <img class="img-fluid mb-4" src="car_images/<%=c.getCar_img() %>" alt="">
        <h4 class="text-uppercase mb-4"><%=c.getCar_name() %></h4>
        <div class="d-flex justify-content-center mb-4">
            <div class="px-2">
                <i class="fa fa-car text-primary mr-1"></i>
                <span><%=c.getCar_model() %></span>
            </div>
            <div class="px-2 border-left border-right">
                <i class="fa fa-cogs text-primary mr-1"></i>
                <span><%=c.getCar_gear() %></span>
            </div>
            <div class="px-2">
                <i class="fa fa-gas-pump text-primary mr-1"></i>
                <span><%=c.getFuel_type() %></span>
            </div>
            <div class="px-2 border-left">
                <i class="fa fa-rupee-sign text-primary mr-1"></i>
                <span><%=c.getCar_ppd() %>/Day</span>
            </div>
        </div>
        <div class="d-flex justify-content-center">
            <a class="btn btn-primary px-3 mr-2" href="editcar.jsp?cid=<%=c.getCid() %>">Edit</a>
            <a class="btn btn-danger px-3" href="deletecar.jsp?cid=<%=c.getCid() %>">Delete</a>
        </div>
    </div>
</div>

        <% } %>                  
            </div>
        </div>
    </div>
    <!-- Rent A Car End -->



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