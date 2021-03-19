<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div {padding-top: 200px;}
</style>
</head>
<body>
<div class="container" align="center">
	<c:if test="${id == null }">
		<a href="bookinginsertForm.og" class="btn btn-danger">비회원</a>
	</c:if>
	<c:if test="${id != null }">
		<a href="bookinginsertForm.og" class="btn btn-info">회원</a>
	</c:if>
	<c:if test="${id == null }">
		<a href="loginForm.og" class="btn btn-info">회원</a>
	</c:if>
</div>  
</body>
</html>