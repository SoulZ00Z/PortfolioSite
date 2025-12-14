<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!-- Guest Login -->
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/navbar.css">
    <link rel="stylesheet" href="CSS/login.css">
    <title>Login - Portfolio</title>
</head>
<body>
    <jsp:include page="navbar.jsp">
        <jsp:param name="page" value="login"/>
    </jsp:include>

    <main>
        <form action="LoginServlet" method="post">
            <div class="login-header">
                <h2>Login</h2>
                <p>or <a href="signup.jsp" class="auth-link">Sign Up</a></p>
            </div>
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="error-message">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <% 
                String successMessage = (String) session.getAttribute("successMessage");
                if (successMessage != null) {
                    session.removeAttribute("successMessage");
            %>
                <div class="success-message">
                    <%= successMessage %>
                </div>
            <% } %>
            
            <section class="textfield-container">
                <label for="GuestID" class="textfield-labels">Guest ID:</label>
                <input type="text" id="GuestID" name="GuestID" class="textfields" placeholder=" " required>
            </section>
            
            <section class="textfield-container">
                <label for="PW" class="textfield-labels">PW:</label>
                <input type="password" id="PW" name="PW" class="textfields" placeholder=" " required>
            </section>
            
            <section class="submit">
                <input type="submit" value="Login" id="login">
            </section>
            
            <div class="bottom-link">
                <a href="" class="auth-link">Forgot PW?</a>
            </div>
        </form>
    </main>
    
    <footer>
        <section>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </section>
        <section>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </section>
    </footer>
</body>
</html>
