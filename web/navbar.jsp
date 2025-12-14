<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.portfolio.GuestBO" %>
<%
    // Get user & session info.
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    GuestBO guest = (GuestBO) session.getAttribute("guest");
    String userType = (String) session.getAttribute("userType");
    String currentPage = request.getParameter("page") != null ? request.getParameter("page") : "";
%>

<header>
    <!-- Top Nav -->
    <nav id="nav1">
        <!-- Logo -->
        <a href="index.jsp" class="navbar-brand">Portfolio Site</a>
        
        <!-- User Section -->
        <div class="navbar-user">
            <% if (isLoggedIn != null && isLoggedIn) { %>
                <% if (guest != null) { %>
                    <!-- Guest Welcome -->
                    <span>Welcome, <strong><%= guest.getGuestID() %></strong>!</span>
                    <a href="LogoutServlet">Logout</a>
                <% } %>
            <% } else { %>
                <!-- Guest Sign Up or Login links -->
                <a href="login.jsp">Login</a>
                <a href="signup.jsp">Sign Up</a>
            <% } %>
        </div>
    </nav>
    
    <!-- Bottom Nav -->
    <nav id="nav2">
        <ul class="navbar-nav">
            <li>
                <a href="index.jsp" class="<%= currentPage.equals("home") ? "active" : "" %>">
                    Home
                </a>
            </li>
            <li><a href="project.jsp" class="<%= currentPage.equals("projects") ? "active" : "" %>">Projects</a></li>
            <li><a href="info.jsp" class="<%= currentPage.equals("info") ? "active" : "" %>">Info</a></li>
            <% if (isLoggedIn != null && isLoggedIn && guest != null) { %>
                <li><a href="guest.jsp" class="<%= currentPage.equals("guest") ? "active" : "" %>">Guest</a></li>
            <% }%>
        </ul>
    </nav>
</header>

