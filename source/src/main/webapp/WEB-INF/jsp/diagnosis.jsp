<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | 購入診断</title>
<link rel = "stylesheet"
	href = "<%=request.getContextPath()%>/css/style.css">

<link rel = "stylesheet"
	href = "<%=request.getContextPath()%>/css/dia_ope.css">


</head>
<body>

<!-- ロゴ(仮) -->
<h1 class="title">
  <img src="images/タイトルロゴ.png" alt="サイトタイトル">
</h1>
<h1>モノカチコレクション</h1>
<p>▶ 購入診断 : 気になる商品を比較して <strong>カチ</strong> のある買い物をしよう！</p>

<!-- 診断フォーム -->
<form id="diagnosis_form" method="POST" action="/e3/DiagnosisServlet"><!-- action→同ページに表示 -->
	<table class="diagnosis">
		<tr> <!-- 4つを一行扱いにしている -->
			<td id = "shouhin_name">
				<label>商品名<br><!-- textareaの方が良い？ -->
				<input type = "text" name = "shouhin_name" >　　　　<!-- とりあえずスペースで余白をつけている -->
				</label>
			</td>
			<td>
				<label>価格<br>
				<input type = "text" name = "price">円 　　　　
				</label>
			</td>
			<td>
				<label>想定年数<br>
				<input type = "text" name = "expect" id ="exp">年使用　　　　
				</label>
			</td>
			<td>
				<input type = "submit" name = "diagnosis" value = "　診断　">
			</td>
		</tr>
</table>
</form>

<br><!-- 改行 -->
<!-- 診断結果リストの表示テーブル -->
<div id = "dr">
	<h2>診断結果</h2>
	<table id="diagnosis_result"><!-- 枠はCSS? -->
	
	<c:forEach var="d" items="${diagnosisList}" > <!-- ここ全然わかりません -->
		<!-- thかtdどっちが良いか -->
		<tr><!-- 1つ目 -->
			<!-- マイナスボタン -->
			<td>
				<input type = "submit" name = "delete" value = "－">　　　<!-- 仮空白3コ -->
			</td>
			<td>商品名 : </td><td>○○○○　　</td><!-- 仮空白2コ -->
			<td>価格 : </td><td>○○円　　</td>
			<td>年数 : </td><td>○年　　　　　</td><!-- 仮空白5コ -->
			<td>1日当たり価格 : </td><td>○○円　　		
		</tr>
		<tr><!-- 区切り線 -->
			<td colspan="10">　　　ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
			</td><!-- 上の10は適当 -->
		</tr>
		<!-- CSSで空間作るべし -->
		<tr><!-- 2つ目 -->
			<td>
				<input type = "submit" name = "delete" value = "－">　　　<!-- 仮空白3コ -->
			</td>
			<td>商品名 : </td><td>○○○○　　</td><!-- 仮空白2コ -->
			<td>価格 : </td><td>○○円　　</td>
			<td>年数 : </td><td>○年　　　　　</td><!-- 仮空白5コ -->
			<td>1日当たり価格 : </td><td>○○円　　		
		</tr>
	</c:forEach>
		
</div>
	
</table>

<!-- 入力・計算結果の読み取り -->
<section>

</section>

<footer>
</footer>

<!-- JavaScript -->
<script>
'use strict';

// 診断情報入力フォームのアラート
// 現状2つ(価格と想定年数)まとめてのアラート表示だが、個別対応の方が良いか？
document.getElementById('diagnosis_form').onsubmit = function(event) {
	  let price = document.getElementById('diagnosis_form').price.value;
	  let expect = document.getElementById('diagnosis_form').expect.value;
	  
	  if (price === '' || expect === '' ) {
	    window.alert('価格と想定年数は必ず入力してください！');
	    event.preventDefault();
	  }
	};

// 診断結果リストへの情報取得
/*
document.getElementById('diagnosis_form').onsubmit = function(event) {
	event.preventDefault();
	const search = document.getElementById('diagnosis_form').shouhin_name;
}
*/
	
	
</script>

</body>
</html>





