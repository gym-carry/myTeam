<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="login.css">
  <script type="text/javascript" src="login.js" defer></script>
  <title>login</title>
</head>
<body>
	<form class="login_form">
      <input id="id_input" class="input_field input_login" type="text" name="id" placeholder="아이디">
      <input id="pwd_input" class="input_field input_login" type="text" name="pwd" placeholder="비밀번호">
      <input id="submit_btn" class="reg_btn" type="submit" value="로그인">
      <div class="form_sub_wrpper">
          <a class="a_link" href="/register.jsp">회원가입</a>
        <ul class="form_ul">
          <li class="form_li">
            <a href="#">아이디찾기</a><span class="driver" aria-hidden="true">|</span>
          </li>
          <li class="form_li">
            <a href="#">비밀번호 찾기</a>
          </li>
        </ul>
      </div>
    </form>
</body>
</html>