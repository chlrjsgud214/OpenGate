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
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "7eRKZaK7LfcNjNxMd7Ht",
				callbackUrl: "http://localhost:8080/opengate/main.og",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
					var email = naverLogin.user.getEmail();
					if( email == undefined || email == null) {
						alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
						/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
						naverLogin.reprompt();
						return;
					}

					window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/opengate/main.og");
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</div>
</body>
</html>