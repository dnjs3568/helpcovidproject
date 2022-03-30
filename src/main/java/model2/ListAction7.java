package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;
import model1.BoardDAO;
import model1.BoardTO;

public class ListAction7 implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "ListAction7 호출" );
		
		AdminTO to = new AdminTO();
		to.setTbcount( request.getParameter( "tbcount" ) );

		AdminDAO dao = new AdminDAO();
		to = dao.tbdaytbcount( to );
		
		request.setAttribute( "to", to );
	}


}
