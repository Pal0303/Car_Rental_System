<%@ include file="header.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.*" %>
<%@ page import="com.bean.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rentals Dashboard</title>
<style>
    .custom-table {
        width: 130%;
    }
</style>
<script>

function showDocument(documentUrl) {
    var modal = document.getElementById("documentModal");
    var modalImg = document.getElementById("documentImg");
    modal.style.display = "block";
    modalImg.src = documentUrl;
}

function closeModal() {
    var modal = document.getElementById("documentModal");
    modal.style.display = "none";
}

function confirmBooking(bookingId) {
    var confirm = window.confirm("Are you sure you want to confirm this booking?");
    if (!confirm) {
        return false; 
    }
    window.location.href = "owner_index.jsp?bid=" + bookingId;
}


</script>
</head>
<body>
<div class="container-fluid page-header">
        <h1 class="display-3 text-uppercase text-white mb-3">Rentals Dashboard</h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="">Home</a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0">Rentals Dashboard</h6>
        </div>
</div>

<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <h1 class="display-4 text-uppercase text-center mb-5">Rentals Dashboard</h1>
        <div class="row justify-content-center">
            <div class="col-lg-14 mb-2">
                <div  style="padding: 30px;">
                    <div class="col-lg-12">
                        <!-- <div class="table_bg"> -->
                             <table class="table table-bordered table-striped custom-table" style="background-color: white; color: black;margin-left: -130px;box-shadow: 0px 0px 35px #2B2E4A;">
                                <thead class="text-primary">
                                    <tr>
                                        <th scope="col">Car Name</th>
                                        <th scope="col">Customer Name</th>
                                        <th scope="col">Customer Mobile</th>
                                        <th scope="col">Start Date</th>
                                        <th scope="col">End Date</th>
                                        <th scope="col">Document</th>
                                        <th scope="col">Car Price per day</th>
                                        <th scope="col">Total Price</th>
                                        <th scope="col">Booking Status</th>
                                        <th scope="col">Payment Status</th>
                                    </tr>
                                </thead>
                                <%
List<Booking> list=BookingDao.SpecificBookingOwner(u.getUid());
for(Booking b:list){
    Car c=CarDao.Specific_car(b.getCid());
    
%>
                                <tbody>
                                    <tr>
                                        <td><%=c.getCar_name() %></td>
                                        <td></td>
                                        <td></td>
                                        <td><%=b.getFrom_date() %></td>
                                        <td><%=b.getTo_date() %></td>
                                        <td><a href="javascript:void(0);" onclick="showDocument('user_document/<%=b.getDocument() %>')">View Document</a></td>
                                        <td><%=c.getCar_ppd() %></td>
                                        <td><%=b.getTotal_amt() %></td>
                                        
                                        <%
                                        if(b.getBooking_status().equalsIgnoreCase("Not confirm")){
                                        %>
                                        <td><input type="checkbox" name="confirmBooking" id="confirmBooking_<%=b.getBid() %>" 
                                        onclick="confirmBooking('<%=b.getBid() %>');">Confirm</td>
                                        <% 
                                        } else{
                                        %>
                                        <td><%=b.getBooking_status()%></td>
                                        <% } %>
                                        
                                        
                                        <% if(b.getPayment_status().equalsIgnoreCase("pending") && b.getBooking_status().equalsIgnoreCase("not confirm")) { %>
                                        <td><a href="payment.jsp?bid=<%= b.getBid() %>" style="color: red;"><%=b.getPayment_status() %></a></td>
                                        <% }
                                        else { %>
                                        <td><%=b.getPayment_status() %></td>
                                        <% } %>
                                        
                                    </tr>
                                </tbody>
                                <% } %>
                            </table>
                        <<!-- /div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="documentModal" class="modal" onclick="closeModal()">
  <span class="close" onclick="closeModal()">&times;</span>
  <img class="modal-content" id="documentImg">
</div>

</body>
</html>
