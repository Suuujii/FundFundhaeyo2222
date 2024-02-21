<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

    <div class="outer" align="center">
        <form action="<%= contextPath %>/deadline.pr" method="post">
            <br>
            <h2 >아이디 찾기</h2>
            <p>아이디는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</p>
        
            <div class="nameForm-area">
                <input type="text" name="name" id="name" placeholder="이름을 입력하세요." required autofocus>
            </div>
            
            <div class="emailForm-area">
                <input type="email" name="email" id="email" placeholder="이메일을 입력하세요." required>
            </div>

            <br>

            <div class="searchId_btn">
                <button type="submit" class="btn-sm">찾기</button>
            </div>
        </form>
    </div>

</body>
</html>