<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
					〇〇日使ったよ！<br>
					大事に使ってくれてありがとう！
				</p>
			</div>
		</div>
		<div class="card">
			<!-- 商品情報 -->
			<table class="information">
				<tr>
					<th>ジャンル</th>
					<td colspan="3">家電</td>
				</tr>
				<tr>
					<th>商品名</th>
					<td>test</td>
					<th>メーカー</th>
					<td>test</td>
				</tr>
				<tr>
					<th>購入日</th>
					<td>test</td>
					<th>価格</th>
					<td>00<span>円</span></td>
				</tr>
				<tr>
					<th>保証期間</th>
					<td>00<span>年</span></td>
					<th>耐用年数</th>
					<td>00<span>年</span></td>
				</tr>
				<tr>
					<th>1日あたりの価格</th>
					<td>00<span>円</span></td>
					<th>目標達成</th>
					<td>○</td>
				</tr>
			</table>
		</div>
		<!-- 各種ボタン -->
		<div class="buttons">
			<button type="button">削除</button>
		</div>
		<div class="backlist">
			<!--　アルバムに戻る　-->
			<a href="${pageContext.request.contextPath}/AlbumListListServlet">
				◀ アルバムへ戻る </a>
		</div>
	</main>

	<!--　フッター　-->
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	<!-- フッターここまで　-->
</body>
</html>