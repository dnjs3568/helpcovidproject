package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AdminDAO {
	private DataSource dataSource;
	
	public AdminDAO() {
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
	
	public ArrayList<AdminTO> boardList() {
		ArrayList<AdminTO> boardLists = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select ID, nickname, name, date_format(birth, '%Y/%m/%d') birth, email, address, gender, date_format(date, '%Y/%m/%d') date from project_users order by date desc";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			

			while(rs.next()) {
				AdminTO to = new AdminTO();
				to.setID( rs.getString( "ID" ) );
				to.setNickname( rs.getString( "nickname" ) );
				to.setName( rs.getString( "name" ) );
				to.setBirth( rs.getString( "birth" ) );
				to.setEmail( rs.getString( "email" ) );
				to.setAddress( rs.getString( "address" ) );
				to.setGender( rs.getString( "gender" ) );
				to.setDate( rs.getString( "date" ) );

				boardLists.add( to );
			}
		
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}		
		
		return boardLists;
	}
	
	public ArrayList<AdminTO> boardList2() {
		ArrayList<AdminTO> boardLists2 = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select ID, nickname, name, date_format(birth, '%Y-%m-%d') birth, date_format(date, '%Y-%m-%d') date from project_users order by date desc limit 5";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			

			while(rs.next()) {
				AdminTO to = new AdminTO();
				to.setID( rs.getString( "ID" ) );
				to.setNickname( rs.getString( "nickname" ) );
				to.setName( rs.getString( "name" ) );
				to.setBirth( rs.getString( "birth" ) );
				to.setDate( rs.getString( "date" ) );

				boardLists2.add( to );
			}
		
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}		
		
		return boardLists2;
	}
	
	public ArrayList<AdminTO> boardList4() {
		ArrayList<AdminTO> boardLists4 = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select seq , left(subject  , 30) as subject, ID, date_format(wdate, '%Y-%m-%d') wdate, category from project_board order by seq desc limit 5";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			

			while(rs.next()) {
				AdminTO to = new AdminTO();
				to.setSeq( rs.getString( "seq" ) );
				to.setSubject( rs.getString( "subject" ) );
				to.setID( rs.getString( "ID" ) );
				to.setWdate( rs.getString( "wdate" ) );
				to.setCategory( rs.getString( "category" ) );

				boardLists4.add( to );
			}
		
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}		
		
		return boardLists4;
	}
	
	public ArrayList<AdminTO> boardList1() {
		ArrayList<AdminTO> boardLists1 = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select aID, aname, date_format(adate, '%Y/%m/%d     (%H:%i)') adate from project_aadmin order by adate desc";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			

			while(rs.next()) {
				AdminTO to = new AdminTO();
				to.setaID( rs.getString( "aID" ) );
				to.setAname( rs.getString( "aname" ) );
				to.setAdate( rs.getString( "adate" ) );

				boardLists1.add( to );
			}
		
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}		
		
		return boardLists1;
	}
	
	public AdminTO Userview(AdminTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select ID, nickname, name, birth, email, address, gender from project_users where ID = ?";
			pstmt = conn.prepareStatement( sql );
			pstmt.setString( 1, to.getID() );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to.setID( rs.getString( "ID" ) );
				to.setNickname( rs.getString( "nickname" ) );
				to.setName( rs.getString( "name" ) );
				to.setBirth( rs.getString( "birth" ) );
				to.setEmail( rs.getString( "email" ) );
				to.setAddress( rs.getString( "address" ) );
				to.setGender( rs.getString( "gender" ) );
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
	
	public int joinIdCheck(String aID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		try {
			//1.DB 연결
			conn = dataSource.getConnection();
			//2. sql 구문 & pstmt 생성
			String sql = "select aID from project_aadmin where aID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,aID);
			
			//3. 실행 -> select -> rs저장
			rs = pstmt.executeQuery();
			
			//데이터 처리
			
			if(rs.next()) {
				result = 0;
			} else {
				result = 1;
			}
		System.out.println("아이디 중복체크결과 : " +result);
	} catch (Exception e) {
		System.out.println( "[에러] : " + e.getMessage() );
	} finally {
		if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
		if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
		if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
	}
		return result;
	}
	
	//SignUp_ok
		public int SignUp_Ok( AdminTO to ) {
			
			Connection conn = null;
			PreparedStatement pstmt = null;

			
			int flag = 1;
			
				try {
					conn = dataSource.getConnection();
					
					String sql = "insert into Project_aadmin values ( ?, ?, '1', ?, now() )";
					pstmt = conn.prepareStatement( sql );
					pstmt.setString( 1, to.getaID() );
					pstmt.setString( 2, to.getApassword() );
					pstmt.setString( 3, to.getAname() );

					if( pstmt.executeUpdate() == 1 ) {
						flag = 0;
					}

				} catch( SQLException e ) {
					System.out.println( "[에러] : " + e.getMessage() );
				} finally {
					if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
					if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
				}
			return flag;	
		}
		
		
		
		public int DeleteOkAction(AdminTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			int flag = 2;
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "delete from project_aadmin where aID=? ";
				pstmt = conn.prepareStatement( sql );
				
				pstmt.setString( 1, to.getaID() );
								
				int result = pstmt.executeUpdate();
				if( result == 0 ) {
					flag = 1;
				} else if( result == 1 ) {
					flag = 0;
				}
				
			} catch( SQLException e ) {
				System.out.println( "[에러] " + e.getMessage() );
			} finally {
				if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
				if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
			}
			
			return flag;
		}

		public int boarddeleteok(AdminTO to) {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			int flag = 2;
			
			try {
				conn = dataSource.getConnection();
				
				String sql = "delete from project_board where seq=?";
				pstmt = conn.prepareStatement( sql );
				
				pstmt.setString( 1, to.getSeq() );
								
				int result = pstmt.executeUpdate();
				if( result == 0 ) {
					flag = 1;
				} else if( result == 1 ) {
					flag = 0;
				}
				
			} catch( SQLException e ) {
				System.out.println( "[에러] " + e.getMessage() );
			} finally {
				if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
				if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
			}
			
			return flag;
		}
		
	// flag 리턴
	public int adminLoginOk(AdminTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 2;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from project_aadmin where aID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getaID());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("apassword").equals(to.getApassword())) {
					// 아이디와 비밀번호가 일치하는 경우
					flag = 0;
				} else {
					// 비밀번호가 일치하지 않는 경우
					flag = 1;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		
		return flag;
	}
	
	public ArrayList<AdminTO> boardList3() {
		ArrayList<AdminTO> boardLists3 = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select seq, left(subject  , 30) as subject, ID, nickname, date_format(wdate, '%Y/%m/%d     (%H:%i)') wdate, category from Project_board order by seq desc";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				AdminTO to = new AdminTO();
				to.setSeq( rs.getString( "seq" ) );
				to.setSubject( rs.getString( "subject" ) );
				to.setID( rs.getString( "ID" ) );
				to.setNickname( rs.getString( "nickname" ) );
				to.setWdate( rs.getString( "wdate" ) );
				to.setCategory( rs.getString( "category" ) );


				boardLists3.add( to );
			}
		
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}		
		
		return boardLists3;
	}
	

	public ArrayList<AdminTO> boardList5() {
		ArrayList<AdminTO> boardLists5 = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = dataSource.getConnection();

			String sql = "select date_format( hdate , '%m-%d일') hdate , COUNT(*) hhit from hit group by hdate order by hdate desc limit 5";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				AdminTO to = new AdminTO();
				to.setHdate( rs.getString( "hdate" ) );
				to.setHhit( rs.getInt( "hhit" ) );

				boardLists5.add( to );
			}
		
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}		
		
		return boardLists5;
	}
	
	public ArrayList<AdminTO> boardList6() {
		ArrayList<AdminTO> boardLists6 = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = dataSource.getConnection();

			String sql = "SELECT DATE_FORMAT(wdate,'%m-%d일') day, COUNT(*) bcount FROM project_board GROUP BY day desc limit 5";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				AdminTO to = new AdminTO();
				to.setDay( rs.getString( "day" ) );
				to.setBcount( rs.getString( "bcount" ) );

				boardLists6.add( to );
			}
		
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}		
		
		return boardLists6;
	} 
	
	public ArrayList<AdminTO> boardList7() {
		ArrayList<AdminTO> boardLists7 = new ArrayList<>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = dataSource.getConnection();

			String sql = "select date_format(wdate , '%Y-%m-%d') tbday, count(*) tbcount from project_board where date_format(wdate , '%Y-%m-%d') > date_format( date_add(now(), interval -2 day), '%Y-%m-%d') GROUP BY tbday";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();

			while(rs.next()) {
				AdminTO to = new AdminTO();
				to.setTbday( rs.getString( "tbday" ) );
				to.setTbcount( rs.getString( "tbcount" ) );

				boardLists7.add( to );
			}
		
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}		
		
		return boardLists7;
	}
	
	public AdminTO tbdaytbcount(AdminTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select date_format(wdate , '%Y-%m-%d') tbday, count(*) tbcount from project_board where date_format(wdate , '%Y-%m-%d') > date_format( date_add(now(), interval -1 day), '%Y-%m-%d') GROUP BY tbday";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to.setTbcount( rs.getString("tbcount") );
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
	
	
	public AdminTO tcdaytccount(AdminTO to1) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select date_format(cdate , '%Y-%m-%d') tcday, count(*) tccount from comment where date_format(cdate , '%Y-%m-%d') > date_format( date_add(now(), interval -1 day), '%Y-%m-%d') GROUP BY tcday";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to1.setTccount( rs.getString("tccount") );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return to1;
	}
	
	public AdminTO ttcdayttccount(AdminTO to2) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select count(*) ttccount from comment";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to2.setTtccount( rs.getString("ttccount") );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return to2;
	}
	
	public AdminTO ttbdayttbcount(AdminTO to3) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select count(*) ttbcount from project_board";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to3.setTtbcount( rs.getString("ttbcount") );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return to3;
	}
	
	public AdminTO ttucount(AdminTO to4) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select count(*) ttucount from project_users";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to4.setTtucount( rs.getString("ttucount") );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return to4;
	}
	
	public AdminTO tucount(AdminTO to5) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();

			String sql = "select date_format(date , '%Y-%m-%d') tuday, count(*) tucount from project_users where date_format(date , '%Y-%m-%d') > date_format( date_add(now(), interval -1 day), '%Y-%m-%d') GROUP BY tuday";
			pstmt = conn.prepareStatement( sql );
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				to5.setTucount( rs.getString("tucount") );
			}
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}
		
		return to5;
	}
	
	
}
