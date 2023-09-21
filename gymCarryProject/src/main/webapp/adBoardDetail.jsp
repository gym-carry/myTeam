<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gymCarryProject.board.*, java.util.*" %>
<jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO" scope="request"/>
<jsp:useBean id="dao" class="gymCarryProject.board.ADBoardDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
    System.out.println(num);
	dto = dao.select(num);
	request.setAttribute("dto", dto);
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p><%= dto.getBoardNum() %></p>
<p><%= dto.getUserId() %></p>
<p><%= dto.getLocal() %></p>
<p><%= dto.getCompanyName() %></p>
<p><%= dto.getBoardTitle() %></p>
<p><%= dto.getBoardContent() %></p>
<p><%= dto.getBoardRegdate() %></p>
<p><%= dto.getViewCnt() %></p>

</body>
</html>