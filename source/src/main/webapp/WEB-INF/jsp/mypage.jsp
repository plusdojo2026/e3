<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ビューポート -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | ログイン</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/mypage.css">
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
					href="${pageContext.request.contextPath}/MyPageServlet">マイページ</a> <a
					href="${pageContext.request.contextPath}/DiagnosisServlet">購入診断</a>
				<a href="${pageContext.request.contextPath}/ShouhinListServlet">一覧表示</a>
				<a href="${pageContext.request.contextPath}/RegisterServlet">登録</a>
				<a href="${pageContext.request.contextPath}/AlbumListServlet">アルバム</a>
				<a href="${pageContext.request.contextPath}/OperationServlet">機能説明</a>
				<a href="${pageContext.request.contextPath}/LogoutServlet">ログアウト</a>
			</div>
		</nav>

	</header>
	<!-- ヘッダー（ここまで） -->

	<main class="most">


		<div class="theme">
			<h2 class="first2">パスワードを変更します！</h2>
			<p>
				ここから <strong>パスワードの変更</strong>を行うことが出来ます。
			</p>

			<img class="mine" src="images/mypagelogo.png" width="400"
				height="400" alt="">
		</div>

		<div class="change">
			<h2 class="second2">パスワード変更</h2>
			<!-- エラー表示 -->
			<c:if test="${not empty error}">
				<p style="color: red;">${error}</p>
			</c:if>
			<form class="change2" method="POST"
				action="/e3/MyPageServlet">
				<p id="text">ユーザーID</p>
				<input type="text" name="userId"><br>
				<p id="text">変更用パスワード</p>
				<input type="text" name="password"><br>
				<p id="text">変更用パスワード(確認用)</p>
				<input type="text" name="passwordConfirm"><br>
				<p class="rule2">パスワードには8文字（英数字、大文字、小文字から２つ以上を含む）を設定してください。</p>
				<input class="chan" type="submit" name="change" value="変更"><br>
			</form>
			<br> <a class="Tomenu" href="/e3/MenuServlet">メニューに戻る</a>

		</div>
	</main>





	<!--　フッター　-->
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	<!-- フッターここまで　-->

	<script src="${pageContext.request.contextPath}/js/common.js"></script>


</body>
</html>