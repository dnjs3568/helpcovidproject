<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.UserTO" %>
<%@ page import="model1.UserDAO" %>

<%
	int flag = (Integer)request.getAttribute("flag");
	String user_id = (String)request.getAttribute("user_id");
	int result = (Integer)request.getAttribute("result"); // 접속자 수
	
	// 자바스크립트
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('로그인에 성공했습니다. 환영합니다!');" );
		session.setAttribute("user_id", user_id); // 세션아이디
		out.println( "location.href='./loginController?action=main';" );
	} else if( flag == 1 ) {
		out.println( "alert('로그인에 실패했습니다.');" );
		out.println( "history.back();" );
	} else if( flag == 2 ) {
		out.println( "alert('존재하지 않는 아이디입니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
	
%> 

