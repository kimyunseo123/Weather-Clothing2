<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>SignUp</title>
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
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
        <div class="inner">
            <header class="align-center">
                <h1>Sign Up</h1>
            </header>
            <div class="signup-container">
                <form id="signupForm" method="post" class="signup-form" action="JoinAction.jsp">
                    <div class="row">
                        <label for="id">ID:</label>
                        <input type="text" name="userID" placeholder="Enter your ID"/>
                    </div>
                    <div class="row">
                        <label for="password">Password:</label>
                        <input type="password" name="userPassword" placeholder="Enter your Password"/>
                    </div>
                    <div class="row">
                        <label for="name">Name:</label>
                        <input type="text" name="userName"placeholder="Enter your Name"/>
                    </div>
                    <div class="row">
                        <label for="email">Email:</label>
                        <input type="email" name="userEmail" placeholder="Enter your Email" />
                    </div>
                    <div class="row button-wrapper align-center">
                        <button type="submit" class="button" id="signupbutton">Create</button>
                    </div>
                </form>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <div class="inner">
            <h2>Get In Touch</h2>
            <ul class="actions">
                <li>Email: <a href="mailto:kimyunseo123@naver.com">kimyunseo123@naver.com</a></li>
                <li>Location: Chungbuk National University</li>
            </ul>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="JS/jQuery.min.js"></script>
    <script src="JS/jQuery.scrolly.min.js"></script>
    <script src="JS/skel.min.js"></script>
    <script src="JS/util.js"></script>
    <script src="JS/main.js"></script>
</body>
</html>
