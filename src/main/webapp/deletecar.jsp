<%
int cid = Integer.parseInt(request.getParameter("cid"));
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Car</title>
</head>
<body>
<script>

    function confirmDelete() {
        return confirm("Are you sure you want to delete the car?");
    }
    
    window.onload = function() {
        if(confirmDelete()) {
        	location.href='delete_carConfirm.jsp?cid=<%=cid%>';
        } else {
            location.href='viewcar.jsp';
        }
    };
</script>
</body>
</html>
