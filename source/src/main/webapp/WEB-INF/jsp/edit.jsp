<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--　ビューポート　-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | 編集</title>
<link rel="stylesheet" 
	href="<%= request.getContextPath()%>/css/style.css">
<link rel="stylesheet" 
	href="<%= request.getContextPath()%>/css/reg_edi.css">	
</head>
<body>
<!--　ヘッダー　-->
	<header>
    <div class="header-in">
        <div class="header-spacer"></div>
        <h1 class="title">
            <img src="images/タイトルロゴ.png" alt="サイトタイトル">
        </h1>
    </div>
    <button class="hamburger-btn" id="menuBtn" aria-label="メニューを開く">
        <span></span><span></span><span></span>
    </button>
    <nav class="side-menu" id="sideMenu">
        <div class="menu-header">モノカチコレクション</div>
        <div class="menu-nav">
            <a href="${pageContext.request.contextPath}/MenuServlet">メニュー</a>
            <a href="${pageContext.request.contextPath}/DiagnosisServlet">購入診断</a>
            <a href="${pageContext.request.contextPath}/ShouhinListServlet">一覧表示</a>
            <a href="${pageContext.request.contextPath}/RegisterServlet">登録</a>
            <a href="${pageContext.request.contextPath}/AlbumListServlet">アルバム</a>
            <a href="${pageContext.request.contextPath}/OperationServlet">機能説明</a>
            <a href="${pageContext.request.contextPath}/LoginServlet">ログアウト</a>
        </div>
    </nav>
</header>
	<!-- ヘッダーここまで　-->
	
<h2>▶ 編集</h2>

<div class="form-container">
<form id="form" action="${pageContext.request.contextPath}/EditServlet"
      method="post"
      enctype="multipart/form-data"> 
      
      <input type="hidden" name="id" value="${dto.id}">
      

  <!-- 画像 -->
  <div class="form-row">
    <label class="form-label">画像</label>

  <div class = "icon-preview">
  <!-- 商品画像用 -->
  <c:choose>
	  <c:when test="${not empty dto.base64Image}">
	    <img id="previewImg"
	         src="data:image/jpeg;base64,${dto.base64Image}" 
	         alt="商品画像">    
	  </c:when>
	  
	  <c:otherwise>
	    <img id="previewImg"
	         src="${pageContext.request.contextPath}/images/chara_logo.png"
	         alt="No Image">
	  </c:otherwise>
    </c:choose>
    
  <!-- フレーム用 -->
    <img id ="previewFrame"
         src = "">
   </div>
    <input type="file" id="img" name="itemImage" accept="image/*">
  </div>

  <!-- ジャンル -->
  <div class="form-row">
  <label class="form-label">商品詳細</label>
   <div class="label-area">
    <label>ジャンル<span class="required">*</span></label>
    <span class = "error" id = "genreError"></span>
   </div>
	
    <div class="radio-group">
      <label><input type="radio" name="genre" value="家電製品" ${dto.genre == '家電製品' ? 'checked' : ''}> 家電製品</label>
      <label><input type="radio" name="genre" value="家具" ${dto.genre == '家具' ? 'checked' : ''}> 家具</label>
      <label><input type="radio" name="genre" value="ぬいぐるみ" ${dto.genre == 'ぬいぐるみ' ? 'checked' : ''}> ぬいぐるみ</label>
      <label><input type="radio" name="genre" value="その他" ${dto.genre == 'その他' ? 'checked' : ''}> その他</label>
    </div>
  </div>

  <!-- 商品名 / メーカー -->
  <div class="form-row two-column">
    <div class="form-group">
     <div class="label-area"> 
      <label>商品名<span class="required">*</span></label>
      <span class = "error" id = "shouhinError"></span>
     </div>
     
     <!--　value="${dto.shouhin}"・・・ DTOから取得した商品名を初期値として表示 -->
      <input type="text" id="shouhin" name="shouhin" value="${dto.shouhin}">
      
    </div>

    <div class="form-group">
      <label>メーカー</label>
      <input type="text" id="maker" name="maker" value="${dto.maker}">
    </div>
  </div>

  <!-- 購入日 / 価格 -->
  <div class="form-row two-column">
    <div class="form-group">
     <div class="label-area"> 
      <label>購入日<span class="required">*</span></label>
      <span class = "error" id = "buyDateError"></span>
     </div>
      <input type="date" id="buyDate" name="buy_date" value="${dto.buy_date}">
      
    </div>

    <div class="form-group">
     <div class="label-area">
      <label>価格<span class="required">*</span></label>
      <span class = "error" id = "priceError"></span>
     </div>
      <input type="number" id="price" name="price" value="${dto.price}"> <span class="unit">円</span>
      
    </div>
  </div>
  
  <!-- 保証期間 / 耐用年数 -->
  <div class="form-row two-column">
    <div class="form-group">
      <label>保証期間</label>
      <input type="number" id="wperiod" name="wperiod" value="${dto.wperiod}"><span class="unit">年</span>
    </div>

    <div class="form-group">
     <div class="label-area">
      <label>耐用年数<span class="required">*</span></label>
      <span class = "error" id = "lifeError"></span>
     </div>
      <input type="number" id="life" name="life" value="${dto.life}"><span class="unit">年</span>
      
    </div>
  </div>

  <!-- 愛称 -->
  <div class="form-row">
    <label class="form-label">愛称</label>
    <input type="text" id="nickname" name="nickname" value="${dto.nickname}">
  </div>

  <!-- フレーム -->
  <div class="form-row">
    <label class="form-label">フレーム (愛称を設定すると入力できます)</label>

    <div class="frame-area">

      <div class="frame-item">
        <input type="radio" id="frame1" class="frameRadio" name="frame" value="1">
        <label for="frame1">
          <img src="${pageContext.request.contextPath}/images/frame_usagi.png" alt="">
        </label>
      </div>

      <div class="frame-item">
        <input type="radio" id="frame2" class="frameRadio" name="frame" value="2">
        <label for="frame2">
          <img src="${pageContext.request.contextPath}/images/frame_neko.png" alt="">
        </label>
      </div>

      <div class="frame-item">
        <input type="radio" id="frame3" class="frameRadio" name="frame" value="3">
        <label for="frame3">
          <img src="${pageContext.request.contextPath}/images/frame_kuma.png" alt="">
        </label>
      </div>

      <div class="frame-item">
        <input type="radio" id="frame4" class="frameRadio" name="frame" value="4">
        <label for="frame4">
          <img src="${pageContext.request.contextPath}/images/frame_inu.png" alt="">
        </label>
      </div>

      <div class="frame-item">
        <input type="radio" id="frame5" class="frameRadio" name="frame" value="5">
        <label for="frame5">
          <img src="${pageContext.request.contextPath}/images/frame_hiyoko.png" alt="">
        </label>
      </div>

    </div>
  </div>

  <!-- ボタン -->
  <button type="submit" id="registerBtn">変更する</button>
  
  <div class="backlist">
			<!--　一覧に戻る　-->
			<a href="${pageContext.request.contextPath}/ShouhinListServlet">
				◀ 一覧へ戻る </a>
		</div>

</form>
</div>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script>

	//耐用年数自動入力
	const genreRadios =document.querySelectorAll("input[name='genre']");
	const life = document.getElementById("life");
	
	genreRadios.forEach(radio => {
	
	    radio.addEventListener("change", function() {
	
	        switch(this.value){
	//仮の数字です。
	            case "家電製品":
	                life.value = 6;
	                break;
	
	            case "家具":
	                life.value = 8;
	                break;
	
	            case "ぬいぐるみ":
	                life.value = 4;
	                break;
	
	            default:
	                life.value = 5;
	        }

    });

});
  
	//画像プレビュー
	document.getElementById("img")
	.addEventListener("change", function() {

	    const file = this.files[0];

	    if(file){

	        const reader = new FileReader();

	        reader.onload = function(e){

	            document.getElementById("previewImg").src =
	                e.target.result;

	        };

	        reader.readAsDataURL(file);
	    }

	});
	
	//ラジオボタンの選択が変更されたときに実行
	const frameRadios = document.querySelectorAll(".frameRadio");
	
	//各ラジオボタンごとにい処理を設定
	frameRadios.forEach(radio => {
		
		//ラジオボタンの選択が変更されたときに実行
		radio.addEventListener("change", function() {
			
			//プレビュー用のフレーム画像の取得
			const previewFrame = 
				document.getElementById("previewFrame");
			
			//選択されたフレームによって表示するフレームを切り替える
			if(this.value == "1") {
				//うさぎフレーム
				previewFrame.src = "${pageContext.request.contextPath}/images/frame_usagi.png"
			} else if(this.value == "2") {
				//ねこフレーム
				previewFrame.src = "${pageContext.request.contextPath}/images/frame_neko.png"
			} else if(this.value == "3") {
				//くまフレーム
				previewFrame.src = "${pageContext.request.contextPath}/images/frame_kuma.png"
			} else if(this.value == "4") {
				//いぬフレーム
				previewFrame.src = "${pageContext.request.contextPath}/images/frame_inu.png"
			} else if(this.value == "5") {
				//とりフレーム
				previewFrame.src = "${pageContext.request.contextPath}/images/frame_hiyoko.png"
			}
		});
	});
	
	
	//愛称未入力の場合、フレーム選択不可
	//ニックネームの入力欄を取得
	const nickname = document.getElementById("nickname");
	
	//const frameRadios = document.querySelectorAll(".frameRadio");
	//すべてのラジオボタンがクリックできない状態
	frameRadios.forEach(radio => {
		radio.disabled = true;
	});
	
	//入力欄に文字が入力されるたびに実行
	nickname.addEventListener("input", function() {
		//入力された文字の前後を削除し空か確認、空でなければtrue、空であればfalse
		const enable = this.value.trim() !== "";
		
		//各ラジオボタンごとに処理
		frameRadios.forEach(radio => {
			radio.disabled = !enable;
		});
	});
	//必須項目に不足あればエラーメッセージの表示
	document.getElementById("form").addEventListener("submit", function(event) {
		let hasError = false;
		
	//エラーメッセージ初期化
	document.querySelectorAll(".error").forEach(e => e.textContent = "");
		
	//商品名
	const shouhin =
		document.getElementById("shouhin").value.trim();
		if(shouhin === "") {
			document.getElementById("shouhinError").textContent = 
				"商品名を入力してください";
				hasError = true;
		}
		
	//購入日
	const buyDate =
		document.getElementById("buyDate").value.trim();
		if(buyDate === "") {
			document.getElementById("buyDateError").textContent = 
				"購入日を入力してください";
				hasError = true;
	}
		
	//価格
	const price =
		document.getElementById("price").value.trim();
		if(price === "") {
			document.getElementById("priceError").textContent = 
				"価格を入力してください";
				hasError = true;
		}
	
	//耐用年数
	const life =
		document.getElementById("life").value.trim();
		if(life === "") {
			document.getElementById("lifeError").textContent = 
				"耐用年数を入力してください";
				hasError = true;
	}
		
	//ジャンル
	const genre =
		document.querySelector("input[name='genre']:checked");
		if(!genre) {
			document.getElementById("genreError").textContent = 
				"ジャンルを選択してください";
			hasError = true;
	}
		
	//エラーがあれば送信できない
	if(hasError) {
		event.preventDefault();
		return;
	}
   });
	//登録内容をポップアップで表示し確認
	document.getElementById("form").addEventListener("submit", function(event) {
		//各項目の入力値を取得
		
		const lifeValue = document.getElementById("life").value;
	    const nicknameValue = document.getElementById("nickname").value;
		const shouhin = document.getElementById("shouhin").value;
		const maker = document.getElementById("maker").value;
		const buyDate = document.getElementById("buyDate").value;
		const price = document.getElementById("price").value;
		
		//ジャンル取得
		const genre = document.querySelector("input[name='genre']:checked");
		const genreValue = genre ? genre.value : "未選択";
		
		//フレーム取得
		const frame = document.querySelector("input[name='frame']:checked");
		const frameValue = frame ? frame.value : "未選択";
		
		//確認メッセージ
		const message = 

			"以下の内容で登録しますか？\n\n" +
			        "ジャンル: " + genreValue + "\n" +
			        "商品名: " + shouhin + "\n" +
			        "メーカー: " + maker + "\n" +
			        "購入日: " + buyDate + "\n" +
			        "価格: " + price + "円\n" +
			        "耐用年数: " + lifeValue + "年\n" +
			        "愛称: " + nicknameValue + "\n" +
			        "フレーム: " + frameValue;

			    // ポップアップ表示
			    if (!confirm(message)) {
			        event.preventDefault(); // キャンセルで送信ストップ
			    }
			});
	
</script>  
<!--　フッター　-->
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	<!-- フッターここまで　-->  
</body>
</html>