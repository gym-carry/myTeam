<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="gymCarryProject.board.*, java.util.*"%>
<jsp:useBean id="db" class="gymCarryProject.board.ADBoardDAO"
	scope="session" />
<jsp:useBean id="user" class="gymCarryProject.board.BoardDTO"
	scope="request" />
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="./styles/adBoardList.css">
<title></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/style.css" rel="stylesheet">

</head>
<body class="body_wrpper">
	<%
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	%>

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


	<nav>

		<ul class="main_nav">
			<li class="main_nav_li"><a href="">리뷰</a></li>
			<li class="main_nav_li"><a href="">홍보</a></li>
		</ul>

	</nav>

	<main class="main">
		<button class="write_btn" type="button"
			onclick="location.href='adWrite.jsp'">글쓰기</button>
		<div class="search_wrapper">
			<input class="filter search_input" type="text" name="searchInput"
				placeholder="검색어 입력">
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
					<th style="padding: 8px 10px 8px 10px">지역</th>
					<th style="padding: 0 20px 0 20px">지점명</th>
					<th style="padding: 0 90px 0 90px">제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<%
					ArrayList<BoardDTO> ls = db.selectAll();
					for (BoardDTO dto : ls) {
					%>
					<td><%=dto.getBoardNum()%></td>
					<td><%=dto.getUserId()%></td>
					<td><%=dto.getLocal()%></td>
					<td><%=dto.getCompanyName()%></td>
					<td><a href="adBoardDetail.jsp?num=<%=dto.getBoardNum()%>"><%=dto.getBoardTitle()%></a></td>
					<td><%=dto.getBoardRegdate()%></td>
					<td><%=dto.getViewCnt()%></td>
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