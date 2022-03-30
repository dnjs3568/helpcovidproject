package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;

public class Userview implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "Userview 호출" );
		
		AdminTO to = new AdminTO();
		to.setID( request.getParameter( "ID" ) );

		AdminDAO dao = new AdminDAO();
		to = dao.Userview( to );
		
		request.setAttribute( "to", to );
	}
}
