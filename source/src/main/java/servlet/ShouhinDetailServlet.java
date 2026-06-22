package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Sd_AdDAO;
import dto.CommonDTO;
import dto.Loginuser;

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
		
		HttpSession session = request.getSession();
		Loginuser loginuser = (Loginuser) session.getAttribute("userid");
				
		if (loginuser == null) {
			response.sendRedirect("/e3/LoginServlet");
			return;
		}

		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("shouhinid"));
		Sd_AdDAO dao = new Sd_AdDAO();

		if (action == null) {
			CommonDTO shouhininfo = dao.shouhinInfo(id);

			request.setAttribute("shouhininfo", shouhininfo);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/shouhinDetail.jsp");
			dispatcher.forward(request, response);
		} else if (action.equals("rireki")) {
			boolean insertSuccess = dao.insertRireki(id);

			if (insertSuccess) {

				boolean deleteSuccess = dao.deleteShouhin(id);

				if (deleteSuccess) {
					response.sendRedirect(request.getContextPath() + "/ShouhinListServlet?rireki=true");
				} else {
					response.sendRedirect(
							request.getContextPath() + "/ShouhinDetailServlet?shouhinid=" + id + "&error=delete");
				}
			} else {

				response.sendRedirect(
						request.getContextPath() + "/ShouhinDetailServlet?shouhinid=" + id + "&error=insert");
			}

		} else if (action.equals("delete")) {
			boolean success = dao.deleteShouhin(id);

			if (success) {
				response.sendRedirect(request.getContextPath() + "/ShouhinListServlet?deleted=true");
			} else {
				response.sendRedirect(
						request.getContextPath() + "/ShouhinDetailServlet?shouhinid=" + id + "&error=delete");
			}
		}
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
