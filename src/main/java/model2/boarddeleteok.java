package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;


public class boarddeleteok implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "boardDeleteOkAction 호출" );
		
		AdminTO to = new AdminTO();
		to.setSeq( request.getParameter( "seq" ) );

		AdminDAO dao = new AdminDAO();
		int flag = dao.boarddeleteok( to );
		
		request.setAttribute( "flag", flag );
		
	
	
	}
}
