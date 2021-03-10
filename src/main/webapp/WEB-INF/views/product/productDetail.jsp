<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../Mheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body { background-color: #fff; 
	background-image: url('resources/images/bg.webp');
}
h1 {
	letter-spacing:-2px;
	text-align: center;
}
.tema-items {list-style: none; margin: 0;}
.tema-items {}
.tema-items li {float: left; padding: 0; margin: 0;}
.tema-items{margin-top:40px; margin-bottom: 40px;}
.tema-item img {width: 100%; height: 47%;}

.tema-items2 {
	margin-top:40px; margin-bottom: 40px;
}
.tema-items2 li {
	float: right; padding: 0; margin: 0;
}
.tema-item2 {
	list-style: none; margin: 0;
	margin-left: 30px;
}
.title {
	color: black;
	font-size: 27px;
	text-align: left;
}
.content {
 	margin: 60px;
	margin-bottom: 0;
}
#bf {
 	margin-left : 64px;
	margin-bottom: 10px;
	border-radius: 7px 7px 7px 7px;
	width: 35%;
	border: 1px solid;
}
.zero {
	width: 100%; height: 85%;
	float: right;
	position: absolute;
}
.f {
	font-size: 13px;
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
<script type="text/javascript">	
	$(function() {
		$('#disp').load("reviewlist.og");
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="hd">
		<h1 style="font-size: 30px">테마 상세 설명</h1>
		<div style="color: #BDBDBD; font-weight: bold;" align="center">___________</div>
	</div>
		<div class="bgc">
		<div class="container">
		<ul class="tema-items col-md-3">
			<li class="tema-item">
				<div class="tema-iamge">
					<img alt="" src="resources/upload/${product.fileName}">
					<div style="color: #BDBDBD; font-weight: bold;" align="center">______</div>
					<br> <span class="f">${product.content}</span>
				</div>
			</li>
		</ul>
		<ul class="tema-item2 col-md-5 cont">
			<li class="tema-items2">
				<div align="left" class="content f">
					<div class="title">${product.tema}</div>
					<div style="color: #BDBDBD; font-weight: bold;" align="left">___________</div>
					<br>
					<div>장르 : 공포,스릴러</div>
					<div>인원 : 1~5인</div>
					<div>난이도 : ${product.difficulty}</div>
					<div>공포도 : ${product.fear}</div>
					<div>활동성 : ${product.active}</div>
					<div>예약 가능 지점 : ${product.locName}</div>
					<div style="color: #BDBDBD;" align="left">______________________</div>
					<br>
				</div>
				<c:if test="${id == 'master' }">
				<div>
					<a id="bf" class="btn btn-default" href="productDelete.og?tema=${product.tema}">삭제</a>
					<a id="bf" class="btn btn-default"
						href="productUpdateForm.og?tema=${product.tema}">수정</a>
				</div>
				</c:if>
			</li>
		</ul>
		<div class="col-md-3 zero"></div>
		<div id="disp"></div><br><br>
	</div>
	</div>
</body>
<%@ include file="../footer.jsp" %>
</html>