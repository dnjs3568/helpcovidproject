<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>COVID-19 NOTE 회원 가입</title>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById( 'wbtn' ).onclick = function() {
			alert( 'click' );
			// 필수 요소 검사 **** 아직 미완성
			/*
			if( document.wfrm.user_ID.value.trim() == '' ) {
				alert( '아이디 확인을 하셔야 합니다.' );
				(현재 그냥 비어있으면 통과 안되는 식으로 만들어둠)
				return false;
			}
			if( document.wfrm.user_NICK.value.trim() == '' ) {
				alert( '닉네임 확인을 하셔야 합니다.' );
				return false;
			}
			if( document.wfrm.subject.value.trim() == '' ) {
				alert( '비밀번호 재확인을 하셔야합니다..' );
				return false;
			}
			if( document.wfrm.password.value.trim() == '' ) {
				alert( '이름을 입력하셔야 합니다.' );
				return false;
			}
			if( document.wfrm.password.value.trim() == '' ) {
				alert( '생년월일을 입력하셔야 합니다.' );
				return false;
			}
			if( document.wfrm.password.value.trim() == '' ) {
				alert( '성별을 입력하셔야 합니다.' );
				return false;
			}
			if( document.wfrm.password.value.trim() == '' ) {
				alert( '이메일을 입력하셔야 합니다.' );
				return false;
			}
			if( document.wfrm.password.value.trim() == '' ) {
				alert( '주소를 입력하셔야 합니다.' );
				return false;
			}
			*/
			document.wfrm.submit();
		};
 	};
</script>
</head>
<body>
  
  <section>
    <h1>회원 가입 페이지</h1>
  </section>
  
  <section>
    <form name="login" action="SignUp_Ok.jsp" method="post" name="wfrm">
      아이디확인<br>
      <input type="text" name="user_ID" placeholder="아이디 입력" >
      <input type="button" name="user_IDcheck" value="아이디 확인">
      <br>
      닉네임<br>
      <input type="text" name="user_NICK" placeholder="닉네임 입력" >
      <input type="button" name="user_NICKcheck" value="닉네임 확인">
      <br> 
      비밀번호<br> 
      <input type="password" name="user_PW1" value=""><br>
      비밀번호 재확인<br> 
      <input type="password" name="user_PW2" value="">
      <input type="button" name="user_PWcheck" value="비밀번호 재확인">
      <br><br>
      이름<br>  <input type="text" name="user_name" value=""> <br>
      생년 월일<br> 
      <select name="year">
        <option value="">-- 선택 --</option>
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
      </select>
      <select name="month">
        <option value="">-- 선택 --</option>
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
      </select>
      <select name="day">
        <option value="">-- 선택 --</option>
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
      <br><br>
      성별<br>  
      <label for="man">남자</label>
      <input type="radio" name="gender" value="M" id="man">
      <label for="woman">여자</label>
      <input type="radio" name="gender" value="F" id="woman"> <br><br>
      이메일<br><input type="email" name="user_email" placeholder="email@example.com"><br><br>
      주소<br>  
      <input type="text" name="user_address1" placeholder="주소"><br>
      <input type="text" name="user_address2" placeholder="선택 기재 사항"><br>

      <br><br>
      <input type="submit" name="" id="wbtn" value="제출">
      
    </form>
  </section>
  
  
</body>
</html>