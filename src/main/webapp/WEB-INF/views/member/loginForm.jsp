<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
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
					<div id="naverIdLogin"></div>
						<script type="text/javascript">
							var naverLogin = new naver.LoginWithNaverId({
								clientId : "7eRKZaK7LfcNjNxMd7Ht",
								callbackUrl : "http://localhost:8080/opengate/main.og",
								isPopup : false, /* 팝업을 통한 연동처리 여부 */
								loginButton : {
									color : "green",
									type : 2,
									height : 30
								}
							/* 로그인 버튼의 타입을 지정 */
							});

							/* 설정정보를 초기화하고 연동을 준비 */
							naverLogin.init();
						</script> <a href="joinForm.og" class="btn btn-info">회원가입</a>
				<a href="main.og" class="btn btn-default">메인</a>
			</td>	
		</tr>
	</table>		
</form> 
</div>
</body>
</html>