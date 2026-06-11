<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | 登録</title>
</head>
<body>

<p>▶ 登録</p>

<table class="form-table">

    <tr>
        <th>画像</th>
        <td colspan="3">
            <img id="preview"
                 src="${pageContext.request.contextPath}/images/noimage.png"
                 width="100">

            <br>

            <input type="file"
                   id="itemImage"
                   name="itemImage"
                   accept="image/*">
        </td>
    </tr>

    <tr>
        <th>ジャンル<span>*</span></th>
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
            <input type="text" name="itemName">
        </td>

        <th>メーカー</th>
        <td>
            <input type="text" name="maker">
        </td>
    </tr>

    <tr>
        <th>購入日<span>*</span></th>
        <td>
            <input type="date" name="purchaseDate">
        </td>

        <th>価格<span>*</span></th>
        <td>
            <input type="number" name="price"> 円
        </td>
    </tr>

    <tr>
        <th>保証期間</th>
        <td>
            <input type="number" name="warranty"> 年
        </td>

        <th>耐用年数<span>*</span></th>
        <td>
            <input type="number"
                   id="lifespan"
                   name="lifespan"> 年
        </td>
    </tr>

    <tr>
        <th>愛称</th>
        <td colspan="3">
            <input type="text"
                   id="nickname"
                   name="nickname">
        </td>
    </tr>
</table>

<div class = "frame-area">
	   <label>
	     <img src="images/frame_rabbit.png">
        <br>
        <input type="radio"
               class="frameRadio"
               name="frame"
               value="1">
	   </label>
	
	</div>

 <button type="submit"
            id="registerBtn">
        登録
    </button>
</body>
</html>