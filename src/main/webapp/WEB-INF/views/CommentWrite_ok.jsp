<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="model1.CommentDAO"%>
<%@page import="model1.CommentTO"%>

<%
	request.setCharacterEncoding("utf-8");
	
	int flag = (Integer) request.getAttribute("flag");
	String seq = (String)request.getAttribute("seq");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('댓글 쓰기에 성공했습니다.');");
		out.println("location.href='./ComBoardController?action=view&seq="  + seq + "' ");
	} else if (flag == 1) {
		out.println("alert('댓글 쓰기에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>

