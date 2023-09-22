<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gymCarryProject.board.*, java.util.*"%>
<jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO"
	scope="application" />
<jsp:useBean id="dao" class="gymCarryProject.board.ADBoardDAO"
	scope="application" />
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
	<p><%=dto.getBoardNum()%></p>
	<p><%=dto.getUserId()%></p>
	<p><%=dto.getLocal()%></p>
	<p><%=dto.getCompanyName()%></p>
	<p><%=dto.getBoardTitle()%></p>
	<p><%=dto.getBoardContent()%></p>
	<p><%=dto.getBoardRegdate()%></p>
	<p><%=dto.getViewCnt()%></p>
    <button type="button" onclick="location.href='editForm.jsp?num=<%=dto.getBoardNum()%>'">
		수정하기</button>
	<button type="button" onclick="location.href='adBoardList.jsp'">
	돌아가기</button>	
</body>
</html>