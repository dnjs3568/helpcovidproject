<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div id="map" style="width: 100%; height: 350px;"></div>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ce00fdf688ee6245ea68e01440ecefa"></script>
<script type="text/javascript">
	var mapContainer = document.getElementById('map'), mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3

	};

	var map = new kakao.maps.Map(mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();
	map1.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	var mapContainer2 = document.getElementById('map2'), mapOption2 = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3
	};
	var map2 = new kakao.maps.Map(mapContainer2, mapOption2);

	var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

	var marker = new kakao.maps.Marker({
		position : markerPosition
	});

	marker.setMap(map2);

	var mapContainer3 = document.getElementById('map3'), // 지도를 표시할 div
	mapOption3 = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	var map3 = new kakao.maps.Map(mapContainer3, mapOption3); // 지도를 생성합니다
	// 마커가 표시될 위치입니다
	var position = [ new kakao.maps.LatLng(33.450705, 126.570677),
			new kakao.maps.LatLng(33.450936, 126.569477),
			new kakao.maps.LatLng(33.450879, 126.569940),
			new kakao.maps.LatLng(33.451393, 126.570738) ];
	for (var i = 0; i < position.length; i++) {
		var marker = new kakao.maps.Marker({
			map : mp3,
			position : position[i]
		});
	}
	var bounds = new kakao.maps.LatLngBounds();
	// bounds에 좌표추가
	bounds.extend(new kakao.maps.LatLng(33.452278, 126.567803));
	bounds.extend(new kakao.maps.LatLng(33.452671, 126.574792));
	bounds.extend(new kakao.maps.LatLng(33.451744, 126.572441));
	map.setBounds(bounds);

	var mapContainer4 = document.getElementById('map4'), // 지도를 표시할 div
	mapOption4 = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};
	var map4 = new kakao.maps.Map(mapContainer4, mapOption4); // 지도를 생성합니다
	// 마커가 표시될 위치입니다
	var positions = [ new kakao.maps.LatLng(33.450705, 126.570677),
			new kakao.maps.LatLng(33.450936, 126.569477),
			new kakao.maps.LatLng(33.450879, 126.569940),
			new kakao.maps.LatLng(33.451393, 126.570738) ];
	var bounds = new kakao.maps.LatLngBounds();
	for (var i = 0; i < position.length; i++) {
		var marker = new kakao.maps.Marker({
			map : map4,
			position : position[i]
		});
		bounds.extent(positions[i]);
	}
	map4.setBounds(bounds)

	
</script>
<body>

</body>
</html>