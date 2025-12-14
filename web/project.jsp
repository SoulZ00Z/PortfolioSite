<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Boolean isLoggedIn = (Boolean) session.getAttribute("isLoggedIn");
    com.portfolio.GuestBO guest = (com.portfolio.GuestBO) session.getAttribute("guest");
    boolean showGuest = (isLoggedIn != null && isLoggedIn && guest != null);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title></title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="CSS/navbar.css">
	<link rel="stylesheet" href="CSS/project.css">
</head>
<body style="background-color: #f0f0f0;">
	<jsp:include page="navbar.jsp">
		<jsp:param name="page" value="projects"/>
	</jsp:include>
	

	<main>

        <!-- SlideShow Container -->
<div class="slideContainer">

    <div class="mySlides fade">
      <div class="slideOrder">1 / 4</div>
      <img src="Pix/Totoro.jpg" style="width:100%">
      <div class="text">Totoro</div>
    </div>
  
    <div class="mySlides fade">
      <div class="slideOrder">2 / 4</div>
      <img src="Pix/Bowsette.jpg" style="width:100%">
      <div class="text">Sky</div>
    </div>
  
    <div class="mySlides fade">
      <div class="slideOrder">3 / 4</div>
      <img src="Pix/Link.webp" style="width:100%">
      <div class="text">Link</div>
    </div>

     <div class="mySlides fade">
        <div class="slideOrder">4 / 4</div>
        <img src="Pix/LinkZ.jpg" style="width:100%">
        <div class="text">LinkZ</div>
    </div>
  
    <a class="prev" onclick="navControl(-1)">&#10094;</a>
    <a class="next" onclick="navControl(1)">&#10095;</a>
  </div>
  <br>
  
  
  <div style="text-align:center">
    <span class="dot" onclick="thisSlide(1)"></span>
    <span class="dot" onclick="thisSlide(2)"></span>
    <span class="dot" onclick="thisSlide(3)"></span>
    <span class="dot" onclick="thisSlide(4)"></span>
  </div>
    
    
    </main>
	
	<footer>
	</footer>
	<script src="JS/script.js"></script>
</body>
</html>