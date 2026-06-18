package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.CommonDTO;

public class Men_RanDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "password";

	// 一日当たり価格の合計を変数totalに格納する準備
	public int getTotalDayPrice() {
		Connection conn = null;
		int total = 0;
		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");
			// データベースへ接続する
			conn = DriverManager.getConnection(URL, USER, PASS);

			// 一日当たり価格を再計算するSQL文をString型で用意
			// case、endはMySQLのif文みたいなもの、耐用年数が0だった場合価格をそのまま表示することでゼロ除算を回避
			// ROUND()で四捨五入
			// 改行は単なる視認性の確保
			String updateSql = "UPDATE shouhin " + "SET day_price = CASE " + "WHEN life = 0 THEN NULL "
					+ "ELSE ROUND(price / (life * 365)) " + "END";
			// uStmtは、pStmtとの被り回避
			PreparedStatement uStmt = conn.prepareStatement(updateSql);
			// updateを実行
			uStmt.executeUpdate();
			uStmt.close();
			// SQL文をString型で用意
			String sql = "SELECT SUM(day_price) AS total FROM shouhin";
			// SQL文をprepareStatement（インジェクション対策）で実行
			PreparedStatement pStmt = conn.prepareStatement(sql);
			// selectを実行、ResultSet型の変数rsに受け取る
			// ResultSetは行と列を持ったデータの集合、表のようなもの
			ResultSet rs = pStmt.executeQuery();
			// rs.next()は0行目の位置にあるrsが1行目に進めるか（次の行が存在するか）
			// 固定費の行数は１のためwhileではなくifを使用

			if (rs.next()) {
				total = rs.getInt("total");
				// totalがnullの際0表示にして対策
				if (rs.wasNull()) {
					total = 0;
				}
			}
			// 後処理
			rs.close();
			pStmt.close();

		} catch (Exception e) {
			// 例外処理
			e.printStackTrace();
		} finally {
			try {
				// connectionがnullじゃない時だけclose()を試みる
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// 例外処理
				e.printStackTrace();
			}
		}
		// totalを返す
		return total;
	}

	// ソート条件に応じたランキング情報の取得
	public List<CommonDTO> getRanking(String sort) {

		// ランキング結果を格納するリスト
		List<CommonDTO> rankingList = new ArrayList<>();

		// DB接続用のオブジェクト
		Connection conn = null;

		try {
			// JDBCドライバを読み込む
			Class.forName("com.mysql.cj.jdbc.Driver");
			// データベースへ接続する
			conn = DriverManager.getConnection(URL, USER, PASS);

			// 実行するSQLを格納する変数
			String sql;

			// ソート条件に応じてSQLを切り替える
			if ("buyDateAsc".equals(sort)) {

				// 購入日の昇順（古い順）
				sql = "SELECT nickname, shouhin, buy_date, day_price FROM rireki ORDER BY buy_date ASC LIMIT 10";
			} else if ("buyDateDesc".equals(sort)) {

				// 購入日の降順（新しい順）

				sql = "SELECT nickname, shouhin, buy_date, day_price FROM rireki ORDER BY buy_date DESC LIMIT 10";
			} else if ("dayPriceAsc".equals(sort)) {

				// 1日の固定費の昇順(安い順)
				sql = "SELECT nickname, shouhin, buy_date, day_price FROM rireki ORDER BY day_price ASC LIMIT 10";
			} else if ("dayPriceDesc".equals(sort)) {

				// 1日の固定費の降順(高い順)

				sql = "SELECT nickname, shouhin, buy_date, day_price FROM rireki ORDER BY day_price DESC LIMIT 10";
			} else {

				// ページ遷移後最初に表示する1日の固定費の昇順(高い順)

				sql = "SELECT nickname, shouhin, buy_date, day_price FROM rireki ORDER BY buy_date ASC LIMIT 10";
			}

			PreparedStatement pStmt = conn.prepareStatement(sql);
			// selectを実行、ResultSet型の変数rsに受け取る
			// ResultSetは行と列を持ったデータの集合、表のようなもの
			ResultSet rs = pStmt.executeQuery();

			// SQLの実行結果（ResultSet）を1行ずつ処理する
			while (rs.next()) {

				// データを入れるDTOの作成
				CommonDTO dto = new CommonDTO();

				// 愛称、購入日、1日当たりの固定費の値を取得
				dto.setNickname(rs.getString("nickname"));
				dto.setBuy_date(rs.getString("buy_date"));
				dto.setDay_price(rs.getInt("day_price"));
				dto.setShouhin(rs.getString("shouhin"));

				// CommonDTOにランキングリストを追加
				rankingList.add(dto);
			}
			// 後処理
			rs.close();
			pStmt.close();

		} catch (Exception e) {
			// 例外処理
			e.printStackTrace();
		} finally {
			try {
				// connectionがnullじゃない時だけclose()を試みる
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// 例外処理
				e.printStackTrace();
			}
		}
		// ランキングリストを返す
		return rankingList;
	}
}