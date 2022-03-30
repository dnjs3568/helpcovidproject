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
									onclick="location.href='Login.jsp';">Login</button>

								<%
								} else {
								%>
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
	
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>


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
	queryParams += '&' + encodeURIComponent('endCreateDt') + '=' + encodeURIComponent(dateString); /**/
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
					increaseArr[i] = parseInt(increase[i].childNodes[0].nodeValue)/100;
					qurRateArr[i] = parseInt(qurRate[i].childNodes[0].nodeValue);
				}
				console.log(gubunArr);
				console.log(deathArr);
				console.log(decideArr);
				console.log(increaseArr);
				console.log(qurRateArr);
				
				chart( gubunArr, deathArr, decideArr, increaseArr, qurRateArr );
			}	
	
	// 바 차트
	function chart( gubunArr, deathArr, decideArr, increaseArr, qurRateArr ) {

			Highcharts.chart('container1', {
			    chart: {
			        type: 'bar'
			    },
			    title: {
			        text: '지역별 확진 수'
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
			        valueSuffix: ' 명'
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
			    }]
			});
			
			Highcharts.chart('container2', {
			    chart: {
			        type: 'bar'
			    },
			    title: {
			        text: '지역별 사망 수'
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
			        valueSuffix: ' 명'
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
			        name: '사망자 수',
			        data: deathArr
			    }]
			});
			
			Highcharts.chart('container3', {
			    chart: {
			        type: 'bar'
			    },
			    title: {
			        text: '지역별 전일 대비 증감 수'
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
			        valueSuffix: ' %'
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
			        name: '전일 대비 증감 수',
			        data: increaseArr
			    }]
			});
			
			Highcharts.chart('container4', {
			    chart: {
			        type: 'bar'
			    },
			    title: {
			        text: '지역별 10만명당 발생률'
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
			        valueSuffix: ' 명'
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
			        name: '10만명당 발생률',
			        data: qurRateArr
			    }]
			});
			
			Highcharts.chart('container5', {
			    chart: {
			        type: 'column'
			    },
			    title: {
			        text: '통합 차트'
			    },
			    subtitle: {
			        text: '자료 제공 : <a href="https://www.data.go.kr/index.do">공공데이터포털</a>'
			    },
			    xAxis: {
			        categories: gubunArr,
			        crosshair: true
			    },
			    yAxis: {
			        min: 0,
			        title: {
			            text: '명'
			        }
			    },
			    tooltip: {
			        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
			        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
			            '<td style="padding:0"><b>{point.y:.1f} 명</b></td></tr>',
			        footerFormat: '</table>',
			        shared: true,
			        useHTML: true
			    },
			    plotOptions: {
			        column: {
			            pointPadding: 0.2,
			            borderWidth: 0
			        }
			    },
			    series: [{
			        name: '확진자 수',
			        data: decideArr

			    }, {
			        name: '사망자 수',
			        data: deathArr

			    }, {
			        name: '전일 대비 증감 수',
			        data: increaseArr

			    }, {
			        name: '10만명당 발생률',
			        data: qurRateArr
			    }]
			    
			});

		}
	
</script>

<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="50">
	<br/><br/><br/>
	<div class="container">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">
			<div class="container-fluid">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="#section1">확진자 수</a></li>
					<li class="nav-item"><a class="nav-link" href="#section2">사망자 수</a></li>
					<li class="nav-item"><a class="nav-link" href="#section3">전일 대비 증감 수</a></li>
					<li class="nav-item"><a class="nav-link" href="#section4">10만명당 발생률</a></li>
					<li class="nav-item"><a class="nav-link" href="#section5">통합 차트</a></li>
				</ul>
			</div>
		</nav>
	
		<br />
		<div id="explain" style="padding: 10px 10px;">
			<h3>전국 지역별 감염 현황 페이지입니다.</h3>
			<p>원하는 항목의 내비게이션 바를 클릭하시면 해당 차트로 이동합니다.</p>
		</div>
	
		<div id="section1" class="container p-5 my-5 text-white" style="padding: 100px 20px;">
			<figure class="highcharts-figure">
				<div id="container1"></div>
			</figure>
		</div>
	
		<div id="section2" class="container p-5 my-5 text-white" style="padding: 100px 20px;">
			<figure class="highcharts-figure">
				<div id="container2"></div>
			</figure>
		</div>
	
		<div id="section3" class="container p-5 my-5 text-white" style="padding: 100px 20px;">
			<figure class="highcharts-figure">
				<div id="container3"></div>
			</figure>
		</div>
	
		<div id="section4" class="container p-5 my-5 text-white" style="padding: 100px 20px;">
			<figure class="highcharts-figure">
				<div id="container4"></div>
			</figure>
		</div>
		
		<div id="section5" class="container p-5 my-5 text-white" style="padding: 100px 20px;">
			<figure class="highcharts-figure">
				<div id="container5"></div>
			</figure>
		</div>
	</div>
	
	
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
