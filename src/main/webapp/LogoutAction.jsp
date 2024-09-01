<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LogoutAction</title>
</head>
<body> 
	<%
		session.invalidate();
	%>
	<script>
		location.href = 'Home.jsp';
	</script>
</body>
</html>