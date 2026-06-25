<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--　ビューポート　-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | メニュー</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/men_ran.css">
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
	<!-- ヘッダー（ここまで） -->

	<main>

		<!-- ヒーロー -->
		<img src="images/hero.jpg" class="hero" alt="">

		<!-- キャラ＋吹き出し -->
		<div class="speech">

			<c:choose>
				<c:when test="${not empty img}">
					<img src="data:image/jpeg;base64,${img.base64Image}" class="logo"
						alt="キャラ画像" />
				</c:when>
				<c:otherwise>
					<img src="images/noimage.png" class="logo" alt="キャラ画像" />
				</c:otherwise>
			</c:choose>

			<!-- 通知を３件ずつ分けて表示 -->
			<!-- <div class="tail"></div> -->
			<div class="speechBubble">
				<div class="speechTrack" id="speechTrack">

					<c:choose>
						<c:when test="${not empty nickname}">
							<c:forEach var="i" begin="0" end="${nickname.size() - 1}"
								step="3">
								<div class="speechPage">
									<c:forEach var="j" begin="0" end="2">
										<c:if test="${i + j < nickname.size()}">
											<c:set var="item" value="${nickname[i + j]}" />
											<div class="speechText">
												<a
													href="${pageContext.request.contextPath}/ShouhinDetailServlet?shouhinid=${item.id}">
													${item.nickname}</a>の保証期間が近づいているよ！
											</div>
										</c:if>
									</c:forEach>
								</div>
							</c:forEach>
						</c:when>
						<c:when test="${empty nickname and not empty nickname_random}">
							<c:forEach var="k" begin="0" end="${nickname_random.size() - 1}"
								step="3">
								<div class="speechPage">
									<c:forEach var="l" begin="0" end="2">
										<c:if test="${k + l < nickname_random.size()}">
											<c:set var="item" value="${nickname_random[k + l]}" />
											<div class="speechText">
												<a
													href="${pageContext.request.contextPath}/ShouhinDetailServlet?shouhinid=${item.id}">
													${item.nickname}</a> がこんにちはと言っているよ！
											</div>
										</c:if>
									</c:forEach>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<div class="notspeechText">通知はありません。</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<c:if
				test="${(not empty nickname and fn:length(nickname) > 3) or (empty nickname and fn:length(nickname_random) > 3)}">
				<button type="button" class="backbutton" id="backbutton">前の3件</button>
				<button type="button" class="nextbutton" id="nextbutton">次の3件</button>
			</c:if>

		</div>

		<!-- テレビ画像 -->
		<div class="tv" align="center">
			<img src="images/tv.png" alt="テレビ">

			<p class="tv_text">
				<b>現在の固定費は<br>${total}円です！</b>
			</p>
		</div>

	</main>

	<!--　フッター　-->
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	<!-- フッターここまで　-->

	<script src="${pageContext.request.contextPath}/js/common.js"></script>

	<script>
	'use strict';
	
	//通知のスライド機能
	document.addEventListener("DOMContentLoaded", () => {

	    const track = document.querySelector(".speechTrack");
	    const pages = document.querySelectorAll(".speechPage");
	    const nextbutton = document.getElementById("nextbutton");
	    const backbutton = document.getElementById("backbutton");

	    let index = 0;
	    const pageHeight = 150;
	    const maxIndex = pages.length - 1;
	    console.log("pageHeight:", pageHeight);
	    backbutton.addEventListener("click", () => {
	        index = (index - 1 + (maxIndex + 1)) % (maxIndex + 1);

	        const move = index * pageHeight;

	        console.log("BACK:", index);
	        console.log("move:", move, typeof move);

	        track.style.transform = "translateY(" + (-move) + "px)";
	        console.log("transform:", track.style.transform);
	    });

	    nextbutton.addEventListener("click", () => {
	        index = (index + 1) % (maxIndex + 1);

	        const move = index * pageHeight;

	        console.log("NEXT:", index);
	        console.log("move:", move, typeof move);

	        track.style.transform = "translateY(" + (-move) + "px)";
	        console.log("transform:", track.style.transform);
	    });
	});
</script>

</body>
</html>