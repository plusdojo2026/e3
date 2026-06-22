package dto;

import java.io.Serializable;
import java.util.Base64;

public class CommonDTO implements Serializable {

	// privateな変数
	private String userid; // ユーザーID
	private String password; // パスワード
	private int id; // ID
	private String shouhin; // 商品名
	private int money; // 価格(購入前)
	private int use_year; // 想定使用年数
	private double day_price; // 1日当たりの価格
	private String genre; // ジャンル
	private String buy_date; // 購入日
	private int price; // 価格(購入時)
	private int wperiod; // 保証期間
	private String maker; // メーカー
	private int life; // 耐用年数
	private int progress; // 経過日数
	private int goal; // あと何日
	private String nickname; // 愛称
	private byte[] img; // 商品画像
	private int frame; //フレーム画像

	// デフォルトコンストラクタ
	public CommonDTO() {

	}

	// コンストラクタ
	public CommonDTO(String userid, String password) { // ログインDB
		this.userid = userid;
		this.password = password;
	}
	
	public CommonDTO(String password) { // ログインDB(登録用)
		this.password = password;
	}

	public CommonDTO(int id, String shouhin, int money, int use_year, double day_price) { // 購入診断DB
		this.id = id;
		this.shouhin = shouhin;
		this.money = money;
		this.use_year = use_year;
		this.day_price = day_price;
	}

	public CommonDTO(int id, String shouhin, double day_price, String genre, String buy_date, int price, int wperiod,
			String maker, int life, int progress, int goal, String nickname, byte[] img, int frame) { // 商品詳細DB、履歴詳細DB
		this.id = id;
		this.shouhin = shouhin;
		this.day_price = day_price;
		this.genre = genre;
		this.buy_date = buy_date;
		this.price = price;
		this.wperiod = wperiod;
		this.maker = maker;
		this.life = life;
		this.progress = progress;
		this.goal = goal;
		this.nickname = nickname;
		this.img = img;
		this.frame = frame;
	}

	// ゲッターとセッター
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getShouhin() {
		return shouhin;
	}

	public void setShouhin(String shouhin) {
		this.shouhin = shouhin;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getUse_year() {
		return use_year;
	}

	public void setUse_year(int use_year) {
		this.use_year = use_year;
	}

	public double getDay_price() {
		return day_price;
	}
	
	public int getFrame() {
	    return frame;
	}
	
	//day_priceをint型で取得するゲッター
	public int getDay_priceInt() {
	    return (int) day_price;
	}

	public void setDay_price(double day_price) {
		this.day_price = day_price;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(String buy_date) {
		this.buy_date = buy_date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getWperiod() {
		return wperiod;
	}

	public void setWperiod(int wperiod) {
		this.wperiod = wperiod;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public int getLife() {
		return life;
	}

	public void setLife(int life) {
		this.life = life;
	}

	public int getProgress() {
		return progress;
	}

	public void setProgress(int progress) {
		this.progress = progress;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public byte[] getImg() {
		return img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}

	// その他
	public String getBase64Image() {
		if (img == null) {
			return null;
		}
		return Base64.getEncoder().encodeToString(img);
	}

	public void setFrame(int frame) {
		this.frame = frame;
	}
}
