package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LoginDAO;
import dto.CommonDTO;
import dto.Loginuser;

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
		String userid = request.getParameter("userId");
		String password = request.getParameter("password");
		
		// ログイン処理
		// 入力チェック(ユーザーID未入力)
		if((userid == null || userid.isEmpty()) && (password == null || password.isEmpty())) {
			request.setAttribute("error", "ユーザーIDとパスワードを入力してください。");
			request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
			return;
		}
		 
        if (userid == null || userid.isEmpty()) {
        	request.setAttribute("error", "ユーザーIDを入力してください。");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            return;
        }
        
        if(password == null || password.isEmpty()) {
        // 入力チェック(パスワード未入力)
            request.setAttribute("error", "パスワードを入力してください。");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            return;
        }
        
        // 数値チェック　★修正6/24テスト後
        try {
        	Integer.parseInt(userid); // ★追加
        } catch (NumberFormatException e) {
        	request.setAttribute("error", "IDは数値で入力してください。");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
            return;
        }

        // DAO呼び出し
        LoginDAO dao = new LoginDAO();
        
        if (dao.login(new CommonDTO(userid, password))) {
            // ログイン成功
        	HttpSession session = request.getSession();
            session.setAttribute("userid", new Loginuser(userid));
            // メニュー画面(MenuServlet)へ
            response.sendRedirect("/e3/MenuServlet");
        } else {
            // ログイン失敗
        	// リクエストスコープに、タイトル、メッセージ、戻り先を格納する
        	request.setAttribute("error", "ログインIDまたはパスワードに誤りがあります");
            request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
        }
	}

}
