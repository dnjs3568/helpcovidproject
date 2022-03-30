package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;
import model1.BoardDAO;
import model1.BoardTO;

public class ListAction8 implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "ListAction8 호출" );
		
		AdminTO to1 = new AdminTO();
		to1.setTccount( request.getParameter( "tccount" ) );

		AdminDAO dao = new AdminDAO();
		to1 = dao.tcdaytccount( to1 );
		
		request.setAttribute( "to1", to1 );
	}


}
