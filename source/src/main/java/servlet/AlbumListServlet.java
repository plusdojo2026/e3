package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Sl_AlDAO;
import dto.CommonDTO;
import dto.Loginuser;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/AlbumListServlet")
public class AlbumListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlbumListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		HttpSession session = request.getSession();
		Loginuser loginuser = (Loginuser) session.getAttribute("userid");
		
		if (loginuser == null) {
			response.sendRedirect("/e3/LoginServlet");
			return;
		}
		
        String sort = request.getParameter("sort");
        System.out.println("sort = " + sort);

        String table = "rireki";
        String column = "id";
        String order = "ASC";

        if (sort != null) {	//並び替え項目と順番の決定
            switch (sort) {
                case "progress_asc":
                    column = "progress";
                    order = "ASC";
                    break;

                case "progress_desc":
                    column = "progress";
                    order = "DESC";
                    break;

                case "day_price_asc":
                    column = "day_price";
                    order = "ASC";
                    break;

                case "day_price_desc":
                    column = "day_price";
                    order = "DESC";
                    break;

                case "id_asc":
                    column = "id";
                    order = "ASC";
                    break;

                case "id_desc":
                    column = "id";
                    order = "DESC";
                    break;
            }
        }

        Sl_AlDAO dao = new Sl_AlDAO();
        List<CommonDTO> list = dao.sort(table, column, order, loginuser);

        request.setAttribute("list", list);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/albumList.jsp");
        dispatcher.forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
