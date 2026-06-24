package servlet;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

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

    	// エラー格納用
    	List<String> errors = new ArrayList<>();

    	String nickname = request.getParameter("nickname");
    	String priceStr = request.getParameter("price");
    	String lifeStr = request.getParameter("life");
    	String buyDate = request.getParameter("buy_date");
    	String wperiodStr = request.getParameter("wperiod");
    	
    	// 愛称
    	if(nickname == null || nickname.trim().isEmpty()){
    	    errors.add("愛称を入力してください");
    	}

    	// 未来日付
    	if(buyDate != null && !buyDate.isEmpty()){
    	    LocalDate date = LocalDate.parse(buyDate);

    	    if(date.isAfter(LocalDate.now())){
    	        errors.add("未来の日付は入力できません");
    	    }
    	}

    	// 価格
    	if(priceStr == null || priceStr.isEmpty()){

    	    errors.add("価格を入力してください");

    	}else{

    	    try{

    	        if(priceStr.contains(".")){
    	            errors.add("価格は整数で入力してください");
    	        }

    	        int price = Integer.parseInt(priceStr);

    	        if(price <= 0){
    	            errors.add("価格は1以上で入力してください");
    	        }

    	    }catch(NumberFormatException e){
    	        errors.add("価格が大きすぎます");
    	    }
    	}

    	// 寿命
    	if(lifeStr == null || lifeStr.isEmpty()){

    	    errors.add("寿命を入力してください");

    	}else{

    	    try{

    	        if(lifeStr.contains(".")){
    	            errors.add("寿命は整数で入力してください");
    	        }

    	        int life = Integer.parseInt(lifeStr);

    	        if(life <= 0){
    	            errors.add("寿命は1以上で入力してください");
    	        }

    	    }catch(NumberFormatException e){
    	        errors.add("寿命の値が不正です");
    	    }
    	}

    	// 保証期間
    	if(wperiodStr != null && !wperiodStr.isEmpty()){

    	    try{

    	        int wperiod = Integer.parseInt(wperiodStr);

    	        if(wperiod < 0){
    	            errors.add("保証期間は0以上で入力してください");
    	        }

    	    }catch(NumberFormatException e){
    	        errors.add("保証期間が不正です");
    	    }
    	}
    	
    	if(!errors.isEmpty()){

    	    request.setAttribute("errors", errors);

    	    Reg_EdiDAO dao = new Reg_EdiDAO();

    	    CommonDTO dto =
    	        dao.selectById(
    	            Integer.parseInt(request.getParameter("id"))
    	        );

    	    request.setAttribute("dto", dto);

    	    RequestDispatcher rd =
    	        request.getRequestDispatcher("/WEB-INF/jsp/edit.jsp");

    	    rd.forward(request, response);
    	    return;
    	}
		
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

		    String contentType = file.getContentType();

		    if(contentType == null ||
		       !contentType.startsWith("image/")){

		        errors.add("画像ファイルを選択してください");
		    }
		}

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