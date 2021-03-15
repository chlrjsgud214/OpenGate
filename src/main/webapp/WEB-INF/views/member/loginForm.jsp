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
	<h2 class="text-primary">로그인</h2>
<form action="login.og">
	<table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" 
				required="required" autofocus="autofocus" class="form-control" >
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="password" required="required" class="form-control" >
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인" class="btn btn-outline-success  pull-right">
				<a href="joinForm.og" class="btn btn-outline-info">회원가입</a>
				<a href="main.og" class="btn btn-outline-primary">메인으로</a>
			</td>	
		</tr>
	</table>		
</form> 
</div>
</body>
</html>