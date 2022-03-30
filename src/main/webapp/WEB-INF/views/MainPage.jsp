<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">

<title>COVID-19 NOTE</title>
  
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

<script type="text/javascript">
const today = new Date();

const year = today.getFullYear();
const month = ('0' + (today.getMonth() + 1)).slice(-2);
const day = ('0' + today.getDate()).slice(-2);//

const dateString = year + month + day;

var xhr = new XMLHttpRequest();
var url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson'; /*URL*/
var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'zPCVEEGVV%2FB80Mim8wjOXRLspjGK%2BKOJ7Ih5AHjiwaU1U1ef7hnRoLfW6qtyuiJPEqQ0TZ9PAmhupTMXJnhxaA%3D%3D'; /*Service Key*/
queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
queryParams += '&' + encodeURIComponent('startCreateDt') + '=' +encodeURIComponent( dateString - 7); /**/
queryParams += '&' + encodeURIComponent('endCreateDt') + '=' + encodeURIComponent( dateString ); /**/
xhr.open('GET', url + queryParams );
xhr.onreadystatechange = function() {
	if (this.readyState == 4) {
		let xhttp = new XMLHttpRequest();

		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				nodeValfunc(this);
			}
		}
		xhttp.open("GET", this.responseURL, true);
		
		xhttp.send();

		function nodeValfunc(xml) {
			
			var decide, death, xmlDoc;

			xmlDoc = xml.responseXML;

			decide = xmlDoc.getElementsByTagName("decideCnt");
			death = xmlDoc.getElementsByTagName("deathCnt");

			document.getElementById("daa").innerHTML = decide[0].childNodes[0].nodeValue;
			document.getElementById("dbb").innerHTML = death[0].childNodes[0].nodeValue;
			
			document.getElementById("dcc").innerHTML = decide[0].childNodes[0].nodeValue - decide[1].childNodes[0].nodeValue;
			document.getElementById("ddd").innerHTML = death[0].childNodes[0].nodeValue - death[1].childNodes[0].nodeValue;
			
			// 확진자 수를 배열로 넣기
			var decide_Data = [
				decide[5].childNodes[0].nodeValue - decide[6].childNodes[0].nodeValue,
				decide[4].childNodes[0].nodeValue - decide[5].childNodes[0].nodeValue,
				decide[3].childNodes[0].nodeValue - decide[4].childNodes[0].nodeValue,
				decide[2].childNodes[0].nodeValue - decide[3].childNodes[0].nodeValue,
				decide[1].childNodes[0].nodeValue - decide[2].childNodes[0].nodeValue,
				decide[0].childNodes[0].nodeValue - decide[1].childNodes[0].nodeValue
			];
			
			// 사망자 수를 배열로 넣기
			var death_Data = [
				death[5].childNodes[0].nodeValue - death[6].childNodes[0].nodeValue,
				death[4].childNodes[0].nodeValue - death[5].childNodes[0].nodeValue,
				death[3].childNodes[0].nodeValue - death[4].childNodes[0].nodeValue,
				death[2].childNodes[0].nodeValue - death[3].childNodes[0].nodeValue,
				death[1].childNodes[0].nodeValue - death[2].childNodes[0].nodeValue,
				death[0].childNodes[0].nodeValue - death[1].childNodes[0].nodeValue
			];
			
			// 날짜 배열 넣기
			if( decide.length == 7 || decide.length == 7 ) {
				var testday = [ day - 6 + '일', day - 5 + '일', day - 4 + '일', day - 3 + '일',
					day - 2 + '일', day - 1 + '일'
				];
			} else {
				var testday = [ day - 5 + '일', day - 4 + '일', day - 3 + '일', day - 2 + '일',
					day - 1 + '일', day - 0 + '일'
				];
			}
			
			// 확진자 수 그래프
			$(function() {
								
							var chart = {
								type : 'column'
							};
							var title = {
								text : '확진자 수'
							};
							var xAxis = {
								categories : testday ,
								crosshair : true
							};
							var yAxis = {
								min : 0,
								title : {
									text : '확진자 수'
								}
							};
							var tooltip = {
								headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
								pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
										+ '<td style="padding:0"><b>{point.y} 명</b></td></tr>',
								footerFormat : '</table>',
								shared : true,
								useHTML : true
							};
							var plotOptions = {
								column : {
									pointPadding : 0.2,
									borderWidth : 0
								}
							};
							var credits = {
								enabled : false
							};

							var series = [ {
								name : '확진자 수',
								data : decide_Data

							} ];

							var json = {};
							json.chart = chart;
							json.title = title;
							json.tooltip = tooltip;
							json.xAxis = xAxis;
							json.yAxis = yAxis;
							json.series = series;
							json.plotOptions = plotOptions;
							json.credits = credits;
							$('#chart').highcharts(json);
							

						});
			
			// 사망자 수 그래프
			$(document)
			.ready(
					function() {
						var chart = {
							type : 'column'
						};
						var title = {
							text : '사망'
						};
						var xAxis = {
							categories : testday ,
							crosshair : true
						};
						var yAxis = {
							min : 0,
							title : {
								text : '사망자 수'
							}
						};
						var tooltip = {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y} 명</b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						};
						var plotOptions = {
							column : {
								pointPadding : 0.2,
								borderWidth : 0
							}
						};
						var credits = {
							enabled : false
						};

						var series = [ {
							name : '사망자 수',
							data : death_Data

						} ];

						var json = {};
						json.chart = chart;
						json.title = title;
						json.tooltip = tooltip;
						json.xAxis = xAxis;
						json.yAxis = yAxis;
						json.series = series;
						json.plotOptions = plotOptions;
						json.credits = credits;
						$('#chart1').highcharts(json);

					});
		}
	}
};

xhr.send('')

</script>

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
									onclick="location.href='./loginController?action=login';">Login</button>

								<%
								} else {
								%>
								<%=user_id%>&nbsp;님 안녕하세요!
								&nbsp;&nbsp;
								<button type="button" onclick="location.href='./loginController?action=logout';"
									class="btn-hover-1 color-13" id="signup">로그아웃</button>
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
				<a class="navbar-brand" href="./loginController">
					<img src="images/logo.png" alt="" class="img-fluid">
				</a>
				<!-- button class-->
				<button class="navbar-toggler collapsed" type="button"
					data-toggle="collapse" data-target="#navbarmain"
					aria-controls="navbarmain" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icofont-navigation-menu"></span>
				</button>

				<!-- 네비게이션 바 -->
				<div class="collapse navbar-collapse" id="navbarmain">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item active"><a class="nav-link" href="./loginController">MAIN</a></li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="news.jsp"
							id="dropdown02" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">COVID-19 LIVE <i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown02">
								<li><a class="dropdown-item" href="news.jsp">COVID NEWS</a></li>
								<li><a class="dropdown-item" href="chart.jsp">확진자 분포도</a></li>
							</ul>
						</li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="AroundMe.jsp"
							id="dropdown03" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">코로나 검사 <i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown03">
								<li><a class="dropdown-item" href="AroundMe.jsp">내 주변 선별소</a></li>
								<li><a class="dropdown-item" href="./loginController?action=nationwide">전국 선별소 위치</a></li>
							</ul>
						</li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="./ComBoardController?action=list"
							id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">커뮤니티 <i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown05">
								<li><a class="dropdown-item" href="./ComBoardController?action=list1">확진자 / 자가격리자</a></li>
								<li><a class="dropdown-item" href="./ComBoardController?action=list">자유게시판</a></li>
							</ul>
						</li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="./loginController?action=userupdate"
							id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">마이 페이지 <i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown05">
								<%
									// Object user_id = session.getAttribute("user_id");
									if (user_id == null) {
								%>
								
								<li><a class="dropdown-item" href="./loginController?action=userupdate_fail">회원 가입 정보</a></li>
								
								<%
									} else {
								%>
								
								<li><a class="dropdown-item" href="./loginController?action=userupdate">회원 가입 정보</a></li>
								
								<%
									}
								%>
								
								
								<%
									if (user_id == null) {
								%>
								
								<li><a class="dropdown-item" href="./loginController?action=userupdate_fail">내가 쓴 글 보기</a></li>
								
								<%
									} else {
								%>
								
								<li><a class="dropdown-item" href="./loginController?action=mywritinglist">내가 쓴 글 보기</a></li>
								
								<%
									}
								%>
								
							</ul>
						</li>
					</ul>
				</div>
				<!-- 네비게이션 바 끝-->
			</div>
		</nav>
	</header>




	<!-- Slider Start -->
	<section class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-12 col-xl-7">
					<div class="block">

						<div class="divider mb-3"></div>

						<span class="text-uppercase text-sm letter-spacing ">조금만 멈춰 주세요</span>

						<h1 class="mb-3 mt-3">「우리 함께 다시」</h1>
						<br /> <br />

						<div class="btn-container ">
							<a href="AroundMe.jsp" target="_blank"
								class="btn btn-main-2 btn-icon btn-round-full">내 주변 선별소 찾기 <i
								class="icofont-simple-right ml-2  "></i></a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="features">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="feature-block d-lg-flex">
						<div class="feature-item mb-5 mb-lg-0">
							<div class="feature-icon mb-4">
								<i class="icofont-surgeon-alt"></i>
							</div>
							<span>코로나 라이브</span>
							<h4 class="mb-3">국내외 실시간 뉴스</h4>
							<p class="mb-4">오늘의 주요 소식은?</p>
							<!--<a href="appoinment.html" class="btn btn-main btn-round-full">Make a appoinment</a> -->
							<!--<button class="btn-hover color-12"> COVID-19 LIVE</button> -->
							<button class="btn-hover color-12" onclick="location.href='./news.jsp' ">COVID-19</button>
						</div>

						<div class="feature-item mb-5 mb-lg-0">
							<div class="feature-icon mb-4">
								<i class="icofont-ui-clock"></i>
							</div>
							<span>혼자가 아니야</span>
							<h4 class="mb-3">당신 곁에 있어요</h4>
							<p class="mb-4">우리끼리 소통하기</p>
							<!--<button class="btn-hover color-8">자유 게시판</button> -->
							<button class="btn-hover color-8" onclick="location.href='./ComBoardController?action=list'">자유 게시판</button>
						</div>

						<div class="feature-item mb-5 mb-lg-0">
							<div class="feature-icon mb-4">
								<i class="icofont-support"></i>
							</div>
							<span>질병 관리청 콜 센터</span>
							<h4 class="mb-3">국번 없이 1339</h4>
							<p class="mb-4">운영 시간 : 365 일 24 시</p>
							<!--<button class="btn-hover color-12">질병 관리청 상담하기</button>-->
							<button class="btn-hover color-12" onclick="location.href='https://pf.kakao.com/_XrQxkM'">질병 관리청 상담하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	<section class="cta-section ">
		<div class="">
			<div class="cta position-relative">
				<div class="row">
				
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="counter-stat">
							<span class="h3" id="daa"></span>
							<p>총 확진자</p>
						</div>
					</div>
					
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="counter-stat">
							<span class="h3" id="dbb"></span>
							<p>총 사망자</p>
						</div>
					</div>
					
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="counter-stat">
							<span class="h3" id="dcc"></span>
							<p>일일 확진자</p>
						</div>
					</div>
					
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="counter-stat">
							<span class="h3" id="ddd"></span>
							<p>일일 사망자</p>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</section>
	
	
	<section class="section about">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-4 col-sm-6">
					<div id="chart" style="width: 550px; height: 400px; "></div>
					<div id="chart1" style="width: 550px; height: 400px; "></div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<div class="about-img mt-4 mt-lg-0">
					</div>
				</div>
				
				<div class="col-lg-4">
					<div class="about-content pl-4 mt-4 mt-lg-0">
						<h3 class="title-color">거리 두기 조정안</h3>
						<p class="mt-4 mb-5">
							사적 모임 인원 전국 6 인 유지 <br>영업 시간 23 시로 완화 즉시 시행(3.05~3.20)
						</p>
						
						<a href="chart.jsp"
							class="btn btn-main-2 btn-round-full btn-icon">확진자 분포도 확인하기<i
							class="icofont-simple-right ml-3"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>


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
		<script src="plugins/google-map/map.js"></script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>

		<script src="js/script.js"></script>
		<script src="js/contact.js"></script>
</body>
</html>
