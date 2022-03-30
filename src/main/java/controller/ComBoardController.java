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
import model2.BoardListAction;
import model2.BoardListAction1;
import model2.CommentAction;
import model2.CommentModifyokAction;
import model2.CommentWriteOk_Action;
import model2.DeleteAction;
import model2.DeleteOkAction;
import model2.DeleteOkAction2;
import model2.ListAction;
import model2.ListAction5;
import model2.ModifyAction;
import model2.ModifyOkAction;
import model2.RecommendAction;
import model2.ReportAction;
import model2.ViewAction;
import model2.WriteAction;
import model2.WriteAction1;
import model2.WriteOkAction;
import model2.WriteOkAction1;

/**
 * Servlet implementation class controller
 */
@WebServlet("/ComBoardController")
public class ComBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			
			String action = request.getParameter("action");
			String url = "";
			
			BoardAction boardAction = null;
			
			if( action == null || action.equals("") || action.equals("list")) {
				boardAction = new BoardListAction();
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardList.jsp";
				
			} else if (action.equals( "list1" ) ) {
				
				boardAction = new BoardListAction1();
				boardAction.execute(request, response);
				
				url = "/WEB-INF/views/Board_BoardList1.jsp";
				
			} else if (action.equals( "view" ) ) {
				boardAction = new ViewAction();
				boardAction.execute(request, response);
				boardAction = new CommentAction(); // 게시판 보기에서 댓글 목록 불러오기
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardView.jsp";
				
			} else if (action.equals( "view1" ) ) {
				boardAction = new ViewAction();
				boardAction.execute(request, response);
				boardAction = new CommentAction(); // 게시판 보기에서 댓글 목록 불러오기
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardView1.jsp";
				
			} else if (action.equals( "write" ) ) {
				boardAction = new WriteAction();
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardWrite.jsp";
				
			} else if (action.equals( "write_ok" ) ) {
				boardAction = new WriteOkAction();
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardWrite_ok.jsp";
			
			} else if (action.equals( "write1" ) ) {
				boardAction = new WriteAction1();
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardWrite1.jsp";
				
			} else if (action.equals( "write_ok1" ) ) {
				boardAction = new WriteOkAction1();
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardWrite_ok1.jsp";
			
			} else if (action.equals( "modify" ) ) {
				boardAction = new ModifyAction();
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardModify.jsp";
				
			} else if (action.equals( "modify1" ) ) {
				boardAction = new ModifyAction();
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardModify1.jsp";
				
			} else if (action.equals( "modify_ok" ) ) {
				boardAction = new ModifyOkAction();
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardModify_ok.jsp";
				
			} else if (action.equals( "delete" ) ) {
				boardAction = new DeleteAction();
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardDelete.jsp";
				
			} else if (action.equals( "delete_ok" ) ) {
				boardAction = new DeleteOkAction2();
				boardAction.execute(request, response);
				url = "/WEB-INF/views/Board_BoardDelete_ok.jsp";

			} else if (action.equals( "report_ok" ) ) {
				boardAction = new ReportAction();
				boardAction.execute(request, response);
				url = "WEB-INF/views/Board_BoardReport_ok.jsp";
			
			} else if (action.equals( "recommend_ok" ) ) {
				boardAction = new RecommendAction();
				boardAction.execute(request, response);
				url = "WEB-INF/views/Board_BoardRecommend_ok.jsp";
			
			} else if( action.equals( "comment_write_ok" ) ) { // 댓글 쓰기
				// comment write
				boardAction = new CommentWriteOk_Action();
				boardAction.execute( request, response );
				url = "WEB-INF/views/CommentWrite_ok.jsp";
				
			} else if( action.equals( "comment_modify_ok" ) ) { // 댓글 수정
				// comment modify
				boardAction = new CommentModifyokAction();
				boardAction.execute( request, response );
				url = "WEB-INF/views/Comment_Modify_ok.jsp";
				
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
