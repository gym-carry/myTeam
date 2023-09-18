<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="gymCarryProject.*, java.util.Date"%>
 <jsp:useBean id="db" class="gymCarryProject.UserDAO" scope="application" />    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인 결과</title>
</head>
<body>

<div style="text-align: center">
<h2>중복확인결과</h2>
</div>
<% 
String id  = request.getParameter("id");
int result = db.doubleCheckID(id);
out.println(result);
%>

</body>
</html>