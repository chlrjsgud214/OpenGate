<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OPEN GATE</title>
<style type="text/css">
	#navi {
		position: fixed;
	}
	.head {
		height:50px;
		top:0;
		left: 0;
		right: 0;
		background-color: white;
		z-index: 2;
	}
	.head1 {
		position: relative;
		margin-bottom: 47px;
	}
</style>
</head>
<body>
<nav id="navi" class="navbar navbar-expand-lg navbar-light nav-fixed head"
	style="padding: 44px">
	<div class="container">
			<a class="navbar-brand head1" href="main.og">
				<img alt="" src="resources/upload/OG_logo.jpg" 
					width="90px" height="90px"></a>
			<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto" style="font-size: 13px">
				<c:if test="${id == null }">
				<li class="nav-item"><a class="nav-link"
					href="loginForm.og">로그인</a></li>
				<li class="nav-item"><a class="nav-link"
					href="joinForm.og">회원가입</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link"
					href="LocList.og">지점</a></li>
				<li class="nav-item"><a class="nav-link"
					href="productList.og">테마</a></li>
				<li class="nav-item"><a class="nav-link"
					href="bookingForm.og">예약</a></li>
				<li class="nav-item"><a class="nav-link"
					href="noticeList.og">공지사항</a></li>
				<li class="nav-item"><a class="nav-link"
					href="reviewlist.og">후기</a></li>
				<li class="nav-item"><a class="nav-link"
					href="qnaList.og">Q&A</a></li>
				<c:if test="${id != null }">
				<li class="nav-item"><a class="nav-link"
					href="myinfo.og">내정보</a></li>
				<li class="nav-item"><a class="nav-link"
					href="logout.og">로그아웃</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
</body>
</html>