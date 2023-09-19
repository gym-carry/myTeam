<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="gymCarryProject.*, java.util.Date"%>
 <%@ page import="java.io.PrintWriter" %>
 <%@ page import="gymCarryProject.UserDAO" %>
 <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="db" class="gymCarryProject.UserDAO" scope="application" />
 <jsp:useBean id="user" class="gymCarryProject.UserDTO" scope="page" />
 <jsp:setProperty name="user" property="id" />
 <jsp:setProperty name="user" property="pwd" />
 <jsp:setProperty property="*" name="user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login action</title>
</head>
<body>
	<%
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
		}
		if(id != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'home.jsp'");
			script.println("</script>");
		}
		
 		int result = db.login(user.getId(), user.getPwd());

		System.out.println(result);
		if(result == 1){
			session.setAttribute("id", user.getId());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'home.jsp'");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('올바른 비밀번호를 입력해주세요.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('올바른 아이디를 입력헤주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생헀습니다.')");
			script.println("history.back()");
			script.println("</script>");

		} 
	%>
</body>
</html>