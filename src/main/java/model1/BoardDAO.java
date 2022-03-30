package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class BoardDAO {
	private DataSource dataSource;
	
	public BoardDAO() {
		// TODO Auto-generated constructor stub
		
		// 디비 연동
		try {
			Context ctx = new InitialContext();
			Context envCtx = (Context)ctx.lookup("java:comp/env");
			this.dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		}
	}
	
	//BoardList 시작 (자유게시판)------------------------------------------------------------------
	public ArrayList<BoardTO> boardList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardTO> lists = new ArrayList<BoardTO>();
		
		
		try {
			conn = dataSource.getConnection();

			String sql = "select seq, subject, nickname, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from Project_board where category='0' order by seq desc";
			pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				BoardTO to = new BoardTO();
				to.setSeq( rs.getString( "seq" ) );
				to.setSubject( rs.getString( "subject" ) );
				to.setNickname( rs.getString( "nickname" ) );
				to.setWdate( rs.getString( "wdate" ) );
				to.setHit( rs.getString( "hit" ) );
				to.setWgap( rs.getInt( "wgap" ) );	
				
				lists.add( to );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if ( rs != null ) try { rs.close(); } catch ( SQLException e ) {}
			if ( pstmt != null ) try { pstmt.close(); } catch ( SQLException e ) {}
			if ( conn != null ) try {  conn.close(); } catch ( SQLException e ) {}
		}
		return lists;
	}
	
	//BoardList 끝--------------------------------------------------------------------
	
	//BoardList 자가/격리 시작------------------------------------------------------------------
		public ArrayList<BoardTO> boardList1() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			ArrayList<BoardTO> lists = new ArrayList<BoardTO>();
			
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "select seq, subject, nickname, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from Project_board where category='1' order by seq desc";
				pstmt = conn.prepareStatement( sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
				rs = pstmt.executeQuery();
				
				while( rs.next() ) {
					BoardTO to = new BoardTO();
					to.setSeq( rs.getString( "seq" ) );
					to.setSubject( rs.getString( "subject" ) );
					to.setNickname( rs.getString( "nickname" ) );
					to.setWdate( rs.getString( "wdate" ) );
					to.setHit( rs.getString( "hit" ) );
					to.setWgap( rs.getInt( "wgap" ) );	
					
					lists.add( to );
				}
			} catch( SQLException e ) {
				System.out.println( "[에러] : " + e.getMessage() );
			} finally {
				if ( rs != null ) try { rs.close(); } catch ( SQLException e ) {}
				if ( pstmt != null ) try { pstmt.close(); } catch ( SQLException e ) {}
				if ( conn != null ) try {  conn.close(); } catch ( SQLException e ) {}
			}
			return lists;
		}
		
		//BoardList1 자가/격리 끝--------------------------------------------------------------------
		
		public BoardTO boardList2(BoardTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				conn = dataSource.getConnection();

				String sql = "select seq, subject, nickname, date_format(wdate, '%Y-%m-%d') wdate, hit, datediff(now(), wdate) wgap from Project_board where ID=? order by seq desc";
				pstmt = conn.prepareStatement( sql );
				pstmt.setString( 1, to.getID() );
				
				rs = pstmt.executeQuery();
				if( rs.next() ) {
					to.setSeq( rs.getString( "seq" ) );
					to.setSubject( rs.getString( "subject" ) );
					to.setNickname( rs.getString( "nickname" ) );
					to.setWdate( rs.getString( "wdate" ) );
					to.setHit( rs.getString( "hit" ) );
					to.setWgap( rs.getInt( "wgap" ) );	
					
				}

			} catch( SQLException e ) {
				System.out.println( "[에러] " + e.getMessage() );
			} finally {
				if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
				if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
				if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
			}
			
			return to;
		}
	
	// 마이페이지(내가 쓴 글 보기) -> 카테고리 상관없이 글 불러오기
	public ArrayList<BoardTO> myWritingBoardList(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<BoardTO> myWritingBoardLists = new ArrayList<BoardTO>();

		try {
			conn = dataSource.getConnection();

			String sql = "select seq, subject, nickname, date_format(wdate, '%Y-%m-%d') wdate, hit, category from Project_board where ID=? order by seq desc";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getID() );

			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				BoardTO to1 = new BoardTO();
				to1.setSeq(rs.getString("seq"));
				to1.setSubject(rs.getString("subject"));
				to1.setNickname(rs.getString("nickname"));
				to1.setWdate(rs.getString("wdate"));
				to1.setHit(rs.getString("hit"));
				if(rs.getString("category").equals("0")) {
					to1.setCategory("[자유]");
				} else {
					to1.setCategory("[확진자 / 자가 격리자]");
				}
				
				myWritingBoardLists.add(to1);
			}
			
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if(rs != null) try{ rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try{ pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try{ conn.close(); } catch(SQLException e) {}
		}
		
		return myWritingBoardLists;
	}
		
				
	//BoardWrite_OK 자가/격리 시작--------------------------------------------------------------
	public int Board_BoardWrite_ok1(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 1;
		
		try {	
			conn = dataSource.getConnection();
			
			String sql = "select nickname from project_users where id=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getID() );
			rs = pstmt.executeQuery();
			while(rs.next()) {
			String Nickname = rs.getString( "Nickname" );
			
			sql = "insert into Project_board values (0, ?, ?, ?, ?, 0, 0, 0, now() , '1')";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getID() );
			pstmt.setString( 2, Nickname );
			pstmt.setString( 3, to.getSubject() );
			pstmt.setString( 4, to.getContent() );
			
			if( pstmt.executeUpdate() == 1 ) {
				flag = 0;
			}
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
			if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
		}
		
		return flag;
	}
	
	//BoardWrite_OK1 자가/격리 끝--------------------------------------------------------------
	
	
	
	//BoardWrite_OK 시작--------------------------------------------------------------
		public int Board_BoardWrite_ok(BoardTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int flag = 1;
			
			try {	
				conn = dataSource.getConnection();
				
				String sql = "select nickname from project_users where id=?";
				pstmt = conn.prepareStatement( sql );
				pstmt.setString( 1, to.getID() );
				rs = pstmt.executeQuery();
				while(rs.next()) {
				String Nickname = rs.getString( "Nickname" );	
				
				sql = "insert into Project_board values (0, ?, ?, ?, ?, 0, 0, 0, now() , 0)";
				pstmt = conn.prepareStatement( sql );
				pstmt.setString( 1, to.getID() );
				pstmt.setString( 2, Nickname );
				pstmt.setString( 3, to.getSubject() );
				pstmt.setString( 4, to.getContent() );
				
				if( pstmt.executeUpdate() == 1 ) {
					flag = 0;
				}
				}

			} catch( SQLException e ) {
				System.out.println( "[에러] : " + e.getMessage() );
			} finally {
				if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
				if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
			}
			
			return flag;
		}
		
		//BoardWrite_OK 끝--------------------------------------------------------------
	
	//BoardReport_OK 시작--------------------------------------------------------------
	
	public int Board_BoardReport_ok(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
			DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb2" );
			
			conn = dataSource.getConnection();
			
			String sql = "update project_board set report = report + 1 where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			
			int result = pstmt.executeUpdate(); 
			if( result == 0 ) {
				flag = 1;
			} else if( result == 1 ) {
				flag = 0;
			}
			
		} catch( NamingException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
			if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
		}
		
		return flag;
	}
	
	//BoardReport_OK 끝--------------------------------------------------------------
	
	//BoardRecommend_OK 시작--------------------------------------------------------------
	public int Board_BoardRecommend_ok(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
			DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb2" );
			
			conn = dataSource.getConnection();
			
			String sql = "update project_board set recommend = recommend + 1 where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			
			int result = pstmt.executeUpdate(); 
			if( result == 0 ) {
				flag = 1;
			} else if( result == 1 ) {
				flag = 0;
			}
			
		} catch( NamingException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
			if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
		}
		
		return flag;
	}
	//BoardRecommend_OK 끝--------------------------------------------------------------
	
	//BoardModify 시작-----------------------------------------------------------------
	public BoardTO Board_BoardModify( BoardTO to ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select subject, content from project_board where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setSubject( rs.getString( "subject" ) );
				to.setContent( rs.getString( "content" ) );
			}

		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if ( rs != null ) try { rs.close(); } catch ( SQLException e ) {}
			if ( pstmt != null ) try { pstmt.close(); } catch ( SQLException e ) {}
			if ( conn != null ) try {  conn.close(); } catch ( SQLException e ) {}
		}
		return to;
	}
	
	//BoardModify 끝-----------------------------------------------------------------
	
	//BoardModify_OK 끝--------------------------------------------------------------
	public int Board_BoardModify_ok(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
			DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb2" );
			
			conn = dataSource.getConnection();
			
			String sql = "update project_board set subject=?, content=? where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSubject() );
			pstmt.setString( 2, to.getContent() );
			pstmt.setString( 3, to.getSeq() );
			
			int result = pstmt.executeUpdate(); 
			if( result == 0 ) {
				flag = 1;
			} else if( result == 1 ) {
				flag = 0;
			}
			
		} catch( NamingException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
			if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
		}
		
		return flag;
	}
	
	//BoardModify_OK 끝--------------------------------------------------------------
	
	//BoardDelete 시작---------------------------------------------------------------------
	public BoardTO boardDelete( BoardTO to ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select subject, ID from project_board where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() ); 
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setSubject( rs.getString( "subject" ) );
				to.setID( rs.getString( "ID" ) );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if ( rs != null ) try { rs.close(); } catch ( SQLException e ) {}
			if ( pstmt != null ) try { pstmt.close(); } catch ( SQLException e ) {}
			if ( conn != null ) try {  conn.close(); } catch ( SQLException e ) {}
		}
		return to;
	}
	
	//BoardDelete 끝------------------------------------------------------------------
	
	//BoardDelete_OK 시작--------------------------------------------------------------
	public int Board_BoardDelete_ok(BoardTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 0;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
			DataSource dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb2" );
			
			conn = dataSource.getConnection();
			
			String sql = "delete from project_board where seq=? ";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			
			int result = pstmt.executeUpdate(); 
			if( result == 1 ) {
				flag = 1; // 글 삭제 성공
			} else if( result == 0 ) {
				flag = 0; // 글 삭제 실패
			}
			
		} catch( NamingException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
			if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
		}
		return flag;
	}
	
	//BoardDelete_OK 끝--------------------------------------------------------------
	
	//BoardView 시작--------------------------------------------------------------
	public BoardTO Board_BoardView( BoardTO to ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "update project_board set hit=hit+1 where seq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getSeq() );
			
			pstmt.executeUpdate();
			
			sql = "select subject, nickname, ID, wdate, hit, recommend, content from project_board where seq=?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getSeq() );
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				to.setSubject( rs.getString( "subject" ) );
				to.setNickname( rs.getString( "nickname" ) );
				to.setID( rs.getString("ID") );
				to.setWdate( rs.getString( "wdate" ) );
				to.setHit( rs.getString( "hit" ) );
				to.setRecommend( rs.getString("recommend") );
				to.setContent( rs.getString( "content" ) == null ? "" : rs.getString("content").replaceAll("\n","<br />") );
			}
			
		} catch( SQLException e ) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if ( rs != null ) try { rs.close(); } catch ( SQLException e ) {}
			if ( pstmt != null ) try { pstmt.close(); } catch ( SQLException e ) {}
			if ( conn != null ) try {  conn.close(); } catch ( SQLException e ) {}
		}
		return to;
	}
	//BoardView 끝--------------------------------------------------------------
	
	
}
