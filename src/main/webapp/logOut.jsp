<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	out.println( "<script type='text/javascript'>" );
	out.println( "alert('로그아웃 성공!');" );
	out.println( "</script>" );
	response.sendRedirect("MainPage.jsp");
%>