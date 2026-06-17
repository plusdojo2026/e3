<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--　ビューポート　-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | アルバム詳細</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/sd_ad.css">
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
				<a href="${pageContext.request.contextPath}/MenuServlet">メニュー</a> <a
					href="${pageContext.request.contextPath}/DiagnosisServlet">購入診断</a>
				<a href="${pageContext.request.contextPath}/ShouhinListServlet">一覧表示</a>
				<a href="${pageContext.request.contextPath}/RegisterServlet">登録</a>
				<a href="${pageContext.request.contextPath}/AlbumListServlet">アルバム</a>
				<a href="${pageContext.request.contextPath}/OperationServlet">機能説明</a>
				<a href="${pageContext.request.contextPath}/LoginServlet">ログアウト</a>
			</div>
		</nav>
	</header>
	<!-- ヘッダーここまで　-->
	<main>


		<!-- キャラクター + 吹き出し -->
		<div class="iconSpeech">
			<img src="images/デフォルトアイコン（仮）.png" width="40vw" height="40vw">

			<div class="speechBubble">
				<p>
					〇〇日使ったよ！<br> 大事に使ってくれてありがとう！
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
			<a href="${pageContext.request.contextPath}/AlbumListServlet">
				◀ アルバムへ戻る </a>
		</div>
	</main>

	<!--　フッター　-->
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	<!-- フッターここまで　-->
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	<script>	
	</script>
</body>
</html>