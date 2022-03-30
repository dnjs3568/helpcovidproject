package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model1.UserDAO;
import model1.UserTO;

public class UserUpdateAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserUpdateAction 호출");
		
		//String user_id = (String)session.getAttribute("user_id");
		HttpSession session = request.getSession();
		// System.out.println(session.getAttribute("user_id")); // 사용자 아이디 출력
		String user_id = (String)session.getAttribute("user_id");
		
		UserTO to = new UserTO();
		to.setID(user_id);
		
		UserDAO dao = new UserDAO();
		to = dao.userUpdate(to);
		
		request.setAttribute("to", to);
		
	}
	
}
