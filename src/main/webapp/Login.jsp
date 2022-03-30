<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>COVID-19 NOTE 로그인</title>
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
	
	$.noConflict();
	var _$ = jQuery;
	_$(document).ready(function() {
	//window.onload = function() {
		document.getElementById('login').onclick = function() {
			// alert('click');
			// alert(document.getElementById('id').value);
			
			if(document.loginfrm.id.value == '') {
				alert('아이디를 입력하세요.');
				document.loginfrm.id.focus();
				return false;
			}
			
			if(document.loginfrm.pw.value == '') {
				alert('비밀번호를 입력하세요.');
				document.loginfrm.pw.focus();
				return false;
			}
			
			// 관리자 로그인
			// if(document.loginfrm.id.value == 'admin1' && document.loginfrm.pw.value == '123456!') {
			if(document.loginfrm.id.value.indexOf('admin') == 0) { // admin의 시작 위치 반환
				
				if(document.loginfrm.pw.value == '') {
					alert('비밀번호를 입력하세요.');
					document.loginfrm.pw.focus();
					return false;
				}
				
				document.loginfrm.action = "Login_Ok_Admin.jsp";
				document.loginfrm.submit();
				
			}
			
			document.loginfrm.submit();
		};
		
		//$ = jquery;
		//Kakao.init('9a8538d567f178d7fe23f4da7ae1cf7a'); RESTAPI
		Kakao.init('6ce00fdf688ee6245ea68e01440ecefa');
		console.log(Kakao.isInitialized());
	});
	
	//$ = jquery;
	/*
	$(document).ready(function() {
		//Kakao.init('9a8538d567f178d7fe23f4da7ae1cf7a'); RESTAPI
		Kakao.init('6ce00fdf688ee6245ea68e01440ecefa');
		console.log(Kakao.isInitialized());
	});
	*/
	
	function kakaoLogin() {
		Kakao.Auth.loginForm({
		scope:"profile_nickname,account_email",
			success : function(authObj) {
				//alert('로그인 성공');
				console.log(authObj);
				Kakao.API.request({
					url : "/v2/user/me",
					success : function(res) {
						console.log(res);
						let email = res.kakao_account.email;
						window.location.href= "http://localhost:8080/covidfinally/MainPage.jsp";
					}
				});
			}
		});
	}
	
	function displayToken() {
		const token = getCookie('authorize-access-token')
		if(token) {
			Kakao.Auth.setAccessToken(token)
			Kakao.Auth.getStatusInfo(({ status }) => {
				if(status === 'connected') {
					document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
				} else {
					Kakao.Auth.setAccessToken(null)
				}
			})
		}
	}
	
	function getCookie(name) {
		const value = "; " + document.cookie;
		const parts = value.split("; " + name + "=");
		if (parts.length === 2) return parts.pop().split(";").shift();
	}
	
	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url: '/v1/user/unlink',
				success: function (response) {
					console.log(response)
					alert('로그아웃 완료');
					window.location.href= "http://localhost:8080/covidfinally/MainPage.jsp";
				},
				fail: function (error) {
					console.log(error)
				},
			})
			Kakao.Auth.setAccessToken(undefined)
		}
	}
	
</script>
<body>

	<div class="limiter">
		<div class="container-login100" style="background-color: rgb(235, 235, 235);">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form action="Login_Ok.jsp" class="login100-form validate-form" method="post" name="loginfrm">
					<span class="login100-form-title p-b-49"> Login </span>

					<div class="wrap-input100 validate-input m-b-23" data-validate="Username is reauired">
						<span class="label-input100">Username</span>
						<input id="id" class="input100" type="text" name="username" placeholder="아이디를 입력해 주세요">
						<span class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<span class="label-input100">Password</span>
						<input id="pw" class="input100" type="password" name="pass" placeholder="비밀번호를 입력해 주세요">
						<span class="focus-input100" data-symbol="&#xf190;"></span>
					</div>

					<!-- 비밀번호 찾기 -->

					<!--<div class="text-right p-t-8 p-b-31">
						<a href="#">
							Forgot password?
						</a>
					</div> -->
					<br>
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button id="login" class="login100-form-btn" onclick="login()">
								Login
							</button>
						</div>
					</div>

					<div class="txt1 text-center p-t-54 p-b-20">
						<span> 소셜 로그인 </span>
					</div>

					<div class="flex-c-m">
						<a id="custom-login-btn" href="javascript:kakaoLogin()"> <img
							src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
							width="222" alt="카카오 로그인 버튼" />
						</a>
						<p id="token-result"></p>
						<ul>
							<li onclick="kakaoLogout();" style="list-style: none;"><a
								href="javascript:void(0)">
									<button>로그아웃</button>
							</a></li>
						</ul>


						<!--<a href="#" class="login100-social-item bg1">
							<i class="fa fa-facebook"></i>
						</a>

						<a href="#" class="login100-social-item bg2">
							<i class="fa fa-twitter"></i>
						</a>

						<a href="#" class="login100-social-item bg3">
							<i class="fa fa-google"></i>
						</a>-->
					</div>

					<!-- 회원 가입 -->
					<!-- <div class="flex-col-c p-t-155">
						<span class="txt1 p-b-17">
							아직 회원이 아니신가요?
						</span>

						<a href="#" class="txt2">
							회원 가입
						</a>
					</div> -->
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