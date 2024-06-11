<%@ page import="com.bean.*" %>
<%
UserBean u=(UserBean)session.getAttribute("u");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>
</head>
<body>
<script>

    function confirmDelete() {
        return confirm("Warning: By deleting your profile, all associated data will be permanently removed. Are you sure you want to proceed with the deletion?");
    }
    
    window.onload = function() {
        if(confirmDelete()) {
        	location.href='delete_userConfirm.jsp';
        } else {
            location.href='viewcar.jsp';
        }
    };
</script>
</body>
</html>
