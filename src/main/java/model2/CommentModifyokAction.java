package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.CommentDAO;
import model1.CommentTO;

public class CommentModifyokAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		System.out.println("Comment ModifyOkAction 호출");

		CommentTO to = new CommentTO();

		String seq = request.getParameter("cmseq");
		String content = request.getParameter("content");

		to.setCmseq(seq);
		to.setCcontent(content);

		CommentDAO dao = new CommentDAO();
		int flag = dao.Comment_modifyok(to);

		request.setAttribute("flag", flag);
		request.setAttribute("seq", to.getCmseq());
	}

}
