package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.Reg_EdiDAO;
import dto.CommonDTO;
import dto.Loginuser;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
  
    //編集画面表示
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			  throws ServletException, IOException {
    	
    	HttpSession session = request.getSession();
		Loginuser loginuser = (Loginuser) session.getAttribute("userid");
		
		if (loginuser == null) {
			response.sendRedirect("/e3/LoginServlet");
			return;
		}
		//URLパラメータから商品IDを取得      
		String idStr = request.getParameter("id");
		//IDがない場合は一覧画面へ戻る
		if (idStr == null) {
		    response.sendRedirect("ShouhinListServlet");
		    return;
		}
		//idStr→数値として扱いたい文字列　文字列をint型に変換
		int id = Integer.parseInt(idStr);
		
		Reg_EdiDAO dao = new Reg_EdiDAO();
	
		//指定されたidの情報を取得
		CommonDTO dto = dao.selectById(id);
		
		request.setAttribute("dto", dto);
		
		//編集画面へ遷移
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/edit.jsp");
		rd.forward(request, response);
		
		
	}
		
		
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
    //編集後の更新処理
    @Override
	protected void doPost(HttpServletRequest request,
	        HttpServletResponse response)
	        throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		//DTO作成
		CommonDTO dto  = new CommonDTO();
		
		//hiddenで送られてきたidをセット
		dto.setId(Integer.parseInt(request.getParameter("id")));
		
		//フォームの入力値をDTOへ格納
		dto.setGenre(request.getParameter("genre"));
		dto.setShouhin(request.getParameter("shouhin"));
		dto.setBuy_date(request.getParameter("buy_date"));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setWperiod(Integer.parseInt(request.getParameter("wperiod")));
		dto.setMaker(request.getParameter("maker"));
		dto.setLife(Integer.parseInt(request.getParameter("life")));
		
		String frame = request.getParameter("frame");
		if(frame == null) {
			dto.setFrame(0);
		} else {
			dto.setFrame(Integer.parseInt(frame));
		}
		
		int progress =
			    (int) ChronoUnit.DAYS.between(
			        LocalDate.parse(dto.getBuy_date()),
			        LocalDate.now());

			int goal = dto.getLife() * 365 - progress;

			int dayPrice =
				    progress == 0
				    ? dto.getPrice()
				    : dto.getPrice() / progress;
	
			dto.setProgress(progress);
			dto.setGoal(goal);
			dto.setDay_price(dayPrice);
		 
		dto.setNickname(request.getParameter("nickname"));
		Part file = request.getPart("itemImage");

		if(file != null && file.getSize() > 0){
		    byte[] imageData = file.getInputStream().readAllBytes();
		    dto.setImg(imageData);
		} else {
			Reg_EdiDAO dao = new Reg_EdiDAO();
			CommonDTO OldDto = dao.selectById(dto.getId());
			
			dto.setImg(OldDto.getImg());
		}
		
		
		//DAO生成
		Reg_EdiDAO dao = new Reg_EdiDAO();
		
		//更新処理実行
		boolean result = dao.update(dto);
		
		//更新成功
		if(result) {
			response.sendRedirect(request.getContextPath() + "/ShouhinListServlet");

		} else {
			//更新失敗
			request.setAttribute("msg","更新に失敗しました");
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/edit.jsp");
			
			rd.forward(request, response);
		}
    }
}