<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">예약현황</h2>
<table class="table table-striped">
	<tr>
		<td>테마</td>
		<td>지점</td>
		<td>이름</td>
		<td>날짜</td>
		<td>시간</td>
	</tr>
	<c:if test="${empty bookingList }">
		<tr><th colspan="4">예약이 없습니다</th></tr>
	</c:if>
	<c:if test="${not empty bookingList }">
		<c:forEach var="booking" items="${bookingList }">
		<tr>
			<td>${booking.tema }</td>
			<td>${booking.locName }</td>
			<td>$booking.name</td>
			<td>${booking.bookDate }</td>
			<td>${booking.time }</td>
		</tr>
		</c:forEach>
	</c:if>
</table>
<a href="main.og" class="btn btn-info">메인으로</a>
</div>
</body>
</html>