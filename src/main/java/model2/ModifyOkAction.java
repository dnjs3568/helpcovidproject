package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class ModifyOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ModifyOkAction 호출");
		
		BoardTO to = new BoardTO();
		
		String seq = request.getParameter("seq");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		to.setSeq(seq);
		to.setSubject(subject);
		to.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		int flag = dao.Board_BoardModify_ok(to);
		
		request.setAttribute("flag" , flag);
		request.setAttribute("seq", to.getSeq());

	}

}
