<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아</title>
</head>
<body>
	<%
		session.invalidate();
	%>
	<script>
		location.href = 'home.jsp';
	</script>
</body>
</html>