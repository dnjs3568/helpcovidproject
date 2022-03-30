<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.naming.Context"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>

<%@ page import="javax.sql.DataSource"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>

<%@page import="model1.CommentDAO"%>
<%@page import="model1.CommentTO"%>

<%
	request.setCharacterEncoding("utf-8");
	
	int flag = (Integer) request.getAttribute("flag");
	String seq = (String) request.getAttribute("cmseq");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('글 수정에 성공했습니다.');");
		out.println("location.href='./ComBoardController?action=comment_modify_ok&seq=" + seq + "' ");
	} else if (flag == 1) {
		out.println("alert('글 수정에 실패했습니다.');");
		out.println("history.back();");
	}
	out.println("</script>");
%>
