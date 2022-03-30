package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model1.UserTO;
import model1.UserDAO;

public class UserUpdateOkAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("UserUpdateOkAction 호출");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("user_id");
		
		UserTO to = new UserTO();
		to.setID(user_id);
		to.setNickname(request.getParameter("user_NICK"));
		to.setPassword(request.getParameter("user_PW2"));
		to.setEmail(request.getParameter("user_email"));
		if(request.getParameter("user_address2").equals("")) {
			to.setAddress(request.getParameter("user_address1"));
		} else {
			to.setAddress(request.getParameter("user_address1") + "/" + request.getParameter("user_address2"));
		}
		to.setGender(request.getParameter("gender"));
		
		
		UserDAO dao = new UserDAO();
		int flag = dao.userUpdateOk(to);
		
		request.setAttribute("flag", flag);
		request.setAttribute("user_id", user_id); // 세션에 사용
		
	}
	
}
