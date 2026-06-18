package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MenuDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "password";

	// 一日当たり価格の合計を変数totalに格納する準備
	public int getTotalDayPrice() {
		Connection conn = null;
		int total = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
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
				//totalがnullの際0表示にして対策
				if (rs.wasNull()) {
					total = 0;
				}
			}

			rs.close();
			pStmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// totalを返す
		return total;
	}
}