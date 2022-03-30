<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%
	request.setCharacterEncoding( "utf-8" );
	BoardTO to = new BoardTO();
	
	String seq = request.getParameter( "seq" );
	to.setSeq(seq);
	
	BoardDAO dao = new BoardDAO();
	int flag = dao.Board_BoardRecommend_ok(to);

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('해당 게시글을 추천했습니다.');" );
		out.println( "location.href='Board_BoardView.jsp?seq=" + seq + "';" );
	} else if( flag == 1 ) {
		out.println( "alert('게시글 추천에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>