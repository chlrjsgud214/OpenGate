<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
h1 {
	letter-spacing: -2px;
	text-align: center;
	margin-top: 45px;
}

.loc-item {
	margin-top: 30px;
}

.td {
	font-weight: bold;
}

.tt {
	border-left: 1px solid #BDBDBD;
	border-right: 1px solid #BDBDBD;
	color: black;
	margin: 15px;
	padding: 15px;
}
.tt:hover {
	text-decoration: none;
	color: #BDBDBD;
}
.u {
	margin-top: 30px;
	margin-bottom: 30px;
}
.aa {
	margin-left: 75px;
}
.bb {
	text-align: left;
}
.cc {
	border-radius: 9px 9px 9px 9px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#disp').load("productList.og");
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>지점</h1>
		<div style="color: #BDBDBD; font-weight: bold;" align="center">____</div>
		<br><table class="table loc-item">
			<c:if test="${empty list}">
				<tr>
					<td align="center" class="td">지점이 없습니다.</td>
				</tr>
			</c:if>
			<div align="center" class="u">
				<c:if test="${not empty list}">
					<c:forEach var="l" items="${list}">
						<span><a class="tt"
							href="locDetail.og?locName=${l.locName}"> ${l.locName}</a></span>
					</c:forEach>
					
					<!-- 지도 -->
					<br><br><br><br>
					<div id="map" style="width: 85%; height: 500px;"></div>
					<div id="clickLatlng"></div>
					
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c49bea286f716c6efcb37389caff83d9&libraries=services">
						
					</script>
					<script type="text/javascript">
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.55056021889889 ,
									126.91590637623462), // 지도의 중심좌표
							level : 2
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new kakao.maps.MapTypeControl();
						
						// 지도 타입 컨트롤을 지도에 표시합니다
						map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

						// 지도를 클릭한 위치에 표출할 마커입니다
						var marker = new kakao.maps.Marker({
							// 지도 중심좌표에 마커를 생성합니다 
							position : map.getCenter()
						});
						// 지도에 마커를 표시합니다
						marker.setMap(map);

						// 지도에 클릭 이벤트를 등록합니다
						// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
						kakao.maps.event.addListener(map, 'click', function(
								mouseEvent) {

							// 클릭한 위도, 경도 정보를 가져옵니다 
							var latlng = mouseEvent.latLng;

							// 마커 위치를 클릭한 위치로 옮깁니다
							marker.setPosition(latlng);

							var message = '클릭한 위치의 위도는 ' + latlng.getLat()
									+ ' 이고, ';
							message += '경도는 ' + latlng.getLng() + ' 입니다';

							var resultDiv = document
									.getElementById('clickLatlng');
							resultDiv.innerHTML = message;

						});
					</script>
					<br>
					<div class="bb col-md-offset-1">
					<div><p style="font-weight: bold;">합정점</p></div>
					<div><p><span style="font-weight: bold;">주소 : </span>서울 마포구 서교동 395-46</p></div>
					<div><span style="font-weight: bold;">번호 : </span>010-0000-0000</div>
					</div>
				</c:if>
			</div>
		</table>
		<div id="disp"></div>
		<c:if test="${id == 'master' }">
		<div style="margin-left: 10px;">
			<a href="locInsertForm.og" class="btn btn-default aa cc">지점 등록</a>
		</div>
		</c:if>
	</div>
</body>
</html>
					