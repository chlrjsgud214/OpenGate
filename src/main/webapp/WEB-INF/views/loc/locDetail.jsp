<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="../Mheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-image: url('resources/images/bg.webp');
}
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
.pp {
	margin-left:75px;
	text-align: left;
	font-size: 13px;
}
#gg {
	margin-left: 75px;
	margin-top: 5px;
	border-radius: 7px 7px 7px 7px;
	border: 1px solid;
}
#gg2 {
	margin-top: 5px;
	border-radius: 7px 7px 7px 7px;
	border: 1px solid;
}
.ff {
	font-size: 14px;
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
		$('#disp').load("productList.og");
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="hd">
		<h1 style="font-size: 30px">지점</h1>
		<div style="color: #BDBDBD; font-weight: bold;" align="center">____</div>
	</div>
		<div class="bgc">
		<div class="container">
		<br><table class="table loc-item">
			<div align="center" class="u">
					<c:forEach var="o" items="${list}">
						<span><a class="tt ff"
							href="locDetail.og?locName=${o.locName}"> ${o.locName}</a></span>
					</c:forEach>	
								
					<!-- 지도 -->
					<c:if test="${l.locName == '합정점' }">
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

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('서울 마포구 서교동 395-46', function(result, status) {

						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {

						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });

						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">OG 합정점</div>'
						        });
						        infowindow.open(map, marker);

						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
						</script>
					</c:if>
					<br>
					
					<!-- 지도 -->
					<c:if test="${l.locName == '부평점' }">
					<br><br><br><br>
					<div id="map" style="width: 85%; height: 500px;"></div>
					<div id="clickLatlng"></div>
					
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c49bea286f716c6efcb37389caff83d9&libraries=services">
						
					</script>
					<script type="text/javascript">
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.49251239202744 ,
									126.72546304876504), // 지도의 중심좌표
							level : 2
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new kakao.maps.MapTypeControl();
						
						// 지도 타입 컨트롤을 지도에 표시합니다
						map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('인천 부평구 부평동 153-7', function(result, status) {

						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {

						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });

						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">OG 부평점</div>'
						        });
						        infowindow.open(map, marker);

						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
						</script>
					</c:if>
					<br>
					<!-- 지도 -->
					<c:if test="${l.locName == '종로점' }">
					<br><br><br><br>
					<div id="map" style="width: 85%; height: 500px;"></div>
					<div id="clickLatlng"></div>
					
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c49bea286f716c6efcb37389caff83d9&libraries=services">
						
					</script>
					<script type="text/javascript">
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.56948753408339 ,
									126.98432254805637), // 지도의 중심좌표
							level : 2
						// 지도의 확대 레벨
						};

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
							
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new kakao.maps.MapTypeControl();
						
						// 지도 타입 컨트롤을 지도에 표시합니다
						map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다
						geocoder.addressSearch('서울 종로구 관철동 43-4', function(result, status) {

						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {

						        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

						        // 결과값으로 받은 위치를 마커로 표시합니다
						        var marker = new kakao.maps.Marker({
						            map: map,
						            position: coords
						        });

						        // 인포윈도우로 장소에 대한 설명을 표시합니다
						        var infowindow = new kakao.maps.InfoWindow({
						            content: '<div style="width:150px;text-align:center;padding:6px 0;">OG 종로점</div>'
						        });
						        infowindow.open(map, marker);

						        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
						        map.setCenter(coords);
						    } 
						});    
						</script>
					</c:if>
					<br>
					<div class="col-md-4 pp">
					<div><p style="font-weight: bold;">${l.locName}</p></div>
					<div><p><span style="font-weight: bold;">주소 : </span><span>${l.locAddr}</span></p></div>
					<div><span style="font-weight: bold;">번호 : </span><span>${l.locTel}</span></div>
					</div>
			</div>
		</table>
		<div id="disp"></div>
		<c:if test="${id == 'master' }">
		<div style="float:left; pposition: relative;" class="col-md-12">
			<a href="locUpdateForm.og?locName=${l.locName}" id="gg" class="btn btn-default">지점 수정</a>
			<a id="gg2" class="btn btn-default" href="locDelete.og?locName=${l.locName}">지점 삭제</a>
		<br><br><br>
		</div>
		</c:if>
	</div>
	</div>
</body>
<%@ include file="../footer.jsp" %>
</html>
					