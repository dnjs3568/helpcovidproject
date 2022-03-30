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

	//접속해 있는 계정의 아이디를 기입하도록 설정.
	to.setID((String)session.getAttribute("user_id"));
	to.setNickname("테스트닉네임");
	to.setSubject(request.getParameter( "subject" ));
	to.setContent(request.getParameter( "content" ));
	
	BoardDAO dao = new BoardDAO();
	int flag = dao.Board_BoardWrite_ok1(to);

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('글쓰기에 성공했습니다.');" );
		out.println( "location.href='blog-sidebar.jsp';" );
	} else if( flag == 1 ) {
		out.println( "alert('글쓰기에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>