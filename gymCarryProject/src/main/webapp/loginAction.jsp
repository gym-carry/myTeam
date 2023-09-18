<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="gymCarryProject.*, java.util.Date"%>
 <%@ page import="java.io.PrintWriter" %>
 <%@ page import="gymCarryProject.UserDAO" %>
 <% request.setCharacterEncoding("UTF-8"); %>
 <jsp:useBean id="db" class="gymCarryProject.UserDAO" scope="application" />
 <jsp:useBean id="user" class="gymCarryProject.UserDTO" scope="request" />
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
/*  		int result = db.login(user.getId(), user.getPwd());
		System.out.println(result);
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.html'");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생헀습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}   */
		 
  		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println(id + "\n" + pwd + "\n");

		user = db.select(user);
		System.out.println("select :: " + user); 
	 
	%>
</body>
</html>