<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.UserTO" %>
<%@ page import="model1.UserDAO" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String user_id = (String)session.getAttribute("user_id");
	
	UserTO to = new UserTO();
	to.setID(user_id);
	to.setNickname(request.getParameter("user_NICK"));
	to.setPassword(request.getParameter("user_PW2"));
	to.setEmail(request.getParameter("user_email"));
	if(request.getParameter("user_address2").equals("")) {
		to.setAddress(request.getParameter("user_address1"));
	} else {
		to.setAddress(request.getParameter("user_address1") + " " + request.getParameter("user_address2"));
	}
	to.setGender(request.getParameter("gender"));
	
	
	UserDAO dao = new UserDAO();
	int flag = dao.userUpdateOk(to);
	
	
	// 자바스크립트
	out.println("<script type='text/javascript'>");
	if(flag == 0) {
		out.println("alert('회원님의 정보가 정상적으로 수정되었습니다.');");
		out.println("location.href='UserUpdate.jsp';");
	} else if(flag == 1) {
		out.println("alert('회원 정보 수정에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>

