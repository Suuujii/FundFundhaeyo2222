<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뻔뻔해요</title>
<link rel="stylesheet" href="resources/css/productSortDeadline.css">
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div class="product_sort_deadline_outer">
		<div class="blank_top"><%-- 여백 --%></div>
		<div class="product_sort_deadline_main">
			<%= m.getUserId() %>
	    </div>
	    <div class="blank_bottom"><%-- 여백 --%></div>
    </div>
    
	<%@ include file="../common/footer.jsp" %>
</body>
</html>