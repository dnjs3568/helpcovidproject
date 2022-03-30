package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.BoardDAO;
import model1.BoardTO;

public class BoardListAction1 implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("BoardListAction1 호출");
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardTO> lists = dao.boardList1();
		
		request.setAttribute("lists", lists);
	}

}
