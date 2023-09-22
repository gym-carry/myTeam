<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<link rel="stylesheet" href="./styles/home.css">
<title>메인화면</title>
</head>
<body>
	<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
	%>
	<div id="wrapper">
	    
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
		<div class="img_container">		
	        <a href="#">
	            <img src="리뷰로고.svg" alt="리뷰게시판 로고">
	        </a>
		</div>
		<div class="img_container">		
	        <a href="#">
	            <img src="홍보로고.svg" alt="홍보게시판 로고">
	        </a>   
		</div>
	    </main>
	
	 </div>
</body>
</html>