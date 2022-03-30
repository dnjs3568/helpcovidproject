package model2;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model1.BoardDAO;
import model1.BoardTO;

public class WriteOkAction1 implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("WriteOkAction 호출");
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");

		BoardTO to = new BoardTO();
		
		//String nickname = request.getParameter( "nickname" );
		String nickname = "테스트닉네임";
		String subject = request.getParameter( "subject" );
		String content = request.getParameter( "content" );	
		
		to.setID( user_id );
		to.setNickname( nickname );
		to.setSubject( subject );
		to.setContent( content );
		
		BoardDAO dao = new BoardDAO();
		int flag = dao.Board_BoardWrite_ok1(to);
		
		request.setAttribute( "flag", flag );
		
	}

}
