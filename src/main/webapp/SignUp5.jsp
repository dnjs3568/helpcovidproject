<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>COVID-19 NOTE 회원 가입</title>

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

		document.getElementById('wbtn').onclick = function() {
			// 필수 요소 검사!
			if (!form.user_ID.value) {
				alert('아이디를 입력해 주세요.');
				form.user_ID.focus();
				return false;
			}

			if (form.idDuplication.value != "idCheck") {
				alert('아이디를 확인해 주세요.');
				form.user_ID.focus();
				return false;
			}

			if (!form.user_NICK.value) {
				alert("닉네임을 입력해 주세요.");
				form.user_NICK.focus();
				return false;
			}

			if (form.user_NICKcheck.value != "NICKCheck") {
				alert('닉네임을 확인해 주세요.');
				form.user_NICK.focus();
				return false;
			}

			if (!form.user_PW1.value) {
				alert('비밀번호를 입력해 주세요.');
				form.user_PW1.focus();
				return false;
			}
			
			if (!form.user_PW2.value) {
				alert('비밀번호를 입력해 주세요.');
				form.user_PW2.focus();
				return false;
			}

			if (form.user_PW1.value != form.user_PW2.value) {
				alert('비밀번호가 일치하지 않습니다.');
				form.user_PW2.focus();
				return false;
			}

			if (!form.user_name.value) {
				alert("이름을 입력해 주세요.");
				form.user_name.focus();
				return false;
			}

			if (!form.year.value || !form.month.value || !form.day.value) {
				alert("생년 월일을 입력해 주세요.");
				if(!form.year.value) form.year.focus();
				if(!form.month.value) form.month.focus();
				if(!form.day.value) form.day.focus();
				return false;
			}

			if (!form.gender.value) {
				alert('성별을 입력해 주세요.');
				form.gender.focus();
				return false;
			}

			if (!form.user_email.value) {
				alert('이메일을 입력해 주세요.');
				form.user_email.focus();
				return false;
			}

			if (!form.user_address1.value) {
				alert('주소를 입력해 주세요.');
				form.user_address1.focus();
				return false;
			}

			document.wfrm.submit();
		};
	};

	// 취소 버튼 클릭시 홈으로 이동
	function getFirstForm() {
		location.href = "/MainPage.jsp";
	}

	//아이디 중복체크 화면 open
	function openIdChk() {
		//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
		// 아이디가 없으면 알림창과 진행x
		const form = document.wfrm;

		if (form.user_ID.value == "" || form.user_ID.value.length < 0) {
			alert("아이디를 입력해 주세요.")
			form.user_ID.focus();
		} else {
			url = "IDCheck.jsp?user_ID="
			window.open(url + form.user_ID.value, "아이디 확인",
					"width=500, height=300, resizable = no, scrollbars = no");
		}
	}

	// 닉네임 중복체크 화면 open
	function openNICKChk() {
		//새창을 열어서 페이지를 오픈 후 -> 닉네임을 가지고 중복체크
		// 닉네임이 없으면 알림창과 진행x
		const form = document.wfrm;

		if (form.user_NICK.value == "" || form.user_NICK.value.length < 0) {
			alert("닉네임을 입력해 주세요.")
			form.user_NICK.focus();
		} else {
			url = "NICKCheck.jsp?user_NICK="
			window.open(url + form.user_NICK.value, "닉네임 확인",
					"width=500, height=300, resizable = no, scrollbars = no");
		}
	}

	// 아이디 양식체크
	function check_IDFORM() {
		var ID = document.getElementById('user_ID').value;
 		var IDSC = ["!","@","#","$","%", "Admin", "admin", "ADMIN"];
		var IDcheck_SC = 0;

		if (ID.length<5 || ID.length>13) {
			window.alert('아이디는 5글자 이상, 12글자 이하만 사용 가능합니다.');
			document.getElementById('user_ID').value = "";
		}
		for (var i = 0; i < IDSC.length; i++) {
			if (ID.indexOf(IDSC[i]) != -1) {
				IDcheck_SC = 1;
			}
		}
		if (IDcheck_SC == 1) {
 			window.alert('아이디에는 특수 문자나 Admin을 넣을 수 없습니다.')
			document.getElementById('user_ID').value = "";
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
	
	// 팝업창
	function popup(){

	window.open('PopUp2.html','팝업창','width=540, height=670');

	}

	</script>
	
</script>
<body>
	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">COVID-19 NOTE Sign Up</h2>
				</div>
				<div class="card-body">

					<form action="SignUp_Ok_Model1.jsp" method="post" name="wfrm">
						<div class="form-row m-b-55">
							<div class="name">ID</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="text" name="user_ID"
												id="user_ID" placeholder="사용자 아이디" onchange="check_IDFORM()">
											<input type="button" class="btn2" value="중복 확인"
												onclick="openIdChk()"> <input type="hidden"
												name="idDuplication" value="idUncheck">
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
												placeholder="사용자 닉네임"> <input type="button"
												class="btn2" value="닉네임 확인" onclick="openNICKChk()">
											<input type="hidden" name="user_NICKcheck"
												value="NICKUncheck">
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
												id="pw" onchange="check_pw()">
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
												id="pw2" onchange="check_pw()">&nbsp;<span
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
												placeholder="성명">
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="form-row m-b-55">
							<div class="name">생년 월일</div>
							<div class="value">
								<div class="row row-space">
									<div class="rs-select2 js-select-simple select--no-search">
										<select name="year">
											<option value="">생년</option>
											<option value="2000">2000</option>
											<option value="1999">1999</option>
											<option value="1998">1998</option>
											<option value="1997">1997</option>
											<option value="1996">1996</option>
											<option value="1995">1995</option>
											<option value="1994">1994</option>
											<option value="1993">1993</option>
											<option value="1992">1992</option>
											<option value="1991">1991</option>
											<option value="1990">1990</option>
											<option value="1989">1989</option>
											<option value="1988">1988</option>
											<option value="1987">1987</option>
											<option value="1986">1986</option>
											<option value="1985">1985</option>
											<option value="1984">1984</option>
											<option value="1983">1983</option>
											<option value="1983">1982</option>
											<option value="1983">1981</option>
											<option value="1983">1980</option>
										</select> <select name="month">
											<option value="">월</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
										</select> <select name="day">
											<option value="">일</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
											<option value="13">13</option>
											<option value="14">14</option>
											<option value="15">15</option>
											<option value="16">16</option>
											<option value="17">17</option>
											<option value="18">18</option>
											<option value="19">19</option>
											<option value="20">20</option>
											<option value="21">21</option>
											<option value="22">22</option>
											<option value="23">23</option>
											<option value="24">24</option>
											<option value="25">25</option>
											<option value="26">26</option>
											<option value="27">27</option>
											<option value="28">28</option>
											<option value="29">29</option>
											<option value="30">30</option>
											<option value="31">31</option>
										</select>

										<div class="select-dropdown"></div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row p-t-20">
							<label class="label label--block">성별</label>
							<div class="p-t-15">
								<label class="radio-container m-r-55">여자 <input
									type="radio" name="gender" value="F" id="woman"> <span
									class="checkmark"></span>
								</label> <label class="radio-container">남자 <input type="radio"
									name="gender" value="M" id="man"> <span
									class="checkmark"></span>
								</label>
							</div>
						</div>

						<br /> <br />

						<div class="form-row m-b-55">
							<div class="name">이메일</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="email" name="user_email"
												placeholder="email@example.com">
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
										placeholder="주소">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">상세 주소</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="user_address2"
										placeholder="선택 기재 사항">
								</div>
							</div>
						</div>
							<div class="form-row p-t-20">
							<label class="label label--block"></label>
							<div class="p-t-15">
								<label class="radio-container m-r-55">개인 정보 이용 및 약관에 동의합니다 <input
									type="radio" name="yak" id="yak" value="yes">
									<span class="checkmark"></span>
								</label>
							</div>
						</div>
						
						<!-- 약관 팝업 -->
								<div>
						<a href="javascript:popup();">약관 보기</a>
						</div>
	
						<div>
							<center>
								<button class="btn btn--radius-2 btn--red" type="submit"
									id="wbtn">가입하기</button>
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