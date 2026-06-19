package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.Reg_EdiDAO;
import dto.CommonDTO;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/register.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
	        HttpServletResponse response)
	        throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

	    // フォームの値取得
	    String genre = request.getParameter("genre");
	    String shouhin = request.getParameter("shouhin");
	    String buyDate = request.getParameter("buy_date");
	    String maker = request.getParameter("maker");
	    String nickname = request.getParameter("nickname");

	    int price = Integer.parseInt(request.getParameter("price"));
	    int life = Integer.parseInt(request.getParameter("life"));

	    String wperiodStr = request.getParameter("wperiod");
	    //未入力を防ぐため初期値に0を設定
	    int wperiod = 0;
	    //保証期間が入力されているときのみ数値の変換を行う
	    if (wperiodStr != null && !wperiodStr.isEmpty()) {
	        wperiod = Integer.parseInt(wperiodStr);
	    }
	    
	    //画像取得
	    Part file  = request.getPart("itemImage");
	    
	    
	    
	    byte[] imageData = null;
	    
	    if(file != null && file.getSize() > 0) {
	    	imageData = file.getInputStream().readAllBytes();
	    }
	    
	    // DTOへ格納
	    CommonDTO dto = new CommonDTO();

	    dto.setGenre(genre);
	    dto.setShouhin(shouhin);
	    dto.setBuy_date(buyDate);
	    dto.setPrice(price);
	    dto.setMaker(maker);
	    dto.setWperiod(wperiod);
	    dto.setLife(life);
	    dto.setNickname(nickname);
	    dto.setImg(imageData);

	    // DAO呼び出し
	    Reg_EdiDAO dao = new Reg_EdiDAO();

	    boolean result = dao.insert(dto);

	    //登録成功　商品一覧画面へ
	    if(result) {
	        response.sendRedirect(
	            request.getContextPath() + "/ShouhinListServlet");
	    } else {
	    //登録失敗　登録画面へ戻る
	        response.sendRedirect(
	            request.getContextPath() + "/RegisterServlet");
	    }
     }	
  }
	
