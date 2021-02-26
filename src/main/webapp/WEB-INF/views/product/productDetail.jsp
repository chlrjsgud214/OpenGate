<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
h1 {
	font-weight: bold;
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
.b {
 	margin-left : 65px;
	margin-bottom: 10px;
	border-radius: 7px 7px 7px 7px;
	width: 35%;
}
</style>
<script type="text/javascript">
	function del(tema) {
		var on=confirm("정말 삭제하시겠습니까?");
		if (on) location.href="productDelete.og?tema="+tema;
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>테마 상세설명</h1>
		<div style="color: #BDBDBD; font-weight: bold;" align="center">___________</div>
		<ul class="tema-items col-md-3">
			<li class="tema-item">
				<div class="tema-iamge">
					<img alt="" src="resources/upload/${product.fileName}">
					<div style="color: #BDBDBD; font-weight: bold;" align="center">______</div>
					<br> <span>${product.content}</span>
				</div>
			</li>
		</ul>
		<ul class="tema-item2 col-md-5 cont">
			<li class="tema-items2">
				<div align="left" class="content">
					<div class="title">${product.tema}</div>
					<div style="color: #BDBDBD; font-weight: bold;" align="left">___________</div>
					<br>
					<div>장르 : 공포,스릴러</div>
					<div>인원 : 1~5인</div>
					<div>난이도 : ${product.difficulty}</div>
					<div>공포도 : ${product.fear}</div>
					<div>활동성 : ${product.active}</div>
					<div style="color: #BDBDBD;" align="left">______________________</div>
					<br>
				</div>
				<div>
					<a class="btn btn-default b" onclick="del(${product.tema})">삭제</a>
					<a class="btn btn-default b"
						href="productUpdateForm.og?tema=${product.tema}">수정</a>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>