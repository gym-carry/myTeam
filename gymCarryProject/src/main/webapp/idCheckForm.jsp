<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idCheckForm.jsp</title>
</head>
<body>

<div style="text-align: center">
	<h2>아이디 중복확인</h2>
	<form name="myForm">
	ID입력<input id="idCheck" type="text" name="id" maxlength="12" />
	<input id = "submitBtn"type="submit" value="중복확인" />
	</form>
</div>

<script>

	const idCheck = document.getElementById("idCheck");
	
	const button = document.getElementById("submitBtn");
	
	function blankCheck(e) {
		// 새로고침 방지
		e.preventDefault();
		if(getInputValue() == "") {
			alert("실패");
			idCheck.focus();
		} else {
			alert("성공");
		}
	}
	
	button.addEventListener('click', blankCheck);
	
	function getInputValue () {
		const idInputValue = idCheck.value;
		return idInputValue;
	}


</script>

</body>
</html>