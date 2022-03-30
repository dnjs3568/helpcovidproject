<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">
<head>
<style type="text/css">
	p1 {
		color: black;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">

<title>COVID-19 NOTE</title>

<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

<script type="text/javascript">

	$(document).ready(
		function() {
		
			$.ajaxSettings.traditional = true;
			//var String item = [];
			$.ajax({
				type : 'get',
				url : 'naverNews.jsp',
				traditional : true,
				data : {},
				dataType : 'json',
				success : function(data) {
					$.each(data.items, function(index, el) {
						var html = '';
						html += '<div class="container">';
						html += '<div class="center-block">';
						html += '<div class="col-sm-12">';
						html += '<h3 class="title">';  
						
						html += '<a href=' + el.link + '> ';
						html += el.title;
						html += '</a>';
						html += '</h3>';
						html += '<p>'
						html += '<span class="glyphicon glyphicon-lock">' + '</span>'
						html += '</p>'
						html += '<p1>'; 	
						html += '<a href=' + el.link + '> ';
						html += el.description;
						html += '</a>';
						html += '</p1>';
						//html += '<p class="text-muted">' + el.link
						//		+ '<a href="#">' + '</a>' + '</p>'
						html += '<hr>'
						html += '</div><br /></div><br /></div>'
						
						//$("#demo").append(el.title + " ");
						
						//$("#demo1").append(el.link + " ");
						//$("#demo2").append(el.description + " ");
						//$("#demo3").append("<br>");
						
						html += "</table>";
						$("#display").empty();
						$("#display1").append(html);
						
					});
				}
			});
		});
	
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

<style>
	/* CSS used here will be applied after bootstrap.css */
	.pagetitle {
		border-bottom: 1px solid #cccccc;
		padding-bottom: 30px;
		margin-bottom: 30px;
	}
</style>

</head>

<body id="top">

	<header>
		<div class="header-top-bar">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6">
						<ul class="top-bar-info list-inline-item pl-0 mb-0">
							<li class="list-inline-item">COVID-19 NOTE <!-- 이메일 링크 안 걸리게 수정 -->
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
	<br/ >
	<br/ >
	<br/ >
	<br/ >
	<br/ >
	<div id="display1"></div>
	<div id="display1"></div>
	<div id="display1"></div>
	<div id="display1"></div>
	<div id="display1"></div>
	


	<br />
	<br />
	<br />
	<br />



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
