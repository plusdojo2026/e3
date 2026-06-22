package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CommonDTO;
import dto.Loginuser;

public class DiagnosisDAO {

	// ---登録---
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "password";

	public boolean register(String shouhin, int money, int use_year, Loginuser loginuser) { // day_priceは計算で出すため。
		Connection conn = null;
		boolean result = false;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USER, PASS);

			String sql = "INSERT INTO diagnosis(shouhin, money, use_year, day_price, userid) VALUES(?, ?, ?, ?, ?)";

			// SQLインジェクション対策
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// サーブレットへ ?に項目が入る
			pStmt.setString(1, shouhin);
			pStmt.setInt(2, money);
			pStmt.setInt(3, use_year);
			pStmt.setString(4, loginuser.getUserid());

			// 一日当たり価格の計算
			int day_price = money;
			/* 0除算対策 */
			if (!(use_year <= 0)) {
				/* (キャスト) Math.round四捨五入でint型に*/
				day_price = (int)Math.round(money / (use_year * 365));
			} else if(!(use_year == 0)) {
				day_price = 0;
			}
			
			pStmt.setInt(4, day_price);

			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}

		// 結果を返す
		return result;

	}

//結果一覧を取得するメソッド
	public List<CommonDTO> findAll(Loginuser loginuser) {
		List<CommonDTO> diagnosisList = new ArrayList<>();// 検索結果を入れるコレクション
		Connection conn = null;// 接続の確認
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(URL, USER, PASS);// データベースに接続する

			// 一覧表示 DESC LIMIT 50:降順で50件表示
			String sql = "SELECT id, shouhin, money, use_year, day_price, userid  FROM diagnosis WHERE userid = ? ORDER BY id DESC LIMIT 50";

			// SQLインジェクション対策
			PreparedStatement pStmt = conn.prepareStatement(sql);
			
			/* ?にセット */
			pStmt.setString(1, loginuser.getUserid());

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// データベースの結果を一行ずつ返す→Resultsetが次の行に進む
			while (rs.next()) {
				CommonDTO shouhin = new CommonDTO(rs.getInt("id"), rs.getString("shouhin"), rs.getInt("money"),
						rs.getInt("use_year"), rs.getInt("day_price"));
				diagnosisList.add(shouhin);
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// データベースを切断
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}

		// 結果を返す
		return diagnosisList;

	}

	/* 行の削除 [DELETEは行ごと行われる] */
	public boolean delete(int id) { 
		Connection conn = null;
		boolean result = false;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // JDBCドライバを読み込む
			conn = DriverManager.getConnection(URL, USER, PASS); // データベースに接続する
			
			// SQL文を準備する
			// 行の削除 // id指定で良い？
			String sql = "DELETE FROM diagnosis WHERE id = ?";
			
			// SQLインジェクション対策
			PreparedStatement pStmt = conn.prepareStatement(sql); 
			
			// SQL文を完成させる　//　prepareStatementの一個目の?に受け取ったidをセット
			pStmt.setInt(1, id);
			
			// この記述は何？　INSERT/UPDATE/DELETE 専用	
			if (pStmt.executeUpdate() == 1) {
				result = true;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// データベースを切断
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}

		// 結果を返す
		return result;
		
	}

}
