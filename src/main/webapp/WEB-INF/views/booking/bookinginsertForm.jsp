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
	<h2 class="text-primary">예약하기</h2>
<form action="bookinginsert.og" method="post" name="frm" 
enctype="multipart/form-data" onsubmit="return chk()">
	<input type="hidden" name="id" value="${member.id }">
	<table class="table table-bordered">
		<tr>
			<td>지점선택</td>
			<td><select>
				<c:forEach var="loc" items="${lc }">
					<option value="${loc.locName }" selected="selected">
						${loc.locName }
					</option>
				</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>테마선택</td>
			<td><select>
				<c:forEach var="product" items="${pt }">
					<option value="${product.tema }" selected="selected">
						${product.tema }
					</option>
				</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>날짜선택</td>
			<td>
				<input type="date">
			</td>
		</tr>
		<tr>
			<td>시간선택</td>
			<td>
				<input type="time">
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${member.id }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text"></td>
		</tr>
		<tr>
			<td>노트</td>
			<td><textarea rows="3" cols="30"></textarea> </td>
		</tr>
		<tr>
			<td><input type="submit" value="예매하기"></td>
		</tr>
	</table>
</form>
	<a href="bookinginsert.og" class="btn btn-info">예매 하기</a>
</div>
</body>
</html>