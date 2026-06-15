package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommonDAO;
import dto.CommonDTO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ログインページにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("user_id");
		String password = request.getParameter("password");
		
		// ログイン処理
		// 入力チェック(ID未入力)
        if (userId == null || userId.isEmpty()) {
        	request.setAttribute("error", "パスワードを入力してください。");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        // 入力チェック(パスワード未入力)
        if(password == null || password.isEmpty()) {
            request.setAttribute("error", "パスワードを入力してください。");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // DB 呼び出し
        CommonDAO dao = new CommonDAO();
        CommonDTO user = null; // TODO: dao.login(userId, password);

        if (user == null) {
            // ログイン成功
        	HttpSession session = request.getSession();
            session.setAttribute("user", user);
            // メニュー画面(Menu.jsp)へ
            response.sendRedirect("menu.jsp");
        } else {
            // ログイン失敗
        	// リクエストスコープに、タイトル、メッセージ、戻り先を格納する
        	request.setAttribute("error", "ログインIDまたはパスワードに誤りがあります");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
	}

}
