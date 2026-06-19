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
 * Servlet implementation class AlbumDetailServlet
 */
@WebServlet("/AlbumDetailServlet")
public class AlbumDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("shouhinid"));
		Sd_AdDAO dao = new Sd_AdDAO();
		
		if(action == null) {
			CommonDTO rirekiinfo = dao.rirekiInfo(id);
			
			request.setAttribute("rirekiinfo", rirekiinfo);

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/albumDetail.jsp");
			dispatcher.forward(request, response);
		}else if(action.equals("delete")) {
			boolean success = dao.deleterireki(id);

			if (success) {
				response.sendRedirect(request.getContextPath() + "/AlbumListServlet?deleted=true");
			} else {
				response.sendRedirect(request.getContextPath() + "/AlbumDetailServlet?shouhinid=" + id + "&error=delete");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
