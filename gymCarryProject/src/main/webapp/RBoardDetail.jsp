<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="gymCarryProject.*, java.util.Date" %>
<%@ page import="gymCarryProject.board.BoardDTO" %>
<%@ page import="gymCarryProject.board.RBoardDAO"%>
<jsp:useBean id="dao" class="gymCarryProject.board.RBoardDAO" scope="application" />
<jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./styles/RBoardDetail.css">
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
 <header>
		    <%
		    	if(id == null){
		    %>
	        <ul class="header_nav">
	            <li>
	                <a href="login.jsp">로그인</a>
	            </li> 
	
	            <li>
	                <a href="register.jsp">회원가입</a>
	            </li>
	
	            <li>
	                <a href=""><img src="마이페이지로고.svg" alt="마이페이지로고"></a>
	            </li>  
	        </ul> 
		    <%
		    	} else {		    
		    %>
	        <ul class="header_nav">
	            <li>
	                <a href="login.jsp"><%=id %>님</a>
	            </li> 
   	            <li>
	                <a href="logoutAction.jsp">로그아웃</a>
	            </li> 
	
	            <li>
	                <a href=""><img src="마이페이지로고.svg" alt="마이페이지로고"></a>
	            </li>  
	        </ul> 
			<%
		    	}
			%>
	
	
	        <div class="header_logo">
	            <img src="메인로고.svg" alt="짐캐리로고">
	        </div>
	        
	    </header>


		<main>
		  <div class="top_wrapper">
		    <div><%= dto.getBoardNum() %></div>
		    <div><%= dto.getCompanyName() %></div>
		    <div><%= dto.getLocal() %></div>
		  </div>
		  <div class="date"><%= dto.getBoardRegdate() %></div>
		  <h2><%= dto.getBoardTitle() %></h2>  
		
		  <div class="middle_wrapper">
		    <div><%= dto.getUserId() %></div>
		    <div><%= dto.getViewCnt() %></div>
	        <button class="mod_btn" type="button" onclick="location.href='Update.jsp?num=<%= dto.getBoardNum() %>'">수정</button>
    		<button type="button" onclick="location.href='deleteAction.jsp?num=<%= dto.getBoardNum() %>'">삭제</button> 
		  </div>
		  <div class="content"><%= dto.getBoardContent() %></div>
		</main>
</body>
</html>