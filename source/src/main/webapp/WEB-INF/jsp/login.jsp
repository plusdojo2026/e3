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
<style>

</style>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/log_reg.css">
</head>
<body>
	<header>
		<h1 class="title">
		<img src="images/タイトルロゴ.png" alt="サイトタイトル">
		</h1>
	</header>

	<div class="container">
		<!-- 左画像 -->
		<img class="left slide-left" src="images/login3.png" alt="">
		<!-- ログインフォーム -->
		<main class="center pop">
			<h2>おかえりなさい！</h2>
			
			<!-- エラー表示 -->
			<c:if test="${not empty error}">
    			<p style="color:red;">${error}</p>
			</c:if>
			
			<form method="POST" action="${pageContext.request.contextPath}/LoginServlet">
				<p id="text">ユーザーID</p><input type="text" name="userId"><br><br>
				<p id="text">パスワード</p><input type="password" name="password"><br>
				<input class="login" type="submit" name="login" value="ログイン"><br>
				<hr style="border: none; border-top: 2px solid #333;">
				<br><a class="Toregist" href="/e3/LoginRegisterServlet">新規登録はこちら</a>
			</form>
			<p class="one">ログインして通知を確認</p>
		</main>
		<!-- 右画像 -->
		<img class="right slide-right" src="images/login2.png" alt="">
	</div>
	
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script>
</script>
</body>
</html>