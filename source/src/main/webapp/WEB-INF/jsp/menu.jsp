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
		<!-- ヒーロー -->
		<img src="images/hero.jpg" class="hero" alt="">

		<!-- キャラ＋吹き出し -->
		<div class="speech">
			<img src="images/chara_logo.png" class="logo" width="10%" alt="">

			<div class="speechBubble">
				<div class="speechTrack" id="speechTrack">
					<div class="speechPage">
						<div class="speechText">通知だよ----ん</div>
						<div class="speechText">通知だよん2</div>
						<div class="speechText">通知だよん3</div>
					</div>
					<div class="speechPage">
						<div class="speechText">通知だよん4</div>
						<div class="speechText">通知だよん5</div>
						<div class="speechText">通知だよん6</div>
					</div>
				</div>
			</div>

			<button type="button" class="backbutton" id="backbutton">前の3件</button>
			<button type="button" class="nextbutton" id="nextbutton">次の3件</button>
		</div>

		<!-- テレビ画像 -->
		<div class="tv" align="center">
			<img src="images/tv.png" alt="テレビ">

			<p class="tv_text">
				現在の固定費は<br>${total}円です！
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