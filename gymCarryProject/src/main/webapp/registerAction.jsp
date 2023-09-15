<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gymCarryProject.*, java.util.*" %> 
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
%>  
<%
	if(result == 1) {
		%>
   <%=dto.getName() %>님 회원가입이 완료되었습니다.
<%	
	}
%>
</body>
</html>