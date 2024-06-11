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
<title>Payment</title>
</head>
<body>
<div class="container-fluid page-header">
        <h1 class="display-3 text-uppercase text-white mb-3">Payment</h1>
        <div class="d-inline-flex text-white">
            <h6 class="text-uppercase m-0"><a class="text-white" href="">Home</a></h6>
            <h6 class="text-body m-0 px-3">/</h6>
            <h6 class="text-uppercase text-body m-0">Payment</h6>
        </div>
</div>

<%
Booking b=BookingDao.Get_Specific_Booking(Integer.parseInt(request.getParameter("bid")));
%>

<div class="container-fluid py-5">
    <div class="container pt-5 pb-3">
        <h1 class="display-4 text-uppercase text-center mb-5">Payment</h1>
        <div class="row justify-content-center">
            <div class="col-lg-12 mb-2">
                <div  style="padding: 30px;">
                    <div class="col-lg-12">
                        <div class="bg-secondary p-5 mb-5">
                            <div class="col-lg-12">
                    <div class="bg-secondary p-5 mb-5">
                        <h2 class="text-primary mb-4">Payment Policy</h2>
                        <ul class="list-unstyled">
                            <li>Payment Methods Accepted: Outline which payment methods your business accepts, such as credit cards, debit cards, PayPal, bank transfers, or cash.</li>
                            <li>Refund Policy: Explain your policy regarding refunds, including under what circumstances refunds are offered, the process for requesting a refund, and any conditions or limitations.</li>
                            <li>Cancellation Policy: If applicable, outline your policy for cancellations, including any fees or penalties for canceled orders or services.</li>
                            
                        </ul><br><br>
                        
                        <form>
                        <input type="hidden" id="amout" value="<%=b.getTotal_amt() %>">
                        </form>
                        
                        
                        <div class="text-center">
                            <button class="btn btn-primary py-3 px-5" id="payButton" type="submit" name="submit" value="Payment" onclick="CreateOrderID()">Pay <%=b.getTotal_amt() %> Now</button>
                        </div>
                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
	var xhttp=new XMLHttpRequest();
	var RazorpayOrderId;
	function CreateOrderID()
	{
		xhttp.open("GET","http://localhost:8080/CarRental/OrderCreation?amount=<%=b.getTotal_amt()%>",false);
		xhttp.send();
		RazorpayOrderId=xhttp.responseText;
		alert("Are you sure you want to proceed with the payment? Please ensure you have reviewed all the details and terms of service. This action cannot be undone.");
		OpenCheckOut();
	}
</script>
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script type="text/javascript">
	
	
	function OpenCheckOut()
	{
		var amount=document.getElementById("amout").value;
		var new_amount=parseInt(amount)*100;
		var options={
				"key":"rzp_test_t6fNhqRquJafiS",
				"amount":new_amount,
				"currency":"INR",
				"name":"FlexiRide",
				"description":"Test",
				"callback_url":"http://localhost:8080/CarRental/index.jsp?bid=<%=b.getBid()%>",
				"prefill" : {
					"name" : "Jigar Thakkar",
					"email" : "jigar.thakkar.tops@gmail.com",
					"contact" : "9377614772"
				},
				"notes" : {
					"address" : "Gandhinagar"
				},
				"theme" : {
					"color" : "#3399cc"
				}

			};
			var rzp1 = new Razorpay(options);
			rzp1.on('payment.failed', function(response) {
				alert(response.error.code);
				alert(response.error.description);
				alert(response.error.source);
				alert(response.error.step);
				alert(response.error.reason);
				alert(response.error.metadata.order_id);
				alert(response.error.metadata.payment_id);
			});
			rzp1.open();
			e.preventDefault();
		}
	</script>
	


</body>
</html>