<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="gymCarryProject.board.*, java.util.*"%>
<jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO"
   scope="request" />
<jsp:useBean id="dao" class="gymCarryProject.board.RBoardDAO"
   scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./styles/RWrite.css">
<title>수정하기</title>
<%
   String id = null;
   if (session.getAttribute("id") != null) {
   id = (String) session.getAttribute("id");
   }

   int num = Integer.parseInt(request.getParameter("num"));
   dto = dao.getBoard(num);
   request.setAttribute("dto", dto);
%>
</head>
<body>
   <header>
      <%
      if (id == null) {
      %>
      <ul class="header_nav">
         <li><a href="login.jsp">로그인</a></li>

         <li><a href="register.jsp">회원가입</a></li>

         <li><a href=""><img src="마이페이지로고.svg" alt="마이페이지로고"></a></li>
      </ul>
      <%
      } else {
      %>
      <ul class="header_nav">
         <li><a href="login.jsp"><%=id%>님</a></li>
         <li><a href="logoutAction.jsp">로그아웃</a></li>

         <li><a href=""><img src="마이페이지로고.svg" alt="마이페이지로고"></a></li>
      </ul>
      <%
      }
      %>


      <div class="header_logo">
         <img src="메인로고.svg" alt="짐캐리로고">
      </div>

   </header>

	<main>
	<h1>헬스장 리뷰</h1>
	 <form action="updateAction.jsp" method="post">
     <input type="hidden" name="boardNum" value="<%= dto.getBoardNum()%>">
     <!-- 등록버튼 -->
    <input class="button submit_btn" type="submit" value="수정하기">

    <!-- 취소버튼 -->
    <button class="button cancel_btn" type="button" onclick="location.href='RBoardList.jsp'">
      취소하기
    </button>

    <div class="select_wrapper">
      <!-- 글쓴이 -->
      <div class="writer_wrpper">
        <div>
          <input name="userId" type="text" value="<%=dto.getUserId() %>" >
        </div>
      </div>

      <!-- 지점명 -->
      <div class="company_wrpper">
        <input name="companyName" type="text" value="<%=dto.getCompanyName() %>" >
      </div>

      <!-- 지역선택 셀렉터 -->
      <div class="locate_wrpper">
        <select name="local">
          <option selected="selected" value="지역"><%=dto.getLocal() %></option>
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
      <input name="boardTitle" type="text" value="<%=dto.getBoardTitle() %>" >
    </div>

    <!-- 글쓰기 -->
    <div class="write_wrpper">
      <textarea name="boardContent"><%=dto.getBoardContent() %></textarea>
    </div>


  </form>
	</main>
    

</body>
</html>