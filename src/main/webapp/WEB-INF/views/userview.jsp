<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model1.AdminTO" %>

<%
	AdminTO to = (AdminTO)request.getAttribute( "to" );	
	
	String id = to.getID();
	String nickname = to.getNickname();
	String name = to.getName();
	String birth = to.getBirth();
	String email = to.getEmail();
	String address = to.getAddress();
	String gender = to.getGender();
	
	
	if ( gender.equals( "M" ) ) {
		gender = "남자";
	} else {
		gender = "여자";
	}
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
<title>COVID-19 NOTE</title>

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
	
	

	

	
</script>
<body>
	<div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
		<div class="wrapper wrapper--w790">
			<div class="card card-5">
				<div class="card-heading">
					<h2 class="title">COVID-19 NOTE</h2>
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
												id="user_ID"  onchange="check_IDFORM()" value="<%=id %>" readonly/>
											
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
											<input class="input--style-5" type="text" name="user_NICK" value="<%=nickname %>" readonly/> 
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
											<input class="input--style-5" type="text" name="user_name" value="<%=name %>" readonly/>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row m-b-55">
							<div class="name">생년 월일</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="text" name="birthday" value="<%=birth %>" readonly/>										
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="form-row m-b-55">
							<div class="name">성별</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="text" name="user_name" value="<%=gender %>"
												placeholder="성별" readonly/>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="form-row m-b-55">
							<div class="name">이메일</div>
							<div class="value">
								<div class="row row-space">
									<div class="col-2">
										<div class="input-group-desc">
											<input class="input--style-5" type="email" name="user_email" value="<%=email %>" readonly/>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="name">주소</div>
							<div class="value">
								<div class="input-group">
									<input class="input--style-5" type="text" name="user_address1" value="<%=address %>" readonly/>
								</div>
							</div>
						</div>		

						<div>
							<center>
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