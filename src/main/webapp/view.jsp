<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="comments.Comments" %>
<%@ page import="comments.CommentsDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Q & A</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
    	.post-details { text-align: right; font-size: 0.8em; color: #666; margin-bottom: 10px; }
        .button-container { text-align: right; margin-top: 20px; }
        .button-container .button { margin-left: 5px; }
        .comment-form,
        .comment-section {
            width: 100%;
            box-sizing: border-box;
            margin-top: 20px;
        }
        .comment-form form {
            display: flex;
            flex-direction: column;
        }
        .comment-form textarea {
            width: 100%;
            height: 80px;
            margin-bottom: 10px;
        }
        .comment-form button {
            align-self: flex-end; /* Right-aligns the submit button */
        }
        .comment {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }
        .comment-content p:last-child {
            text-align: right;
            font-size: 0.8em; /* Smaller font size for the comment date */
            margin: 0;
        }
        .comment-section {
	    width: 100%;
	    box-sizing: border-box;
	    margin-top: 20px;
	    padding-top: 20px; /* Added padding to create space */
		}
		.delete-link {
		    font-size: 0.8em; /* Same size as the comment date */
		    color: #007bff; /* Bootstrap primary color or any color you prefer */
		    text-decoration: underline;
		}
    </style>
</head>
<body>
	<%
	    String userID = (String) session.getAttribute("userID");
	    int bbsID = 0;
	    try {
	        bbsID = Integer.parseInt(request.getParameter("bbsID"));
	    } catch (NumberFormatException e) {
	        bbsID = 0;
	    }
	    if (bbsID == 0) {
	        response.sendRedirect("bbs.jsp");
	        return;
	    }
	
	    BbsDAO bbsDAO = new BbsDAO();
	    Bbs bbs = bbsDAO.getBbs(bbsID);
	    if (bbs == null) {
	        response.sendRedirect("bbs.jsp");
	        return;
	    }
	
	    CommentsDAO commentsDAO = new CommentsDAO();
	    List<Comments> commentsList = commentsDAO.getComments(bbsID);
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
	
	<nav id="menu">
	    <ul class="links">
	        <li><a href="Home.jsp">Home</a></li>
	        <li><a href="Forecast.jsp">Today's Weather</a></li>
	        <li><a href="Clothing.jsp">Today's Clothing</a></li>
	        <li><a href="bbs.jsp">Q & A</a></li>
	    </ul>
	</nav>
	
	<section id="main" class="wrapper">
	    <div class="inner container">
	        <header class="align-center">
	            <h1>Q & A</h1>
	        </header>
	
	        <div class="form-container">
	            <div class="post-details">
	                작성자: <%= bbs.getUserID() %> | 작성일자: <%= bbs.getBbsDate() %>
	            </div>
	
	            <label>Title</label>
	            <p><%= bbs.getBbsTitle() %></p>
	            <label>Content</label>
	            <p><%= bbs.getBbsContent() %></p>
	
	            <div class="button-container">
	                <a href="Q&A.jsp" class="button">목록</a>
	                <%
	                    if (userID != null && userID.equals(bbs.getUserID())) {
	                %>
	                <a href="update.jsp?bbsID=<%= bbsID %>" class="button">수정</a>
	                <a onclick="return confirm('글을 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="button">삭제</a>
	                <%
	                    }
	                %>
	            </div>
	        </div>
	
	        <div class="comment-section">
	            <div class="comment-form">
		            <form method="post" action="CommentAction.jsp">
		                <input type="hidden" name="postID" value="<%= bbsID %>">
		                <textarea name="commentContent" placeholder="Write your comment here..." required></textarea>
		                <button class="button" type="submit">등록</button>
		            </form>
		        </div>
	            <%
	                if (commentsList != null && !commentsList.isEmpty()) {
	                    for (Comments comment : commentsList) {
	            %>
			<div class="comment">
			    <div class="comment-content">
			        <p><strong><%= comment.getUserID() %>:</strong> <%= comment.getCommentContent() %></p>
			        <p>
			            <em><%= comment.getCommentDate() %></em>
			            <% if (userID != null && userID.equals(comment.getUserID())) { %>
			            | <a href="CommentDeleteAction.jsp?commentID=<%= comment.getCommentID() %>" class="delete-link" onclick="return confirm('Are you sure you want to delete this comment?')">Delete</a>
			            <% } %>
			        </p>
			    </div>
			</div>
	            <%
	                    }
	                } else {
	            %>
	            <p>No comments yet.</p>
	            <%
	                }
	            %>
	        </div>
	    </div>
	</section>
	
	<footer id="footer">
	    <div class="inner">
	        <h2>Get In Touch</h2>
	        <ul class="actions">
	            <li>Email: kimyunseo123@naver.com</li>
	            <li>Location: Chungbuk National University</li>
	        </ul>
	    </div>
	</footer>
	
	<script src="JS/jQuery.min.js"></script>
	<script src="JS/jQuery.scrolly.min.js"></script>
	<script src="JS/skel.min.js"></script>
	<script src="JS/util.js"></script>
	<script src="JS/main.js"></script>
</body>
</html>