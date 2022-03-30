<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	StringBuffer sbHtml = new StringBuffer();

	String name1 = "관악구보건소";
	String name2 = "에이치플러스 양지병원";

	sbHtml.append( "<tr>" );
	sbHtml.append( "<td>" + "1" +"</td>" );
	sbHtml.append( "<td>" + "서울" + "</td>" );
	sbHtml.append( "<td>" + "관악구" + "</td>" );
	sbHtml.append( "<td>" + name1 + "</td>" );
	sbHtml.append( "<td>" + "02-879-7103" + "</td>" );
	sbHtml.append( "<td>" + "20200104" + "</td>" );
	sbHtml.append( "<td><button onclick='showMap()'>지도</button></td>" );
	sbHtml.append( "</tr>" );
	
	sbHtml.append( "<tr>" );
	sbHtml.append( "<td>" + "2" +"</td>" );
	sbHtml.append( "<td>" + "서울" + "</td>" );
	sbHtml.append( "<td>" + "관악구" + "</td>" );
	sbHtml.append( "<td>" + name2 + "</td>" );
	sbHtml.append( "<td>" + "02-1877-8875" + "</td>" );
	sbHtml.append( "<td>" + "20200104" + "</td>" );
	sbHtml.append( "<td><button onclick='showMap()'>지도</button></td>" );
	sbHtml.append( "</tr>" );
	
%>

<!DOCTYPE html>
<html lang="zxx">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">

<title>COVID-19 NOTE</title>
  
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="/images/favicon.ico" />

<!-- bootstrap.min css -->
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
<!-- Icon Font Css -->
<link rel="stylesheet" href="plugins/icofont/icofont.min.css">
<!-- Slick Slider  CSS -->
<link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="css/style.css">

<!-- Kakao Map -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef8fd921ddb5debb035c37c28669b219&libraries=services,clusterer,drawing"></script>

<!-- 추가 -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="css/styles2.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>


<script type="text/javascript">
	
	let presentPosition;
	
	var mapContainer;
	var map;
	
	var infowindow1; // 키워드 검색 시 마커를 클릭하면 장소명을 표출할 인포윈도우
	
	window.onload = function() {
		
		let presentPosition;
		
		///////////////// 지도의 중심을 현재 위치로 변경 ///////////////////////
		mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				level : 5 // 지도의 확대 레벨 
			};
		
		map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
		
		// HTML5의 geolocation으로 사용할 수 있는지 확인 
		if(navigator.geolocation) {
		
			// GeoLocation을 이용해서 접속 위치를 얻어온다
			navigator.geolocation.getCurrentPosition(function(position) {
		
				var lat = position.coords.latitude, // 위도
					lon = position.coords.longitude; // 경도
		
				var locPosition = new kakao.maps.LatLng(lat, lon); // geolocation으로 얻어온 좌표
				presentPosition = locPosition; // geolocation으로 얻어온 좌표를 현재 위치로 설정
				map.setCenter(presentPosition); // 지도의 중심을 현재 위치로 설정
				
				
				// 현재 내 위치 마커이미지 설정
				var imageSrc = './images/icons/GPS_icon.png', // 빨간 마커이미지의 주소
					imageSize = new kakao.maps.Size(31,35), // 마커이미지의 크기(64,69)
					imageOption = {offset: new kakao.maps.Point(31, 35)}; // 마커이미지의 옵션 (마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정) (27, 69)
				// 마커의 이미지 정보를 가지고 있는 마커이미지 생성
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
					markerPosition = locPosition; // 마커가 표시될 위치
				
				
				var markerPosition = locPosition; // 마커가 표시될 위치 (= geolocation으로 받아온 현재 위치)
				// 마커 생성
				var marker = new kakao.maps.Marker({
					position : markerPosition,
					image : markerImage // 빨간 마커이미지 설정
				});
				marker.setMap(map); // 마커가 지도 위에 표시되도록 설정
				
				
				var iwContent = '<div style="padding:5px;">현재 위치</div>', // 인포윈도우 내용
					iwPosition = locPosition; // 인포윈도우가 표시될 위치 (= geolocation으로 받아온 현재 위치)
				// 인포윈도우 생성
				var infowindow = new kakao.maps.InfoWindow({
					position : iwPosition,
					content : iwContent
				});
				infowindow.open(map, marker); // 마커 위에 인포윈도우 표시 (두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됨)
				
			});
		
		} else { // HTML5의 GeoLocation을 사용할 수 없을 때 
			var locPosition = new kakao.maps.LatLng(37.566826, 126.9786567);
			alert('현재 위치를 찾을 수 없습니다!');
		}
		
		
		// 마커를 클릭하면 장소명을 표출할 인포윈도우
		//var infowindow1 = new kakao.maps.InfoWindow({zIndex:1});
		infowindow1 = new kakao.maps.InfoWindow({zIndex:1});
		
		/*
		// v3가 모두 로드된 후 이 콜백 함수가 실행된다
		kakao.maps.load(function() {
			// 장소 검색 객체 생성
			var ps = new kakao.maps.services.Places();
			
			// 키워드로 장소 검색
			// ps.keywordSearch('이태원 맛집', placeSearchCB);
			ps.keywordSearch('관악구 선별진료소', placeSearchCB); // 따로 지정 안하면 데이터가 json 형식으로 반환됨
			// ps.keywordSearch(presentPosition, placeSearchCB); // 현재 위치 변수 -> 안됨
			// ps.keywordSearch('코로나19 낙성대공원 임시선별검사소', placeSearchCB); // 정확한 이름을 넣으면 딱 그 데이터의 위치만 표시됨!
			
		});
		*/
	};
	
	
	
	// 테이블의 '지도' 버튼을 눌렀을 떄
	function showMap() {
		alert('지도 보여줘ㅓㅓㅓ');
		
		var name = "<%=name1 %>";
		console.log(name);
		
		// v3가 모두 로드된 후 이 콜백 함수가 실행된다
		kakao.maps.load(function() {
			// 장소 검색 객체 생성
			var ps = new kakao.maps.services.Places();
			
			// 키워드로 장소 검색
			// ps.keywordSearch('이태원 맛집', placeSearchCB);
			ps.keywordSearch(name + ' 선별진료소', placeSearchCB); // 따로 지정 안하면 데이터가 json 형식으로 반환됨
			// ps.keywordSearch(presentPosition, placeSearchCB); // 현재 위치 변수 -> 안됨
			// ps.keywordSearch('코로나19 낙성대공원 임시선별검사소', placeSearchCB); // 정확한 이름을 넣으면 딱 그 데이터의 위치만 표시됨!
			
		});
		
	}
	
	/*
	// 테이블의 지도 버튼을 눌렀을 때
	function showMap() {
		// alert('지도 보여줘!!');
		
		alert('document.getElementById('name').value');
		//var name = document.getElementById('name').value;
		//console.log(name);
	}
	*/
	/*
	function showLoc(var name) {
		alert('지도 나오나???');
	}
	*/
	
	// 키워드 검색 완료 시 호출되는 콜백함수
	function placeSearchCB(data, status, pagination) {	// 검색 목록, 결과가 있는지 없는지, 페이지 처리
		if(status === kakao.maps.services.Status.OK) {	// 검색 결과가 있다면
			
			// 데이터 확인
			console.log(data);
			
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기 위해 LatLngBounds 객체에 좌표 추가
			var bounds = new kakao.maps.LatLngBounds();
			
			for(var i=0; i<data.length; i++) {
				displayMarker(data[i]);
				bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			}
			
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정
			map.setBounds(bounds);
		} else if(status === kakao.maps.services.Status.ZERO_RESULT) {
			alert('검색 결과가 존재하지 않습니다.');
			return;
		} else if(status === kakao.maps.services.Status.ERROR) {
			alert('검색 결과 중 오류가 발생했습니다.');
			return;
		}
	}
	
	
	// 지도에 마커를 표시하는 함수
	function displayMarker(place) {
		// console.log(place);
		// console.log(place.place_name);
		// console.log(place.road_address_name);
		
		// 마커를 생성하고 지도에 표시
		var marker = new kakao.maps.Marker({
			map: map,
			position: new kakao.maps.LatLng(place.y, place.x)
		});
		
		// 마커에 클릭이벤트 등록
		kakao.maps.event.addListener(marker, 'click', function() {
			// 마커를 클릭하면 장소명이 인포윈도우에 표출
			infowindow1.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>'); // 이름만 출력
			// infowindow1.setContent('<div style="height:100%; padding:5px; margin-right:10px; font-size:12px;">' + '<strong>' + place.place_name + '</strong> ' + place.road_address_name + '</div>'); // 이름+주소 출력
			infowindow1.open(map, marker);
		});
	}
	
	
	
	
	
</script>

</head>

<body id="top">

	<header>
		<div class="header-top-bar">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6">
						<ul class="top-bar-info list-inline-item pl-0 mb-0">
							<li class="list-inline-item">
							COVID-19 NOTE
							<!-- 이메일 링크 안 걸리게 수정 -->
							</li>
						</ul>
					</div>
					<div class="col-lg-6">
						<div class="text-lg-right top-right-bar mt-2 mt-lg-0">
							<div class="btn-container ">

								<%
								Object user_id = session.getAttribute("user_id");
								if (user_id == null) {
								%>

								<button type="button" onclick="location.href='SignUp5.jsp'"
									class="btn-hover-1 color-13" id="signup">sign up</button>
									&nbsp;&nbsp;
								<button class="btn-hover-1 color-13"
									onclick="location.href='Login.jsp';">Login</button>

								<%
								} else {
								%>
								<%=user_id%>&nbsp;님 안녕하세요!
								&nbsp;&nbsp;
								<button type="button" onclick="location.href='logOut.jsp';"
									class="btn-hover-1 color-13" id="signup">로그아웃</button>
									&nbsp;&nbsp;
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<nav class="navbar navbar-expand-lg navigation" id="navbar">
			<div class="container">
				<a class="navbar-brand" href="MainPage.jsp"> <img
					src="images/logo.png" alt="" class="img-fluid">
				</a>
				<!-- button class-->
				<button class="navbar-toggler collapsed" type="button"
					data-toggle="collapse" data-target="#navbarmain"
					aria-controls="navbarmain" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icofont-navigation-menu"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarmain">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link"
							href="MainPage.jsp">MAIN</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="department.html"
							id="dropdown02" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">COVID-19 LIVE <i
								class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown02">
								<li><a class="dropdown-item" href="department.html">국내</a></li>
								<li><a class="dropdown-item" href="department-single.html">해외</a></li>
								<li><a class="dropdown-item" href="department-single.html">확진자
										분포도</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="doctor.html"
							id="dropdown03" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">코로나 검사 <i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown03">
								<li><a class="dropdown-item" href="AroundMe.jsp">내 주변
										선별소</a></li>
								<li><a class="dropdown-item" href="Nationwide.jsp">전국
										선별소 위치</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="blog-sidebar.html"
							id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">커뮤니티 <i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown05">
								<li><a class="dropdown-item" href="blog-sidebar.html">확진자/자가
										격리자</a></li>

								<li><a class="dropdown-item" href="blog-single.html">자유
										게시판</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="blog-sidebar.html"
							id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">마이 페이지 <i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown05">
								<li><a class="dropdown-item" href="blog-sidebar.html">회원
										가입 정보</a></li>
								<li><a class="dropdown-item" href="blog-sidebar.html">내가
										쓴 글 보기</a></li>
							</ul></li>
					</ul>
				</div>

				<!-- logo div끝-->
			</div>
		</nav>
	</header>
	
	<!-- AroundMe.jsp -->
	
	<div class="container">
		<div id="map" style="width:100%;height:400px;"></div>
	</div>
	
	<p></p>
	
	<div class="container">
		<table width="100%" border="1px solid border">
			<thead>
				<tr>
					<th>번호</th>
					<th>시도</th>
					<th>시군구</th>
					<th>선별진료소(운영시간(?))</th>
					<th>전화번호</th>
					<th>운영가능일자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>서울</td>
					<td>관악구</td>
					<td>관악구보건소</td>
					<td>02-879-7103</td>
					<td>20200104</td>
				</tr>
				<tr>
					<td>2</td>
					<td>서울</td>
					<td>관악구</td>
					<td>에이치플러스 양지병원</td>
					<td>02-1877-8875</td>
					<td>20200104</td>
				</tr>
			</tbody>
		</table>
		
		<!-- <div id="result"></div> -->
		
	</div>
	
	
	<!-- 테이블 -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4"></h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active"></li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 내 주변 선별소 목록
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr bgcolor="#A9A9A9">
									<th>번호</th>
									<th>시도</th>
									<th>시군구</th>
									<th>선별진료소(운영시간(?))</th>
									<th>전화번호</th>
									<th>운영가능일자</th>
									<th>위치</th>
								</tr>
							</thead>
							<!-- 
							<tfoot>
								<tr align="center">
									<th>아이디</th>
									<th>닉네임</th>
									<th>이름</th>
									<th>생년월일</th>
									<th>성별</th>
									<th>생성일</th>
									<th>기능</th>
								</tr>
							</tfoot>
							-->
							<tbody>
								<%=sbHtml %>
								<!-- <input type="hidden" id="name" name="name" value="<%=name1 %>" /> -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
		<footer class="py-4 bg-light mt-auto"> </footer>
	</div>
	
	<br/><br/><br/><br/><br/>


	<!-- 
    Essential Scripts
    =====================================-->


		<!-- Main jQuery -->
		<!-- Bootstrap 4.3.2 -->
		<script src="plugins/bootstrap/js/popper.js"></script>
		<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="plugins/counterup/jquery.easing.js"></script>
		<!-- Slick Slider -->
		<script src="plugins/slick-carousel/slick/slick.min.js"></script>
		<!-- Counterup -->
		<script src="plugins/counterup/jquery.waypoints.min.js"></script>

		<script src="plugins/shuffle/shuffle.min.js"></script>
		<script src="plugins/counterup/jquery.counterup.min.js"></script>
		
		<!-- Google Map -->
		<!-- 
		<script src="plugins/google-map/map.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>
		-->
		
		<script src="js/script.js"></script>
		<script src="js/contact.js"></script>
		
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
		
</body>
</html>
