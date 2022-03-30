<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	out.println( "<script type='text/javascript'>" );
	out.println( "alert('로그인 후 이용 가능합니다.');" );
	out.println( "location.href='./loginController?action=main';" );
	out.println( "</script>" ); 
%>
