<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="gymCarryProject.*, java.util.Date"%>
 <jsp:useBean id="user" class="gymCarryProject.UserDTO" scope="page" />
 <jsp:setProperty property="*" name="user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login action</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	%>
</body>
</html>