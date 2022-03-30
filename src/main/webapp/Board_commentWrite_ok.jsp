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

	//접속해 있는 계정의 아이디를 기입하도록 설정.
	String cID = (String)session.getAttribute("user_id");
	String cnickname = "테스트닉네임";
	String seq = request.getParameter( "seq" );
	String ccontent = request.getParameter( "content1" );
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int flag = 1;
	
	try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb2" );
		
		conn = dataSource.getConnection();
		
		String sql = "insert into comment values ( ?, ?, ?, ? , now() )";
		
		
		pstmt = conn.prepareStatement( sql );
		pstmt.setString( 1, seq );
		pstmt.setString( 2, cID );
		pstmt.setString( 3, cnickname );
		pstmt.setString( 4, ccontent );
		
		System.out.println( pstmt );
		if( cID == null ) {
			flag = 1;
		} else if( pstmt.executeUpdate() == 1 ) {
			flag = 0;
		}
		
	} catch( NamingException e ) {
		System.out.println( "[에러] : " + e.getMessage() );
	} catch( SQLException e ) {
		System.out.println( "[에러] : " + e.getMessage() );
	} finally {
		if( pstmt != null ) pstmt.close();
		if( conn != null ) conn.close();
	}

	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('댓글 쓰기에 성공했습니다.');" );
		out.println( "location.href='Board_BoardView.jsp?seq=" + seq + "';" );
	} else if( flag == 1 ) {
		out.println( "alert('로그인이 필요합니다.');" );
		out.println( "history.back();" );
	} else {
		out.println( "alert('댓글 쓰기에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>