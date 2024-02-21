<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* .searchPwd_btn>button{
       width: 100%;
       box-sizing: border-box;
    } */
</style>
</head>
<body>
	<div class="outer" align="center">
        <form action="/searchPwd.me" method="post">
            <br>
            <h2>비밀번호 찾기</h2>
            <p>비밀번호는 이름, 가입한 아이디, 이메일을 통해 찾을 수 있습니다.</p>
                <div class="nameForm-area">
                    <input type="text" name="name" placeholder="이름을 입력해주세요." required autofocus>
                </div>
                <br>
                <div class="idForm-area">
                    <input type="text" name="id" placeholder="아이디를 입력하세요." required>
                </div>
                <br>
                <div class="emailForm-area">
                    <input type="email" name="email" placeholder="이메일을 입력해주세요" required>
                </div>
                <br>
 
                <div class="searchPwd_btn">
                    <button type="submit">찾기</button>
                </div>
        </form>
    </div>
	
</body>
</html>