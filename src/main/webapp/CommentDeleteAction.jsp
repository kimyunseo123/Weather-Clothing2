<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="comments.CommentsDAO" %>
<%
    String commentID = request.getParameter("commentID");
    if (commentID != null) {
        CommentsDAO commentsDAO = new CommentsDAO();
        commentsDAO.deleteComment(Integer.parseInt(commentID));
    }
    response.sendRedirect("view.jsp?bbsID=" + request.getParameter("bbsID")); 
%>
