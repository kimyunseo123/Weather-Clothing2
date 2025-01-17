<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <% 

        if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserEmail() == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 사항이 있습니다.')");
            script.println("history.back()"); // 뒤로가기
            script.println("</script>");
        } else {
            UserDAO userDAO = new UserDAO(); //데이터 베이스에 접근 가능한 객체생성
            int result = userDAO.join(user);
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");
                script.println("</script>");
            } else { // 회원가입이 되었을때 로그인 페이지로 넘어감,-1이 아닌경우 전부 넘어가도록함
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'Login.jsp'"); //로그인된 화면
                script.println("</script>");
            }
        }

    %>
</body>
</html>