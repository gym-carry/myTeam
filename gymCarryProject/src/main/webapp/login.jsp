<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="login.css">
  <!-- <script type="text/javascript" src="login.js" defer></script> -->
  <style>

  </style>
  <title>login</title>
</head>
<body>
	<form class="login_form" name="myForm" action="loginAction.jsp">
      <input id="id_input" class="input_field" type="text" name="id" placeholder="아이디">
      <small id="id_error" class="error_message"></small>
      <input id="pwd_input" class="input_field" type="password" name="pwd" placeholder="비밀번호">
      <small id="pwd_error" class="error_message"></small>
      <button id="submit_btn" class="reg_btn" type="submit" >로그인</button>
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
    <script type="text/javascript">
    <input id="id_input" class="input_field" type="text" name="id" placeholder="아이디">
    <small id="id_error" class="error_message"></small>
    <input id="pwd_input" class="input_field" type="password" name="pwd" placeholder="비밀번호">
    <small id="pwd_error" class="error_message"></small>
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
  <script type="text/javascript">
  const idInput = document.getElementById("id_input");
  const pwdInput = document.getElementById("pwd_input");
  const form = document.querySelector(".login_form");
  const idError = document.getElementById("id_error");
  const pwdError = document.getElementById("pwd_error");
  const logInBtn = document.getElementById("submit_btn");
  
  function onClickLoginSubmit(e){
    e.preventDefault();
    let result = true;
    if(idInput.value == ""){ 
      idInput.className = 'input_id';
      idError.innerText = "아이디를 입력해주세요";
      idInput.focus();
      result = false;
    }else if(pwdInput.value == ""){
      pwdInput.className = 'input_pwd';
      pwdError.innerText = '비밀번호를 입력해주세요';
      pwdInput.focus();
      result = false;
    }
    
    if (result) {
      onSubmitHandler(); // 로그인 성공 시 호출되는 함수
    }
  }
  
  function onSubmitHandler(){
    alert("로그인 성공")
  }
  
  logInBtn.addEventListener('click', onClickLoginSubmit); // 클릭 이벤트 핸들러 등록
  form.addEventListener('submit', function(e) {
    e.preventDefault(); // 폼 제출을 막음
    onClickLoginSubmit(e); // 클릭 이벤트 핸들러 호출
  });
    
    
    </script>
</body>
</html>