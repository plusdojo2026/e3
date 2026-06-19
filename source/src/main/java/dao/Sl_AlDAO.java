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

public class Sl_AlDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "password";

	public List<CommonDTO> sort(String table, String column, String order, Loginuser loginuser) {
		Connection conn = null;
		List<CommonDTO> list = new ArrayList<>();

		String sortTable = table;

		String sortColumn = "";
		switch (column) { // SQLインジェクション対策
		case "id":
			sortColumn = "id";
			break;
		case "progress":
			sortColumn = "progress";
			break;
		case "day_price":
			sortColumn = "day_price";
			break;
		case "price":
			sortColumn = "price";
			break;
		default:
			sortColumn = "id";
		}

		String sortOrder = "ASC";
		if ("DESC".equalsIgnoreCase(order)) { // 昇順か降順かを判定する
			sortOrder = "DESC";
		}

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USER, PASS);

			String sql = "SELECT * FROM " + sortTable + " WHERE userid = ? ORDER BY " + sortColumn + " " + sortOrder; // サーブレットから受け取った値に応じてSQL文を変化させる
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setString(1, loginuser.getUserid());
			System.out.println(sql);
			System.out.println(loginuser.getUserid());
			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				CommonDTO dto = new CommonDTO(rs.getInt("id"), rs.getString("shouhin"), rs.getDouble("day_price"),
						rs.getString("genre"), rs.getString("buy_date"), rs.getInt("price"), rs.getInt("wperiod"),
						rs.getString("maker"), rs.getInt("life"), rs.getInt("progress"), rs.getInt("goal"),
						rs.getString("nickname"), rs.getBytes("img"));
				list.add(dto); // listに１行ずつ格納する
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

		return list;
	}
}
