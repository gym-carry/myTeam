<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="gymCarryProject.*, java.util.Date"%>
<%@ page import="gymCarryProject.board.RBoardDAO"%>
<%@ page import="gymCarryProject.board.BoardDTO"%>
<%@ page import="java.util.ArrayList"%>
 <jsp:useBean id="dao" class="gymCarryProject.board.RBoardDAO" scope="application" />
 <jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./styles/RBoardList.css">
<title>Insert title here</title>
</head>
<body class="body_wrpper">
	<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
/* 		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}  */
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
	        
	
	    <nav>
	        
	        <ul class="main_nav">
	            <li class="main_nav_li">
	                <a href="RBoardList.jsp">리뷰</a>
	            </li>
	            <li class="main_nav_li">
	                <a href="adBoardList.jsp">홍보</a></li>
	        </ul>
	
	    </nav>
<main class="main">

  <button class="write_btn" type="button" onclick="location.href='RWrite.jsp'">글쓰기</button>
  <div class="search_wrapper">
    <input class="filter search_input" type="text" name="searchInput" placeholder="검색어 입력">
  </div>
  <button class="filter search_btn" type="button">검색</button>
  <select class="filter filter_select" name="sort" id="sort">
    <option value="조회수">조회수</option>
    <option value="최근글">최근글</option>
  </select>
  <table>
    <thead>
    <tr>
      <th>번호</th>
      <th>작성자</th>
      <th style="padding : 8px 10px 8px 10px">지역</th>
      <th style="padding : 0 20px 0 20px">지점명</th>
      <th style="padding : 0 90px 0 90px">제목</th>
      <th>작성일</th>
      <th>조회수</th>
    </tr>
    </thead>
    <tbody>
	    <%
	    	ArrayList<BoardDTO> list = dao.getList();
	    	for(int i = 0 ; i < list.size() ; i++){
   		%>
	 		<tr>
		        <td><%= list.get(i).getBoardNum() %></td>
		        <td><%= list.get(i).getUserId() %></td>
		        <td><%= list.get(i).getLocal() %></td>
		        <td><%= list.get(i).getCompanyName() %></td>
		        <td>
		        	<a href="RBoardDetail.jsp?num=<%= list.get(i).getBoardNum() %>">		        	
		        		<%= list.get(i).getBoardTitle() %>
		        	</a>
		        </td>
		        <td><%= list.get(i).getBoardRegdate() %></td>
		        <td><%= list.get(i).getViewCnt() %></td>
	      	</tr>
   		<%
	    	}
	    %>

    </tbody>
  </table>
</main>
<footer>
  <address>
    <p>dev.rowoon@gmail.com</p>
    <p>weew9900@gmail.com</p>
    <p>copyright &copy; by 로운완.All Rights Reserved.</p> 
  </address>
</footer>
</body>
</html>