<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경 페이지</title>
    <link rel="stylesheet" href="/css/aside.css?after">
    <script src="https://kit.fontawesome.com/f0e73cfa04.js" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
</head>
<body>

<form action="/find/modify" method="GET">
    아이디(id): <input type="text" value="${id}" id="id2" name="id" readonly>
    변경할 비밀번호: <input type="password" id="pwd1" name="pwd" required>
    비밀번호 재확인: <input type="password" id="pwd2" name="pwd" oninput="checkPwdMatch();" required>
    <input type="submit" value="변경">
</form>

${incorrectPwdMsg}

<div id="error-msg"></div>

</body>
<script src="/js/aside.js?after"></script>
<script>
    function checkPwdMatch() {
        let pwd1 = document.getElementById('pwd1').value;
        let pwd2 = document.getElementById('pwd2').value;
        let errorMsg = document.getElementById('error-msg');

        if (pwd1 !== pwd2) {
            errorMsg.innerHTML = "비밀번호가 일치하지 않습니다."
        } else {
            errorMsg.innerHTML = "";
        }
    }
</script>

</html>
