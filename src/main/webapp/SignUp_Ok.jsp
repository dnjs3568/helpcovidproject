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

String ID = request.getParameter( "user_ID" );
String nickname = request.getParameter( "user_NICK" );
String password = request.getParameter( "user_PW2" );
String name = request.getParameter( "user_name" );
String birth = request.getParameter( "year" ) + "/" + request.getParameter( "month" ) + "/" + request.getParameter( "day" );
String email = request.getParameter( "user_email" );
String address = request.getParameter( "user_address1" ) + request.getParameter( "user_address2" );
String gender = request.getParameter("gender");

Connection conn = null;
PreparedStatement pstmt = null;

int flag = 1;
try {
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
		DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb2" );
		
		conn = dataSource.getConnection();
		
		String sql = "insert into Project_Users values (?, ?, ?, ?, ?, ?, ?, ?, now())";
		pstmt = conn.prepareStatement( sql );
		pstmt.setString( 1, ID );
		pstmt.setString( 2, nickname );
		pstmt.setString( 3, password );
		pstmt.setString( 4, name );
		pstmt.setString( 5, birth );
		pstmt.setString( 6, email );
		pstmt.setString( 7, address );
		pstmt.setString( 8, gender );
		
		if( pstmt.executeUpdate() == 1 ) {
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
		out.println( "alert('회원이 되신 것을 환영합니다.');" );
		out.println( "location.href='index_4.jsp';" );
	} else if( flag == 1 ) {
		out.println( "alert('회원 가입에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COVID-19 NOTE 회원 가입</title>
</head>
<body>

</body>
</html>