package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;
import model1.BoardDAO;
import model1.BoardTO;

public class ListAction11 implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "ListAction11 호출" );
		
		AdminTO to5 = new AdminTO();
		to5.setTucount( request.getParameter( "tucount" ) );

		AdminDAO dao = new AdminDAO();
		to5 = dao.tucount( to5 );
		
		request.setAttribute( "to5", to5 );
	}


}
