<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | メニュー</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/men_ran.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
	<!-- ヘッダー（ここから） -->

	<header>
		<h1 class="title">
			  <img src="images/タイトルロゴ.png" alt="サイトタイトル">
		</h1>
	</header>
	<!-- ヘッダー（ここまで） -->
	
	<!-- ヒーロー -->
	<main>
		<img src="images/menu_hero.png" class="hero" width=300%  alt="">
	<div class="items">

		<!-- キャラ＋吹き出し -->
		<div class="item">

			<img src="images/petlogo.png" class="logo" width="10%" alt="">

			<!-- 吹き出し（ここはテキストだけ） -->
			<div class="speechBubble">通知です</div>
			<!-- 吹き出しの外 -->
			<button type="button">もっと見る</button>

			<!-- 固定費を表示するテレビ -->
			<div align="center">
				<img src="images/tv.png" alt="テレビ">

			</div>

		</div>

	</div>
	</main>
	<!--　フッター　-->
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	<!-- フッターここまで　-->
</body>
</html>