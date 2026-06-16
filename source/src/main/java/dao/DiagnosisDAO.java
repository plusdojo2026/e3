package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DiagnosisDAO {

	private static final String URL = "jdbc:mysql://localhost:3306/monocolledb?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "root";
	private static final String PASS = "password";

	public boolean register(String shouhin, int money, int use_year) { //day_priceは計算で出すため。
		Connection conn = null;
		boolean result = false;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USER, PASS);
			
			String sql = "INSERT INTO diagnosis(shouhin, money, use_year, day_price) VALUES(?, ?, ?, ?)";
			
			// SQLインジェクション対策
			PreparedStatement pStmt = conn.prepareStatement(sql); 
			
			 //サーブレットへ ?に項目が入る
			pStmt.setString(1,shouhin);
			pStmt.setInt(2,money);
			pStmt.setInt(3,use_year);
			
			// 計算 (キャスト) Math.roundは四捨五入
			int day_price = (int) Math.round(money/(use_year*365));
			pStmt.setInt(4,day_price);
			
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}

		return result;
		
	}
	
	
}

