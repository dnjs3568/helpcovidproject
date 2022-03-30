package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model1.CommentDAO;
import model1.CommentTO;

public class CommentWriteOk_Action implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		HttpSession session = request.getSession();

		
		
		String user_id = (String)session.getAttribute("user_id");
		
		CommentTO to = new CommentTO();
		
		String seq = request.getParameter("seq");
		//String cmseq = request.getParameter("cmseq");
		String Cnickname = "닉네임입니다";
		String Ccontent = request.getParameter( "content" );	
		String Cdate = request.getParameter( "cdate" );	
		
		to.setSeq(seq);
		to.setcID((String)session.getAttribute("user_id"));
		//to.setCmseq(request.getParameter("cmseq"));
		to.setCnickname("cnickname");
		to.setCdate("cdate");
		to.setCcontent(request.getParameter("content1"));
		//to.setCmseq(request.getParameter("cmseq"));
		
		CommentDAO dao = new CommentDAO();
		int flag = dao.comment_write(to);
		request.setAttribute("flag", flag);
		request.setAttribute("seq", to.getSeq());

		System.out.println("CommentWriteOK_Action 호출");
		
	}

}
