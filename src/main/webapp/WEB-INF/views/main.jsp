<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
    <%@ include file="Mheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
<style type="text/css">
body {
	background-image: url('resources/images/bg.webp');
}

.hd {
	height: 80px;
	margin-top: 120px;
	color: #8C8C8C;
	text-align: center;
}

.bgc {
	background-color: white;
	width: 100%;
}

.main-items {
	list-style: none;
	margin: 0;
}

.main-items>li {
	float: left;
	padding: 0;
	margin-left: 30px;
}

.main-items {
	margin-top: 35px;
}

.main-item {
	width: 300px;
}

.main-notice {
	width: 300px;
}

.main-item2 {
	padding: 20px;
}

.main-item img {
	width: 100%;
	height: 47%;
}

.main-image2 {
	height: 70%;
	width: 65%;
	height: 70%;
	margin-left: 40px;
}

.main-detail {
	font-size: 13px;
	text-align: center;
	padding: 10px;
}

.main-detail {
	padding-bottom: 15px;
}

.detail-title {
	font-weight: bold;
	font-size: 19px;
}

#b {
	border-radius: 7px 7px 7px 7px;
	border: 1px solid;
	margin-bottom: 30px;
}

.cr {
	color: white;
}

.Precautions {
	left: 0;
	right: 0;
	height: 60%;
	background-color: white;
}

.Precautions2 {
	padding-top: 27px;
	font-weight: bold;
	font-size: 30px;
	font-weight: bold;
}

.Precautions-Detail {
	font-size: 20px;
}
.slide3 {
	width: 100%;
	height: 90%;
}

.slide3 .slide-img {
	width: 100%;
	height: 93%;
	position: absolute;
	top: 0;
	margin-top: 50px;
}
#img2 {
	height: 700px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('.slide3 .slide-img:gt(0)').hide();
		setInterval(function() {
			if (!$('.slide3 .slide-img').is(':animated')) {
				$('.slide3 .slide-img').first().fadeOut(2500).next().fadeIn(
						2500).end().appendTo('.slide3 .slide-inner')
			}
		}, 3000)
	})
</script>
<title>OPEN GATE</title>
</head>
<body>
	<div class="slide3 slide">
		<div class="slide-inner">
			<img
				src="resources/images/slide2.jpg"
				alt="이미지1" class="slide-img" id="img2"> <img
				src="resources/images/slide6.png"
				alt="이미지2" class="slide-img"> <img
				src="resources/images/slide4.jpg"
				alt="이미지2" class="slide-img">
		</div>
	</div>
	<br>

	<div style="text-align: center">
		<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
	</div>

	<div class="hd">
		<h1 style="font-size: 30px">초보자에게 추천하는 테마</h1>
		<div style="color: #BDBDBD; font-weight: bold;" align="center">_______</div>
	</div>
		<div class="container">
			<c:forEach var="p" items="${list}">
				<ul class="main-items">
					<li class="main-item">
						<div class="main-item2">
							<div class="main-image" align="center">
								<a href="productDetail.og?tema=${p.tema}"> <img alt=""
									src="resources/upload/${p.fileName}"></a>
							</div>
							<div class="main-detail cr">
								<span class="detail-title cr">${p.tema}</span><br>
								<div style="color: #BDBDBD; font-size: 17px;">_______</div>
								<br> <span>테마 오픈 날짜 : ${p.startdate}</span><br> <span>테마
									마감 날짜 : ${p.enddate}</span><br> <br> <span>난이도 :
									${p.difficulty}</span><br> <span>공포도 : ${p.fear}</span><br>
								<span>활동성 : ${p.active}</span><br> <span>예약 가능 지점 :
									${p.locName}</span><br>
								<div style="color: #BDBDBD;" align="center">______________________</div>
							</div>
							<div align="center">
								<a id="b" class="btn btn-default" href="bookingForm.og"
									style="border: 1px solid; width: 85%;">예약하기</a>
							</div>
						</div>
					</li>
				</ul>
			</c:forEach>
		</div>
	<div class="Precautions" align="center">
		<h1 class="Precautions2">주의 사항</h1>
		<p style="font-size: 15px">안전한 문화생활을 위해 아래 준수사항을 꼭 지켜주시길 바랍니다.</p>
		<ul class="main-items">
			<li class="main-notice">
				<div class="main-item2">
					<div class="main-image2">
						<img alt="" src="resources/images/notice01.jpg"><br>
						<br> <span class="Precautions-Detail">사진 촬영 금지</span>
					</div>
				</div>
			</li>
		</ul>
		<ul class="main-items">
			<li class="main-notice">
				<div class="main-item2">
					<div class="main-image2">
						<img alt="" src="resources/images/notice02.jpg"><br>
						<br> <span class="Precautions-Detail">위험물질 반입금지</span>
					</div>
				</div>
			</li>
		</ul>
		<ul class="main-items">
			<li class="main-notice">
				<div class="main-item2">
					<div class="main-image2">
						<img alt="" src="resources/images/notice03.jpg"><br>
						<br> <span class="Precautions-Detail">안전 주의</span>
					</div>
				</div>
			</li>
		</ul>
		<ul class="main-items">
			<li class="main-notice">
				<div class="main-item2">
					<div class="main-image2">
						<img alt="" src="resources/images/notice04.jpg"><br>
						<br> <span class="Precautions-Detail">물품 파손주의</span>
					</div>
				</div>
			</li>
		</ul>
	</div>

	<!-- 네이버 로그인 -->
	<script>
				var naverLogin = new naver.LoginWithNaverId({
					clientId : "7eRKZaK7LfcNjNxMd7Ht",
					callbackUrl : "http://localhost:8080/opengate/main.og",
					isPopup : false,
					callbackHandle : true
				});

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
</body>
<%@ include file="footer.jsp" %>
</html>