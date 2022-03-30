package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class WebDAO {
	private DataSource dataSource;
	
	public WebDAO() {
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup( "java:comp/env" );
			this.dataSource = (DataSource)envCtx.lookup( "jdbc/mariadb2" );
		} catch (NamingException e) {
			System.out.println( "에러: " + e.getMessage() );
		}
	}
	
	//SignUp_ok
	public int SignUp_Ok( WebTO to ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		
			try {
				conn = dataSource.getConnection();
				
				String sql = "insert into Project_Users values (?, ?, ?, ?, ?, ?, ?, ?, now())";
				pstmt = conn.prepareStatement( sql );
				pstmt.setString( 1, to.getID() );
				pstmt.setString( 2, to.getNickname() );
				pstmt.setString( 3, to.getPassword() );
				pstmt.setString( 4, to.getName() );
				pstmt.setString( 5, to.getBirth() );
				pstmt.setString( 6, to.getEmail() );
				pstmt.setString( 7, to.getAddress() );
				pstmt.setString( 8, to.getGender() );
				
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
	
	//아이디 중복체크 메서드
	public int joinIdCheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		try {
			//1.DB 연결
			conn = dataSource.getConnection();
			//2. sql 구문 & pstmt 생성
			String sql = "select id from project_users where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			
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
		if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
		if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
	}
		return result;
	}
	//아이디 중복체크 메서드 끝
	
	//닉네임 중복체크 메서드
	public int joinNICKCheck(String NICK) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1; // 에러
		try {
			//1.DB 연결
			conn = dataSource.getConnection();
			//2. sql 구문 & pstmt 생성
			String sql = "select nickname from project_users where nickname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,NICK);
			
			//3. 실행 -> select -> rs저장
			rs = pstmt.executeQuery();
			
			//데이터 처리
			
			if(rs.next()) {
				result = 0; // 중복된 아이디가 있는 경우
			} else {
				result = 1; // 중복된 아이디가 없는 경우
		}
		System.out.println("닉네임 중복체크결과 : " + result);
		} catch (Exception e) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
			if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
		}
		return result;
	}
	//닉네임 중복체크 메서드 끝
	
	// 회원정보 수정 시 닉네임 중복체크 메서드
	public int joinNICKCheck(String NICK, String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
					
		int result = -1; // 에러
		try {
			//1.DB 연결
			conn = dataSource.getConnection();
			//2. sql 구문 & pstmt 생성
			String sql = "select nickname from project_users where nickname=?";
			// String sql = "select nickname from project_users where nickname=? and ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, NICK);
			//pstmt.setString(2, user_id);
						
			//3. 실행 -> select -> rs저장
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 중복된 닉네임이 있는 경우 -> 사용 못함
				// result = 0;
				
				String sql2 = "select nickname from project_users where nickname=? and ID=?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, NICK);
				pstmt.setString(2, user_id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					// 중복된 아이디지만 내 아이디인 경우 -> 사용 가능
					result = 2;
				} else {
					// 다른 사람이 사용중이여서 중복된 닉네임이 있는 경우 -> 사용 못함
					result = 0;
				}
				
			} else {
				// 중복된 닉네임이 없는 경우 -> 사용 가능
				result = 1;
				
			}
			
			System.out.println("닉네임 중복체크결과 : " + result);
			
		} catch (Exception e) {
			System.out.println( "[에러] : " + e.getMessage() );
		} finally {
			if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
			if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
		}
		return result;
	}
	// 회원정보 수정 시 닉네임 중복체크 메서드 끝
	
}
