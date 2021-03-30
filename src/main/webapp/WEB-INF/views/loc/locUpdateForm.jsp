<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../Mheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-image: url('resources/images/bg.webp');
}
h1 {
	text-align: center;
}
.hd {
	height: 180px;
	margin-top: 200px;
	color: #8C8C8C;
}
.bgc {
	background-color: white;
	width: 100%;
}
#table-he {
	margin: 10px;
	padding: 10px;
}
#bbb {
		margin:10px;
		width: 80px;
		border-radius: 7px 7px 7px 7px;
		border: 1px solid;
	}
</style>
</head>
<body>
	<div class="hd">
	<h1>지점 정보 수정</h1>
	<div style="color: #BDBDBD; font-weight: bold;" align="center">____</div>
	</div>
	<div class="bgc">
	<div class="container">
	<form action="locUpdate.og">
	<table class="table table-hover" id="table-he">
		<tr><th>지점명</th><td><input type="text" name="locName"
			value="${loc.locName }" readonly="readonly"></td></tr>
		<tr><th>주소</th><td><input type="text" name="locAddr"
			value="${loc.locAddr }"></td></tr>
		<tr><th>텔</th><td><input type="tel" name="locTel"  pattern="\d{3}-\d{3,4}-\d{4}"
			value="${loc.locTel }"></td></tr>
		<tr><td colspan="2" align="center"><input type="submit" value="수정" class="btn btn-default" id="bbb">
			<a id="bbb" class="btn btn-default" href="locDetail.og?locName=${loc.locName}">이전</a></td></tr>
	</table>
	</form>
</div>
</div>
</body>
<%@ include file="../footer.jsp" %>
</html>