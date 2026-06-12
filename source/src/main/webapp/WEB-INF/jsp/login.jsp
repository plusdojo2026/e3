<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | ログイン</title>
<style>

</style>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/log_reg.css">
</head>
<body>
	<div class="screen">
		<header>
			<h1 class="title">
			<img src="images/タイトルロゴ.png" alt="サイトタイトル">
			</h1>
		</header>

		<div class="container">
			<!-- 左画像 -->
			<img class="left" src="images/login3.png" width="320" height="350" alt="">
			<!-- ログインフォーム -->
			<main>
				<h2>おかえりなさい！</h2>
				<form method="POST" action="/e3/LoginServlet">
					ユーザーID<br><input type="text" name="id"><br><br>
					パスワード<br><input type="password" name="password"><br>
					<input type="button" name="login" value="ログイン"><br>
					<hr style="border: none; border-top: 2px solid #333;">
					<br><a href="/e3/LoginRegisterServlet">新規登録はこちら</a>
				</form>
			</main>
			<!-- 右画像 -->
			<img class="right" src="images/login2.png" width="350" height="300" alt="">
		</div>
	</div>
</body>
</html>