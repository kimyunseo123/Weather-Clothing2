<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Q & A</title>
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
		if(userID == null)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'Login.jsp'");
			script.println("</script>");
		}
		
		int bbsID = 0;
		if(request.getParameter("bbsID") != null)
		{
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if(bbsID ==0)
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다..')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
	%>
	<header id="header">
	    <nav class="left"><a href="#menu"><span>Menu</span></a></nav>
	    <a href="Home.jsp" class="logo">Weather Clothing</a>
	    <nav class="right">
	        <%
	            if (userID == null) {
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
                <h1>Update a Post</h1>
            </header>

            <!-- 게시글 작성 폼 -->
            <div class="form-container">
				<form method="post" action="updateAction.jsp">
				    <input type="hidden" name="bbsID" value="<%= bbs.getBbsID() %>">
				    <label for="title">Title</label>
				    <input type="text" name="bbsTitle" value="<%= bbs.getBbsTitle()%>" required>
				
				    <label for="content">Content</label>
				    <textarea name="bbsContent" required><%= bbs.getBbsContent()%></textarea>
				
				    <button type="submit">Update</button>
				</form>
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