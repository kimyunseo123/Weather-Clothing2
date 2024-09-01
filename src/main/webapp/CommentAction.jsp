<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comments.CommentsDAO, comments.Comments" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Comment</title>
</head>
<body>
<%
    String userID = (String) session.getAttribute("userID");
    int postID = Integer.parseInt(request.getParameter("postID"));
    String commentContent = request.getParameter("commentContent");
    String commentDate = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());

    if (userID != null && commentContent != null && !commentContent.trim().isEmpty()) {
        Comments comment = new Comments();
        comment.setPostID(postID);
        comment.setUserID(userID);
        comment.setCommentContent(commentContent);
        comment.setCommentDate(commentDate);

        CommentsDAO commentsDAO = new CommentsDAO();
        commentsDAO.addComment(comment);

        response.sendRedirect("view.jsp?bbsID=" + postID); // Correct redirection to the post page
    } else {
        out.println("Error: Please log in and provide a comment.");
    }
%>
</body>
</html>
