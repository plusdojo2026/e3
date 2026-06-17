package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.CommonDTO;
public class Sd_AdDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/monocolledb?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASS = "password";
    
    // 引数としてidを受け取り、CommonDTO型を返す
    public CommonDTO shouhinInfo(int id) {
        Connection conn = null;
        CommonDTO dto = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASS);
            //　経過日数、一日当たり価格、目標達成までの日数を表示前に計算
            String updateSql = "UPDATE shouhin SET " +
                    "progress = DATEDIFF(CURDATE(), buy_date), " +
                    "goal = (life * 365) - DATEDIFF(CURDATE(), buy_date), " +
                    "day_price = CASE " +
                    "    WHEN DATEDIFF(CURDATE(), buy_date) = 0 THEN price " +
                    "    ELSE price / DATEDIFF(CURDATE(), buy_date) " +
                    "END " +
                    "WHERE id = ?";
         //　uStmtは、pStmtとの被り回避
                PreparedStatement uStmt = conn.prepareStatement(updateSql);
                uStmt.setInt(1, id);
                uStmt.executeUpdate();
                uStmt.close();
          //　SQL文をString型で用意
            String sql = "SELECT * FROM shouhin WHERE id = ?";
          //　SQL文をprepareStatement（インジェクション対策）で実行
            PreparedStatement pStmt = conn.prepareStatement(sql);
          //　prepareStatementの一個目の?に受け取ったidをセット
            pStmt.setInt(1, id);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                dto = new CommonDTO(
                    rs.getInt("id"),
                    rs.getString("shouhin"),
                    rs.getDouble("day_price"),
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
}