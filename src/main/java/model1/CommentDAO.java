package model1;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;

public class CommentDAO {
	
	private Connection conn1;
	private PreparedStatement pstmt1;
	private ResultSet rs1;
	
	private DataSource dataSource;
	
	public CommentDAO() {
		// TODO Auto-generated constructor stub
		
		try {
			Context ctx = new InitialContext();
			Context envCtx = (Context)ctx.lookup("java:comp/env");
			this.dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		}
	}
	
	
	// 글 번호에 해당하는 댓글을 모두 불러옴
	public ArrayList<CommentTO> commentList(CommentTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<CommentTO> commentLists = new ArrayList<CommentTO>();
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select cID, cnickname, ccontent, date_format(cdate, '%Y/%m/%d     (%H:%i)') cdate from comment where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() ); 

			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				CommentTO cto = new CommentTO();
				cto.setcID(rs.getString("cID"));
				cto.setCcontent(rs.getString("ccontent"));
				cto.setCdate(rs.getString("cdate"));
				
				commentLists.add(cto);
			}
			
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if(rs != null) try{ rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try{ pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try{ conn.close(); } catch(SQLException e) {}
		}
		
		return commentLists;
	}
	/*
	public int commentWriteOk(CommentTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "insert into comment values ( ?, ?, ?, ? , now() )";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			pstmt.setString( 2, to.getcID() );
			pstmt.setString( 3, to.getCnickname() );
			pstmt.setString( 4, to.getCcontent() );
			
			if( to.getcID().equals("") ) {
				flag = 1; // 댓글 쓰기 실패
			} else if( pstmt.executeUpdate() == 1 ) {
				flag = 0; // 댓글 쓰기 성공
			}
			
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		
		return flag;
	}
	*/
	
	/*
	public ArrayList getList() {
		ArrayList list = new ArrayList();
		CommentTO to = new CommentTO();
		String sql1 = "select cID, cnickname, ccontent, date_format(cdate, '%Y/%m/%d(%H:%i)') cdate from comment where seq=?";
		try {
			pstmt1 = conn1.prepareStatement(sql1);
			pstmt1.setString(1, to.getSeq());
			rs1 = pstmt1.executeQuery();
			while (rs1.next()) {
				to.setcID(rs1.getString("cID"));
				to.setCnickname(rs1.getString("cnickname"));
				to.setCcontent(rs1.getString("ccontent"));
				to.setCdate(rs1.getString("cdate"));
				list.add(to);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		}

		return list;
	}
	*/
	
	public int comment_write(CommentTO to) {
		Connection conn1 = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;
		int flag = 1;

		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource dataSource = (DataSource) envCtx.lookup("jdbc/mariadb2");

			conn1 = dataSource.getConnection();
			String sql = "insert into comment values (  ?, ?, ?, ? , ?,now())";
			pstmt1 = conn1.prepareStatement(sql);
			// rs1 = pstmt1.executeQuery();
			System.out.println(to.getSeq());

			pstmt1.setString(1, to.getSeq());
			pstmt1.setString(2, to.getCmseq());
			pstmt1.setString(3, to.getcID());
			pstmt1.setString(4, to.getCnickname());
			pstmt1.setString(5, to.getCcontent());
			// pstmt1.setString(6, to.getCdate());
			System.out.println(pstmt1);

			if (to.getcID() == null) {
				flag = 1;
				System.out.println("등록실패");
			} else if (pstmt1.executeUpdate() == 1) {
				flag = 0;
				System.out.println("등록성공!");
			}

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if (rs1 != null)try {rs1.close();} catch (SQLException e) {}
			if (pstmt1 != null)try {pstmt1.close();} catch (SQLException e) {}
			if (conn1 != null)try {conn1.close();} catch (SQLException e) {}
		}
		return flag;
	} // write 끝

	
	public int Comment_modifyok(CommentTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		int flag = 1;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource dataSource = (DataSource) envCtx.lookup("jdbc/mariadb2");

			conn = dataSource.getConnection();

			String sql = "update comment set  content=? where cmseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getCmseq());
			rs1 = pstmt.executeQuery();

			if (rs1.next()) {
				to.setCcontent(rs1.getString("content"));
			}

		} catch (NamingException e) {
			System.out.println("[에러] : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if (pstmt != null)try {pstmt.close();} catch (SQLException e) {}
			if (conn != null)try {conn.close();} catch (SQLException e) {}
		}
		return flag;
	}// modifyok 끝

	
	public int delete(CommentTO to ) {
		Connection conn1 = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;
		int flag = 1;

		try {

			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource dataSource = (DataSource) envCtx.lookup("jdbc/mariadb2");

			conn1 = dataSource.getConnection();
			String sql = "delete from comment where cmseq=? ";
			pstmt1 = conn1.prepareStatement( sql );
			pstmt1.setString( 1, to.getSeq() );
			
			int result = pstmt1.executeUpdate(); 
			if( result == 1 ) {
				flag = 1;
			} else if( result == 0 ) {
				flag = 0;
			}
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if (rs1 != null)try {rs1.close();	} catch (SQLException e) {}
			if (pstmt1 != null)try {pstmt1.close();} catch (SQLException e) {}
			if (conn1 != null)try {conn1.close();} catch (SQLException e) {}
		}
		return flag;
	}

}// class 끝

