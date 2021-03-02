<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1 {
	font-weight: bold;
	letter-spacing:-2px;
	text-align: center;
}
.t {
		margin-top: 30px;
		width: 85%;
	}
.t th {
	font-size: 15px;
	text-align: center;
}
.b {
		width: 80px;
		border-radius: 7px 7px 7px 7px;
	}
</style>
</head>
<body>
	<div class="container" align="center">
		<h1>테마 등록</h1>
		<div style="color: #BDBDBD;" align="center">____________</div>
		<form action="productInsert.og" method="post"
			enctype="multipart/form-data">
			<table class="table table-striped t">
				<tr>
					<th>테마 이름</th>
					<td><input type="text" name="tema" required="required"></td>
				</tr>
				<tr>
					<th>테마 설명</th>
					<td><textarea rows="5" cols="40" name="content"
							required="required"></textarea></td>
				</tr>
				<tr>
					<th>시작 날짜</th>
					<td><input type="date" name="startdate"></td>
				</tr>
				<tr>
					<th>마감 날짜</th>
					<td><input type="date" name="enddate"></td>
				</tr>
				<tr>
					<th>휴무</th>
					<td><input type="date" name="restdate"></td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="fileName1" required="required"></td>
				</tr>
				<tr>
					<th>난이도</th>
					<td><select name="difficulty">
							<option>★
							<option>★★
							<option>★★★
							<option>★★★★
							<option>★★★★★
					</select>
				<tr>
					<th>공포도</th>
					<td><select name="fear">
							<option>★
							<option>★★
							<option>★★★
							<option>★★★★
							<option>★★★★★
					</select>
				<tr>
					<th>활동성</th>
					<td><select name="active">
							<option>★
							<option>★★
							<option>★★★
							<option>★★★★
							<option>★★★★★
					</select></td></tr>
				<tr>
					<th>지점</th>
					<td><select name="locName">
						<c:forEach var="loc" items="${list }">
							<option>${loc.locName}
						</c:forEach>
					</select>
				<tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록"
						class="btn btn-sm btn-default b"> <a href="main.og"
						class="btn btn-default b">이전</a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>