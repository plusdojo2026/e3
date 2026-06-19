package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.CommonDTO;

public class LoginDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "password";

	// ----ログイン----
	public boolean login(CommonDTO login) {
		Connection conn = null;
		boolean loginResult = false;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USER, PASS);

			String sql = "SELECT COUNT(*) FROM login WHERE id = ? AND password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, login.getUserid());
			ps.setString(2, login.getPassword());

			ResultSet rs = ps.executeQuery();

			rs.next();
			if (rs.getInt("count(*)") == 1) {
				loginResult = true;
			}

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

		return loginResult;
	}

	// ----新規登録(自動採番をサーブレットに送る)----
	public int insertUserAndGetId(CommonDTO dto) {
		int userid = -1;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);

			String sql = "INSERT INTO login (password) VALUES (?)";
			PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setString(1, dto.getPassword());
			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();
			if (rs.next()) {
				userid = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return userid;
	}
}
