<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.BoardTO" %>
<%@ page import="model1.BoardDAO" %>

<%
	request.setCharacterEncoding( "utf-8" );
	
	int flag = (Integer)request.getAttribute("flag");
	// System.out.println(flag);

	out.println( "<script type='text/javascript'>" );
	if( flag == 1 ) {
		out.println( "alert('글 삭제에 성공했습니다.');" );
		out.println( "location.href='./ComBoardController?action=list' " );
	} else if( flag == 0 ) {
		out.println( "alert('글 삭제에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>