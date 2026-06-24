package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.CommonDTO;

public class Reg_EdiDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "9PSp2kThXYGG8mC5";
	
	//登録
	public boolean insert(CommonDTO dto) {
	    Connection conn = null;
	    PreparedStatement pStmt = null;

	    try {
	    	//JDBCファイル読み込み
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        //DB接続
	        conn = DriverManager.getConnection(URL, USER, PASS);     
	        
	        String sql =
	                "INSERT INTO shouhin (" +
	                "genre, shouhin, buy_date, price," +
	                "wperiod, maker, life," +
	                "day_price, progress, goal," +
	                "nickname, frame, img, userid" +
	                ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	        // SQLインジェクション対策
	        pStmt = conn.prepareStatement(sql);

	     	pStmt.setString(1, dto.getGenre());
	     	pStmt.setString(2, dto.getShouhin());
	     	pStmt.setDate(3, java.sql.Date.valueOf(dto.getBuy_date()));
	     	pStmt.setInt(4, dto.getPrice());
	     	pStmt.setInt(5, dto.getWperiod());
	     	pStmt.setString(6, dto.getMaker());
	     	pStmt.setInt(7, dto.getLife());

	     	pStmt.setDouble(8, dto.getDay_price());     // 仮
	     	pStmt.setInt(9, dto.getProgress());         // 仮
	     	pStmt.setInt(10, dto.getGoal());            // 仮

	     	pStmt.setString(11, dto.getNickname());
	     	pStmt.setInt(12, dto.getFrame());
	     	pStmt.setBytes(13, dto.getImg());
	     	pStmt.setString(14, dto.getUserid());
	     	
	     	
	     	
	        int result = pStmt.executeUpdate();

	        return result > 0;

	    } catch (Exception e) {

	        e.printStackTrace();
	        return false;

	    } finally {

	        try {
	            if (pStmt != null) pStmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
                e.printStackTrace();
            }
          }
	    }
	
	//編集
	public boolean update(CommonDTO dto) {
	    Connection conn = null;
	    PreparedStatement pStmt = null;
	
	    try {
	    	//JDBCファイル読み込み
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        //DB接続
	        conn = DriverManager.getConnection(URL, USER, PASS);
	        
	        //更新SQL
	        String sql =
	        	    "UPDATE shouhin SET " +
	        	    "genre=?, shouhin=?, buy_date=?, price=?," +
	        	    "wperiod=?, maker=?, life=?," +
	        	    "day_price=?, progress=?, goal=?," +
	        	    "nickname=?, frame=?, img=? " +
	        	    "WHERE id=?";
	
	        // SQLインジェクション対策
	            pStmt = conn.prepareStatement(sql);
	
	            pStmt.setString(1, dto.getGenre());
	            pStmt.setString(2, dto.getShouhin());
	            pStmt.setDate(3, java.sql.Date.valueOf(dto.getBuy_date()));
	            pStmt.setInt(4, dto.getPrice());
	            pStmt.setInt(5, dto.getWperiod());
	            pStmt.setString(6, dto.getMaker());
	            pStmt.setInt(7, dto.getLife());
	            pStmt.setDouble(8, dto.getDay_priceInt());     // 仮
		     	pStmt.setInt(9, dto.getProgress());         // 仮
		     	pStmt.setInt(10, dto.getGoal());            //　仮  
		     	pStmt.setString(11, dto.getNickname());
		     	pStmt.setInt(12, dto.getFrame());
		     	pStmt.setBytes(13, dto.getImg());
		     	pStmt.setInt(14, dto.getId());
	
	        //SQL実行
	        int result = pStmt.executeUpdate();
	        //成功ならtrue
	        return result > 0;
	
	    } catch (Exception e) {
	
	        e.printStackTrace();
	        
	        //エラーの時
	        return false;
	
	    } finally {
	
	        try {
	            if (pStmt != null) pStmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	} 

	
	//idを指定して商品情報を１件取得
	public CommonDTO selectById(int id) {
		
		CommonDTO dto = null;
		
		try {
			//JDBCドライバ読み込み
			 Class.forName("com.mysql.cj.jdbc.Driver");
				
				//DB接続
		       Connection conn = DriverManager.getConnection(URL, USER, PASS);
			//指定されたidの商品を取得
		       String sql = 
		    		   "SELECT * FROM shouhin WHERE id = ?";
		    
		    // SQLインジェクション対策
		       PreparedStatement pStmt = conn.prepareStatement(sql);
		    
		    //?にidをセット
		       pStmt.setInt(1,  id);
	       
		    //select実行
		       ResultSet rs = pStmt.executeQuery();
		       
		    //データが見つかった場合
		       if(rs.next()) {

		    	   //DTO生成
		    	   dto = new CommonDTO();
		    	   
		    	   //dbからdtoへ格納
		    	   dto.setId(rs.getInt("id"));
		    	   dto.setGenre(rs.getString("genre"));
		    	   dto.setShouhin(rs.getString("shouhin"));
		    	   dto.setBuy_date(rs.getString("buy_date"));
		    	   dto.setPrice(rs.getInt("price"));
		    	   dto.setWperiod(rs.getInt("wperiod"));
		    	   dto.setMaker(rs.getString("maker"));
		    	   dto.setLife(rs.getInt("life"));
		    	   dto.setDay_price(rs.getInt("day_price"));
		    	   dto.setProgress(rs.getInt("progress"));
		    	   dto.setGoal(rs.getInt("goal"));
		    	   dto.setNickname(rs.getString("nickname"));
		    	   dto.setFrame(rs.getInt("frame"));
		    	   dto.setImg(rs.getBytes("img"));
		    	   dto.setUserid(rs.getString("userid"));
		    	   
		    	   
		       }
		    	   //ResultSet を閉じる
		    	   rs.close();
		    	   //PreparedStatement を閉じる
		    	   pStmt.close();
		    	   //Connection を閉じる
		    	   conn.close();
		    	 
		       } catch (Exception e) {
		            e.printStackTrace();
		       }
		
		return dto;
	}
  }
	
		