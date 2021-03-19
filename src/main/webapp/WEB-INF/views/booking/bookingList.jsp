<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del(id){
		var cf = confirm("정말로 삭제 하시겠습니까?")
		if(cf) location.href="bookingDel.og?id="+id;
		else alert("삭제가 취소되었습니다")
	}
</script>
<style type="text/css">
.container {width: 70%;}
h2 {padding:50px 0; font-size: 24px;}
tr {color: #666;}


</style> 
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">예약현황</h2>
<table class="table table-striped">
	<tr>
		<td>아이디</td>
		<td>테마</td>
		<td>지점</td>
		<td>이름</td>
		<td>시간</td>
		<td>날짜</td>
		<td>예약취소</td>
	</tr>
	<c:if test="${empty bookingList }">
		<tr><th colspan="4">예약이 없습니다</th></tr>
	</c:if>
	<c:if test="${not empty bookingList }">
		<c:forEach var="booking" items="${bookingList }">
		<tr>
			<td>${booking.id }</td>
			<td>${booking.tema }</td>
			<td>${booking.locName }</td>
			<td>${booking.name }</td>
			<td>${booking.time}</td>
			<td><fmt:parseDate var="booking1" value="${booking.bookDate}" pattern="yyyy-MM-dd"/>
         		<fmt:formatDate var="resultRegDt" value="${booking1}" pattern="yyyy-MM-dd"/>
       			${resultRegDt}
       		</td>
       		<td>
       			<a class="btn btn-danger btn-sm" 
				onclick="del('${booking.id}')" >삭제</a>
			</td>
		</tr>
		</c:forEach>
	</c:if>
</table>
<a href="bookinginsertForm.og" class="btn btn-outline-info ">예매하기</a>
<a href="main.og" class="btn btn-outline-primary">메인으로</a>
</div>
</body>
</html>
