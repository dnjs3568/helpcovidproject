package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.CommentTO;
import model1.CommentDAO;

public class CommentAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "CommentAction 호출" );
		
		String seq = request.getParameter("seq");
		
		CommentTO to = new CommentTO();
		to.setSeq(seq);
		
		ArrayList<CommentTO> commentLists = new ArrayList<CommentTO>();
		
		CommentDAO dao = new CommentDAO();
		commentLists = dao.commentList(to);

		request.setAttribute( "commentLists", commentLists );
	}

}
