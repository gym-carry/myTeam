<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <title>register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">

        <style>
           * {
            box-sizeing: border-box;
           }

           body {
            margin: 0;
            background-color: #1BBC9B;
           }

        /* 폼 전체*/
        .register_form {
            background-color: #D9D9D9;
            width: 300px;
            padding: 20px;
            border: 0;
            border-radius: 5px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            margin-top: 12%;
        }

        /* 폼 input*/
        .input_field{
            margin-bottom: 10px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            padding: 5px;
        }


        /*id 중복확인 wrapper*/
        .id_wrapper {
            display: flex;
            justify-content: space-between;
        }

        /*check wrapper*/
        .check_wrapper {
            display: flex;
            justify-content: center;
        }

        /* 이름 인풋 */
        .input_name {
            width: 100px;
            height: 23px;
        }

        /* id / pwd 확인 폼 */
        .input_login {
            width: 169px;
            height: 23px;
        }

        /* email / phone 확인 폼 */
        .input_ep {
            height: 23px;
        }

        /* 개인정보 동의 수정 */
        .input_p {
            font-size: 10px;
            transform: translateY(-15%);
        }

        /* 버튼 */
        .reg_btn {
            background-color: #1BBC9B;
            border: none;
            border-radius: 5px;
            padding: 10px;
            color: #FFFFFF;
        }

        .dc_btn {
            height: 35px;
        }

        </style>
    </head>
    <body>
     <form class="register_form">
        <input class="input_field input_name" type="text" name="name"  placeholder="이름"/>
        <div class="id_wrapper">

        <input class="input_field input_login" type="text" name="id"  placeholder="아이디"/>
        <input class="reg_btn dc_btn" type="button" name="dc"  value="중복확인"/>
            
        </div>
        <input class="input_field input_login" type="text" name="pwd"  placeholder="비밀번호"/>
        <input class="input_field input_login" type="text" name="pwdC"  placeholder="비밀번호확인"/>
        <input class="input_field input_ep" type="text" name="email"  placeholder="이메일"/>
        <input class="input_field input_ep" type="text" name="phone"  placeholder="전화번호"/>
        <div class="check_wrapper">
        <input class="input_feild input_check" type="checkbox" name="check"  /> 
        <p class="input_p">개인정보 이용에 대한 동의</p>  
        </div>
        <input class="reg_btn" type="submit" value="회원가입" />
     </form>
    </body>
</html>