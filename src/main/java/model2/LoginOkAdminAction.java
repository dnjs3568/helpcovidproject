package model2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model1.AdminTO;
import model1.AdminDAO;

public class LoginOkAdminAction {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("LoginOkAdminAction 호출");
		
		AdminTO to = new AdminTO();
		String admin_id = request.getParameter("username");
		to.setaID(admin_id);
		to.setApassword(request.getParameter("pass"));
		
		AdminDAO dao = new AdminDAO();
		int flag = dao.adminLoginOk(to);
		
		request.setAttribute("flag", flag);
		request.setAttribute("admin_id", admin_id); // 세션에 사용
	}
	
}
