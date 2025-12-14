<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check if guest is logged in.
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    com.portfolio.GuestBO guest = (com.portfolio.GuestBO) session.getAttribute("guest");
    
    if (isLoggedIn == null || !isLoggedIn || guest == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Guest - Portfolio</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/navbar.css">
    <link rel="stylesheet" href="CSS/guest.css">
</head>
<body style="background-color: #f0f0f0;">
    <jsp:include page="navbar.jsp">
        <jsp:param name="page" value="guest"/>
    </jsp:include>

    <main>
        <div class="guest-container">
            <div class="guest-header">
                <h1>Welcome to this Portfolio!</h1>
                <p></p>
            </div>
            
            <div class="guest-info">
                <h3>Guest Info</h3>
                <p><strong>Guest ID:</strong> <%= guest.getGuestID() %></p>
                <p><strong>Phone Number:</strong> <%= guest.getPhoneNumber() != null ? guest.getPhoneNumber() : "N/A" %></p>
            </div>
            
            <div style="text-align: center;">
                <a href="LogoutServlet" class="logout-btn">Logout</a>
            </div>
        </div>
    </main>
</body>
</html>

