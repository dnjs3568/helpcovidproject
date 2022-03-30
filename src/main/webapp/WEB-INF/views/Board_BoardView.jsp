<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>

<%@page import="javax.sql.DataSource"%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<%@page import="model1.BoardTO"%>
<%@page import="model1.BoardDAO"%>
<%@page import="model1.CommentTO"%>
<%@page import="java.util.ArrayList"%>

<!-- 게시글 -->
<%
	request.setCharacterEncoding( "utf-8" );
	BoardTO to = (BoardTO)request.getAttribute("to");
%>

<!-- 댓글 -->
<%
	request.setCharacterEncoding( "utf-8" );
	
	ArrayList<CommentTO> commentLists = (ArrayList)request.getAttribute("commentLists");
	
	StringBuffer sbHtml = new StringBuffer();
	
	for(CommentTO cto : commentLists) {
		String cID = cto.getcID();
		String cdate = cto.getCdate();
		String ccontent = cto.getCcontent();
		
		sbHtml.append( "<li>" );
		sbHtml.append( "<span></span>" );
		sbHtml.append( "<div class='box-content'>" );
		sbHtml.append( "<div class='box-meta'>" );
		sbHtml.append( "<strong>" + cID + "</strong>" );
		sbHtml.append( "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" );
		sbHtml.append( "<span class='date'>"+ cdate + "</span>" );
		sbHtml.append( "</div>" );
		sbHtml.append( "<p class='text'>" + ccontent + "</p>" );
		sbHtml.append( "</div>" );
		sbHtml.append( "</li>" );
	}

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
								Object admin_id = session.getAttribute("admin_id");
								Object user_id = session.getAttribute("user_id");
								
								if( admin_id != null ) {
									// 관리자 로그인시 조건 - 관리자 로그인 중입니다!
							%>
							
							관리자 로그인 중
							<button type="button" onclick="location.href='./loginController?action=logout';"
								class="btn-hover-1 color-13" id="signup">로그아웃</button>
								&nbsp;&nbsp;
								
							<%	
								} else if( user_id == null && admin_id == null ) {
									// 비로그인시 조건.
							%>
							
							<button type="button" onclick="location.href='SignUp5.jsp'"
								class="btn-hover-1 color-13" id="signup">sign up</button>
								&nbsp;&nbsp;
							<button class="btn-hover-1 color-13"
								onclick="location.href='./loginController?action=login';">Login</button>
								
							<% 
								} else {
									// 정상 로그인
									// session.setAttribute("user_nickname", to.getNickname()); // 세션 닉네임 설정 -> 로그인한 사람이 아니라 게시글 작성자의 닉네임으로 설정되버림
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
	
<!--------------------------------------------네비게이션 바 끝------------------------------------------------------>

<!--------------------------------------------게시판 시작------------------------------------------------------------->

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/board_view.css">
</head>

<body>
<div class="container">
	<!-- 상단 디자인 -->
	<div class="con_title">
		<h3>게시판</h3>
	</div>
	<div class="con_txt">
		<div class="contents_sub">
			<!--게시글-->
			<div class="board_view">
				<table>
				<tr>
					<th width="10%">제목</th>
					<td width="60%"><%=to.getSubject() %></td>
					<th width="10%">등록일</th>
					<td width="20%"><%=to.getWdate() %></td>
				</tr>
				<tr>
					<th>글쓴이</th>
					<td><%=to.getNickname() %>(<%=to.getID() %>)</td>
					<th>조회</th>
					<td><%=to.getHit() %></td>
					<th>추천</th>
					<td><%=to.getRecommend() %></td>
				</tr>
				<tr>
					<td colspan="4" height="200" valign="top" style="padding: 20px; line-height: 160%"><%=to.getContent() %></td>
				</tr>
				</table>
			</div>
			<!-- 게시글 끝 -->
			
			<!-- 목록/수정/삭제/쓰기 버튼 영역 -->
			<div class="btn_area">
				<div class="align_left">
					<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./ComBoardController?action=list'" />
				</div>
				<div class="align_right">
		
					<!-- 세션에서 아이디를 받아서 아이디가 작성자와 동일하면 수정과 삭제버튼이 뜨도록 설정한다 -->
	
					<%
						// ********************
						user_id = (String)session.getAttribute("user_id");
						// ********************
						if (to.getID().equals(user_id) ) {
					%>
					
					<input type="button" value="수정" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./ComBoardController?action=modify&seq=<%=to.getSeq() %>'" />
					<input type="button" value="삭제" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./ComBoardController?action=delete&seq=<%=to.getSeq() %>'" />
					<input type="button" value="쓰기" class="btn_write btn_txt01" style="cursor: pointer;" onclick="location.href='./ComBoardController?action=write'" />
						
					<%
						} else {
					%>
						
					<input type="button" value="추천" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./ComBoardController?action=recommend_ok&seq=<%=to.getSeq() %>'" />
					<input type="button" value="신고" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='./ComBoardController?action=report_ok&seq=<%=to.getSeq() %>'" />
	
					<%
						}
					%>
						
				</div>
			</div>
			<!-- 목록/수정/삭제/쓰기 버튼 영역 끝 -->
			
			<br/><br/>
			
			<!-- 댓글 영역 -->
			<div class="container">
				<script type="text/javascript">
				window.onload = function() {
					document.getElementById('cbtn').onclick = function() {
						// 필수 요소 검사
						if (document.cfrm.content1.value.trim() == '') {
							alert('내용을 입력 하셔야 합니다.');
							return false;
						}
						document.cfrm.submit();
					};
				};
				</script>
				
				<%=sbHtml%>
				
				<br /> <br /> <br /> <br /> <br />
	
				<!-- comment form -->
				<div class="form-group">
					<form action="./ComBoardController?action=comment_write_ok" method="post" name="cfrm">
						<input type="hidden" name="seq" value="<%=to.getSeq() %>" />
						<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
							<tr>
								<td style="border-bottom:none;" valign="middle"><br><br>
								<%
									admin_id = session.getAttribute("admin_id");
									user_id = (String)session.getAttribute("user_id");
									
									if( admin_id != null ) {
										//관리자 로그인시 조건 - 관리자 로그인 중입니다!
								%>
								관리자 로그인 중
								<%
									} else if (user_id == null && admin_id == null ) {
										//비로그인시 조건.
								%>
								로그인이 필요합니다
								<% 
									} else {
										//정상 로그인	
								%>
								<%= user_id %>
								<% } %>
								</td>
								<td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name="content1"></td>
								<td><br><br><input type="submit" id="cbtn" class="btn-primary pull" value="댓글 작성"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<!-- 댓글 영역 끝 -->
		</div>
	</div>
</div>

<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

<!--------------------------------------------게시판 끝------------------------------------------------------------->

    
    <!-- Main jQuery -->
    <script src="plugins/jquery/jquery.js"></script>
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