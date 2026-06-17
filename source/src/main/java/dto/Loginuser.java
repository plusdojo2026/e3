package dto;

import java.io.Serializable;

public class Loginuser implements Serializable{
	private String userid;
	
	public Loginuser() {	//デフォルトコンストラクタ
		this(null);
	}
	
	public Loginuser(String userid) {	//コンストラクタ
		this.userid = userid;
	}

	//ゲッターとセッター
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
}
