<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    com.portfolio.GuestBO guest = (com.portfolio.GuestBO) session.getAttribute("guest");
    boolean showGuestTab = (isLoggedIn != null && isLoggedIn && guest != null);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="CSS/navbar.css">
	<link rel="stylesheet" href="CSS/info.css">
</head>
<body style="background-color: #f0f0f0;">
	<jsp:include page="navbar.jsp">
		<jsp:param name="page" value="info"/>
	</jsp:include>
	

	<main>
        
        

    
    
   </main>
	
	<footer>
	</footer>
    <script src="JS/script.js"></script>
</body>
</html>