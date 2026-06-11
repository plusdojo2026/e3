<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | 新規登録</title>
<style>
.container{
	display: flex; /* 横並び */
	margin: 50px 30px;
}
</style>
</head>
<body>
	<header>
		<h1>モノカチコレクション</h1>
	</header>
	<div class="container">
		<div class="left">
			<h2>はじめまして！</h2>
			<p>これは、あなたが<strong>モノ</strong>の<strong>カチ</strong>を計算できる魔法のツールです。<br>
			ここから、あなただけのコレクションを始めていきましょう。</p>
		</div>
		<div class="regist">
			<h2>会員登録</h2>
			<form method="POST" action="/e3/LoginRegisterServlet">
				ユーザーID<input type="text" name="id"><br>
				パスワード<input type="text" name="password"><br>
			</form>>
		</div>
	</div>
</body>
</html>