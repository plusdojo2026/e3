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

import dao.Men_RanDAO;
import dto.CommonDTO;
import dto.Loginuser;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/RankingServlet")
public class RankingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RankingServlet() {
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
    	
    	
        String sort = request.getParameter("sort_");
		Men_RanDAO dao = new Men_RanDAO();
		List<CommonDTO> rankingList = dao.getRanking(sort, loginuser);

        request.setAttribute("rankingList", rankingList);

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("/WEB-INF/jsp/ranking.jsp");
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
