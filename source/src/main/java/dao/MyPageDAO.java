package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import dto.MyPageDTO;

public class MyPageDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "9PSp2kThXYGG8mC5";


	public int updateUser(MyPageDTO dto) {
		int updateCount = 0;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);

			String sql = "UPDATE login SET password=? WHERE id = ? AND password=?";
			PreparedStatement ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setString(1, dto.getPasswordNew());
			ps.setString(2, dto.getUserId());
			ps.setString(3, dto.getPasswordNow());
			updateCount = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return updateCount;

	}

	public MyPageDAO() {

	}

}
