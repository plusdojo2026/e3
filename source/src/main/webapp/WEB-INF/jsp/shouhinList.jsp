<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | 商品一覧</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/sl_al.css">
</head>
<body>
	<h1 class="title">
		  <img src="images/タイトルロゴ.png" alt="サイトタイトル">
	</h1>

	<h2>
		<b>▶ 一覧 </b>： 登録した<strong>モノ</strong>たちを見てみよう！
	</h2>

	<div class="sort">
		<img src="images/sortbutton.png" alt="並び替え"
			class="sortbutton">
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
				href="${pageContext.request.contextPath}/ShouhinListServlet?sort=day_price_desc">１日当たりの固定費が多い順</a>
			<a
				href="${pageContext.request.contextPath}/ShouhinListServlet?sort=day_price_asc">１日当たりの固定費が少ない順</a>
		</div>
	</div>

	<main>
		<div class="items">
			<c:forEach var="s" items="${list}">
				<div class="item">
					<a
						href="${pageContext.request.contextPath}/ShouhinDetailServlet?shouhinid=${s.id}">
						<img src="images/shouhinList_bg.png" width=300px height=auto>
						<div class="nickname">
							<p>${s.nickname}</p>
						</div>
						<div class="shouhinimg">
							<img src="" alt="商品画像">
							<!--退避　${pageContext.request.contextPath}/ImageServlet?name=${s.id}-->
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

</html>

