<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>login</title>
  <style>
    *{
      box-sizing: border-box;
    }

    body{
      margin: 0;
      background-color: #1BBC9B;
    }

    ul{
    list-style: none;
  }

  a{
    color: inherit;
    text-decoration: none;
  }

    /* 폼 전체 */
    .login_form{
      background-color: #D9D9D9;
      width: 300px;
      height: 250px;
      padding: 20px;
      border: 0;
      border-radius: 5px;
      margin: 0 auto;
      display: flex;
      flex-direction: column;
      margin-top: 12%;
    }

    /* 폼 input */
    .input_field{
      margin-bottom: 15px;
      font-size: 14px;
      border: none;
      border-radius: 5px;
      padding: 10px;
    }

    /* 이름 인풋 */
    .input_name{
      width: 100px;
      height: 23px;
    }

    /* 버튼 */
    .reg_btn{
      background-color: #1BBC9B;
      border: none;
      border-radius: 5px;
      padding: 10px;
      color: #fff;
    }

    .form_sub_wrpper{
      display: flex;
      font-size: 11px;
      justify-content: space-between;
      color: #696969;
    }

    .form_ul{
      display: flex;
      font-size: 13px;
      margin-top: 30px;
      font-size: 11px;
    }

    .a_link{
      margin-top: 30px;
    }

    .driver{
      margin: 0 5px;
    }

  </style>
</head>
<body>
    <form class="login_form" action="loginAction.jsp">
      <input class="input_field input_login" type="text" name="id" placeholder="아이디">
      <input class="input_field input_login" type="text" name="pwd" placeholder="비밀번호">
      <input class="reg_btn" type="submit" value="로그인">
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