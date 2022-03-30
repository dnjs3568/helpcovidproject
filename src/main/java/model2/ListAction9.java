package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;
import model1.BoardDAO;
import model1.BoardTO;

public class ListAction9 implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "ListAction9 호출" );
		
		AdminTO to2 = new AdminTO();
		to2.setTtccount( request.getParameter( "ttccount" ) );

		AdminDAO dao = new AdminDAO();
		to2 = dao.ttcdayttccount( to2 );
		
		request.setAttribute( "to2", to2 );
	}


}
