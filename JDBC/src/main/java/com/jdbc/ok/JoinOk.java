package com.jdbc.ok;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.domain.UserDAO;
import com.jdbc.domain.UserVO;

/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public JoinOk() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// form에서 들어오는 값 처리
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String gender = request.getParameter("gender");
		
		// DAO 객체 생성
		UserDAO dao = UserDAO.getInstance();
		
		// VO 객체 생성
		UserVO vo = new UserVO(id, pw, name, phone1, phone2, gender);
		
		// 회원 가입처리
		int result = dao.join(vo);
		if(result == 1) {	// 성공시 처리
			response.sendRedirect("join_success.jsp");
		} else {			// 실패시 처리
			response.sendRedirect("join_fail.jsp");
		}
	}

}
