<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="gymCarryProject.board.*, java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO"
   scope="request" />
<jsp:useBean id="dao" class="gymCarryProject.board.RBoardDAO"
   scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홍보 게시물 삭제하기</title>
<%
int num = Integer.parseInt(request.getParameter("num"));
int result = dao.delete(num);
%>
</head>
<body>
   <%
   if (result == 1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('정말로 해당 게시글을 삭제하시겠습니까?')");
      script.println("alert('삭제처리 되었습니다.')");
      script.println("location.href ='RBoardList.jsp'");
      script.println("</script>");
   } else if(result == -1) {
      PrintWriter script = response.getWriter();
      script.println("<script>");
      script.println("alert('잘못된 요청입니다.')");
      script.println("history.back()");
      script.println("</script>");
   }
   %>
</body>
</html>