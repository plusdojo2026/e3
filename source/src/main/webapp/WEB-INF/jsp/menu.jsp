<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--　ビューポート　-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | メニュー</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/men_ran.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
	<!-- ヘッダー（ここから） -->

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
	<!-- ヘッダー（ここまで） -->

	<!-- ヒーロー -->
	<main>
		<img src="images/hero.jpg" class="hero" alt="">

		<!-- キャラ＋吹き出し -->
		<div class="image">

			<img src="images/petlogo.png" class="logo" width="10%" alt="">

			<!-- 吹き出し（ここはテキストだけ） -->
			<div class="speechBubble">
				通知です<br>通知です<br>通知です
			</div>
			<!-- 「もっと見る」ボタン -->
			<button type="button">もっと見る</button>

		</div>
		<!-- テレビ画像 -->
		<div class="tv" align="center">
			<img src="images/tv.png" alt="テレビ">

			<p class="tv_text">
				今日の固定費は<br>〇〇円です！
			</p>
		</div>
	</main>
	<!--　フッター　-->
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	<!-- フッターここまで　-->
	<script src="${pageContext.request.contextPath}/js/common.js">
		
	</script>
</body>
</html>