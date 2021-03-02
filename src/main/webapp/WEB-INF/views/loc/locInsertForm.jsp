<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
h1 {
	letter-spacing:-2px;
	text-align: center;
}
.t {
		margin-top: 30px;
		width: 100%;
		height: 30%;
	}
.t th {
	font-size: 15px;
	text-align: center;
}
.t tr {
}
.b {
		width: 80px;
		border-radius: 7px 7px 7px 7px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h1>지점 등록</h1>
	<div style="color: #BDBDBD; font-weight: bold;" align="center">____</div>
	<form action="locInsert.og">
		<table class="table table-striped t">
			<tr><th>지점명</th><td><input type="text" name="locName"
				 required="required"></td></tr>
			<tr><th>주소</th><td><input type="text" name="locAddr"
				 required="required"></td></tr>
			<tr><th>번호</th><td><input type="tel" name="locTel" pattern="\d{3}-\d{3,4}-\d{4}"
				 required="required"></td></tr>
			<tr><td align="center" colspan="2"><input type="submit" value="등록" class="btn btn-default b">
				<a class="btn btn-default" href="locDetail.og?locName=${loc.locName}">이전</a></td></tr>
		</table>
	</form>
</div>
</body>
</html>