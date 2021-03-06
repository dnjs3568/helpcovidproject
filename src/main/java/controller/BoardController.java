package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model2.BoardAction;
import model2.DeleteOkAction;
import model2.Idcheck;
import model2.ListAction;
import model2.ListAction0;
import model2.ListAction1;
import model2.ListAction10;
import model2.ListAction11;
import model2.ListAction2;
import model2.ListAction3;
import model2.ListAction4;
import model2.ListAction5;
import model2.ListAction6;
import model2.ListAction7;
import model2.ListAction8;
import model2.ListAction9;
import model2.Signup;
import model2.SignupOk;
import model2.Userview;
import model2.boarddeleteok;

/**
 * Servlet implementation class BoardController
 */
@WebServlet( { "*.do", "*.json" } )
public class BoardController extends HttpServlet {
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

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding( "utf-8" );
			
			String path = request.getRequestURI().replaceAll( request.getContextPath(), "" );

			String url = "";
			BoardAction boardAction = null;

			if( path.equals( "/*.do") || path.equals("/index.do") ) {
				// ???????????????
				
				boardAction = new ListAction2();
				boardAction.execute(request, response);

				ListAction4 boardAction4 = new ListAction4();
				boardAction4.execute(request, response);

				ListAction5 boardAction5 = new ListAction5();
				boardAction5.execute(request, response);
				
				ListAction6 boardAction6 = new ListAction6();
				boardAction6.execute(request, response);
				
				ListAction7 boardAction7 = new ListAction7();
				boardAction7.execute(request, response);
				
				ListAction8 boardAction8 = new ListAction8();
				boardAction8.execute(request, response);
				
				ListAction9 boardAction9 = new ListAction9();
				boardAction9.execute(request, response);
				
				ListAction0 boardAction0 = new ListAction0();
				boardAction0.execute(request, response);
				
				ListAction10 boardAction10 = new ListAction10();
				boardAction10.execute(request, response);
				
				ListAction11 boardAction11 = new ListAction11();
				boardAction11.execute(request, response);
				
				
				url = "/WEB-INF/views/index.jsp";
				
			} else if( path.equals( "/users.do" ) ) {
				// ????????????
				
				boardAction = new ListAction();
				boardAction.execute(request, response);

				url = "/WEB-INF/views/users.jsp";
				
			} else if( path.equals( "/board.do" ) ) {
				// ????????? ??????
	
				boardAction = new ListAction3();
				boardAction.execute(request, response);
				
				url = "/WEB-INF/views/board.jsp";
				
			}  else if( path.equals( "/boarddelete_ok.do" ) ) {
				
				// ????????? ??????
	
				boardAction = new boarddeleteok();
				boardAction.execute( request, response );
				
				url = "/WEB-INF/views/boarddelete_ok.jsp";
					
			} else if( path.equals( "/aadmin.do" ) ) {
				// ????????? ??????
				
				boardAction = new ListAction1();
				boardAction.execute(request, response);
	
				url = "/WEB-INF/views/aadmin.jsp";
				
			} else if( path.equals( "/aadminid.do" ) ) {
				// ????????? ????????? ??????
				
				boardAction = new Signup();
				boardAction.execute( request, response );
				
				
				url = "/WEB-INF/views/aadminid.jsp";
				
			} else if( path.equals( "/Idcheck.do" ) ) {
				// ????????? ????????? ??????
				
				boardAction = new Idcheck();
				
				boardAction.execute( request, response );
				
				url = "/WEB-INF/views/Idcheck.jsp";
				
			} else if( path.equals( "/SignUp_Ok.do" ) ) {
				// ????????? ????????? ??????
	
				boardAction = new SignupOk();
				boardAction.execute( request, response );
				
				url = "/WEB-INF/views/SignUp_Ok.jsp";
				
			} else if( path.equals( "/delete_ok.do" ) ) {
				
				// ????????? ????????? ??????
	
				boardAction = new DeleteOkAction();
				boardAction.execute( request, response );
				
				url = "/WEB-INF/views/delete_ok.jsp";
				
			} else if( path.equals( "/connect_list.do" ) ) {
				// ????????? ??????
	
				url = "/WEB-INF/views/connect_list.jsp";
				
			} else if( path.equals( "/userview.do" ) ) {
				// ?????? ????????? ??????
				
				boardAction = new Userview();
				boardAction.execute( request, response );
	
				url = "/WEB-INF/views/userview.jsp";
				
			} else if( path.equals( "/fuck.do" ) ) {
				// ?????? ??????
	
				url = "/WEB-INF/views/fuck.jsp";
				
			} else if( path.equals( "/fuck_board.do" ) ) {
				// ?????? ??????
	
				url = "/WEB-INF/views/fuck_board.jsp";
				
			} else if( path.equals( "/config.do" ) ) {
				// ?????? ?????? ??? ?????? ??????
	
				url = "/WEB-INF/views/config.jsp";

			} else {
				
				url = "/WEB-INF/views/404.jsp";
			}
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
