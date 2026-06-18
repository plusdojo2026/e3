package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DiagnosisDAO;
import dto.CommonDTO;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// doGet
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// もしもログインしていなかったらログインサーブレットにリダイレクトする
		/*
		 * HttpSession session = request.getSession(); if (session.getAttribute("id") ==
		 * null) { response.sendRedirect("/LoginServlet"); return; }
		 */

		// ---診断結果リストの一覧表示---
		DiagnosisDAO dao = new DiagnosisDAO();
		List<CommonDTO> diagnosisList = dao.findAll(); // 変数の宣言
		// dao.findAll();

		// 診断結果をリクエストスコープに格納する
		request.setAttribute("diagnosisList", diagnosisList);

		// 購入診断ページにフォワードする
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/diagnosis.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// doPost
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// フォームから値を受け取る(getParameter) Integer.parseInt();でint型に直す
		request.setCharacterEncoding("UTF-8");
		// インスタンス生成 (データベース処理を行う専用のクラス)
		DiagnosisDAO dao = new DiagnosisDAO();
		// ボタンの種類を確認
		String button = request.getParameter("diagnosis");
		if (button != null) {
			String shouhin = request.getParameter("shouhin");
			int money = Integer.parseInt(request.getParameter("money"));
			int use_year = Integer.parseInt(request.getParameter("use_year"));

			// ---登録---
			// DAOの呼び出し DBに登録
			dao.register(shouhin, money, use_year);
		} else {

			// ---削除---
			int id = Integer.parseInt(request.getParameter("id"));
			// idだけで良いの？shouhin, money, use_year, day_priceは？
			dao.delete(id); // DELETEは[行ごと]消えるため、idだけで良い。

		}

		// 購入診断ページへredirect
		response.sendRedirect("DiagnosisServlet");
	}

}
