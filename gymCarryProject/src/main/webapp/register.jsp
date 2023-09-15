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
        <!--  
        <script type="text/javascript">
        	
        	function idCheck() {
        		console.log("확인");
        		if(myform.id.value == "abcd") {
            		console.log("재확인");
        			alert("중복된 아이디입니다.");
        		} else {
        			alert("사용 가능한 아이디입니다.");
        		}
        	}
        
        	function checkInput(myform) {
        		var check = /^[가-힣]+$/ //한글만 입력받기
        		var check2 = /[^0-9-]/;//숫자와-를 뺀 모든 문자
        		var result = true; // 입력이 모두 유효한지 여부를 나타내는 변수
        		
        		if(!myform.name.value) {
        			alert("이름을 입력해주세요");
					myform.name.focus();
					result = false;
        		} //else

        		if(!check.test(myform.name.value)) {
        			alert("이름을 정확하게 입력해주세요");
        			myform.name.focus();
        			result = false;
        		} //else
        		
        		if(!myform.id.value) {
        			alert("아이디를 입력해주세요");
        			myform.id.focus();
        			result = false;
				} //else
        		     		
        		
        		if(!myform.pwd.value) {
        			alert("비밀번호를 입력해주세요"); 
        			myform.pwd.focus();
        			result = false;
        		} //else
        		
     			if(myform.pwd.indexOf(" ") !== -1){
     				alert("비밀번호는 공백을 포함할 수 없습니다.");
     				myform.pwd.focus();
     				result = false;
     			} //else
        		
        		if(myform.pwdc.value !== myform.pwd.value) {
        			alert("비밀번호가 동일하지 않습니다.");
        			myform.pwdc.focus();
        			result = false;
        		} //else
        		
        		if(!myform.email.value) {
        			alert("이메일을 입력해주세요");
        			myform.email.focus();
        			result = false;
        		} //else
        		
        		if(check2.test(myform.phone.value) || myform.phone.value.length != 13 ) {
        			alert("핸드폰 번호를 -을 추가하여 입려해주세요");
        			myform.phone.focus();
        			result = false;
        		}
				return result;
        	}       
              
        </script>
        -->
        <script type="text/javascript">
        // const로 선언해서 변경되지 않도록 한다
        function inputCheck(){
        	const name = document.getElementById("name");
        	const id = document.getElementById("id");
        	const pwd = document.getElementById("pwd");
        	const pwdC = document.getElementById("pwdC");
        	
        }
        
        function checkInput(myform) {
        	let result = true;
        	if(!myform.name.value)  { result = false;}
        	if(!myform.id.value)  { result = false;}
        	if(!myform.pwd.value)  { result = false;}
        	if(!myform.pwdC.value)  { result = false;}
        	if(!myform.email.value)  { result = false;}
        	if(!myform.phone.value)  { result = false;}
        	alert(result);
        	return result;
        }
        </script>
    </head>
    <body>
     <form class="register_form" name="myform" action="registerAction.jsp" onsubmit="return checkInput(myform)" >
        <input class="input_field input_name" type="text" name="name"  placeholder="이름"/>
        <div class="id_wrapper">

        <input class="input_field input_login" type="text" name="id" placeholder="아이디"/>
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