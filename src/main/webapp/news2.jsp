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
<meta name="description"
	content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">

<title>COVID-19 NOTE</title>

<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

<script type="text/javascript">
	// 페이징 처리준비
	let totalData;	// 총 데이터 수
	let dataPerPage;	// 한 페이지에 나타낼 글 수
	let pageCount = 10;		// 페이징에 나타낼 페이지 수
	let globalCurrentPage=1;	// 현재 페이지
	
	$(document).ready(function() {
		//dataPerPage 선택값 가져오기
		dataPerPage = $("#dataPerPage").val();
		
		$.ajaxSettings.traditional = true;
		//var String item = [];
		
		$.ajax({ //ajax로 데이터 가져오기
			method: "GET",
			url : 'naverNews.jsp',
			traditional : true,
			data : {},
			dataType : 'json',
			success : function(data) {

			}

		});
		
		//글 목록 표시 호출 (테이블 생성)
		 displayData(1, dataPerPage);
		 //페이징 표시 호출
		 paging(totalData, dataPerPage, pageCount, 1);

		});
	
	
		//페이징 표시 함수
		function paging(totalData, dataPerPage, pageCount, currentPage) {
		  console.log("currentPage : " + currentPage);
		
		  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
		  
		  if(totalPage<pageCount){
		    pageCount=totalPage;
		  }
		  
		  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
		  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
		  
		  if (last > totalPage) {
		    last = totalPage;
		  }
		
		  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
		  let next = last + 1;
		  let prev = first - 1;
		
		  let pageHtml = "";
		
		  if (prev > 0) {
		    pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
		  }
		
		 //페이징 번호 표시 
		  for (var i = first; i <= last; i++) {
		    if (currentPage == i) {
		      pageHtml +=
		        "<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
		    } else {
		      pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
		    }
		  }
		
		  if (last < totalPage) {
		    pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
		  }
		
		  $("#pagingul").html(pageHtml);
		  let displayCount = "";
		  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
		  $("#displayCount").text(displayCount);
		
		
		  //페이징 번호 클릭 이벤트 
		  $("#pagingul li a").click(function () {
		    let $id = $(this).attr("id");
		    selectedPage = $(this).text();
		
		    if ($id == "next") selectedPage = next;
		    if ($id == "prev") selectedPage = prev;
		    
		    //전역변수에 선택한 페이지 번호를 담는다...
		    globalCurrentPage = selectedPage;
		    //페이징 표시 재호출
		    paging(totalData, dataPerPage, pageCount, selectedPage);
		    //글 목록 표시 재호출
		    displayData(selectedPage, dataPerPage);
		  });
		}
			
		
		
	//글 목록 표시 함수
	//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
	function displayData(currentPage, dataPerPage) {
	
	  let chartHtml = "";
	
	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
	  currentPage = Number(currentPage);
	  dataPerPage = Number(dataPerPage);
	  
	  for (
	    var i = (currentPage - 1) * dataPerPage;
	    i < (currentPage - 1) * dataPerPage + dataPerPage;
	    i++
	  ) {
		  
		  
		  
	    chartHtml +=
	    	html = '';
		html += '<div class="container">';
		html += '<div class="center-block">';
		html += '<div class="col-sm-12">';
		html += '<h3 class="title">';  
		
		html += '<a href=' + el.link + '> ';
		html += el.title;
		html += '</a>';
		html += '</h3>';
		html += '<p>'
		html += '<span class="glyphicon glyphicon-lock">'
				+ '</span>'
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

		html += "</table>";
		//$("#display").empty();
		//$("#display1").append(html);
	      
	      
	      
	  }
	  $("#dataTableBody").append(html);
	}
	
	
	
	//페이지 번호 클릭시
	$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
 	});
	


</script>

<script type="text/javascript">
	$(document).ready(
			function() {

				
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
<link rel="stylesheet"
	href="plugins/slick-carousel/slick/slick-theme.css">

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
								<li><a class="dropdown-item" href="news.jsp">COVIDNEWS</a></li>
								<li><a class="dropdown-item" href="chart.jsp">확진자
										분포도</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="doctor.html"
							id="dropdown03" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">코로나 검사 <i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown03">
								<li><a class="dropdown-item" href="doctor.jsp">내 주변
										선별소</a></li>
								<li><a class="dropdown-item" href="doctor-single.jsp">전국
										선별소 위치</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="blog-sidebar.html"
							id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">커뮤니티 <i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown05">
								<li><a class="dropdown-item" href="blog-sidebar.jsp">확진자/자가
										격리자</a></li>

								<li><a class="dropdown-item" href="Board_BoardList.jsp">자유
										게시판</a></li>
							</ul></li>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="blog-sidebar.html"
							id="dropdown05" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false">마이 페이지 <i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown05">
								<li><a class="dropdown-item" href="blog-sidebar1.jsp">회원
										가입 정보</a></li>
								<li><a class="dropdown-item" href="blog-sidebar2.jsp">내가
										쓴 글 보기</a></li>
							</ul></li>
					</ul>
				</div>



				<!-- logo div끝-->
			</div>
		</nav>
	</header>
	
	<div class="float-right">
	<select id="dataPerPage">
		<option value="10">10개씩 보기</option>
		<option value="10">15개씩 보기</option>
		<option value="10">20개씩 보기</option>
	</select>
	</div>
	
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
	
	<ul id="pagingul">

	</ul>

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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>

	<script src="js/script.js"></script>
	<script src="js/contact.js"></script>
</body>
</html>
