package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiagnosisDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/DiagnosisServlet")
public class DiagnosisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiagnosisServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    // 購入診断画面にフォワードする
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/diagnosis.jsp");
		dispatcher.forward(request, response);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//リクエストパラメータを取得する Integer.parseInt();でint型に直す
		request.setCharacterEncoding("UTF-8");
		String shouhin = request.getParameter("shouhin");
		int money = Integer.parseInt(request.getParameter("money"));
		int use_year = Integer.parseInt(request.getParameter("use_year"));
		
		//インスタンス生成
		DiagnosisDAO dao = new DiagnosisDAO();
		//DAOの呼び出し
		dao.register(shouhin, money, use_year);
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/diagnosis.jsp");
        dispatcher.forward(request, response);
	}

}
	


