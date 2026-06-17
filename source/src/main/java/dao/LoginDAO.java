package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.CommonDTO;

public class LoginDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/monocolledb?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "root";
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

	// ----自動採番----
	public int getNextUserId() {
		String sql = "SELECT MAX(userid) FROM login";

		try (Connection con = DriverManager.getConnection(URL, USER, PASS);
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			if (rs.next()) {
				return rs.getInt(1) + 1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 1; // 初回登録
	}

	// ----新規登録----
	public boolean insertUser(CommonDTO dto) {
		Connection conn = null;
		boolean result = false;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);

			String sql = "INSERT INTO login (password) VALUES (?)";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, dto.getPassword());

			if (ps.executeUpdate() == 1) {
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

		return result;
	}
}
