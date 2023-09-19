<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
	                <a href="">홍보</a></li>
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
      <tr>
        <td>1</td>
        <td>이로운</td>
        <td>광진구</td>
        <td>헬스보이짐</td>
        <td>헬스보이짐 리뷰</td>
        <td>23.01.01</td>
        <td>5</td>
      </tr>
    </tbody>
  </table>
</main>
	
</body>
</html>