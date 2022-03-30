<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model1.UserTO" %>
<%@ page import="model1.UserDAO" %>

<%
	request.setCharacterEncoding("utf-8");
	
	// session 아이디
	String user_id = (String)session.getAttribute("user_id");
	
	UserTO to = new UserTO();
	to.setID(user_id);
	
	UserDAO dao = new UserDAO();
	to = dao.userUpdate(to);
	
	String ID = to.getID();
	String nickname = to.getNickname();
	String name = to.getName();
	String birth = to.getBirth();
	String gender = to.getGender();
	String email = to.getEmail();
	String address = to.getAddress();
	
%>


<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Colorlib Templates">
<meta name="author" content="Colorlib">
<meta name="keywords" content="Colorlib Templates">

<!-- Title Page-->
<title>COVID-19 NOTE My Page</title>

<!-- Icons font CSS-->
<link href="vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">
<link href="vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<!-- Font special for pages-->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i"
	rel="stylesheet">

<!-- Vendor CSS-->
<link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
<link href="vendor/datepicker/daterangepicker.css" rel="stylesheet"
	media="all">

<!-- Main CSS-->
<link href="css/main.css" rel="stylesheet" media="all">
</head>

<!-- 아이디/비밀번호/닉네임 검증 -->
<script type="text/javascript">
	
	window.onload = function() {
		
		const form = document.wfrm;
		
		// 정보 수정 버튼을 눌렀을 경우
		document.getElementById('ubtn').onclick = function() {
			// 필수 요소 검사			
			if(!form.user_NICK.value) {
				alert('닉네임을 입력해 주세요.');
				form.user_NICK.focus();
				return false;
			}
			
			if(form.user_NICKcheck.value != "NICKCheck") { // 중복확인 버튼을 안눌렀을 때
				alert('닉네임을 확인해 주세요.');
				form.user_NICK.focus();
				return false;
			}
			
			if(!form.user_PW1.value) {
				alert('비밀번호를 입력해 주세요.');
				form.user_PW1.focus();
				return false;
			}
			
			if(!form.user_PW2.value) {
				alert('비밀번호를 입력해 주세요.');
				form.user_PW2.focus();
				return false;
			}
			
			if(form.user_PW1.value != form.user_PW2.value) {
				alert('비밀번호가 일치하지 않습니다.');
				form.user_PW2.focus();
				form.user_PW2.select();
				return false;
			}
			
			if(!form.gender.value) {
				alert('성별을 입력해 주세요.');
				form.gender.focus();
				return false;
			}
			
			if(!form.user_email.value) {
				alert('이메일을 입력해 주세요.');
				form.user_email.focus();
				return false;
			}
			
			if(!form.user_address1.value) {
				alert('주소를 입력해 주세요.');
				form.user_address1.focus();
				return false;
			}
			document.wfrm.submit();
		};

		
		// 회원 탈퇴 버튼을 눌렀을 경우
		document.getElementById('dbtn').onclick = function() {
			alert('탈퇴하시겠습니까?');
			
			document.wfrm.action = "UserDelete.jsp";
			document.wfrm.submit();
		};
		
	};
	
	// 취소 버튼 클릭시 홈으로 이동
	function getFirstForm() {
		location.href = "./loginController";
	}
	
	
	// 닉네임 중복체크 화면 open
	function openNICKChk() {
		//alert('열림');
		//새창을 열어서 페이지를 오픈 후 -> 닉네임을 가지고 중복체크
		// 닉네임이 없으면 알림창과 진행x
		const form = document.wfrm;

		if (form.user_NICK.value == "" || form.user_NICK.value.length < 0) {
			alert("닉네임을 입력해 주세요.")
			form.user_NICK.focus();
		} else {
			url1 = "NICKCheck.jsp?user_NICK="
			url2 = "&user_id="
			// alert(url1 + form.user_NICK.value + url2 + form.user_id.value);
			window.open(url1 + form.user_NICK.value + url2 + form.user_id.value, "닉네임 확인",
					"width=500, height=300, resizable = no, scrollbars = no");
		}
	}
	
	// 비밀번호 양식체크
	function check_pw() {
		var pw = document.getElementById('pw').value;
		var SC = [ "!", "@", "#", "$", "%" ];
		var check_SC = 0;

		if (pw.length<6||pw.length>16) {
			window.alert('비밀번호는 6글자 이상, 16글자 이하만 사용 가능합니다.');
			document.getElementById('pw').value = "";
		}
		for (var i = 0; i < SC.length; i++) {
			if (pw.indexOf(SC[i]) != -1) {
				check_SC = 1;
			}
		}
		if (check_SC == 0) {
			window.alert('비밀번호에는 !,@,#,$,%의 특수 문자가 들어가야 합니다.')
			document.getElementById('pw').value = "";
		}
		if (document.getElementById('pw').value != ""
				&& document.getElementById("pw2").value != "") {
			if (document.getElementById('pw').value == document
					.getElementById("pw2").value) {
				document.getElementById('check').innerHTML = "<Strong>비밀번호가 일치합니다.</Strong>"
				document.getElementById("check").style.color = "blue";
			} else {
				document.getElementById("check").innerHTML = "<Strong>비밀번호가 일치하지 않습니다.</Strong>";
				document.getElementById("check").style.color = "red";
			}
		}
	}
	
	
</script>

<body>
	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">COVID-19 NOTE My Page</h2>
				</div>
				<div class="card-body">

					<form action="UserUpdate_Ok.jsp" method="post" name="wfrm">
					<input type="hidden" name="user_id" value="<%=user_id %>" />
						<div class="form-row m-b-55">
							<div class="name">ID</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="text" name="ID"
												id="ID" value="<%=ID%>" readonly>
											<!--  <input type="button" class="btn2" value="중복 확인"
												onclick="openIdChk()"> <input type="hidden"
												name="idDuplication" value="idUncheck">-->
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row m-b-55">
							<div class="name">닉네임</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="text" name="user_NICK" 
												id="nickname" value="<%=nickname %>" placeholder="변경할 닉네임">
											<input type="button" class="btn2" value="중복 확인" onclick="openNICKChk()">
											<input type="hidden" name="user_NICKcheck" value="NICKUncheck">
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row m-b-55">
							<div class="name">비밀번호</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="password" name="user_PW1"
												id="pw" placeholder="변경할 비밀번호" onchange="check_pw()">
										</div>
				 					</div>
								</div>
							</div>
						</div>

						<div class="form-row m-b-55">
							<div class="name">비밀번호 확인</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="password" name="user_PW2"
												id="pw2" placeholder="비밀번호 재확인" onchange="check_pw()">&nbsp;<span
												id="check"></span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row m-b-55">
							<div class="name">이름</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="text" name="user_name"
												value="<%=name %>" readonly>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row m-b-55">
							<div class="name">생년월일</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="text" name="user_name"
												value="<%=birth %>" readonly>
										</div>
									</div>
								</div>
							</div>
						</div>

						<%
							if(gender.equals("F")) {
						%>
						<div class="form-row p-t-20">
							<label class="label label--block">성별</label>
							<div class="p-t-15">
								<label class="radio-container m-r-55">여자
									<input type="radio" name="gender" value="F" id="woman" checked>
									<span class="checkmark"></span>
								</label>
								<label class="radio-container">남자
									<input type="radio" name="gender" value="M" id="man">
									<span class="checkmark"></span>
								</label>
							</div>
						</div>
						<%
							} else {
						%>
						<div class="form-row p-t-20">
							<label class="label label--block">성별</label>
							<div class="p-t-15">
								<label class="radio-container m-r-55">여자
									<input type="radio" name="gender" value="F" id="woman">
									<span class="checkmark"></span>
								</label>
								<label class="radio-container">남자
									<input type="radio" name="gender" value="M" id="man" checked>
									<span class="checkmark"></span>
								</label>
							</div>
						</div>
						<%
							}
						%>

						<br /> <br />

						<div class="form-row m-b-55">
							<div class="name">이메일</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="email" name="user_email"
											value="<%=email %>" placeholder="변경할 이메일">	
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">주소</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="user_address1" 
									value="<%=address %>" placeholder="변경할 주소">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">상세 주소</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="user_address2" 
									value="" placeholder="상세 주소 선택 기재 사항">
								</div>
							</div>
						</div>

						<div>
							<center>
								<button class="btn btn--radius-2 btn--red" type="submit" id="ubtn">정보 수정</button>
								<button class="btn btn--radius-2 btn--red" type="submit" id="dbtn">회원 탈퇴</button>
							</center>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery JS-->
	<script src="vendor/jquery/jquery.min.js"></script>
	<!-- Vendor JS-->
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/datepicker/moment.min.js"></script>
	<script src="vendor/datepicker/daterangepicker.js"></script>

	<!-- Main JS-->
	<script src="js/global.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->