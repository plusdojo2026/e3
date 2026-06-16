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
	<main>
		<h2>
			<b>▶ ランキング </b>
		</h2>

<div class="wrapper">
  <!-- 2位（左） -->
  <div class="item second">
	 <img src="images/銀メダルアイコン.png" class="medal">
	 <p  class="plate">おこめちゃん</p>
	 <img src="images/chara_logo.png" class="icon">
    <div class="stand">2年</div>
  </div>
  <!-- 1位（中央・最前面） -->
  <div class="item first">
    <img src="images/金メダルアイコン .png" class="medal">
	<p class="plate">れいぞうくん</p>
	<img src="images/chara_logo.png" class="icon">
    <div class="stand">5年</div>
  </div>
  <!-- 3位（右） -->
  <div class="item third">
    <img src="images/銅メダルアイコン.png" class="medal">
	<p  class="plate">そうじきん</p>
	<img src="images/chara_logo.png" class="icon">
    <div class="stand">1年</div>
  </div>
</div>

		<div class="sort_">
			<img src="images/sortbutton.png" alt="並び替え" class="sort_button">
			<div class="drop_down">
				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=id_desc">経過日数が長い順</a>
				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=id_asc">経過日数が短い順</a>
				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=day_price_desc">１日当たりの固定費が多い順</a>
				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=day_price_asc">１日当たりの固定費が少ない順</a>
			</div>
		</div>

		<div class="card">
			<!-- ランキング結果 -->
			<table class="info">
				<tr>
					<th>①</th>
					<th>れいぞうくん</th>
					<td>5年3か月使用</td>
				</tr>
				<tr>
					<th>②</th>
					<th>おこめちゃん</th>
					<td>3年4か月使用</td>
				</tr>
				<tr>
					<th>③</th>
					<th>〇〇ちゃん</th>
					<td>〇年〇か月使用</td>
				</tr>
				<tr>
					<th>④</th>
					<th>〇〇ちゃん</th>
					<td>〇年〇か月使用</td>
				</tr>
				<tr>
					<th>⑤</th>
					<th>〇〇ちゃん</th>
					<td>〇年〇か月使用</td>
				</tr>
				<tr>
					<th>⑥</th>
					<th>〇〇ちゃん</th>
					<td>〇年〇か月使用</td>
				</tr>
				<tr>
					<th>⑦</th>
					<th>〇〇ちゃん</th>
					<td>〇年〇か月使用</td>
				</tr>
				<tr>
					<th>⑧</th>
					<th>〇〇ちゃん</th>
					<td>〇年〇か月使用</td>
				</tr>
				<tr>
					<th>⑨</th>
					<th>〇〇ちゃん</th>
					<td>〇年〇か月使用</td>
				</tr>
				<tr>
					<th>⑩</th>
					<th>〇〇ちゃん</th>
					<td>〇年〇か月使用</td>
				</tr>
				<!-- 履歴 -->
				<tr>
					<th>・</th>
					<td>〇〇ちゃん</td>
					<td>〇年〇か月使用</td>
				</tr>
				<tr>
					<th>・</th>
					<td>〇〇ちゃん</td>
					<td>〇年〇か月使用</td>
				</tr>
				<tr>
					<th>・</th>
					<td>〇〇ちゃん</td>
					<td>〇年〇か月使用</td>
				</tr>
			</table>
		</div>
	</main>
</body>
<!--　フッター　-->
<footer>
	<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
</footer>
<!-- フッターここまで　-->
<script src="${pageContext.request.contextPath}/js/common.js">
	
</script>

<script>
	'use strict';
	document.addEventListener("DOMContentLoaded", function() {
		const btn = document.querySelector(".sort_button");
		const menu = document.querySelector(".drop_down");

		btn.addEventListener("click", function() {
			menu.style.display = (menu.style.display === "block") ? "none"
					: "block";
		});

		document.addEventListener("click", function(e) {
			if (!e.target.closest(".sort_")) {
				menu.style.display = "none";
			}
		});
	});
</script>

</html>