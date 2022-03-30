package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model1.UserTO;
import model1.UserDAO;

public class UserDeleteOkAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserDeleteOkAction 호출");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		UserTO to = new UserTO();
		to.setID(user_id);
		to.setPassword(request.getParameter("pass"));
		
		UserDAO dao = new UserDAO();
		int flag = dao.userDeleteOk(to);
		
		request.setAttribute("flag", flag);
		request.setAttribute("user_id", user_id); // 세션에 사용
		
	}
	
}
