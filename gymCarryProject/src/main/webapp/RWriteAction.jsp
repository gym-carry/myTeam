<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="gymCarryProject.*, java.util.Date"%>
 <%@ page import="gymCarryProject.board.RBoardDAO" %>
 <%@ page import="java.io.PrintWriter" %>
 <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="dao" class="gymCarryProject.board.RBoardDAO" scope="application" />
 <jsp:useBean id="dto" class="gymCarryProject.board.BoardDTO" scope="request" />
 <jsp:useBean id="login" class="gymCarryProject.UserDTO" scope="session" />
 <jsp:setProperty name="dto" property="boardTitle" />
 <jsp:setProperty name="dto" property="boardContent" />
 <jsp:setProperty property="*" name="dto" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login action</title>
</head>
<body>
	<%

 		String userID = null;
		if(session.getAttribute("id") != null) {
			userID = (String) session.getAttribute("id");
		}

		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}else{
			if(dto.getBoardTitle() == null || dto.getBoardContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('제목과 내용을 입력해주세요.')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				int result = dao.write(dto);
				if(result == -1){	
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패하였습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
			}
		}
	 
	%>
</body>
</html>