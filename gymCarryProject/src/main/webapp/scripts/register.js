       	
/*        	function idCheck() {
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
        	}   */    
              
        
        function checkInput(myform) {
        	if(!myform.name.value && !myform.id.value && !myform.pwd.value
        		&& !myform.pwdC.value && !myform.email.value && !myform.phone.value) { 
        		alert("입력 항목을 확인해주세요");
        		return false;
        		
        	}
        	return true;
        
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
        
        