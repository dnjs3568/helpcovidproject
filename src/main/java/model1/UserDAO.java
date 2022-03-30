package model1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class UserDAO {
	private DataSource dataSource;
	
	public UserDAO() {
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
	
	// flag 리턴
	public int userLoginOk(UserTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int flag = 2;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select * from Project_Users where ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getID());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("password").equals(to.getPassword())) {
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
	
	// 마이페이지 - 회원 정보 수정 (UserUpdate.jsp)
	public UserTO userUpdate(UserTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "select ID, nickname, password, name, birth, email, address, gender from Project_Users where ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getID());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				to.setID(rs.getString("ID"));
				to.setNickname(rs.getString("nickname"));
				to.setName(rs.getString("name"));
				to.setBirth(rs.getString("birth"));
				to.setGender(rs.getString("gender"));
				to.setEmail(rs.getString("email"));
				to.setAddress(rs.getString("address"));
			}
			
		} catch(SQLException e) {
			System.out.println("[에러] " + e.getMessage());
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		
		return to;
	}
	
	// 마이페이지 - 회원 정보 수정_ok (UserUpdate_Ok.jsp)
	public int userUpdateOk(UserTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 1;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "update Project_Users set nickname=?, password=?, email=?, address=?, gender=? where ID=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getNickname());
			pstmt.setString(2, to.getPassword());
			pstmt.setString(3, to.getEmail());
			pstmt.setString(4, to.getAddress());
			pstmt.setString(5, to.getGender());
			pstmt.setString(6, to.getID());
			
			int result = pstmt.executeUpdate();
			if(result == 0) {
				// 수정 실패한 경우
				flag = 1;
			} else if(result == 1) {
				// 정상적으로 수정이 된 경우
				flag = 0;
			}
			
		} catch(SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		
		return flag;
	}
	
	// 마이페이지 - 회원 탈퇴 (UserDelete.jsp)
	public void userDelete() {
		// 사용 안함
	}

	// 마이페이지 - 회원 탈퇴_ok (UserDelete_Ok.jsp)
	public int userDeleteOk(UserTO to) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int flag = 2;
		try {
			conn = this.dataSource.getConnection();
			
			String sql = "delete from Project_Users where ID=? and password=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, to.getID());
			pstmt.setString(2, to.getPassword());
			
			int result = pstmt.executeUpdate();
			if(result == 0) {
				// 비밀번호가 틀린 경우
				flag = 1;
			} else if(result == 1) {
				// 비밀번호가 정상적으로 입력된 경우
				flag = 0;
			}
			
		} catch(SQLException e) {
			System.out.println("[에러] : " + e.getMessage());
		} finally {
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		
		return flag;
	}

	public int hit (String hID) { // 방문자 수
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int result = -1;
		try {
			conn = dataSource.getConnection();
			String sql = "select hdate from hit where (hdate like date_format(now(), '%Y-%m-%d') and hID like ? )";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,hID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = 0; // 이미 접속이 되어있는 경우

			} else {
				result = 1; // 새로 접속한 경우
				sql = "insert into hit values ( ?, now() )";	
				pstmt = conn.prepareStatement( sql );
				pstmt.setString(1, hID);
			
				rs = pstmt.executeQuery();

			}
	} catch (Exception e) {
		System.out.println( "[에러] : " + e.getMessage() );
	} finally {
		if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
		if( pstmt != null ) try{ pstmt.close(); } catch (SQLException e) {}
		if( conn != null ) try{ conn.close(); } catch (SQLException e) {}
	}
		return result;
	}
	
}
