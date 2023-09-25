<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="gymCarryProject.board.*, java.util.*" %>
<jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO" scope="request"/>
<jsp:useBean id="dao" class="gymCarryProject.board.RBoardDAO" scope="session"/>
<jsp:setProperty name="dto" property="*" />
<!DOCTYPE html>
<html>
<%

   int result = dao.update(dto);
%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   if (result == 1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('게시물 수정이 완료되었습니다.')");
      script.println("location.href=RBoardList.jsp'");
      script.println("</script>");
   } else if (result == -1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('게시물을 다시 입력해주세요')");
      script.println("history.back()");
      script.println("</script>");
   } else {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert( '입력오류 입니다.')");
      script.println("location.href= 'RBoardDetail.jsp'");
      script.println("</script>");
   }

%>
</body>
</html>