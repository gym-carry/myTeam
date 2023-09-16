const idInput = document.getElementById("id_input");
console.log(idInput);
const pwdInput = document.getElementById("pwd_input");
console.log(pwdInput);
const logInBtn = document.getElementById("submit_btn");
console.log(logInBtn);

// getInputValue 함수
const getIdInputValue = (e) => {
  const idInputValue = e.target.value;
  console.log(idInputValue);
  return idInputValue;
};

// getpwdInputValue 함수
const getpwdInputValue = (e) => {
  const pwdInputValue = e.target.value;
  console.log(pwdInputValue);
  return pwdInputValue;
};

// onloginHandler 함수
const onloginHandler = () => {
  alert("로그인 성공");
};

// 아이디 인풋 이벤트
idInput.addEventListener("input", getIdInputValue);
// 비번 인풋 이벤트
pwdInput.addEventListener("input", getpwdInputValue);
// 제출버튼 이벤트
logInBtn.addEventListener("click", onloginHandler);
