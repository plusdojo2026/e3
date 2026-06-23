package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Men_RanDAO;
import dto.CommonDTO;
import dto.Loginuser;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MenuServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Loginuser loginuser = (Loginuser) session.getAttribute("userid");
		
		/*if (loginuser == null) {
			response.sendRedirect("/e3/LoginServlet");
			return;
		}*/

		// DAO,DTO呼び出し、使用
		Men_RanDAO dao = new Men_RanDAO();

		List<CommonDTO> list = dao.wpNotification(loginuser);
		CommonDTO img = null;
		List<CommonDTO> imglist = dao.getRandomImg(loginuser);
		List<CommonDTO> nickname_random = dao.getRandomNickname(loginuser);
		int total = dao.getTotalDayPrice(loginuser);

		//imgを一件だけにする
		if(!imglist.isEmpty()) {
			img = imglist.get(0);
		}
		
		// JSPに渡す
		request.setAttribute("nickname", list);
		request.setAttribute("nickname_random", nickname_random);
		request.setAttribute("img", img);
		request.setAttribute("total", total);

		// フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/menu.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}