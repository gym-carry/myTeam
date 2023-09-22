<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="gymCarryProject.board.*, java.util.*" %>
<jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO" scope="request"/>
<jsp:useBean id="dao" class="gymCarryProject.board.ADBoardDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
<%
	int num = Integer.parseInt(request.getParameter("num"));
    System.out.println(num);
	dto = dao.select(num);
	request.setAttribute("dto", dto);
%>
</head>
<body>
<form action="edit.jsp">
<p><input name="boardNum" value=<%= dto.getBoardNum() %> /></p>
<p><input name="userId" value=<%= dto.getUserId() %> /></p>
<p><input name="local" value=<%= dto.getLocal() %> /></p>
<p><input name="companyName" value=<%= dto.getCompanyName() %> /></p>
<p><input type="text" name="boardTitle" /></p>
<p><textarea name="boardContent"></textarea></p>
<p><input name="boardRegdate" value=<%= dto.getBoardRegdate() %> /></p>
<p><input name="boardRegdate" value=<%= dto.getViewCnt() %> /></p>
<input type="submit" value="수정하기" />
</form>

</body>
</html>