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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		  
		HttpSession session = request.getSession();
		Loginuser loginuser = (Loginuser) session.getAttribute("userid");
		
		if (loginuser == null) {
			response.sendRedirect("/e3/LoginServlet");
			return;
		}
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
		
		HttpSession session = request.getSession();
		Loginuser loginUser =
			    (Loginuser) session.getAttribute("userid");

			String userid = loginUser.getUserid();
			
		request.setCharacterEncoding("UTF-8");

		List<String> errors = new ArrayList<>();
		
	    // フォームの値取得
	    String genre = request.getParameter("genre");
	    String shouhin = request.getParameter("shouhin");
	    String buyDate = request.getParameter("buy_date");
	    
	   //未来の日付の入力不可
	    if(buyDate != null && !buyDate.isEmpty()) {
	    	
	    	LocalDate date = LocalDate.parse(buyDate);
	    	
	    	if(date.isAfter(LocalDate.now())) {
	    		errors.add("未来の日付は入力できません");
	    	}
	    }
	    String maker = request.getParameter("maker");
	    String nickname = request.getParameter("nickname");
	    
	    
	    //愛称チェック 未入力な場合はエラーメッセージをerrorに追加する
	    if (nickname == null || nickname.trim().isEmpty()) {
	    	errors.add("愛称を入力してください");
	    }
	    
	   //フレーム
	    String frameStr = request.getParameter("frame");
	   
	    int frame = 0;

	    try {
	    	if(frameStr != null && !frameStr.isEmpty()){
		        frame = Integer.parseInt(frameStr);
		    }
	    } catch(NumberFormatException e) {
	    	errors.add("フレームの値が不正です。");
	    }
	   
	    //価格
	    int price = 0;
	    String priceStr = request.getParameter("price");
	    
	    if(priceStr == null || priceStr.isEmpty()) {
	    	errors.add("価格を入力してください");
	    	
	    } else {
	    	try {
		    	if(priceStr.contains(".")) {
		    		double d = Double.parseDouble(priceStr);
		    		
		    		int round = (int)Math.round(d);        //四捨五入
		    		
		    		request.setAttribute(
		    				"suggest",   
		    				"価格に小数が含まれています。\n"
		    				+ round
		    				+"円として登録します");
		    		
		    		price = round;
		    		
		    	} else {
		    		price = Integer.parseInt(priceStr);
		    	}
		    	
		    	if(price <= 0) {
		    		errors.add("価格は1以上で入力してください");
		    	}
		    	
		    } catch(NumberFormatException e) {
		    	errors.add("価格の値が不正です");
		    }

	    }
	    
	    	    
	    //寿命 マイナスや0の登録の防止
	    int life = 0;
	    String lifeStr = request.getParameter("life");
	    
	    if(lifeStr == null || lifeStr.isEmpty()) {
	    	errors.add("寿命を入力してください");
	    	
	    } else {
	    	try {
		    	if(lifeStr.contains(".")) {
		    		errors.add("寿命は整数で入力してください");
		    	}
		    	life = Integer.parseInt(lifeStr);
		    	
		    	if(life <= 0) {
		    		errors.add("寿命は1以上で入力してください");
		    	}
		    	
		    } catch(NumberFormatException e) {
		    	errors.add("寿命の値が不正です");
		    }
	    }
	    	
	    

	    //保証期間　　　　マイナスの値が入力されないように
	    String wperiodStr = request.getParameter("wperiod");
	    //未入力を防ぐため初期値に0を設定
	    int wperiod = 0;
	    //保証期間が入力されているときのみ数値の変換を行う
	    if (wperiodStr != null && !wperiodStr.isEmpty()) {
	    	try {
	    		wperiod = Integer.parseInt(wperiodStr);
	    		
	    		if(wperiod < 0) {
	    			errors.add("保証期間は0以上で入力してください");
	    		}
	    		
	    	} catch(NumberFormatException e) {
	    		errors.add("保証期間が不正です");
	    	}
	        
	    }
	    
	    //画像　　画像ファイル以外の登録不可
	    Part file  = request.getPart("itemImage");
	    
	    if (file != null && file.getSize() > 0) {
	    	String contentType = file.getContentType();
	    	
	    	if(contentType == null || !contentType.startsWith("image/")) {
	    		errors.add("画像ファイルを選択してください");
	    	}
	    }
	    
	    //画像データ取得
	    byte[] imageData = null;
	    
	    if(file != null && file.getSize() > 0) {
	    	imageData = file.getInputStream().readAllBytes();
	    }
	    
	    //エラーが一つでもあれば登録処理の中断
	    if(!errors.isEmpty()) {
	    	
	    	request.setAttribute("errors", errors);
	    	
	    	RequestDispatcher dispatcher = 
	    			request.getRequestDispatcher("/WEB-INF/jsp/register.jsp");
	    	
	    	dispatcher.forward(request, response);
	    	return;
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
	    dto.setFrame(frame);
	    
	    LocalDate buy = LocalDate.parse(buyDate);

	    int progress =
	        (int) ChronoUnit.DAYS.between(
	            buy,
	            LocalDate.now()
	        );

	    int goal = life * 365;

	     int dayPrice =
	    	    progress == 0
	    	    ? price
	    	    : price / progress;

	    dto.setProgress(progress);
	    dto.setGoal(goal);
	    dto.setDay_price(dayPrice);
	    dto.setNickname(nickname);
	    dto.setImg(imageData);
	    dto.setUserid(userid);

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
	
