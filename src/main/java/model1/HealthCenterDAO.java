package model1;

import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import javax.sql.DataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HealthCenterDAO {
	private DataSource dataSource;
	
	public HealthCenterDAO() {
		// TODO Auto-generated constructor stub
		// 디비와 연동해서 DataSource를 얻어내는 역할
		
		try {
			Context ctx = new InitialContext();
			Context envCtx = (Context)ctx.lookup("java:comp/env");
			this.dataSource = (DataSource)envCtx.lookup("jdbc/mariadb2");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러] " + e.getMessage());
		}
	}
	
	public ArrayList<HealthCenterTO> centerList() {
		ArrayList<HealthCenterTO> centerLists = new ArrayList<HealthCenterTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			
			String sql = "select * from public_health_center order by sidoNm, sgguNm, medical";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				HealthCenterTO to = new HealthCenterTO();
				to.setSido(rs.getString("sidoNm"));
				to.setSigungu(rs.getString("sgguNm"));
				to.setName(rs.getString("medical"));
				to.setAddress(rs.getString("addr"));
				to.setHours(rs.getString("opening_hours"));
				to.setSat_hours(rs.getString("satopening_hours"));
				to.setHoliday_hours(rs.getString("holidays"));
				to.setTel(rs.getString("number"));
				
				centerLists.add(to);
			}
			
		} catch( SQLException e ) {
			System.out.println( "[에러] " + e.getMessage() );
		} finally {
			if( rs != null ) try { rs.close(); } catch( SQLException e ) {}
			if( pstmt != null ) try { pstmt.close(); } catch( SQLException e ) {}
			if( conn != null ) try { conn.close(); } catch( SQLException e ) {}
		}	
		
		return centerLists;
	}
	
	
	
}
