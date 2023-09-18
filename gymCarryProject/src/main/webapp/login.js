const idInput = document.getElementById("id_input");
const pwdInput = document.getElementById("pwd_input");
const logInBtn = document.getElementById("submit_btn");

// getInputValue 함수
const getIdInputValue = (e) => {
  const idInputValue = e.target.value;
  return idInputValue;
};

// getpwdInputValue 함수
const getpwdInputValue = (e) => {
  const pwdInputValue = e.target.value;
  return pwdInputValue;
};

// onloginHandler 함수
const onloginHandler = (e) => {
  e.preventDefault();
  if (idInput.value === "") {
    alert("아이디를 입력해주세요");
  } else if (pwdInput.value === "") {
    alert("비밀번호를 입력해주세요");
  } else {
    alert("로그인을 진행하시겠습니까?");
  }
};

// 아이디 인풋 이벤트
idInput.addEventListener("input", getIdInputValue);
// 비번 인풋 이벤트
pwdInput.addEventListener("input", getpwdInputValue);
// 제출버튼 이벤트
logInBtn.addEventListener("click", onloginHandler);
