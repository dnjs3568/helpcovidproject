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
<title>COVID-19 NOTE 관리자 추가</title>

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
<link href="css/main.css" rel="stylesheet" >
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

			if (!form.user_name.value) {
				alert("이름을 입력해 주세요.");
				form.user_name.focus();
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

			if (!form.user_email.value) {
				alert('이메일을 입력해 주세요.');
				form.user_email.focus();
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
			url = "Idcheck.do?user_ID="
			window.open(url + form.user_ID.value, "아이디 확인",
					"width=500, height=300, resizable = no, scrollbars = no");
		}
	}

	

	// 아이디 양식체크
	function check_IDFORM() {
		var ID = document.getElementById('user_ID').value;
		var IDSC = [ "!", "@", "#", "$", "%" ];
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
			window.alert('아이디에는 특수 문자를 넣을 수 없습니다.')
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
</script>
<body>
	<div >
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">COVID-19 NOTE Sign Up ADMIN</h2>
				</div>
				<div class="card-body">

					<form action="SignUp_Ok.do" method="post" name="wfrm">
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

						

						<div>
							<center>
								<button class="btn btn--radius-2 btn--red" type="submit"
									id="wbtn">추가하기</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="btn btn--radius-2 btn--red" type="submit"  onClick='self.close()' >닫기</button>
									
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