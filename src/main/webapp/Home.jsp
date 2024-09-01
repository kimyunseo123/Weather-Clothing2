<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home Page</title>
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
	<%
	    String userID = null;
	    if (session.getAttribute("userID") != null) {
	        userID = (String) session.getAttribute("userID");
	    }
	%>
	
    <!-- Header -->
    <header id="header">
        <nav class="left">
            <a href="#menu"><span>Menu</span></a>
        </nav>
        <a href="Home.jsp" class="logo">Weather Clothing</a>
        <nav class="right">
        <%
        	if(userID == null) {
        %>
        		<button id="loginButton" class="button" onclick="window.location.href='Login.jsp'">Login</button>
        <% 
        	} else {
        %>
        		<span class="userGreeting"><%= userID %>님</span>
        		<button id="loginButton" class="button" onclick="window.location.href='LogoutAction.jsp'">Logout</button>
        <%		
        	}
        %>
      
        </nav>
    </header>

    <!-- Menu -->
    <nav id="menu">
        <ul class="links">
            <li><a href="Home.jsp">Home</a></li>
            <li><a href="Forecast.jsp">Today's Weather</a></li>
            <li><a href="Clothing.jsp">Today's Clothing</a></li>
            <li><a href="bbs.jsp">Q & A</a></li>
        </ul>
    </nav>

    <!-- Banner -->
    <section id="banner">
        <div class="content">
            <h1>What's Weather Clothing?</h1>
            <p>Weather Clothing은 원하는 지역을 검색하면<br>
                실시간 날씨 정보와 5일간의 날씨 예보가 제공됩니다.<br>
                해당 지역의 온도와 강수량에 맞는 적절한 옷차림을 추천해줍니다.<br>
            </p>
        </div>
    </section>
    
    <!-- Scripts -->
    <script src="JS/jQuery.min.js"></script>
    <script src="JS/jQuery.scrolly.min.js"></script>
    <script src="JS/skel.min.js"></script>
    <script src="JS/util.js"></script>
    <script src="JS/main.js"></script>
</body>
</html>