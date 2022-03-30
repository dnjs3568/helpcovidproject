package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model1.BoardTO;
import model1.BoardDAO;
import java.util.ArrayList;

public class MyWritingListAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MyWritingListAction 호출");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		BoardTO to = new BoardTO();
		to.setID(user_id);

		BoardDAO dao = new BoardDAO();
		ArrayList<BoardTO> myWritingBoardLists = dao.myWritingBoardList(to); // 카테고리 상관없이 글 불러오기
		
		request.setAttribute("myWritingBoardLists", myWritingBoardLists);
		
	}
	
}
