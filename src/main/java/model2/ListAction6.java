package model2;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminDAO;
import model1.AdminTO;

public class ListAction6 implements BoardAction {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse reponse) {
		// TODO Auto-generated method stub
		System.out.println( "ListAction6 호출" );
		
		AdminDAO dao = new AdminDAO();
		ArrayList<AdminTO> boardLists6 = dao.boardList6();

		request.setAttribute( "boardLists6", boardLists6 );
	}

}
