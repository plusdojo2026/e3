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
}

main {  /* フォームのコンテンツ */
	text-align: left;
	flex: 1;
	padding: 0 50px ;
}
form{ /* フォームのコンテンツ内部 */
	background: #fef263;
	padding: 40px 100px;
	border: solid 6px orange;
	border-radius: 30px;
}
input{ 
	margin: 10px 0;
}
input[type="text"], input[type="password"] { /* 記入欄 */
	width: 250px;
	height: 30px;
	background-color: gold;
	color:white;
	border-radius: 5px;
}
input[type="submit"] {
	padding: 5px 20px;
	margin: 20px 80px 30px;
	font-size: 10px  20px;
}
h2 {
	font-size: 35px;
	
}
a {
	color: white;
	padding: 0 3px;
	margin: 0 60px;
	text-decoration: none;
	border: solid 1px black;
	background: orange;
}
.left, .right {
	padding: 100px 50px;
	margin: 60px 30px;
}
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
		<img class="left" src="images/login3.png" width="320" height="350" alt="">
		<!-- ログインフォーム -->
		<main>
			<h2>おかえりなさい！</h2>
			<form method="POST" action="/e3/LoginServlet">
				ユーザーID<br><input type="text" name="id"><br><br>
				パスワード<br><input type="password" name="password"><br>
				<input type="submit" name="login" value="ログイン"><br>
				<hr style="border: none; border-top: 2px solid #333;">
				<br><a href="/e3/LoginRegisterServlet">新規登録はこちら</a>
			</form>
		</main>
		<!-- 右画像 -->
		<img class="right" src="images/login2.png" width="350" height="300" alt="">
	</div>
</body>
</html>