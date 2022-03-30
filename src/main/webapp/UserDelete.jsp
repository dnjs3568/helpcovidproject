<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>COVID-19 NOTE 회원 탈퇴</title>
<meta charset="UTF-8">
</head>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/Loginutil.css">
<link rel="stylesheet" type="text/css" href="css/Loginmain.css">
<!--===============================================================================================-->
<style>
a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

a:active {
	text-decoration: underline;
}
</style>
</head>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>

<script type="text/javascript">
	
	window.onload = function() {
		document.getElementById('userdelete').onclick = function() {
			
			if(document.userdeletefrm.pw.value == '') {
				alert('비밀번호를 입력하세요.');
				document.loginfrm.pw.focus();
				return false;
			}
			
			document.loginfrm.submit();
		};
		
	});
	
</script>
<body>

	<div class="limiter">
		<div class="container-login100" style="background-color: rgb(235, 235, 235);">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form action="UserDelete_Ok.jsp" class="login100-form validate-form" method="post" name="userdeletefrm">
				<!-- 추가 -->
				<!-- <input type="hidden" name="action" value="login_ok" /> -->
					<span class="login100-form-title p-b-49"> 회원 탈퇴 </span>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">비밀번호 확인</span>
						<input id="pw" class="input100" type="password" name="pass" placeholder="비밀번호를 입력해 주세요">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<br/>
					<div>
						<span class="label-input100">* 확인 버튼을 누르면 다시 로그인이 불가능합니다 *</span>
					</div>

					<br>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button id="userdelete" class="login100-form-btn">확인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>
</html>