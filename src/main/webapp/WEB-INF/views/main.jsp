<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
    <%@ include file="Mheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<style type="text/css">
	body {
	background-image: url('resources/images/bg.webp');
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
<title>Insert title here</title>
</head>
<body>
<div class="hd">
<div class="bgc">
<div class="container" align="center">
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "7eRKZaK7LfcNjNxMd7Ht",
				callbackUrl: "http://localhost:8080/opengate/main.og",
				isPopup: false,
				callbackHandle: true
			}
		);

	var naver_id_login = new naver_id_login("7eRKZaK7LfcNjNxMd7Ht",
			"http://localhost:8080/opengate/main.og");
	alert(naver_id_login.oauthParams.access_token);
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	function naverSignInCallback() {
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
	}
</script>
</div>
</div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>