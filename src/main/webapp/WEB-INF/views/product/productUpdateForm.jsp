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
	font-weight: bold;
	letter-spacing:-2px;
	text-align: center;
}
.t {
		margin-top: 30px;
		width: 100%;
	}
.t th {
	font-size: 15px;
	text-align: center;
}
.t img {
	width: 22%;
}
#b {
		width: 80px;
		border-radius: 7px 7px 7px 7px;
		margin: 0 auto;
		border: 1px solid;
		background-color: white;

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
</style>
</head>
<body>
	<div class="hd">
		<h1>테마 수정</h1>
		<div style="color: #BDBDBD;" align="center">____________</div>
	</div>
		<div class="bgc">
		<div class="container">
		<form action="productUpdate.og" method="post"
			enctype="multipart/form-data">
			<table class="table table-striped t">
				<tr>
					<th>테마 이름</th>
					<td><input type="text" name="tema" value="${product.tema}" readonly="readonly"></td>
				</tr>
				<div style="color: #BDBDBD;" align="center">____________</div>
				<tr>
					<th>내용</th>
					<td><textarea rows="5" cols="40" name="content">
				${product.content}</textarea>
				<tr>
					<th>사진</th>
					<td><input type="file" name="fileName1"> <br>
					<img alt="" src="resources/upload/${product.fileName}"></td>
				</tr>
				<tr>
					<th>난이도</th>
					<td><select name="difficulty">
							<option>★
							<option>★★
							<option>★★★
							<option>★★★★
							<option>★★★★★
					</select></td>
				</tr>
				<tr>
					<th>공포도</th>
					<td><select name="fear">
							<option>★
							<option>★★
							<option>★★★
							<option>★★★★
							<option>★★★★★
					</select></td>
				</tr>
				<tr>
					<th>활동성</th>
					<td><select name="active">
							<option>★
							<option>★★
							<option>★★★
							<option>★★★★
							<option>★★★★★
					</select></td>
				</tr>
				<tr>
					<th>지점</th>
					<td><select name="locName">
						<option>마포점
						<option>광교점
						<option>부평점
					</select>
				<tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정"
						id="b"	class="btn btn-default"> <a href="productDetail.og?tema=${product.tema}"
						id="b"	class="btn btn-default">이전</a></td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</body>
<%@ include file="../footer.jsp" %>
</html>