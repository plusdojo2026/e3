package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dto.CommonDTO;

public class Reg_EdiDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "password";
	
	//登録
	public boolean insert(CommonDTO dto) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;

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
	                "nickname, img" +
	                ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	        // SQLインジェクション対策
	     	PreparedStatement pStmt = conn.prepareStatement(sql);

	            pStmt.setString(1, dto.getGenre());
	            pStmt.setString(2, dto.getShouhin());
	            pStmt.setDate(3, java.sql.Date.valueOf(dto.getBuy_date()));
	            pStmt.setInt(4, dto.getPrice());
	            pStmt.setInt(5, dto.getWperiod());
	            pStmt.setString(6, dto.getMaker());
	            pStmt.setInt(7, dto.getLife());

	            pStmt.setDouble(8, dto.getDay_price());
	            pStmt.setInt(9, dto.getProgress());
	            pStmt.setInt(10, dto.getGoal());

	            pStmt.setString(11, dto.getNickname());
	            pStmt.setBytes(12, dto.getImg());


	        int result = pStmt.executeUpdate();

	        return result > 0;

	    } catch (Exception e) {

	        e.printStackTrace();
	        return false;

	    } finally {

	        try {
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
                e.printStackTrace();
            }
          }
	    }
	
	//編集
	public boolean update(CommonDTO dto) {
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	
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
	                "nickname=?, img=?" +
	                "WHERE id=?";
	
	        // SQLインジェクション対策
	     	PreparedStatement pStmt = conn.prepareStatement(sql);
	
	            pStmt.setString(1, dto.getGenre());
	            pStmt.setString(2, dto.getShouhin());
	            pStmt.setDate(3, java.sql.Date.valueOf(dto.getBuy_date()));
	            pStmt.setInt(4, dto.getPrice());
	            pStmt.setInt(5, dto.getWperiod());
	            pStmt.setString(6, dto.getMaker());
	            pStmt.setInt(7, dto.getLife());
	
	            pStmt.setDouble(8, dto.getDay_price());
	            pStmt.setInt(9, dto.getProgress());
	            pStmt.setInt(10, dto.getGoal());
	
	            pStmt.setString(11, dto.getNickname());
	            pStmt.setBytes(12, dto.getImg());
	            pStmt.setInt(13, dto.getId());
	
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
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	      }
	    }
	
	}
