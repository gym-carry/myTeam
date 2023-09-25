<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./styles/adWrite.css">
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

<main>
  <h1>헬스장 홍보</h1>
  <form action="adWriteAction.jsp">
     <!-- 등록버튼 -->
    <input class="button submit_btn" type="submit" value="등록하기">

    <!-- 취소버튼 -->
    <button class="button cancel_btn" type="button" onclick="location.href='adBoardList.jsp'">
      취소하기
    </button>

    <div class="select_wrapper">
      <!-- 글쓴이 -->
      <div class="writer_wrpper">
        <div>
          <input name="userId" type="text" value="<%=id %>" placeholder="작성자">
        </div>
      </div>

      <!-- 지점명 -->
      <div class="company_wrpper">
        <input name="companyName" type="text" placeholder="지점명">
      </div>

      <!-- 지역선택 셀렉터 -->
      <div class="locate_wrpper">
        <select name="local">
          <option selected="selected" value="지역">지역을 선택해주세요</option>
          <option value="강남">강남</option>
          <option value="관악">관악</option>
          <option value="구로">구로</option>
          <option value="마포">마포</option>
          <option value="송파">송파</option>
          <option value="영등">영등</option>
          <option value="용산">용산</option>
        </select>
      </div>
    </div>


    <!-- 제목 -->
    <div class="title_wrapper">
      <input name="boardTitle" type="text" placeholder="제목">
    </div>

    <!-- 글쓰기 -->
    <div class="write_wrpper">
      <textarea name="boardContent" placeholder="글을 작성해주세요"></textarea>
    </div>


  </form>
</main>
</body>
</html>