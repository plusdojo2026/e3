package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CommonDTO;

public class DiagnosisDAO {

	// ---登録---
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "password";

	public boolean register(String shouhin, int money, int use_year) { // day_priceは計算で出すため。
		Connection conn = null;
		boolean result = false;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USER, PASS);

			String sql = "INSERT INTO diagnosis(shouhin, money, use_year, day_price) VALUES(?, ?, ?, ?)";

			// SQLインジェクション対策
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// サーブレットへ ?に項目が入る
			pStmt.setString(1, shouhin);
			pStmt.setInt(2, money);
			pStmt.setInt(3, use_year);

			// 一日当たり価格の計算
			// (キャスト) Math.round四捨五入でint型に
			int day_price = (int) Math.round(money / (use_year * 365));
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
	public List<CommonDTO> findAll() {
		List<CommonDTO> diagnosisList = new ArrayList<>();// 検索結果を入れるコレクション
		Connection conn = null;// 接続の確認
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			conn = DriverManager.getConnection(URL, USER, PASS);// データベースに接続する

			// 一覧表示
			String sql = "SELECT shouhin, money, use_year, day_price  FROM diagnosis";

			// SQLインジェクション対策
			PreparedStatement pStmt = conn.prepareStatement(sql);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// データベースの結果を一行ずつ返す→Resultsetが次の行に進む
			while (rs.next()) {
				// int id = rs.getInt("id"); // idいる？
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

	/* 行の削除 */
	public boolean delete(int id) { // day_priceは計算で出すため。
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
			
			// SQL文を完成させる
			pStmt.setInt(1, id);
			
			// この記述は何？// この記述は何？　INSERT/UPDATE/DELETE 専用	
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
