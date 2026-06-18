<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--　ビューポート　-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | ランキング</title>
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

<!-- 1位 -->
<div class="item first">
    <img src="images/金メダルアイコン .png" class="medal">

    <p class="plate">
        ${not empty rankingList[0] ? (empty rankingList[0].nickname ? rankingList[0].shouhin : rankingList[0].nickname) : "未登録"}
    </p>

    <img src="images/chara_logo.png" class="icon">

    <div class="stand">
        ${not empty rankingList[0] ? rankingList[0].day_price : 0}円/日
    </div>
</div>

<!-- 2位 -->
<div class="item second">
    <img src="images/銀メダルアイコン.png" class="medal">

    <p class="plate">
        ${not empty rankingList[1] ? (empty rankingList[1].nickname ? rankingList[1].shouhin : rankingList[1].nickname) : "未登録"}
    </p>

    <img src="images/chara_logo.png" class="icon">

    <div class="stand">
        ${not empty rankingList[1] ? rankingList[1].day_price : 0}円/日
    </div>
</div>

<!-- 3位 -->
<div class="item third">
    <img src="images/銅メダルアイコン.png" class="medal">

    <p class="plate">
        ${not empty rankingList[2] ? (empty rankingList[2].nickname ? rankingList[2].shouhin : rankingList[2].nickname) : "未登録"}
    </p>

    <img src="images/chara_logo.png" class="icon">

    <div class="stand">
        ${not empty rankingList[2] ? rankingList[2].day_price : 0}円/日
    </div>
</div>

</div>

		<div class="sort_">
			<img src="images/sortbutton.png" alt="並び替え" class="sort_button">
			<div class="drop_down">
				<!--   <a href="${pageContext.request.contextPath}/RankingServlet?sort_=id_desc">経過日数が長い順</a> -->
				<!--  <a href="${pageContext.request.contextPath}/RankingServlet?sort_=id_asc">経過日数が短い順</a> -->
				<!--   <a href="${pageContext.request.contextPath}/RankingServlet?sort_=day_price_desc">１日当たりの固定費が多い順</a>  -->
				<!--   < a href="${pageContext.request.contextPath}/RankingServlet?sort_=day_price_asc">１日当たりの固定費が少ない順</a>  -->
				<!-- sort_=id_descの部分がDAOと違っていたので修正しています、確認できましたら上のコメントアウトは消してもらって大丈夫です！ -->

				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=buyDateDesc">経過日数が長い順</a>

				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=buyDateAsc">経過日数が短い順</a>

				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=dayPriceDesc">１日当たりの固定費が多い順</a>

				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=dayPriceAsc">１日当たりの固定費が少ない順</a>

			</div>
		</div>

		<div class="card">
			<!-- ランキング結果 -->
			<table class="info">

<c:forEach var="item" items="${rankingList}" varStatus="status">

<tr>
    <th>${status.count}</th>

    <th>
        ${empty item.nickname ? item.shouhin : item.nickname}
    </th>

    <td>
        ${item.day_price}円/日
    </td>
</tr>

</c:forEach>
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