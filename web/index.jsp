<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    com.portfolio.GuestBO guest = (com.portfolio.GuestBO) session.getAttribute("guest");
    boolean showGuest = (isLoggedIn != null && isLoggedIn && guest != null);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Portfolio Site - Home</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="CSS/navbar.css">
	<link rel="stylesheet" href="CSS/index.css">
</head>
<body style="background-color: #f0f0f0;">
	<jsp:include page="navbar.jsp">
		<jsp:param name="page" value="home"/>
	</jsp:include>
	

	<main>
        
        <section id="">
            <div style="background-image: url('Pix/Totoro.jpg'); background-repeat: no-repeat; background-size: auto; width: 700px; height: 400px; border: 10px solid black; margin: 0px auto; position: relative;">
                <h1 style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); color: black; font-size: 2em; font-weight: bold; font-style: italic; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);">Totoro</h1></div>
			
        </section>
	
        <section id="">
            
            <header style = "text-align: center;">
                <h1>Software Dev Portfolio</h1>
                <h2>Editors/Version Control:</h2>
                <p style="font-family: Arial, Helvetica, sans-serif, sans-serif; font-size: 16px; color: #333; font-weight: bold; font-style: italic;">Notepad++, Visual Studio, NetBeans, GitHub, GitHub Desktop</p>
                <h2>Code:</h2>
                <p style="font-family: Arial, Helvetica, sans-serif, sans-serif; font-size: 16px; color: #333; font-weight: bold; font-style: italic;">Java, Python, HTML, CSS, JavaScript, SQL, PHP</p>
                <h1>Schools:</h1>
                <h2>Chattahoochee Technical College:</h2>
                <p style="font-family: Arial, Helvetica, sans-serif, sans-serif; font-size: 16px; color: #333; font-weight: bold; font-style: italic;">Associate Of Applied Science In Computer Science</p>  
                <h2>Kennesaw State University:</h2>
                <p style="font-family: Arial, Helvetica, sans-serif, sans-serif; font-size: 16px; color: #333; font-weight: bold; font-style: italic;">Bachelor Of Science In Information Technology(Begin Summer 2026)</p>
            </header>

        </section>
    
    
    </main>
	
	<footer>
	</footer>
    <script src="JS/script.js"></script>
</body>
</html>