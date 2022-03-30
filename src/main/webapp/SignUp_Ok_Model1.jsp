<%@page import="model1.WebDAO"%>
<%@page import="model1.WebTO"%>
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

	WebTO to = new WebTO();
	
	to.setID( request.getParameter("user_ID") );
	to.setNickname( request.getParameter("user_NICK") );
	to.setPassword( request.getParameter("user_PW2") );
	to.setName( request.getParameter("user_name") );
	to.setBirth( request.getParameter("year") + "/" + request.getParameter( "month" ) + "/" + request.getParameter( "day" ) );
	to.setEmail( request.getParameter("user_email") );
	if(request.getParameter( "user_address2".trim() ).equals("") ) {
		to.setAddress( request.getParameter("user_address1") + "/ " );
	} else {
		to.setAddress( request.getParameter("user_address1") + "/" + request.getParameter("user_address2") );
	}
	//to.setAddress( request.getParameter("user_address1") + "/" + request.getParameter("user_address2") );
	to.setGender( request.getParameter("gender") );
	
	WebDAO dao = new WebDAO();
	int flag = dao.SignUp_Ok(to);
		
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('회원이 되신 것을 환영합니다.');" );
		out.println( "location.href='./loginController?action=main';" );
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