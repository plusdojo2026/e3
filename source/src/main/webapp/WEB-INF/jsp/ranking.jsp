<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | ランキング</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/men_ran.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>

	<!-- ヘッダー -->
	<header>
		<div class="header-in">
			<div class="header-spacer"></div>
			<h1 class="title">
    <a href="${pageContext.request.contextPath}/MenuServlet">
        <img src="${pageContext.request.contextPath}/images/タイトルロゴ.png" alt="サイトタイトル">
    </a>
</h1>
		</div>

		<button class="hamburger-btn" id="menuBtn" aria-label="メニューを開く">
			<span></span><span></span><span></span>
		</button>

		<nav class="side-menu" id="sideMenu">
			<div class="menu-header">モノカチコレクション</div>

			<div class="menu-nav">
				<a href="${pageContext.request.contextPath}/MenuServlet">メニュー</a>
				<a href="${pageContext.request.contextPath}/MyPageServlet">マイページ</a>
				<a href="${pageContext.request.contextPath}/DiagnosisServlet">購入診断</a>
				<a href="${pageContext.request.contextPath}/ShouhinListServlet">一覧表示</a>
				<a href="${pageContext.request.contextPath}/RegisterServlet">登録</a>
				<a href="${pageContext.request.contextPath}/AlbumListServlet">アルバム</a>
				<a href="${pageContext.request.contextPath}/OperationServlet">機能説明</a>
				<a href="${pageContext.request.contextPath}/LogoutServlet">ログアウト</a>
			</div>
		</nav>
	</header>

	<main>

		<h2 class=stitle>
			<b>▶ ランキング：</b><br class="mediabr"> <span class="sort-label"><c:choose>
					<c:when test="${empty param.sort_ or param.sort_ eq 'buyDateDesc'}"> 購入日が新しい順</c:when>
					<c:when test="${param.sort_ eq 'buyDateAsc'}"> 購入日が古い順</c:when>
					<c:when test="${param.sort_ eq 'progressDesc'}"> 使用日数が長い順</c:when>
					<c:when test="${param.sort_ eq 'progressAsc'}"> 使用日数が短い順</c:when>
					<c:when test="${param.sort_ eq 'dayPriceDesc'}"> １日あたりの価格が多い順</c:when>
					<c:when test="${param.sort_ eq 'dayPriceAsc'}"> １日あたりの価格が少ない順</c:when>
				</c:choose></span>
		</h2>
		<div class="backalbum">
			<a href="${pageContext.request.contextPath}/AlbumListServlet">
				◀アルバムに戻る </a>
		</div>

		<!-- 上位ランキング -->
		<div class="wrapper">

			<c:forEach var="item" items="${rankingList}" varStatus="st">

				<c:if test="${st.count <= 3}">

					<a
						href="${pageContext.request.contextPath}/AlbumDetailServlet?shouhinid=${item.id}"
						class="nextAD">
						<div
							class="item
        ${st.count == 1 ? 'first' : ''}
        ${st.count == 2 ? 'second' : ''}
        ${st.count == 3 ? 'third' : ''}">

							<!-- メダル -->
							<c:choose>
								<c:when test="${st.count == 1}">
									<img src="images/金メダルアイコン .png" class="medal">
								</c:when>
								<c:when test="${st.count == 2}">
									<img src="images/銀メダルアイコン.png" class="medal">
								</c:when>
								<c:when test="${st.count == 3}">
									<img src="images/銅メダルアイコン.png" class="medal">
								</c:when>
							</c:choose>

							<!-- 名前 -->
							<p class="plate">${empty item.nickname ? item.shouhin : item.nickname}</p>

							<!-- アイコン -->
							<div class="icon">
								<c:choose>
									<c:when test="${not empty item.base64Image}">
										<img src="data:image/jpeg;base64,${item.base64Image}"
											alt="商品画像">
									</c:when>
									<c:otherwise>
										<img src="images/chara_logo.png">
									</c:otherwise>
								</c:choose>
							</div>

							<!-- 表彰台 -->
							<div class="stand">
								<c:choose>
									<c:when
										test="${empty param.sort_ or param.sort_ eq 'buyDateAsc' or param.sort_ eq 'buyDateDesc'}">
							${item.buy_date}
						</c:when>
									<c:when
										test="${param.sort_ eq 'progressAsc' or param.sort_ eq 'progressDesc'}">
							${item.progress}日
						</c:when>
									<c:otherwise>
							${item.day_priceInt}円/日
						</c:otherwise>
								</c:choose>
							</div>

						</div>
					</a>

				</c:if>

			</c:forEach>

		</div>

		<!-- 並び替え -->
		<div class="sort_">
			<img src="images/sortbutton.png" alt="並び替え" class="sort_button">

			<div class="drop_down">

				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=buyDateDesc">購入日が新しい順</a>
				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=buyDateAsc">購入日が古い順</a>				
				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=progressDesc">使用日数が長い順</a>
				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=progressAsc">使用日数が短い順</a>
				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=dayPriceDesc">１日当たりの固定費が多い順</a>
				<a
					href="${pageContext.request.contextPath}/RankingServlet?sort_=dayPriceAsc">１日当たりの固定費が少ない順</a>

			</div>
		</div>

		<!-- 一覧テーブル -->
		<c:choose>
			<c:when test="${not empty rankingList}">
				<div class="card">

					<table class="info">

						<c:forEach var="item" items="${rankingList}" varStatus="status">

							<tr class="nextAD"
								onclick="location.href='${pageContext.request.contextPath}/AlbumDetailServlet?shouhinid=${item.id}'">
								<th>${status.count}</th>
								<th>${empty item.nickname ? item.shouhin : item.nickname}</th>
								<td><c:choose>
										<c:when
											test="${empty param.sort_ or param.sort_ eq 'buyDateAsc' or param.sort_ eq 'buyDateDesc'}">
					${item.buy_date}
				</c:when>
										<c:when
											test="${param.sort_ eq 'progressAsc' or param.sort_ eq 'progressDesc'}">
					${item.progress}日
				</c:when>
										<c:otherwise>
					${item.day_priceInt}円/日
				</c:otherwise>
									</c:choose></td>
							</tr>

						</c:forEach>

					</table>

				</div>
			</c:when>

			<c:otherwise>
				<p class="no-data">データがありません</p>
			</c:otherwise>
		</c:choose>

	</main>

	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>

	<script src="${pageContext.request.contextPath}/js/common.js"></script>

	<script>
'use strict';

document.addEventListener("DOMContentLoaded", function() {
    const btn = document.querySelector(".sort_button");
    const menu = document.querySelector(".drop_down");

    btn.addEventListener("click", function() {
        menu.style.display = (menu.style.display === "block") ? "none" : "block";
    });

    document.addEventListener("click", function(e) {
        if (!e.target.closest(".sort_")) {
            menu.style.display = "none";
        }
    });
});
</script>

</body>
</html>