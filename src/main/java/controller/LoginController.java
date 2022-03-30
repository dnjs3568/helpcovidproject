package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.AdminMainAction;
import model2.LoginAction;
import model2.LoginOkAction;
import model2.LoginOkAdminAction;
import model2.LogoutAction;
import model2.MainAction;
import model2.MyWritingListAction;
import model2.NationwideAction;
import model2.UserDeleteAction;
import model2.UserDeleteOkAction;
import model2.UserUpdateAction;
import model2.UserUpdateFailAction;
import model2.UserUpdateOkAction;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/loginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding("utf-8");
			
			String action = request.getParameter("action");
			System.out.println(action);
			
			String url = "";
			
			if(action == null || action.equals("") || action.equals("main")) {
				
				MainAction mainAction = new MainAction();
				mainAction.execute(request, response);
				
				url = "/WEB-INF/views/MainPage.jsp";
				
			} else if (action.equals("login")) {
				
				LoginAction loginAction = new LoginAction();
				loginAction.execute(request, response);
				
				url = "/WEB-INF/views/Login.jsp";
				
			} else if (action.equals("login_ok")) {
				
				LoginOkAction loginOkAction = new LoginOkAction();
				loginOkAction.execute(request, response);
				
				url = "/WEB-INF/views/Login_Ok.jsp";
			
			} else if (action.equals("login_ok_admin")) {
				
				LoginOkAdminAction loginOkAdminAction = new LoginOkAdminAction();
				loginOkAdminAction.execute(request, response);
				
				url = "/WEB-INF/views/Login_Ok_Admin.jsp";
				
			} else if (action.equals("admin_main")) {
				
				AdminMainAction adminMainAction = new AdminMainAction();
				adminMainAction.execute(request, response);
				
				url = "/WEB-INF/views/admin_main.jsp";
				
			} else if (action.equals("logout")) {
				
				LogoutAction logoutAction = new LogoutAction();
				logoutAction.execute(request, response);
				
				url = "/WEB-INF/views/logOut.jsp";
				
			} else if (action.equals("nationwide")) { // 전국 선별소 위치
				
				NationwideAction nationwideAction = new NationwideAction();
				nationwideAction.execute(request, response);
				
				url = "/WEB-INF/views/Nationwide.jsp";
				
			} else if (action.equals("userupdate")) {	// 마이페이지(회원정보수정)
				
				UserUpdateAction userUpdateAction = new UserUpdateAction();
				userUpdateAction.execute(request, response);
				
				url = "/WEB-INF/views/UserUpdate.jsp";
				
			} else if (action.equals("userupdate_ok")) {
				
				UserUpdateOkAction userUpdateOkAction = new UserUpdateOkAction();
				userUpdateOkAction.execute(request, response);
				
				url = "/WEB-INF/views/UserUpdate_Ok.jsp";
				
			} else if (action.equals("userupdate_fail")) {
				
				UserUpdateFailAction userUpdateFailAction = new UserUpdateFailAction();
				userUpdateFailAction.execute(request, response);
				
				url = "/WEB-INF/views/UserUpdate_Fail.jsp";
				
			} else if (action.equals("userdelete")) {
				
				UserDeleteAction userDeleteAction = new UserDeleteAction();
				userDeleteAction.execute(request, response);
				
				url = "/WEB-INF/views/UserDelete.jsp";
				
			} else if (action.equals("userdelete_ok")) {
				
				UserDeleteOkAction userDeleteOkAction = new UserDeleteOkAction();
				userDeleteOkAction.execute(request, response);
				
				url = "/WEB-INF/views/UserDelete_Ok.jsp";
				
			} else if (action.equals("mywritinglist")) { // 마이페이지(내가 쓴 글 보기)
				
				MyWritingListAction myWritingListAction = new MyWritingListAction();
				myWritingListAction.execute(request, response);
				
				url = "/WEB-INF/views/MyWritingList.jsp";
				
			} else {
				
				url = "/WEB-INF/views/404.jsp";
				
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		}
		
	}

}
