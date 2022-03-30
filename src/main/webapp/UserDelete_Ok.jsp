<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model1.UserTO" %>
<%@ page import="model1.UserDAO" %>

<%
	request.setCharacterEncoding("utf-8");

	String user_id = (String)session.getAttribute("user_id");
	
	UserTO to = new UserTO();
	to.setID(user_id);
	to.setPassword(request.getParameter("pass"));
	
	UserDAO dao = new UserDAO();
	int flag = dao.userDeleteOk(to);
	
	
	// 자바스크립트!
	out.println("<script type='text/javascript'>");
	if(flag == 0) {
		session.invalidate();
		out.println("alert('회원 탈퇴가 완료되었습니다.');");
		out.println("location.href='./loginController?action=main';");
	} else if(flag == 1) {
		out.println("alert('비밀번호를 다시 입력해주세요.');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>
