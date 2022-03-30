package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;
import model1.BoardDAO;
import model1.BoardTO;

public class ListAction0 implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "ListAction0 호출" );
		
		AdminTO to3 = new AdminTO();
		to3.setTtbcount( request.getParameter( "ttbcount" ) );

		AdminDAO dao = new AdminDAO();
		to3 = dao.ttbdayttbcount( to3 );
		
		request.setAttribute( "to3", to3 );
	}


}
