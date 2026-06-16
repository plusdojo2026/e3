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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 登録ページにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		
		String userIdStr = request.getParameter("userId");
		String password = request.getParameter("password");
		String passwordConfirm = request.getParameter("passwordConfirm");
		
		// 未記入
		if((userIdStr ==null || userIdStr.isEmpty()) && (password == null || password.isEmpty())) {
			request.setAttribute("error", "ユーザーIDとパスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}
		
		// パスワードのみ入力
		if((userIdStr ==null || userIdStr.isEmpty()) && (passwordConfirm == null || passwordConfirm.isEmpty())) {
			request.setAttribute("error", "ユーザーIDと確認用パスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}
		
		// ID未入力チェック
		if(userIdStr == null || userIdStr.isEmpty()) {
			request.setAttribute("error", "パスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}
		
		// パスワード未入力チェック
		if(password == null || password.isEmpty()) {
			request.setAttribute("error", "パスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}
		
		// パスワード確認未入力チェック
		if(passwordConfirm == null || passwordConfirm.isEmpty()) {
			request.setAttribute("error", "確認用パスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}
		
		// ----パスワード条件確認----
		// 8文字以上チェック
		if(password.length() < 8) {
			request.setAttribute("error", "パスワードは8文字以上で入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}
		
		// 文字種チェック（数字・大文字・小文字のうち2種類以上）
		boolean hasDigit = password.matches(".*[0-9].*");
		boolean hasUpper = password.matches(".*[A-Z].*");
		boolean hasLower = password.matches(".*[a-z].*");
		
		int typeCount = 0;
		if(hasDigit) typeCount++;
		if(hasUpper) typeCount++;
		if(hasLower) typeCount++;
		
		// パスワード一致チェック
		if(typeCount < 2) {
			request.setAttribute("error", "パスワードが一致しません。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
		}
		
		// DAOに登録（自動採番）
		LoginDAO dao = new LoginDAO();
		int newUserId = dao.getNextUserId();
		
		CommonDTO dto = new CommonDTO(newUserId, password);
		boolean result = dao.insertUser(dto);
		
		if(!result) {
			request.setAttribute("error", "登録に失敗しました。");
			request.getRequestDispatcher("/WEB-INF/jsp/loginRegister.jsp").forward(request, response);
			return;
		}
		
		// 完了メッセージをポップアップ表示
		request.setAttribute("message", "登録が完了しました。");
		
	}

}
