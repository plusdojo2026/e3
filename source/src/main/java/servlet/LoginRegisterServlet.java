package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoginDAO;
import dto.CommonDTO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginRegisterServlet")
public class LoginRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginRegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 登録ページにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");

		String password = request.getParameter("password");
		String passwordConfirm = request.getParameter("passwordConfirm");

		// 全部 未入力
		if ((password == null || password.isEmpty()) && (passwordConfirm == null || passwordConfirm.isEmpty())) {
			request.setAttribute("error", "パスワード・確認用パスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}

		// パスワード 未入力
		if (password == null || password.isEmpty()) {
			request.setAttribute("error", "パスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}

		// 確認用パスワード 未入力
		if (passwordConfirm == null || passwordConfirm.isEmpty()) {
			request.setAttribute("error", "確認用パスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}

		// パスワード一致チェック
		if (!(password.equals(passwordConfirm))) {
			request.setAttribute("error", "パスワードと確認パスワードが一致しません。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}

		// ----パスワード条件確認----
		// 8文字以上チェック
		if (password.length() < 8) {
			request.setAttribute("error", "パスワードは8文字以上で入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}

		// 文字種チェック（数字・大文字・小文字のうち2種類以上）
		boolean hasDigit = password.matches(".*[0-9].*");
		boolean hasUpper = password.matches(".*[A-Z].*");
		boolean hasLower = password.matches(".*[a-z].*");

		int typeCount = 0;
		if (hasDigit)
			typeCount++;
		if (hasUpper)
			typeCount++;
		if (hasLower)
			typeCount++;

		// パスワード文字種チェック
		if (typeCount < 2) {
			request.setAttribute("error", "パスワードには文字種を2種類以上含めて下さい。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}

		// DAOに登録（自動採番）
		LoginDAO dao = new LoginDAO();

		CommonDTO dto = new CommonDTO(password);
		int userId = dao.insertUserAndGetId(dto);

		if (userId != -1) {	// 登録成功
			request.setAttribute("userId", userId);
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		} else {	//登録失敗
			request.setAttribute("error", "登録に失敗しました。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}
	}
}
