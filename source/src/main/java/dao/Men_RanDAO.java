package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dto.CommonDTO;

public class Men_RanDAO {
	private static final String URL = "jdbc:mysql://localhost:3306/e3?characterEncoding=utf8&useSSL=false&serverTimezone=GMT%2B9&rewriteBatchedStatements=true&allowPublicKeyRetrieval=true";
	private static final String USER = "e3";
	private static final String PASS = "password";

	List<CommonDTO> getRanking(String sort) {

		List<CommonDTO> rankingList = new ArrayList<>();

		String sql;

		if ("buyDateAsc".equals(sort)) {

		}
		// 購入日の降順（新しい順）
		sql = "SELECT nickname, buy_date, day_price FROM shouhin ORDER BY buy_date ASC LIMIT 10";
	}else if("buyDateDesc".equals(sort))

	{
		// 購入日の降順（新しい順）

		sql = "SELECT nickname, buy_date, day_price FROM shouhin ORDER BY buy_date DESC LIMIT 10";
	}else if("dayPriceAsc".equals(sort))
	{
		sql = "SELECT nickname, buy_date, day_price FROM shouhin ORDER BY day_price ASC LIMIT 10";
	}else if("dayPriceDesc".equals(sort))
	{
		sql = "SELECT nickname, buy_date, day_price FROM shouhin ORDER BY day_price DESC LIMIT 10";
	}else
	{
		sql = "SELECT nickname, buy_date, day_price FROM shouhin ORDER BY buy_date ASC LIMIT 10";
	}

	try(
	Connection conn = getConnection();
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery())
	{

		while (rs.next()) {

			CommonDTO dto = new CommonDTO();

			dto.setNickname(rs.getString("nickname"));
			dto.setBuyDate(rs.getDate("buy_date"));
			dto.setDayPrice(rs.getInt("day_price"));

			rankingList.add(dto);
		}

	}catch(
	Exception e)
	{
		e.printStackTrace();
	}

	return rankingList;

	private Connection getConnection() {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}
}
