<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="gymCarryProject.board.*, java.util.Date"%>    
 <jsp:useBean id="db" class="gymCarryProject.board.ADBoardDAO" scope="session" />
 <jsp:useBean id="user" class="gymCarryProject.board.BoardDTO" scope="request" />
 <jsp:setProperty name="user" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adWriteAction.jsp</title>
<%
	int result = db.insert(user);
	
%>
</head>
<body>
<%=user.getUserId()%>님 게시글 등록이 완료되었습니다.
</body>
</html>