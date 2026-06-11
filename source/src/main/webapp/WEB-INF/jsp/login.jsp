<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | ログイン</title>
<style>
body {
	margin: 0;
	font-family: sans-serif;
}

h2 {
	text-align:center;
}

.container {
	display: flex; /* 横並び */
	margin: 50px 30px;
}

aside {
	background: #f0f0f0;
	padding: 100px;
	margin: 80px;
	box-sizing: border-box;
}

main {
	text-align: left;
	flex: 1; /* フォームのコンテンツ */
	padding: 0 50px ;
	background: #0ff;
}
form{
	background: #e0e0ee;
	padding: 60px 130px;
}
input{
	margin: 10px;
}
.button {
}

.right {
	background: #e0e0e0;
	padding: 100px;
	margin: 80px;
}
</style>
</head>
<body>
	<header>
		<h1>モノカチコレクション</h1>
	</header>

	<div class="container">
		<!-- 左画像 -->
		<aside class="left">左側の画像</aside>
		<!-- ログインフォーム -->
		<main>
			<h2>おかえりなさい！</h2>
			<form method="POST" action="/e3/LoginServlet">
				ユーザーID<br><input type="text" name="id"><br>
				パスワード<br><input type="password" name="password"><br>
				<input type="submit" name="login" value="ログイン" class="button"><br>
				<a href="/e3/LoginRegisterServlet">新規登録はこちら</a>
			</form>
		</main>
		<!-- 右画像 -->
		<div class="right">右側の画像</div>
	</div>
</body>
</html>