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
<c:if test="${empty map }">
	<script type="text/javascript">
		alert("예약 되었습니다");
		location.href="bookingList.og";
	</script>
</c:if>
<c:if test="${!empty map }">
	<script type="text/javascript">
		alert("다시 입력해주세요");
		history.back;
	</script>
</c:if>
</body>
</html>