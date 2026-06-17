package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Sd_AdDAO;
import dto.CommonDTO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/ShouhinDetailServlet")
public class ShouhinDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShouhinDetailServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("shouhinid"));
		Sd_AdDAO dao = new Sd_AdDAO();
		
		if(action == null) {
			CommonDTO shouhininfo = dao.shouhinInfo(id);
			
			request.setAttribute("shouhininfo", shouhininfo);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/shouhinDetail.jsp");
			dispatcher.forward(request, response);
		}else if(action.equals("rireki")) {
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/shouhinDetail.jsp");
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
