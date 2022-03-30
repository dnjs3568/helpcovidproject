<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String user_id = (String)request.getAttribute("user_id");
	int flag = (Integer)request.getAttribute("flag");
	
	
	// 자바스크립트
	out.println("<script type='text/javascript'>");
	if(flag == 0) {
		out.println("alert('회원님의 정보가 정상적으로 수정되었습니다.');");
		out.println("location.href='./loginController?action=userupdate';");
	} else if(flag == 1) {
		out.println("alert('회원 정보 수정에 실패하였습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
	
%>

