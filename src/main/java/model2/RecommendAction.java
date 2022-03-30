package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class RecommendAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("RecommendAction 호출");
		
		BoardTO to = new BoardTO();
		
		String seq = request.getParameter("seq");
		
		to.setSeq(seq);
		
		BoardDAO dao = new BoardDAO();
		int flag = dao.Board_BoardRecommend_ok(to);
		
		request.setAttribute("flag", flag);
		request.setAttribute("seq", seq);

	}

}
