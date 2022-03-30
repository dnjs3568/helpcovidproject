<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description"
	content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">

<title>COVID-19 NOTE</title>
  
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

<script type="text/javascript">

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
								<li><a class="dropdown-item" href="news.jsp">COVIDNEWS</a></li>
								<li><a class="dropdown-item" href="chart.jsp">지역별 확진자
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
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<figure class="highcharts-figure">
    <div id="container"></div>
    <p class="highcharts-description">

    </p>
</figure>

<script type="text/javascript">

// 오늘의 날짜 선언
	const today = new Date();
	const year = today.getFullYear();
	const month = ('0' + (today.getMonth() + 1)).slice(-2);
	const day = ('0' + today.getDate()).slice(-2);//
	const dateString = year + month + day;
	
	// API에서 불러오기
	var xhr = new XMLHttpRequest();
	var url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson'; /*URL*/
	var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'AxHdlWlUlIm47ZJSmct%2B4WT1FxyXkRjv8D2%2Bt%2FueMngcwFw%2BjuROjUhr%2Bko34%2ByD4AGV1aj0Onu6h5I1IFKSFA%3D%3D'; /*Service Key*/
	queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
	queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
	queryParams += '&' + encodeURIComponent('startCreateDt') + '=' + encodeURIComponent(dateString-1); /**/
	queryParams += '&' + encodeURIComponent('endCreateDt') + '=' + encodeURIComponent(dateString-1); /**/
	xhr.open('GET', url + queryParams);
	xhr.onreadystatechange = function () {
	    if (this.readyState == 4) {
	    	let xhttp = new XMLHttpRequest();
	    	//잘 불러 왔는지 확인해보기
	    	//alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
	        xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					// 함수에 넣기
					nodeValfunc(this);
					}
		    }
			xhttp.open("GET", this.responseURL, true);
			xhttp.send();	
		};
	}
	xhr.send('')

	// 함수 호출
	function nodeValfunc(xml) {
				
				var death;
				var gubun;
				var decide;
				var increase;
				var qurRate;

				xmlDoc = xml.responseXML;

				gubun = xmlDoc.getElementsByTagName("gubun");
				death = xmlDoc.getElementsByTagName("deathCnt");
				decide = xmlDoc.getElementsByTagName("defCnt");
				increase = xmlDoc.getElementsByTagName("incDec");
				qurRate = xmlDoc.getElementsByTagName("qurRate");
				
				var gubunArr = new Array(18);
				var deathArr = new Array(18);
				var decideArr = new Array(18);
				var increaseArr = new Array(18);
				var qurRateArr = new Array(18);
				
				for (var i=0; i<gubun.length-1; i++){
					gubunArr[i] = gubun[i].childNodes[0].nodeValue;
					deathArr[i] = parseInt(death[i].childNodes[0].nodeValue);
					decideArr[i] = parseInt(decide[i].childNodes[0].nodeValue);
					increaseArr[i] = parseInt(increase[i].childNodes[0].nodeValue);
					qurRateArr[i] = parseInt(qurRate[i].childNodes[0].nodeValue);
				}
				chart( gubunArr, deathArr, decideArr, increaseArr, qurRateArr );
			}	
	
	function chart( gubunArr, deathArr, decideArr, increaseArr, qurRateArr ) {
		
		//console.log(gubunArr);
		//console.log(deathArr);
		//console.log(decideArr);
		//console.log(increaseArr);
		//console.log(qurRateArr);
		Highcharts.chart('container', {
		    chart: {
		        type: 'bar'
		    },
		    title: {
		        text: '지역별 감염 및 확진 현황'
		    },
		    subtitle: {
		        text: '자료 제공 : <a href="https://www.data.go.kr/index.do">공공데이터포털</a>'
		    },
		    xAxis: {
		        categories: gubunArr,
		        title: {
		            text: null
		        }
		    },
		    yAxis: {
		        min: 0,
		        title: {
		            text: '명',
		            align: 'high'
		        },
		        labels: {
		            overflow: 'justify'
		        }
		    },
		    tooltip: {
		        valueSuffix: ' millions'
		    },
		    plotOptions: {
		        bar: {
		            dataLabels: {
		                enabled: true
		            }
		        }
		    },
		    legend: {
		        layout: 'vertical',
		        align: 'right',
		        verticalAlign: 'top',
		        x: -40,
		        y: 80,
		        floating: true,
		        borderWidth: 1,
		        backgroundColor:
		            Highcharts.defaultOptions.legend.backgroundColor || '#FFFFFF',
		        shadow: true
		    },
		    credits: {
		        enabled: false
		    },
		    
		    series: [{
		        name: '확진자 수',
		        data: decideArr
		    }, {
		        name: '사망자 수',
		        data: deathArr
		    }, {
		        name: '전일 대비 증감',
		        data: increaseArr
		    }, {
		        name: '10만명당 발생률',
		        data: qurRateArr
		    }]
		});
	}
	
	
	
</script>

<!-- 표 -->
<br />
<br />
<br />
<br />
<br />
<style type="text/css">

.tg  {
border-collapse:collapse;
border-spacing:0;
margin-left:auto;
margin-right:auto;
}

.tg td {
border-color:black;
border-style:solid;
border-width:1px;
font-family:sans-serif;
font-size:14px;
overflow:hidden;
padding:10px 20px;
word-break:normal;
}

.tg th {
border-color:black;
border-style:solid;
border-width:1px;
font-family:sans-serif;
font-size:14px;
font-weight:normal;
overflow:hidden;
padding:10px 20px;
word-break:normal;
}

.tg .tg-vx9a {
background-color:#ffffff;
border-color:#efefef;
color:#001970;
font-size:16px;
font-weight:bold;
text-align:center;
vertical-align:middle
}

  
.tg .tg-zq2w {
border-color:#efefef;
font-size:16px;
font-weight:bold;
text-align:center;
  vertical-align:middle
}
  
.tg .tg-6y6w {
border-color:#efefef;
font-size:16px;
font-weight:bold;
text-align:center;
vertical-align:middle
}

.tg .tg-x2wf {
background-color:#ffffff;
border-color:#efefef;
color:#001970;
font-size:16px;
text-align:center;
vertical-align:middle
}

</style>
<table class="tg">
<thead>
  <tr>
    <th class="tg-zq2w" rowspan="2">시도명</th>
    <th class="tg-zq2w" colspan="3">전일 대비<br>확진 환자</th>
    <th class="tg-zq2w" colspan="3">확진 환자 (명)</th>
  </tr>
  <tr>
    <th class="tg-6y6w">합계</th>
    <th class="tg-6y6w">국내 발생</th>
    <th class="tg-6y6w">해외 유입</th>
    <th class="tg-6y6w">확진 환자</th>
    <th class="tg-6y6w">사망자</th>
    <th class="tg-6y6w">발생률</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-vx9a">합계</td>
    <td class="tg-vx9a">327,549</td>
    <td class="tg-vx9a">327,490</td>
    <td class="tg-vx9a">59</td>
    <td class="tg-vx9a">5,539,650</td>
    <td class="tg-vx9a">9,646</td>
    <td class="tg-vx9a">10728</td>
  </tr>
  <tr>
    <td class="tg-vx9a">서울</td>
    <td class="tg-x2wf">66,859</td>
    <td class="tg-x2wf">66,859</td>
    <td class="tg-x2wf">0</td>
    <td class="tg-x2wf">1,274,661</td>
    <td class="tg-x2wf">2,661</td>
    <td class="tg-x2wf">13404</td>
  </tr>
  <tr>
    <td class="tg-vx9a">부산</td>
    <td class="tg-x2wf">31,578</td>
    <td class="tg-x2wf">31,568</td>
    <td class="tg-x2wf">10</td>
    <td class="tg-x2wf">413,900</td>
    <td class="tg-x2wf">651</td>
    <td class="tg-x2wf">12354</td>
  </tr>
  <tr>
    <td class="tg-vx9a">대구</td>
    <td class="tg-x2wf">11,601</td>
    <td class="tg-x2wf">11,601</td>
    <td class="tg-x2wf">0</td>
    <td class="tg-x2wf">219,956</td>
    <td class="tg-x2wf">587</td>
    <td class="tg-x2wf">9221</td>
  </tr>
  <tr>
    <td class="tg-vx9a">인천</td>
    <td class="tg-x2wf">21,975</td>
    <td class="tg-x2wf">21,974</td>
    <td class="tg-x2wf">1</td>
    <td class="tg-x2wf">377,975</td>
    <td class="tg-x2wf">577</td>
    <td class="tg-x2wf">12820</td>
  </tr>
  <tr>
    <td class="tg-vx9a">광주</td>
    <td class="tg-x2wf">6,300</td>
    <td class="tg-x2wf">6,300</td>
    <td class="tg-x2wf">0</td>
    <td class="tg-x2wf">142,798</td>
    <td class="tg-x2wf">150</td>
    <td class="tg-x2wf">9905</td>
  </tr>
  <tr>
    <td class="tg-vx9a">대전</td>
    <td class="tg-x2wf">7,884</td>
    <td class="tg-x2wf">7,884</td>
    <td class="tg-x2wf">0</td>
    <td class="tg-x2wf">137,576</td>
    <td class="tg-x2wf">291</td>
    <td class="tg-x2wf">9473</td>
  </tr>
  <tr>
    <td class="tg-vx9a">울산</td>
    <td class="tg-x2wf">8,789</td>
    <td class="tg-x2wf">8,789</td>
    <td class="tg-x2wf">0</td>
    <td class="tg-x2wf">101,325</td>
    <td class="tg-x2wf">113</td>
    <td class="tg-x2wf">9034</td>
  </tr>
  <tr>
    <td class="tg-vx9a">세종</td>
    <td class="tg-x2wf">1,944</td>
    <td class="tg-x2wf">1,944</td>
    <td class="tg-x2wf">0</td>
    <td class="tg-x2wf">32,125</td>
    <td class="tg-x2wf">6</td>
    <td class="tg-x2wf">8638</td>
  </tr>
  <tr>
    <td class="tg-vx9a">경기</td>
    <td class="tg-x2wf">88,144</td>
    <td class="tg-x2wf">88,141</td>
    <td class="tg-x2wf">3</td>
    <td class="tg-x2wf">1,602,946</td>
    <td class="tg-x2wf">2,837</td>
    <td class="tg-x2wf">11816</td>
  </tr>
  <tr>
    <td class="tg-vx9a">강원</td>
    <td class="tg-x2wf">8,172</td>
    <td class="tg-x2wf">8,169</td>
    <td class="tg-x2wf">3</td>
    <td class="tg-x2wf">118,925</td>
    <td class="tg-x2wf">219</td>
    <td class="tg-x2wf">7730</td>
  </tr>
  <tr>
    <td class="tg-vx9a">충북</td>
    <td class="tg-x2wf">8,765</td>
    <td class="tg-x2wf">8,765</td>
    <td class="tg-x2wf">0</td>
    <td class="tg-x2wf">130,871</td>
    <td class="tg-x2wf">214</td>
    <td class="tg-x2wf">8193</td>
  </tr>
  <tr>
    <td class="tg-vx9a">충남</td>
    <td class="tg-x2wf">10,666</td>
    <td class="tg-x2wf">10,664</td>
    <td class="tg-x2wf">2</td>
    <td class="tg-x2wf">180,073</td>
    <td class="tg-x2wf">323</td>
    <td class="tg-x2wf">8497</td>
  </tr>
  <tr>
    <td class="tg-vx9a">전북</td>
    <td class="tg-x2wf">10,075</td>
    <td class="tg-x2wf">10,072</td>
    <td class="tg-x2wf">3</td>
    <td class="tg-x2wf">144,992</td>
    <td class="tg-x2wf">244</td>
    <td class="tg-x2wf">8114</td>
  </tr>
  <tr>
    <td class="tg-vx9a">전남</td>
    <td class="tg-x2wf">8,470</td>
    <td class="tg-x2wf">8,467</td>
    <td class="tg-x2wf">3</td>
    <td class="tg-x2wf">119,947</td>
    <td class="tg-x2wf">76</td>
    <td class="tg-x2wf">6</td>
  </tr>
  <tr>
    <td class="tg-vx9a">경북</td>
    <td class="tg-x2wf">11,964</td>
    <td class="tg-x2wf">11,960</td>
    <td class="tg-x2wf">4</td>
    <td class="tg-x2wf">180,278</td>
    <td class="tg-x2wf">418</td>
    <td class="tg-x2wf">6864</td>
  </tr>
  <tr>
    <td class="tg-vx9a">경남</td>
    <td class="tg-x2wf">19,412</td>
    <td class="tg-x2wf">19,410</td>
    <td class="tg-x2wf">2</td>
    <td class="tg-x2wf">288,305</td>
    <td class="tg-x2wf">233</td>
    <td class="tg-x2wf">8699</td>
  </tr>
  <tr>
    <td class="tg-vx9a">제주</td>
    <td class="tg-x2wf">4,923</td>
    <td class="tg-x2wf">4,923</td>
    <td class="tg-x2wf">0</td>
    <td class="tg-x2wf">62,910</td>
    <td class="tg-x2wf">30</td>
    <td class="tg-x2wf">9296</td>
  </tr>
  <tr>
    <td class="tg-vx9a">검역</td>
    <td class="tg-x2wf">28</td>
    <td class="tg-x2wf">0</td>
    <td class="tg-x2wf">28</td>
    <td class="tg-x2wf">10,087</td>
    <td class="tg-x2wf">16</td>
    <td class="tg-x2wf">-</td>
  </tr>
</tbody>
</table>
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
