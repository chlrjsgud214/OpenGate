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
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
			<input type="submit" value="로그인" class="btn btn-outline-success"> <!-- 네이버아이디로로그인 버튼 노출 영역 -->
						<div id="naver_id_login"></div> <!-- //네이버아이디로로그인 버튼 노출 영역 --> <script
							type="text/javascript">
							var naver_id_login = new naver_id_login(
									"7eRKZaK7LfcNjNxMd7Ht", "http://localhost:8080/opengate/main.og");
							var state = naver_id_login.getUniqState();
							naver_id_login.setButton("white", 2, 25);
							naver_id_login.setDomain("http://localhost:8080/opengate/loginForm.og");
							naver_id_login.setState(state);
							naver_id_login.setPopup();
							naver_id_login.init_naver_id_login();
						</script> <a href="joinForm.og" class="btn btn-outline-info">회원가입</a>
				<a href="main.og" class="btn btn-outline-primary">메인으로</a>
			</td>	
		</tr>
	</table>		
</form> 
</div>
</body>
</html>