package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;


public class DeleteOkAction implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "DeleteOkAction 호출" );
		
		AdminTO to = new AdminTO();
		to.setaID( request.getParameter( "aID" ) );

		AdminDAO dao = new AdminDAO();
		int flag = dao.DeleteOkAction( to );
		
		request.setAttribute( "flag", flag );
		
	
	}
}
