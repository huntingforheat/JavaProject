package com.myweb.user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;

public class UsersDAO {

	private DataSource ds;
	
	private static UsersDAO instance = new UsersDAO();
	
	private UsersDAO() {
		try {
			InitialContext ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql2");
		} catch (NamingException e) {
			System.out.println("커넥션 풀링 에러 발생");
		}
	}
	
	public static UsersDAO getInstance() {
		return instance;
	}
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
//	public int join(UsersVO vo) {
//		int result = 0;
//		
//		String sql = "insert into user values(?,?,?,?,?,?)";
//		
//		try {
//			conn = ds.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setString(1, vo.getId());
//			pstmt.setString(2, vo.getPw());
//			pstmt.setString(3, vo.getName());
//			pstmt.setString(4, vo.getEmail());
//			pstmt.setString(5, vo.getAddress());
//			pstmt.setString(6, vo.getRegdate());
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//		} finally {
//			try {
//				
//			} catch (Exception e2) {
//				// TODO: handle exception
//			}
//		}
//		
//		return result;
//	}
	
	// 중복확인 메서드
	public int IdConfirm(String id) {
		int result = 0;
		
		String sql = "select * from users where id = ?";
		
		try {
			// Connection Pool
			conn = ds.getConnection();
			
			// PreparedStatement
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			// SQL 실행
			rs = pstmt.executeQuery();
			if(rs.next()) result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 회원 가입 메서드
	
	public int join(UsersVO vo) {
		int result = 0;
		
		String sql = "insert into users(id, pw, name, email, address) values (?,?,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getAddress());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public int IdPw_check(String id, String pw) {
		int result = 0;
		
		String sql = "select * from users where id = ? and pw = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) result = 1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 회원정보를 얻어오는 메서드
	public UsersVO getUserInfo(String id1) {
		UsersVO vo = null;
		
		String sql = "select * from users where id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id1);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String address = rs.getString("address");
				Timestamp regdate = rs.getTimestamp("regdate");
				
				vo = new UsersVO(id, null, name, email, address, regdate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	public int update(UsersVO vo) {
		int result = 0;
		
		String sql = "update users set name = ?, email = ?, address = ? where id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getEmail());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	public int change_pw(String id, String new_pw) {
		int result = 0;
		
		String sql = "update users set pw = ? where id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, new_pw);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 회원 삭제
	public int delete(String id) {
		int result = 0;
		
		String sql = "delete from users where id = ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}

}
