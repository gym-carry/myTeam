 const idInput = document.getElementById("id_input");
  const pwdInput = document.getElementById("pwd_input");
  const logInBtn = document.getElementById("submit_btn");
  const idError = document.getElementById("id_error");
  const pwdError = document.getElementById("pwd_error");
  
  function onClickLoginSubmit(e){
    e.preventDefault();
    let result = true;
    if(idInput.value == ""){ 
      idInput.className = 'input_id';
      idError.innerText = "아이디를 입력해주세요";
      idInput.focus();
    }else if(pwdInput.value == ""){
      pwdInput.className = 'input_pwd';
      pwdError.innerText = '비밀번호를 입력헤주세요';
      pwdInput.focus();
    }else{
  	  form.submit();
    }
  }
  
  form.addEventListener('submit', onClickLoginSubmit);