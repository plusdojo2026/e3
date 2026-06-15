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
	public CommonDTO login(int userid, String password) {
		String sql ="SELECT user_id, password FROM login WHERE user_id = ? AND password = ?";
		
		try(Connection con = DriverManager.getConnection(URL, USER, PASS);
			PreparedStatement ps = con.prepareStatement(sql)) {
			
			ps.setInt(1, userid);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
	            CommonDTO dto = new CommonDTO();
	            dto.setUserid(rs.getInt("user_id"));
	            dto.setPassword(rs.getString("password"));
	            return dto;
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return null;
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

	    String sql = "INSERT INTO login (userid, password) VALUES (?, ?)";

	    try (Connection con = DriverManager.getConnection(URL, USER, PASS);
	         PreparedStatement ps = con.prepareStatement(sql)) {

	        ps.setInt(1, dto.getUserid());
	        ps.setString(2, dto.getPassword());

	        int result = ps.executeUpdate();
	        return result == 1;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}
}
