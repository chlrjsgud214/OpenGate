<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body { background-color: #fff; 
	/* background-image: url('resources/upload/x-file.jpg'); */
}
h1 {
	letter-spacing:-2px;
}
.star{margin-top:10px;}

.tema {margin-top:0px;  color:#ffffff; padding:20px 0 100px 0;}
.tema p{  color:#fff; line-height:100%;}

.tema-items {list-style: none; margin: 0;}
.tema-items {}
.tema-items > li {float: left; padding: 0; margin-left: 30px;}

.tema-items{margin-top:40px;}
.tema-item { width: 300px;
}
.tema-item .item-main { padding: 15px;}
.tema-item img {width: 100%; height: 47%;}


.tema-image a div {
   display:block;
   top: 0px;
   left: -100%;
   -webkit-transition: all 0.3s ease;
   -moz-transition: all 0.3s ease-in-out;
   -o-transition: all 0.3s ease-in-out;
   -ms-transition: all 0.3s ease-in-out;
   transition: all 0.3s ease-in-out;
}
.tema-image a:hover div{
   left: 0px;
}

.tema-image { margin-right: 20px; }
.tema-image a,
.tema-image a img {
   display: block;
   position: relative;
}

.tema-image a {
   overflow: hidden;
   color: black;
}

.tema-image a div {
   position: absolute;
   /* background: #fff; */
   background: rgba(75,75,75,0.9);
   width: 100%;
   height: 100%;
}
/* .tema-image a div span {
   
   margin: 20px 10px 10px 10px;
   text-transform: uppercase;
   font-weight: normal;
   color: rgba(255,255,255,0.9);
   text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
   border-bottom: 1px solid rgba(255,255,255,0.5);
   box-shadow: 0 1px 0 rgba(0,0,0,0.1), 0 -10px 0 rgba(255,255,255,0.3);
}
.tema-image a div p {
   margin:0px;
   padding:0px;
} */

@media screen and (max-width: 1024px) {   
   .tema-items.col-4 > li{width:50%; float:left;}
   .tema-items {margin-right: 0px;}
   
}
@media screen and (max-width: 640px) {   
   .tema-items.col-4 > li{width:100%; float:left;}
   .tema-items {margin: 0; padding:0; }
   .tema-item .item-main {margin: 0 0 25px 0;}
}
.title {
	color: black; font-weight: bold;
	font-size: 18px;
}
.b {
	border-radius: 7px 7px 7px 7px;
}
.p {
	margin-left: 47%;
}
.pagination li.a a {
	color: white; !important; background: #BDBDBD; !important; 
}
.pagination li a {
	color: black;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1 class="text-center">테마 소개</h1>
		<div style="color: #BDBDBD; font-weight: bold;" align="center">____</div>
		<c:forEach var="product" items="${list}">
			<ul class="tema-items col-md-4">
				<li class="tema-item">
					<div class="item-main">
						<div class="tema-image" align="center">
							<a href="productDetail.og?tema=${product.tema}"> <img alt=""
								src="resources/upload/${product.fileName}">
								<div style="color: #BDBDBD; font-size: 13px; padding: 15px;">
									__________<br>
									<br> ${product.content}
								</div>
							</a>
						</div>
						<div align="center">
							<br>
							<span class="title">${product.tema}</span><br>
							<div style="color: #BDBDBD; font-size: 15px;">_______</div>
							<br>
							<span>테마 오픈 날짜 ${product.startdate}</span> <br>
							<span>테마 마감 날짜 ${product.enddate}</span> <br>
							<br>
							<span>난이도 : ${product.difficulty}</span><br> <span>공포도
								: ${product.fear}</span><br> <span>활동성 : ${product.active}</span><br>
						</div>
						<div align="center">
							<div style="color: #BDBDBD;" align="center">______________________</div>
							<br>
							<a class="btn btn-default b" href="#"
								style="border: 1px solid; width: 85%;">예약하기</a>
						</div>
					</div>
				</li>
			</ul>
		</c:forEach>
		<div>
		<ul class="pagination p col-md-3">
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="productList.og?pageNum=1">◀◀
					</a></li>
					<li><a href="productList.og?pageNum=${pb.startPage-1}">◀
					</a></li>
				</c:if>
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
				<c:if test="${pb.currentPage == i}">
				<li class="a">
					<a href="productList.og?pageNum=${i}">${i}</a></li>
				</c:if>
				<c:if test="${pb.currentPage != i}">
				<li><a href="productList.og?pageNum=${i}">${i}</a></li>
				</c:if>
			</c:forEach>
					<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="productList.og?pageNum=${pb.endPage+1}">▶
					</a></li>
					<li><a href="productList.og?pageNum=${pb.totalPage}">▶▶
					</a></li>
				</c:if>
		</ul>
	</div>
	</div>
</body>
</html>