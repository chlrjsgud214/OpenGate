<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">OpenGate</h2>
	<a class="btn btn-default" href="noticeList.og">공지사항</a>
	<a class="btn btn-default" href="reviewlist.og">리뷰게시판</a>
	<a class="btn btn-default" href="joinForm.og">회원가입</a>
	<a class="btn btn-default" href="productList.og">테마소개</a>
	<a class="btn btn-default" href="updateForm.og">회원정보 수정</a>
	<a class="btn btn-default" href="logout.og">로그아웃</a> 
	<a class="btn btn-default" href="qnaList.og">Q&A</a>
	<a class="btn btn-default" href="LocList.og">지점</a>
<script type="text/javascript">

	var naver_id_login = new naver_id_login("7eRKZaK7LfcNjNxMd7Ht",
			"http://localhost:8080/opengate/main.og");
	// 접근 토큰 값 출력
	alert(naver_id_login.oauthParams.access_token);
	// 네이버 사용자 프로필 조회
	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
	function naverSignInCallback() {
		alert(naver_id_login.getProfileData('email'));
		alert(naver_id_login.getProfileData('nickname'));
		alert(naver_id_login.getProfileData('age'));
	}
</script>
</div>
</body>
</html>