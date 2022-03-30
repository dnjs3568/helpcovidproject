package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.UserTO;
import model1.UserDAO;

public class LoginOkAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("LoginOkAction 호출");
		
		UserTO to = new UserTO();
		String user_id = request.getParameter("username");
		to.setID(user_id);
		to.setPassword(request.getParameter("pass"));
		
		UserDAO dao = new UserDAO();
		int flag = dao.userLoginOk(to);
		
		// 접속자 수 추가
		String hID = request.getParameter("username");
		int result = dao.hit(hID);
		
		request.setAttribute("flag", flag);
		request.setAttribute("user_id", user_id); // 세션에 사용
		request.setAttribute("result", result); // 접속자 수에 사용
	}
	
}
