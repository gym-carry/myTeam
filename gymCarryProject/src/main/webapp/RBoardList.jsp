<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="gymCarryProject.*, java.util.Date"%>
<%@ page import="gymCarryProject.board.RBoardDAO"%>
<%@ page import="gymCarryProject.board.BoardDTO"%>
<%@ page import="java.util.ArrayList"%>
 <jsp:useBean id="dao" class="gymCarryProject.board.RBoardDAO" scope="application" />
 <jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./styles/RBoardList.css">
<title>Insert title here</title>
</head>
<body>
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
<main>
  <button type="button" onclick="location.href='RWrite.jsp'">글쓰기</button>
  <table>
    <thead>
      <tr>
        <th>번호</th>
        <th>작성자</th>
        <th>지역</th>
        <th>지점명</th>
        <th>제목</th>
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
	
</body>
</html>