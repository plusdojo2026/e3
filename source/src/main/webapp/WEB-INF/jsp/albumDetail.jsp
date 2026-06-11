<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | 商品詳細</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/sd_ad.css">
</head>
<body>
	<!--　ヘッダー　-->
	<header>
<h1 class="title">
  <img src="images/タイトルロゴ.png" alt="サイトタイトル">
</h1>
	</header>
	<!-- ヘッダーここまで　-->
	<main>

		<!-- キャラクター + 吹き出し -->
		<div class="iconSpeech">
		<img src="images/デフォルトアイコン（仮）.png" width="40vw" height="40vw">
		
		<div class="speechBubble">
		<p>
			僕の一日あたりの価格は〇〇円だよ！<br> 〇〇日使ったよ！<br> あと〇〇日で目標達成♪
		</p>
		</div>
		</div>
<div class = "card">
		<!-- 商品情報 -->
		<table class="information">
			<tr>
				<th colspan="4">ジャンル</th>
				<td></td>
			</tr>
			<tr>
				<th>商品名</th>
				<td></td>
				<th>メーカー</th>
				<td></td>
			</tr>

			<tr>
				<th>購入日</th>
				<td></td>
				<th>価格</th>
				<td><span>円</span></td>
			</tr>

			<tr>
				<th>保証期間</th>
				<td><span>年</span></td>
				<th>耐用年数</th>
				<td><span>年</span></td>
			</tr>

			<tr>
				<th>1日あたりの価格</th>
				<td><span>円</span></td>
				<th>目標達成まで</th>
				<td><span>日</span></td>
			</tr>
		</table>
	</div>	

		<div class="buttons">
			<button type="button">編集</button>
			<button type="button">履歴へ送る</button>
			<button type="button" class = deleteButton>削除</button>
		</div>
	</main>

	<!--　フッター　-->
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	<!-- フッターここまで　-->
</body>
</html>