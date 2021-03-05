<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>Insert title here</title>
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
				required="required" autofocus="autofocus">
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="password" required="required">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="로그인" class="btn btn-success">
						<div id="naver_id_login"></div>
						<script	type="text/javascript">
							var naver_id_login = new naver_id_login(
									"7eRKZaK7LfcNjNxMd7Ht", "http://localhost:8080/opengate/main.og");
							var state = naver_id_login.getUniqState();
							naver_id_login.setButton("white", 2, 40);
							naver_id_login.setDomain("http://localhost:8080/opengate/loginForm.og");
							naver_id_login.setState(state);
							naver_id_login.init_naver_id_login();
						</script> 
				<a href="joinForm.og" class="btn btn-info">회원가입</a>
				<a href="main.og" class="btn btn-default">메인</a>
			</td>	
		</tr>
	</table>		
</form> 
</div>
</body>
</html>