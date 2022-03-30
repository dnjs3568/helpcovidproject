<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.AdminTO" %>
<%@ page import="model1.AdminDAO" %>

<%
	request.setCharacterEncoding("utf-8");

	AdminTO to = new AdminTO();
	String admin_id = request.getParameter("username");
	to.setaID(admin_id);
	to.setApassword(request.getParameter("pass"));
	
	AdminDAO dao = new AdminDAO();
	int flag = dao.adminLoginOk(to);
	
	
	// 자바스크립트
	out.println( "<script type='text/javascript'>" );
	if( flag == 0 ) {
		out.println( "alert('관리자 로그인 완료!');" );
		session.setAttribute("admin_id", admin_id); // 세션아이디
		out.println( "location.href='index.do';" );
	} else if( flag == 1 ) {
		out.println( "alert('로그인에 실패했습니다.');" );
		out.println( "history.back();" );
	} else {
		out.println( "alert('로그인에 실패했습니다.');" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
	
%> 

