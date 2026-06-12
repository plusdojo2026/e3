package dto;

import java.io.Serializable;

public class CommonDTO implements Serializable{
	
	//privateな変数
	private String id; //ユーザーID
	private String password; //パスワード
	
	//デフォルトコンストラクタ
	public CommonDTO() {
		// TODO 自動生成されたコンストラクター・スタブ
	}
	
	//コンストラクタ
    public CommonDTO(String id, String password) {
		this.id = id;
		this.password = password;
	}
    
	//ゲッターとセッター
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
    	this.id = id;
    }

    public String getPassword() {
    	return password;
    }
    
    public void setPassword(String password) {
    	this.password = password;
    }
    
    public login(String id, String password) {
    	this.id = id;
    	this.password = password;
    }
    
    public login() {
    	this.id = "";
    	this.password = "";
    }
}
