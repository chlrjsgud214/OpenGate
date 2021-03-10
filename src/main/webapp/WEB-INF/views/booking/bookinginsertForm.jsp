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
<form action="bookinginsert.og" method="post" name="frm" >
	<input type="hidden" name="id" value="${member.id }">
	<table class="table table-bordered">
		<input type="hidden" name="tema" value="${product.tema }">
		<input type="hidden" name="locName" value="${loc.locName }">
		<tr>
			<td>테마선택</td>
			<td>
			<select id="temaBox" onChange="fTemaChange()">
				<c:forEach var="product" items="${pt }" varStatus="status">
					<c:if test="${status.count == 1}">
						<option value="${product.tema}" selected="selected">${product.tema}</option>
					</c:if> 					
					<c:if test="${status.count != 1}">
						<option value="${product.tema}">${product.tema }</option>						
					</c:if>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td>지점선택</td>
			<td>
			<select id="locBox" onChange="fLocChange()">
				<c:forEach var="loc" items="${lc}" varStatus="status">
					<c:if test="${status.count == 1}">
						<option value="${loc.locName }" selected="selected">${loc.locName }</option>
					</c:if> 					
					<c:if test="${status.count != 1}">
						<option value="${loc.locName }">${loc.locName }</option>						
					</c:if>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>${member.id }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" required="required"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" name="phone" required="required"></td>
		</tr>
		<tr>
			<td>노트</td>
			<td><textarea rows="3" cols="30" name="note"></textarea> </td>
		</tr>
		<tr>
			<td>날짜선택</td>
			<td>
				<input type="date" name="bookDate" required="required">
			</td>
		</tr>
		<tr>
			<td>시간선택</td>
			<td>
				<input type="time" name="time" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input type="submit" value="예매하기"></td>
		</tr>
	</table>
</form>
	<a href="main.og" class="btn btn-info">메인으로 가기</a>
</div>
</body>
<script type="text/javascript">
 	$(document).ready(function() {
 		$("input[name=tema]").attr("value", $("#temaBox option:selected").val());
 		$("input[name=locName]").attr("value", $("#locBox option:selected").val());
	});
	function fTemaChange() {
		var element = $("#temaBox option:selected").val();
		$("input[name=tema]").attr("value", element);
	}
	function fLocChange() {
		var element = $("#locBox option:selected").val();
		$("input[name=locName]").attr("value", element);
	}
</script>
</html>

