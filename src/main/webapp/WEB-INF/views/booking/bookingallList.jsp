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
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">예약현황 전체보기</h2>
	<table class="table table-striped">
		<tr>
			<td>아이디</td>
			<td>테마</td>
			<td>지점</td>
			<td>이름</td>
			<td>날짜</td>
			<td>시간</td>
			<td>삭제</td>
		</tr>
	<c:if test="${empty bookingallList }">
		<tr><th colspan="4">예약이 없습니다</th></tr>
	</c:if>
	<c:if test="${not empty bookingallList }">
		<c:forEach var="booking" items="${bookingallList }">
		<tr>
			<td>${booking.id }</td>
			<td>${booking.tema }</td>
			<td>${booking.locName }</td>
			<td>${booking.name }</td>
			<td>${booking.bookDate }</td>
			<td>${booking.time }</td>
			<td><a class="btn btn-danger btn-sm" 
				onclick="del(${booking.id})">삭제</a></td>
		</tr>
		</c:forEach>
	</c:if>
	</table>
</div>
</body>
</html>