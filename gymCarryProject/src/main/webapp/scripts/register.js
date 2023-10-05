    function checkInput(myform) {
      if(!myform.name.value && !myform.id.value && !myform.pwd.value
        && !myform.pwdC.value && !myform.email.value && !myform.phone.value) { 
        alert("입력 항목을 확인해주세요");
        return false;
      }
      return true;
    
    }
    
    function idCheck() {
      window.open("idCheckForm.jsp", "중복확인 팝업", "width=400, height=350");
    }
    
  function registerCheckFunction() {
    const userID = $("#userID").val();
    console.log(userID);
    $.ajax({
      type: "POST",
      url: "./UserRegisterCheckServelet",
      data: { userID: userID },
      success: function (result) {
        if (result == 1) {
          alert("사용 가능한 아이디입니다");
        } else {
          alert("이미 존재하는 아이디 입니다.");
        }	
      },
    });
		}

	function passwordCheckFunction() {
  const userPassword1 = $("#userPassword1").val();
  console.log(userPassword1);
  const userPassword2 = $("#userPassword2").val();
  console.log(userPassword2);

  if (userPassword1 != userPassword2) {
    $("#passwordCheckMessage").html('비밀번호가 서로 일치하지 않습니다.')
  }else{
    $("#passwordCheckMessage").html('');
  }
	}