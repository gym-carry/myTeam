<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gymCarryProject.*, java.util.*" %> 
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="dao" class="gymCarryProject.UserDAO" scope="request" />
<jsp:useBean id="dto" class="gymCarryProject.UserDTO" scope="request" />
<jsp:setProperty name="dto" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerAction</title>
</head>
<body>
<%
	int result = dao.insert(dto);	

if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 완료되었습니다.')");
		script.println("location.href = 'home.jsp'");
		script.println("</script>");
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력정보를 다시 확인해주세요.')");
		script.println("history.back()");
		script.println("</script>");
	}

%>
</body>
</html>