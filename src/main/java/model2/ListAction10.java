package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;
import model1.BoardDAO;
import model1.BoardTO;

public class ListAction10 implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "ListAction10 호출" );
		
		AdminTO to4 = new AdminTO();
		to4.setTtucount( request.getParameter( "ttucount" ) );

		AdminDAO dao = new AdminDAO();
		to4 = dao.ttucount( to4 );
		
		request.setAttribute( "to4", to4 );
	}


}
