<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		
		
		</header>
	<!-- ヘッダー（ここまで） -->
	
	
	<!--　フッター　-->
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	<!-- フッターここまで　-->

	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	
	
	</body>
</html>