<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Forecast</title>
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%    
        String userID = null;
        if(session.getAttribute("userID") != null){
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
    
    <section id="main" class="wrapper centered-content">
        <div class="inner">
            <header class="align-center">
                <h1>Today's Weather</h1>
                <p style="font-size: small; color: #666;">원하는 지역을 검색하면 해당 지역의 날씨 정보가 제공됩니다.</p>
            </header>
            <div>
                <input id="city" type="text" placeholder=" ex. Seoul" oninput="updateButtonColor()">
                <button id="searchButton" class="button" onclick="getWeather()">Search</button>
            </div>

            <!-- Current Weather -->
            <div id="currentWeather">
                <h3 id="forecastHeader">Today's Weather</h3>
                <p id="currentDate" style="font-weight: bold;"></p>
                <img id="currentWeatherIcon" src="" alt="Weather Icon">
                <p id="description" style="font-weight: bold;"></p>
                
                <!-- Weather Information with Icons -->
                <div class="weather-info">
                    <img id="temperatureIcon" src="images/현재온도.png" alt="Temperature Icon">
                    <span id="temperature"></span>
                    <img id="windIcon" src="images/풍력.png" alt="Wind Icon">
                    <span id="wind"></span>
                    <img id="precipitationIcon" src="images/강수량.png" alt="Precipitation Icon">
                    <span id="precipitation"></span>
                </div>
            </div>

            <!-- 5-Day Weather Forecast -->
            <div class="FiveDay" id="fiveDayForecast">
                <h3>5-Day Weather Forecast</h3>
            </div>
            <!-- Daily Forecast -->
            <div id="dailyForecasts">
                <!-- Forecast items will be added dynamically -->
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <div class="inner centered-content">
            <h2>Get In Touch</h2>
            <ul class="actions">
                <li>kimyunseo123@naver.com</li>
                <li>Chungbuk National University</li>
            </ul>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="JS/jQuery.min.js"></script>
    <script src="JS/jQuery.scrolly.min.js"></script>
    <script src="JS/skel.min.js"></script>
    <script src="JS/util.js"></script>
    <script src="JS/main.js"></script>
    <script src="JS/Forecast.js"></script>
</body>
</html>