<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="gymCarryProject.*, java.util.Date" %>
<%@ page import="gymCarryProject.board.BoardDTO" %>
<%@ page import="gymCarryProject.board.RBoardDAO"%>
<jsp:useBean id="dao" class="gymCarryProject.board.RBoardDAO" scope="application" />
<jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 페이지</title>
</head>
<body>
	<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
		
		int boardNum = 0;
		if(request.getParameter("num") != null){
			boardNum = Integer.parseInt(request.getParameter("num"));
		}
		if(boardNum == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'RBaordDetail.jsp'");
			script.println("</script>");
		}
		dto = dao.getBoard(boardNum);
	%>
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