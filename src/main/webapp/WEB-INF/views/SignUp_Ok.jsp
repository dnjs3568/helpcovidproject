<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>

<%@ page import="javax.sql.DataSource" %>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%@page import="model1.AdminTO"%>
<%@page import="model1.AdminDAO"%>

<!-- 관리자 회원가입 -->
<%
	request.setCharacterEncoding( "utf-8" );

	AdminTO to = new AdminTO();
	
	to.setaID( request.getParameter("user_ID") );
	to.setAname( request.getParameter("user_NICK") );
	to.setApassword( request.getParameter("user_PW2") );
	to.setAname( request.getParameter("user_name") );
	
	AdminDAO dao = new AdminDAO();
	int flag = dao.SignUp_Ok(to);
	
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('성공.');" );
		out.println( "self.close(); ");

	} else if( flag == 1 ) {
		out.println( "alert('실패.');" );
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