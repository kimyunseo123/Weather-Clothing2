<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Q & A</title>
    <meta name="robots" content="index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style type="text/css">
		a, a:hover{
		color : #000000;
		text-decoration: none;
		}
	</style>
</head>
<body>
    <%    
        String userID = null;
        if(session.getAttribute("userID") != null){
            userID = (String) session.getAttribute("userID");
        }
        
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
        <div class="inner container">
            <header class="align-center">
                <h1>Q & A</h1>
            </header>

            <a href="write.jsp" class="button write" id="writeButton">글쓰기</a>

            <div class="write-list">
                <div class="write-header">
                	<span>번호</span>
                    <span>제목</span>
                    <span>작성자</span>
                    <span>작성일</span>
                </div>
                <%
                	BbsDAO bbsDAO = new BbsDAO();
                	ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                	for(int i=0; i<list.size(); i++) {
                %>
                <li>
				    <span><%= list.get(i).getBbsID() %></span>
				    <span><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></span>
				    <span><%= list.get(i).getUserID() %></span>
				    <span><%= list.get(i).getBbsDate() %></span>
				</li>
				<%
                	}
				%>
            </div>

        </div>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <div class="inner">
            <h2>Get In Touch</h2>
            <ul class="actions">
                <li>Email: kimyunseo123@naver.com</li>
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
