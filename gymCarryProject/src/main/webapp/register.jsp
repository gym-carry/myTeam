<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="./styles/register.css" rel="stylesheet">
		<script type="text/javascript" src="./scripts/register.js"></script>
    </head>
    <body>
     <form class="register_form" name="myform" action="registerAction.jsp" onsubmit="return checkInput(myform)" >
        <input class="input_field input_name" type="text" name="name"  placeholder="이름"/>
        <div class="id_wrapper">

        <input class="input_field input_login" type="text" size="12" maxlength="12" name="id" placeholder="아이디"/>
        <input class="reg_btn dc_btn" type="button" name="dc" value="중복확인" />
            
        </div>
        <input class="input_field input_login" type="password" name="pwd"  placeholder="비밀번호" />
        <input class="input_field input_login" type="password" name="pwdC"  placeholder="비밀번호확인" />
        <input class="input_field input_ep" type="email" name="email" placeholder="이메일" />
        <input class="input_field input_ep" type="tel" maxlength="13" name="phone" placeholder="010-1234-1234" />
        <div class="check_wrapper">
        <input class="input_field input_check" type="checkbox" name="check"  /> 
        <p class="input_p">개인정보 이용에 대한 동의</p>  
        </div>
        <input class="reg_btn" type="submit" value="회원가입" />
     </form>
  
    </body>
</html>