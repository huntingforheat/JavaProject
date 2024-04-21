package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class JDBCinsert {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.print("id>> ");
		String id = scan.next();
		System.out.print("pw>> ");
		String pw = scan.next();
		System.out.print("name>> ");
		String name = scan.next();
		System.out.print("email>> ");
		String email = scan.next();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "insert into members values(?,?,?,?)";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/jdbctest?serverTimezone=Asia/Seoul",
					"jdbc",
					"jdbc");
			System.out.println(conn);
			System.out.println("데이터베이스 접속 성공");
			// 3. sql문 전달객체 생성(prepareStatement)
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			// 4. sql 실행
			int result = pstmt.executeUpdate();
			if(result != 0) {
				System.out.println("레코드 추가 성공");
			} else {
				System.out.println("레코드 추가 실패");
			}
		} catch (ClassNotFoundException ce) {
			System.out.println("드라이버 로드 실패");
		} catch (SQLException sqle) {
			System.out.println("SQL 연동 오류");
			sqle.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {}
		}

	}

}
