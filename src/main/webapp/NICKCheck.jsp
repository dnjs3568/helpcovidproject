<%@page import="model1.WebDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>idCheckForm.jsp</title>
</head>
<body>
<h2>닉네임 중복체크</h2>
<%
	//1. 한글처리 % 받아온 피라미터 변수화
	request.setCharacterEncoding("utf-8");
	String NICK = request.getParameter("user_NICK");
	String user_id = request.getParameter("user_id");
	
	//2. MemberDAO 객체 생성 -> 전달받은 정보 모두 저장
	WebDAO mdao = new WebDAO();

	//3. joinIdCheck(ID)메서드
	int result = mdao.joinNICKCheck(NICK, user_id);
	if (result == 1) { // 중복된 닉네임이 없는 경우 -> 사용 가능
		out.println("사용 가능한 닉네임입니다.");
		//5. 닉네임 사용하기 버튼 추가
		%>
		<input type="button" value="닉네임 사용하기" onclick="result();">
		<%
		
	} else if(result == 0) { // 다른 사람이 사용중이여서 중복된 닉네임이 있는 경우 -> 사용 못함
		out.println("중복된 닉네임입니다.");
	} else if(result == 2) { // 중복된 아이디지만 내 아이디인 경우 -> 사용 가능
		out.println("기존 닉네임으로 사용 가능합니다.");
		%>
		<input type="button" value="닉네임 사용하기" onclick="result();">
		<%
	} else {
		out.print("에러 발생!!!(-1)");
	}
%>

<!-- 4. 팝업창 구현 -->
<fieldset>
	<form action="NICKCheck.jsp" method="post" name="wfrm">
		ID : <input type="text" name="user_NICK" value="<%=NICK%>">
		<input type="submit" value="중복 확인">
	</form>
</fieldset>

<!-- 5. 선택된 아이디는 중복확인창에서 회원가입 페이지로 정보전달 -->
<script type="text/javascript">
	function result(){
		//아이디 체크 확인
		opener.document.wfrm.user_NICKcheck.value = "NICKCheck";
		// 팝업창의 아이디정보를 회원가입창에 아이디정보로 전달
		opener.document.wfrm.user_NICK.value = document.wfrm.user_NICK.value;
		// 팝업창은 기존창과 종속관계를 가지고 있으므로 opener를 이용하면 된다.
		opener.document.wfrm.user_NICK.readOnly=true;
		
		// 6-2 창닫기
		window.close();
	}

</script>

</body>
</html>