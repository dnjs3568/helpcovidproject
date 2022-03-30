<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.AdminTO" %>
<%@ page import="model1.AdminDAO" %>

<%
	int flag = (Integer)request.getAttribute("flag");
	String admin_id = (String)request.getAttribute("admin_id");

	// 자바스크립트
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('관리자 로그인에 성공했습니다. 환영합니다!');" );
		session.setAttribute("admin_id", admin_id); // 세션아이디
		//out.println( "location.href='./loginController?action=admin_main';" );
		out.println( "location.href='./index.do';" );
	} else if( flag == 1 ) {
		out.println( "alert('로그인에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
	
%> 

