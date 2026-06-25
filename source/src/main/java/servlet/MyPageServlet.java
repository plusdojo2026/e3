package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MyPageDAO;
import dto.Loginuser;
import dto.MyPageDTO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/MyPageServlet")
public class MyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public MyPageServlet() {
		super();
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Loginuser loginuser = (Loginuser) session.getAttribute("userid");
		String userId = loginuser.getUserid();
		request.setAttribute("userid", userId);

		// フォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		String passwordNow = request.getParameter("passwordNow");
		String passwordNew = request.getParameter("passwordNew");

		// 全部 未入力
		if ((passwordNow == null || passwordNow.isEmpty()) && (passwordNew == null || passwordNew.isEmpty())) {
			request.setAttribute("error", "変更前パスワード・変更後パスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp").forward(request, response);
			return;
		}

		// へんパスワード 未入力
		if (passwordNow == null || passwordNow.isEmpty()) {
			request.setAttribute("error", "変更前パスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp").forward(request, response);
			return;
		}

		// 確認用パスワード 未入力
		if (passwordNew == null || passwordNew.isEmpty()) {
			request.setAttribute("error", "変更後パスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp").forward(request, response);
			return;
		}

		// ----パスワード条件確認----
		// 8文字以上チェック
		if (passwordNew.length() < 8) {
			request.setAttribute("error", "変更後パスワードは8文字以上で入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp").forward(request, response);
			return;
		}
		
		//使用可能文字チェック（記号除外した英数字のみ）★追加6/24テスト後
		if (!passwordNew.matches("^[a-zA-Z0-9]+$")) {
			request.setAttribute("error", "変更後パスワードは英数字のみ使用できます");
			request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp").forward(request, response);
			return;
		} //★追加ここまで)
		
		// 文字種チェック（数字・大文字・小文字のうち2種類以上）
		boolean hasDigit = passwordNew.matches(".*[0-9].*");
		boolean hasUpper = passwordNew.matches(".*[A-Z].*");
		boolean hasLower = passwordNew.matches(".*[a-z].*");

		int typeCount = 0;
		if (hasDigit)
			typeCount++;
		if (hasUpper)
			typeCount++;
		if (hasLower)
			typeCount++;

		// パスワード文字種チェック
		if (typeCount < 2) {
			request.setAttribute("error", "変更後パスワードには文字種を2種類以上含めて下さい。");
			request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp").forward(request, response);
			return;
		}

		// DAOに登録（自動採番）
		MyPageDAO dao = new MyPageDAO();

		MyPageDTO dto = new MyPageDTO(userId, passwordNow, passwordNew);
		int updateCount = dao.updateUser(dto);

		if (updateCount == 1) {	// 登録成功
			request.setAttribute("error", "登録に成功しました。");
			request.setAttribute("userid", userId);
			request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp").forward(request, response);
			return;
		} else {	//登録失敗
			request.setAttribute("error", "登録に失敗しました。");
			request.getRequestDispatcher("/WEB-INF/jsp/mypage.jsp").forward(request, response);
			return;
		}
	}
}