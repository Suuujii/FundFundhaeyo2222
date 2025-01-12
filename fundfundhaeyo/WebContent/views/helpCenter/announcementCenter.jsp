<%@page import="com.kh.semi1st.company.model.vo.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Announcement> list = (ArrayList<Announcement>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뻔뻔해요</title>
<link rel="stylesheet" href="resources/css/announcementCenter.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resources/js/announcementCenter.js" rel="javascript"></script>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="announcement_center_outer">
		<div class="blank_top"><%-- 여백 --%></div>
		
		<div class="announcement_center_main">
		
			<div class="announcement_center_main_top font_outer">
				<div class="announcement_center_main_top_row1">
					<h1 class="announcement_center_main_top_row1_title">고객지원</h1>
				</div>
				<div class="announcement_center_main_top_row2">
					<div class="announcement_center_main_top_row2_bottom"></div>
				</div>
			</div>
			<div class="announcement_center_main_navi">
				<div class="btn-a fl"><a style="color: skyblue;">공지사항</a></div>
				<div class="btn-b fl"><a href="#">FAQ</a></div>
				<div class="btn-c fl"><a href="#">Q&A</a></div>
				<div class="btn-d fl"><a href="#">펀딩 가이드</a></div>
			</div>
			<div class="announcement_center_main_select">
				검색기능 넣던가 하자
			</div>
			<div class="announcement_center_main_content">
				<table class="announcement_list_area">
					<thead>
						<tr>
		                    <th>글번호</th>
		                    <th width="400">글제목</th>
		                    <th width="100">작성자</th>
		                    <th>조회수</th>
		                    <th width="100">작성일</th>
                		</tr>
					</thead>
					<tbody>
					
					<%-- 공지사항이 없을 경우 --%>
					<% if(list.isEmpty()){ %>
						<tr>
							<td colspan="5">존재하는 공지사항이 없습니다.</td>
						</tr>
					<% }else{ %>
						<%-- 공지사항이 있을 경우 --%>
						<% for(Announcement v : list){ %>
						<tr>
							<td><%= v.getAnnouncementNo() %></td>
							<td><%= v.getAnnouncementTitle() %></td>
							<td><%= v.getAnnouncementWriter() %></td>
							<td><%= v.getAnnouncementCount() %></td>
							<td><%= v.getAnnouncementCreateDate() %></td>
						</tr>
						<% } %>
					<% } %>
					
					</tbody>					
				</table>
			</div>
			<div class="announcement_center_main_bottom"></div>
			
	    </div>
	    
	    <div class="blank_bottom"><%-- 여백 --%></div>
    </div>
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>