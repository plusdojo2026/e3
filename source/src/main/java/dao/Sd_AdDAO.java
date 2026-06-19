package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.CommonDTO;
public class Sd_AdDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "password";
    
    // 引数としてidを受け取り、CommonDTO型を返す
    public CommonDTO shouhinInfo(int id) {
        Connection conn = null;
        CommonDTO dto = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASS);
            //　経過日数、一日当たり価格、目標達成までの日数を表示前に計算するSQL文をString型で用意
            //　DATEDIFF(a, b)はMySQLの関数、date型a-bを日数で返す
            // case、endはMySQLのif文みたいなもの、経過日数が0だった場合価格をそのまま表示することでゼロ除算を回避
            String updateSql = "UPDATE shouhin SET " +
                    "progress = DATEDIFF(CURDATE(), buy_date), " +
                    "goal = (life * 365) - DATEDIFF(CURDATE(), buy_date), " +
                    "day_price = CASE " +
                    "    WHEN DATEDIFF(CURDATE(), buy_date) = 0 THEN price " +
                    "    ELSE round(price / DATEDIFF(CURDATE(), buy_date)) " +
                    "END " +
                    "WHERE id = ?";
         //　uStmtは、pStmtとの被り回避
                PreparedStatement uStmt = conn.prepareStatement(updateSql);
                uStmt.setInt(1, id);
                //updateを実行
                uStmt.executeUpdate();
                uStmt.close();
          //　SQL文をString型で用意
            String sql = "SELECT * FROM shouhin WHERE id = ?";
          //　SQL文をprepareStatement（インジェクション対策）で実行
            PreparedStatement pStmt = conn.prepareStatement(sql);
          //　prepareStatementの一個目の?に受け取ったidをセット
            pStmt.setInt(1, id);
          //　updateを実行、ResultSet型の変数rsに受け取る
          //　ResultSetは行と列を持ったデータの集合、表のようなもの
            ResultSet rs = pStmt.executeQuery();
          //rs.next()は0行目の位置にあるrsが1行目に進めるか（次の行が存在するか）
          //商品詳細は個別のページ、行数は１のためwhileではなくifを使用
            
            if (rs.next()) {
                dto = new CommonDTO(
                    rs.getInt("id"),
                    rs.getString("shouhin"),
                    rs.getInt("day_price"),
                    rs.getString("genre"),
                    rs.getString("buy_date"),
                    rs.getInt("price"),
                    rs.getInt("wperiod"),
                    rs.getString("maker"),
                    rs.getInt("life"),
                    rs.getInt("progress"),
                    rs.getInt("goal"),
                    rs.getString("nickname"),
                    rs.getBytes("img")
                );
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
        return dto;
    }

public boolean deleteShouhin(int id) {
	Connection conn = null;
	boolean result = false;

	try {
		// JDBCドライバを読み込む
		Class.forName("com.mysql.cj.jdbc.Driver");

		// データベースに接続する
		conn = DriverManager.getConnection(URL, USER, PASS);

		// SQL文を準備する
		String sql = "DELETE FROM shouhin WHERE id=?";
		PreparedStatement pStmt = conn.prepareStatement(sql);

		// SQL文を完成させる
		pStmt.setInt(1, id);

		// SQL文を実行する
		if (pStmt.executeUpdate() == 1) {
			result = true;
		}
		pStmt.close();
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} finally {
		// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// 結果を返す
	return result;
}

public boolean insertRireki(int id) {
	Connection conn = null;
	boolean result = false;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(URL, USER, PASS);

		String sql = "INSERT INTO rireki "
				+ "(genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img) "
				+ "SELECT genre, shouhin, buy_date, price, wperiod, maker, life, day_price, progress, goal, nickname, img "
				+ "FROM shouhin WHERE id = ?";

		PreparedStatement pStmt = conn.prepareStatement(sql);
		pStmt.setInt(1, id);

		result = pStmt.executeUpdate() == 1;

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

	return result;
}
}