<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.UserTO" %>
<%@ page import="model1.UserDAO" %>

<%
	request.setCharacterEncoding("utf-8");

	UserTO to = new UserTO();
	String user_id = request.getParameter("username");
	to.setID(user_id);
	to.setPassword(request.getParameter("pass"));
	
	UserDAO dao = new UserDAO();
	int flag = dao.userLoginOk(to);
	
	String hID = request.getParameter("username");
	int result = dao.hit(hID); // 방문자수 -> 이게 model2로 변경이 안되서!!
	
	// 자바스크립트
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('환영합니다. 오늘도 좋은 하루 보내세요.');" );
		session.setAttribute("user_id", user_id); // 세션아이디
		out.println( "location.href='MainPage.jsp';" );
	} else if( flag == 1 ) {
		out.println( "alert('로그인에 실패했습니다. 비밀번호를 확인해 주세요.');" );
		out.println( "history.back();" );
	} else if( flag == 2 ) {
		out.println( "alert('존재하지 않는 아이디입니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
	
%> 

