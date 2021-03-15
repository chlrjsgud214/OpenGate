<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {width: 40%;}
h2 {padding:50px 0; font-size: 24px;}
tr {color: #666;}



</style>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">내정보</h2>
	<table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td>${member.id }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>${member.password }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${member.name }</td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td>${member.phone }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${member.email }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${member.address }</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<c:if test="${id != null }">
				<a href="updateForm.og" class="btn btn-outline-info">회원정보 수정</a>
				</c:if>
				<a href="bookingList.og" class="btn btn-outline-info">예매현황</a>
				<a href="delete.og" class="btn btn-outline-info">회원탈퇴</a>
			</td>	
		</tr>
	</table>		
</div>
</body>
</html>