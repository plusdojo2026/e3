<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | 商品一覧</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/sl_al.css">
</head>

<body>

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
				<a href="${pageContext.request.contextPath}/LogoutServlet">ログアウト</a>
			</div>
		</nav>

	</header>

	<main>

		<h2 class="listtitle">
			<b>▶ 一覧 </b>： 登録した<strong>モノ</strong>たちを見てみよう！
		</h2>

		<!-- 並び替えボタン -->
		<div class="sort">
			<img src="images/sortbutton.png" alt="並び替え" class="sortbutton">
			<div class="dropdown">
				<a
					href="${pageContext.request.contextPath}/ShouhinListServlet?sort=id_desc">登録が新しい順</a>
				<a
					href="${pageContext.request.contextPath}/ShouhinListServlet?sort=id_asc">登録が古い順</a>
				<a
					href="${pageContext.request.contextPath}/ShouhinListServlet?sort=progress_desc">経過日数が長い順</a>
				<a
					href="${pageContext.request.contextPath}/ShouhinListServlet?sort=progress_asc">経過日数が短い順</a>
				<a
					href="${pageContext.request.contextPath}/ShouhinListServlet?sort=day_price_desc">1日当たりの固定費が多い順</a>
				<a
					href="${pageContext.request.contextPath}/ShouhinListServlet?sort=day_price_asc">1日当たりの固定費が少ない順</a>
			</div>
		</div>

		<!-- 商品一覧を表示 -->
		<div class="shouhinlist">
			<c:forEach var="s" items="${list}">
				<div class="shouhin">
					<a
						href="${pageContext.request.contextPath}/ShouhinDetailServlet?shouhinid=${s.id}">
						<img src="images/shouhinList_bg.png">
						<div class="nickname">
							<p>${s.nickname}</p>
						</div>
						<div class="shouhinimg">
							<c:choose>
								<c:when test="${not empty s.base64Image}">
									<img src="data:image/jpeg;base64,${s.base64Image}" alt="商品画像">
								</c:when>
								<c:otherwise>
									<img src="images/noimage.png" alt="画像がありません">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="name">
							<p>${s.shouhin}</p>
						</div>
						<div class="progress">
							<p>${s.progress}</p>
						</div>
						<div class="day_price">
							<p>${s.day_price}</p>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>

	</main>
</body>

<footer>
	<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
</footer>

<script>
	'use strict';

	//並び替えのプルダウンを表示
	document.addEventListener("DOMContentLoaded", function() {
		const btn = document.querySelector(".sortbutton");
		const menu = document.querySelector(".dropdown");

		btn.addEventListener("click", function() {
			menu.style.display = (menu.style.display === "block") ? "none"
					: "block";
		});

		document.addEventListener("click", function(e) {
			if (!e.target.closest(".sort")) {
				menu.style.display = "none";
			}
		});
	});
</script>

<script src="${pageContext.request.contextPath}/js/common.js"></script>

</html>

