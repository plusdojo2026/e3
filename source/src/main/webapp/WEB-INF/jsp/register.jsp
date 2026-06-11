<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | 登録</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

<p>▶ 登録</p>

<table class="form-table">

    <tr>
        <th>画像</th>
        <td colspan="3">
            <img id="preview"
                 src="${pageContext.request.contextPath}/images/frame_noimage.png"
                 alt = "No Image"
                 width="120">

            <input type="file"
                   id="img"
                   name="itemImage"
                   accept="image/*">
        </td>
    </tr>

    <tr>
        <th>ジャンル<span class="required">*</span></th>
        <td colspan="3">

            <input type="radio" name="genre" value="家電製品">家電製品
            <input type="radio" name="genre" value="家具">家具
            <input type="radio" name="genre" value="ぬいぐるみ">ぬいぐるみ
            <input type="radio" name="genre" value="その他">その他

        </td>
    </tr>

    <tr>
        <th>商品名<span>*</span></th>
        <td>
            <input type="text" placeholder="入力してください" id="shouhin" name="shouhin">
        </td>

        <th>メーカー</th>
        <td>
            <input type="text" placeholder="入力してください" id="maker" name="maker">
        </td>
    </tr>

    <tr>
        <th>購入日<span>*</span></th>
        <td>
            <input type="date" placeholder="年 / 月 / 日" id="buyDate" name="buy_date">
        </td>

        <th>価格<span>*</span></th>
        <td>
            <input type="number" placeholder="入力してください" id="price" name="price"> 円
        </td>
    </tr>

    <tr>
        <th>保証期間</th>
        <td>
            <input type="number" placeholder="年数を入力" id="wperiod" name="wperiod"> 年
        </td>

        <th>耐用年数<span>*</span></th>
        <td>
            <input type="number" placeholder="年数を入力"
                   id="life"
                   name="life"> 年
        </td>
    </tr>

    <tr>
        <th>愛称</th>
        <td colspan="3">
            <input type="text" placeholder="入力してください"
                   id="nickname"
                   name="nickname">
        </td>
    </tr>
</table>

<p>フレーム</p>

 <div class="frame-area">

        <div class="frame-item">

            <input type="radio"
                   id="frame1"
                   class="frameRadio"
                   name="frame"
                   value="1">

            <label for="frame1">
                <img src="${pageContext.request.contextPath}/images/frame_rabbit.png"
                     alt="frame1" width = "100">
            </label>

        </div>

        <div class="frame-item">

            <input type="radio"
                   id="frame2"
                   class="frameRadio"
                   name="frame"
                   value="2">

            <label for="frame2">
                <img src="${pageContext.request.contextPath}/images/frame_dog.png"
                     alt="frame2"width = "100">
            </label>

        </div>

        <div class="frame-item">

            <input type="radio"
                   id="frame3"
                   class="frameRadio"
                   name="frame"
                   value="3">

            <label for="frame3">
                <img src="${pageContext.request.contextPath}/images/frame_cat.png"
                     alt="frame3" width = "100">
            </label>

        </div>
        
         <div class="frame-item">

            <input type="radio"
                   id="frame44"
                   class="frameRadio"
                   name="frame"
                   value="4">

            <label for="frame4">
                <img src="${pageContext.request.contextPath}/images/frame_bear.png"
                     alt="frame4" width = "100">
            </label>

        </div>
        
         <div class="frame-item">

            <input type="radio"
                   id="frame5"
                   class="frameRadio"
                   name="frame"
                   value="5">

            <label for="frame5">
                <img src="${pageContext.request.contextPath}/images/frame_bird.png"
                     alt="frame5" width = "100">
            </label>

        </div>

    </div>


    <button type="submit"
            id="registerBtn">
        登録
    </button>
    
    
<script>
	//耐用年数自動入力
	const genreRadios =
    document.querySelectorAll("input[name='genre']");

	const life =
	    document.getElementById("life");
	
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
	                life.value = 5;
	                break;
	
	            default:
	                life.value = 3;
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

	            document.getElementById("preview").src =
	                e.target.result;

	        };

	        reader.readAsDataURL(file);
	    }

	});
	
	
	//愛称未入力の場合、フレーム選択不可
	
	
</script>  
    
    
    
</body>
</html>