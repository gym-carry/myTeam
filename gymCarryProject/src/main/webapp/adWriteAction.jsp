<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.PrintWriter" %>
 <%@ page import="gymCarryProject.board.*, java.util.Date"%>    
 <jsp:useBean id="db" class="gymCarryProject.board.ADBoardDAO" scope="session" />
 <jsp:useBean id="user" class="gymCarryProject.board.BoardDTO" scope="request" />
 <jsp:setProperty name="user" property="*" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adWriteAction.jsp</title>
</head>
<body>
<%
		String id = null;

		if (session.getAttribute("id") != null) {
		id =(String)session.getAttribute("id");	
		}
		
		if (id == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		int result = db.insert(user);
		
		if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert( '게시글 등록이 완료되었습니다.')");
			script.println("location.href= 'adBoardDetail.jsp'");
			script.println("</script>");
		} else if (result == -1 ) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert( '게시글 등록내용을 확인해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
%>

        <button type="button" onclick="location.href='adBoardList.jsp'">목록보기</button>
</body>
</html>