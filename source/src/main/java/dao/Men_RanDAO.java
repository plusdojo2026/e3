package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Men_RanDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "password";

	public class RankingDAO extends DAO {

		// ランキングデータを取得するメソッド
		public List<Shouhin> selectRanking() {

			// 返却用リスト（ランキング結果を格納）
			List<Shouhin> rankingList = new ArrayList<>();

			// SQL（購入日が古い順で上位10件）
			String sql = "SELECT nickname, buy_date " + "FROM shouhin " + "ORDER BY buy_date ASC " + "LIMIT 10";

			try (
					// DB接続を取得
					Connection conn = getConnection();

					// SQLを実行するための準備
					PreparedStatement ps = conn.prepareStatement(sql);) {

				// SQLを実行して結果を受け取る
				ResultSet rs = ps.executeQuery();

				// 1件ずつ取り出してListに詰める
				while (rs.next()) {

					// 1行分のデータを入れる箱（Bean）
					Shouhin s = new Shouhin();

					// nicknameをセット
					s.setNickname(rs.getString("nickname"));

					// buy_dateをセット
					s.setBuyDate(rs.getDate("buy_date"));

					// リストに追加
					rankingList.add(s);
				}

			} catch (Exception e) {
				// エラーが出た場合は表示
				e.printStackTrace();
			}

			// 完成したランキングリストを返す
			return rankingList;
		}

		private Connection getConnection() {
			// TODO 自動生成されたメソッド・スタブ
			return null;
		}
	}
}
