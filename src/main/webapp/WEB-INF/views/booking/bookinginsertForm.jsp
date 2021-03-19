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
h2 {padding-top:50px; font-size: 24px;}
form {padding-top: 50px;}
tr {color: #666;}


</style>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">예약하기</h2>
<form action="bookinginsert.og" method="post" name="frm" >
	<input type="hidden" name="id" value="${member.id }">
	<input type="hidden" name="tema" value="${product.tema }">
	<input type="hidden" name="locName" value="${loc.locName }">
	<table class="table table-bordered">
		<tr> 
			<th>테마선택</th>
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
			<th>지점선택</th>
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
			<th>아이디</th>
			<td>${member.id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" required="required" class="form-control" ></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" required="required" class="form-control"></td>
		</tr>
		<tr>
			<th>노트</th>
			<td><textarea name="note" class="form-control"></textarea> </td>
		</tr>
		<tr>
			<th>날짜 시간선택</th>
			<td>
				<input type="date" name="bookDate" required="required">
				<input type="time" name="time" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" ><input type="submit" value="예매하기" class="btn btn-outline-success"></td>
		</tr>
	</table>
</form>
	<a href="bookingList.og" class="btn btn-outline-info">예약현황</a>
	<a href="main.og" class="btn btn-outline-primary">메인으로 가기</a>
	<c:if test="${member.id == 'master' }">
	<a href="bookingallList.og" class="btn btn-outline-success">예약 전체보기</a>
	</c:if>
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

