<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@page import="model1.AdminDAO"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Idcheck</title>
</head>
<body>
<h2>아이디 중복 체크</h2>
<script type="text/javascript">
function check_IDFORM(){
 		var ID = document.getElementById('user_ID').value;
 		var IDSC = ["!","@","#","$","%", "Admin", "admin", "ADMIN"];
 		var IDcheck_SC = 0;
 		
 		if(ID.length<5 || ID.length>13){
 			window.alert('아이디는 5글자 이상, 12글자 이하만 사용 가능합니다.');
 			document.getElementById('user_ID').value="";
 		}
 		for(var i=0;i<IDSC.length; i++){
 			if(ID.indexOf(IDSC[i]) != -1) {
 				IDcheck_SC = 1;
 			}
 		}
 		if(IDcheck_SC == 1 ) {
 			window.alert('아이디에는 특수 문자나 Admin을 넣을 수 없습니다.')
 			document.getElementById('user_ID').value="";
 		}
 	}
</script>

<%
	//1. 한글처리 % 받아온 피라미터 변수화
	request.setCharacterEncoding("utf-8");
	String aID = request.getParameter("user_ID");
	
	//2. MemberDAO 객체 생성 -> 전달받은 정보 모두 저장
	AdminDAO mdao = new AdminDAO();

	//3. joinIdCheck(ID)메서드
	int result = mdao.joinIdCheck(aID);
	if (result == 1) {
		out.println("사용 가능한 아이디입니다.");
		//5. 아이디 사용하기 버튼 추가
		%>
		<input type="button" value="아이디 사용하기" onclick="result();">
		<%
		
	} else if(result == 0){
		out.println("중복된 아이디입니다.");
	} else {
		out.print("에러 발생!!!(-1)");
	}
%>



<!-- 4. 팝업창 구현 -->
<fieldset>
	<form action="Idcheck.do" method="post" name="wfrm">
		ID : <input type="text" name="user_ID" id="user_ID" onchange="check_IDFORM()" value="<%=aID%>">
		<input type="submit" value="중복 확인">
	</form>
</fieldset>

<!-- 5. 선택된 아이디는 중복확인창에서 회원가입 페이지로 정보전달 -->
<script type="text/javascript">
	function result(){
		
		if( !document.getElementById("user_ID").value ) {
			alert( '아이디를 입력해 주세요.' );
			return false;
		} else {
		//아이디 체크 확인
		opener.document.wfrm.idDuplication.value = "idCheck";
		// 팝업창의 아이디정보를 회원가입창에 아이디정보로 전달
		opener.document.wfrm.user_ID.value = document.wfrm.user_ID.value;
		// 팝업창은 기존창과 종속관계를 가지고 있으므로 opener를 이용하면 된다.
		opener.document.wfrm.user_ID.readOnly=true;
		
		// 6-2 창닫기
		window.close();
 		}
	}

</script>

</body>
</html>