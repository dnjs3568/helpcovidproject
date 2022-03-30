<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>

<%
	request.setCharacterEncoding( "utf-8" );
	
	int flag = (Integer)request.getAttribute( "flag" );
	String seq = (String)request.getAttribute( "seq" );

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('해당 게시글을 추천했습니다.');" );
		out.println( "location.href='./ComBoardController?action=view&seq=" + seq + "'" );
	} else if( flag == 1 ) {
		out.println( "alert('게시글 추천에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>