package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;

public class SignupOk implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "SignUp_Ok 호출" );
		
		AdminTO to = new AdminTO();
		to.setaID( request.getParameter( "aID" ) );
		to.setApassword( request.getParameter( "apassword" ) );
		to.setAname( request.getParameter( "aname" ) );
		to.setAdate( request.getParameter( "adate" ) );
		
		AdminDAO dao = new AdminDAO();
		int flag = dao.SignUp_Ok( to );
		
		request.setAttribute( "flag", flag );
	}

}
