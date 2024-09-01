<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Clothing</title>
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

    <!-- Main Section -->
    <section id="main" class="wrapper">
        <header class="align-center">
            <h1>Today's Clothing</h1>
            <p style="font-size: small; color: #666;">해당 지역의 날씨와 강수 확률을 입력하면 적절한 옷차림을 추천해줍니다. 추천 옷차림으로 오늘의 코디를 완성해보세요.</p>
            <!-- Temperature and Rain Input -->
            <div class="inputs">
                <label for="temperature">Temperature:</label>
                <input type="text" id="temperature" name="temperature" class="temperature-input" placeholder="Enter temperature (°C)">
                <label for="rain">Rain Probability:</label>
                <select id="rain" name="rain">
                    <option value="none">No Rain</option>
                    <option value="low">Low</option>
                    <option value="medium">Medium</option>
                    <option value="high">High</option>
                </select>
                <button id="submit" class="button">GO</button>
            </div>
        </header>

        <!-- Container for left and right sections -->
        <div class="main-content">
            <div class="left-section">
                <h3>Recommended Outfit</h3>
                <!-- Clothing Recommendations -->
                <div class="recommendations">
                    <div class="recommendation" id="top-recommendation">
                        <h3>Top</h3>
                        <img src="" alt="Top Image" style="display:none;">
                    </div>
                    <div class="recommendation" id="bottom-recommendation">
                        <h3>Bottom</h3>
                        <img src="" alt="Bottom Image" style="display:none;">
                    </div>
                    <div class="recommendation" id="etc-recommendation">
                        <h3>Etc</h3>
                        <img src="" alt="Etc Image" style="display:none;">
                    </div>
                </div>
            </div>
            <div class="right-section">
                <div class="custom-outfit">
                    <h3>My Outfit</h3>
                    <div class="outfit">
                        <div class="outfit-part">
                            <div class="outfit-box" id="gender-box"></div>
                        </div>
                        <div class="outfit-part">
                            <div class="outfit-box" id="top-box"></div>
                        </div>
                        <div class="outfit-part">
                            <div class="outfit-box" id="bottom-box"></div>
                        </div>
                        <div class="outfit-part">
                            <div class="outfit-box" id="etc-box"></div>
                        </div>
                    </div>
                    <div class="gender-buttons">
                        <div id="male-button" class="gender-button active">M</div>
                        <div id="female-button" class="gender-button">F</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <div class="inner">
            <h2>Get In Touch</h2>
            <ul class="actions">
                <li>Email: kimyunseo123@naver.com</li>
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
	<script src=JS/Clothing.js></script>
</body>
</html>