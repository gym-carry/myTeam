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
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" defer>
        
        function checkInput(myform) {
        	if(!myform.name.value && !myform.id.value && !myform.pwd.value
        		&& !myform.pwdC.value && !myform.email.value && !myform.phone.value) { 
        		alert("입력 항목을 확인해주세요");
        		return false;
        		
        	}
        	return true;
        
        }
        
        function doubleCheckId() {
        	var id = $('#id').val();
        	$.ajax({
        		type: 'POST',
        		url: './UserRegisterCheckServlet',
        		data: {id:id},
        		succerss: function(result) {
        			$('#checkMessage').html('사용할 수 있는 아이디입니다.');
        			$('#checkType').attr('class', 'modal-content panel-success');
        		} else {
        			$('#checkMessage').html('사용할 수 없는 아이디입니다.');
        			$('#checkType').attr('class', 'modal-content panel-warning');
        		}
        		$('#checkModal').modal("show");
        	})
        }
           
/*            function checkId(){
           	const id = document.getElementById("id");
           	
           	if (checkAlphaNum(id)) {
           		alert("영문 대소문자와 숫자만 입력가능합니다.");
           		id.focus(); 
           		id.value="";
           		return false;
           	} else if(!id.value == null) {
           		alert("아이디를 입력해주세요");
           		id.focus();
           		return false;
           	} else 
           		return true;
           }
           
           //대소문자 체크, 숫자체크
           function checkAlphaNum(str) {
           	
           	for (let i = 0; i<str.length; i++ ) {
           		console.log(str.charCodeAt(i));
           	if(!(str.charCodeAt(i) > 47 && str.charCodeAt(i) < 58) && // numeric (0-9)
           	   !(str.charCodeAt(i) > 64 && str.charCodeAt(i) < 91) && // upper alpha( A - Z )
           	   !(str.charCodeAt(i) > 96 && str.charCodeAt(i) < 123)) { // lower alpha ( a - z )  
           	   return false;
           		}
           	 }
           	 return true;
              }
           } */
           
           function idCheck() {
        	 window.open("idCheckForm.jsp", "중복확인 팝업", "width=400, height=350");
           }
        
        
        </script>
    </head>
    <body>
     <form class="register_form" name="myform" action="registerAction.jsp" onsubmit="return checkInput(myform)" >
        <input class="input_field input_name" type="text" name="name"  placeholder="이름"/>
        <div class="id_wrapper">

        <input class="input_field input_login" type="text" size="12" maxlength="12" name="id" placeholder="아이디"/>
        <input class="reg_btn dc_btn" type="button" name="dc" value="중복확인" onclick="doubleCheckId()" />
            
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
     
     <div class="modal fade" id="checkModal" tabindex="-1" role="dialog" aria-hidden="true">
     	<div class="vertical-alignment-helper">
     		<div id="checkType" class="modal-content panel-info">
     			<div class="modal-header panel-heading">
     				<button type="botton" class="close" data-dismiss="modal">
     					<span aria-hidden="true">&time;</span>
     					<span class="sr-only">Close</span>
     				</button>
     				<h4 class="modal-title">확인메시지</h4>
     			</div>
     			<div class="modal-body" id="checkMessage"></div>
     			<div class="modal-footer">
     				<button type="button" class="reg_btn dc_btn" data-dismiss="modal">확인</button>
     			</div>
     		</div>
     	</div>
     
     </div>
    </body>
</html>