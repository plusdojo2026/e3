<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | 新規登録</title>
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
	
	<main class="contain">
	
		<div class="notice">
			<h2 class="first">はじめまして！</h2>
			<p>これは、あなたが <strong>モノ</strong> の <strong>カチ</strong> を計算できる魔法のツールです。</p>
			<p>ここから、あなただけのコレクションを始めていきましょう。</p>
			
			<img class="tip" src="images/loginRegister1.png" width="430" height="400" alt="">
		</div>
		
		<div class="regist">
			<h2 class="second">会員登録</h2>
			<!-- エラー表示 -->
			<c:if test="${not empty error}">
    			<p style="color:red;">${error}</p>
			</c:if>
			<form class="register" method="POST" action="/e3/LoginRegisterServlet">
				<p id="text">ユーザーID　　　</p><input type="text" name="userId" placeholder="(自動採番)" disabled><br>
				<p id="text">パスワード　　　　</p><input type="text" name="password"><br>
				<p id="text">パスワード(確認用)</p><input type="text" name="passwordConfirm"><br>
				<p class="rule">パスワードには8文字（英数字、大文字、小文字から２つ以上を含む）を設定してください。</p>
				<input class="reg" type="submit" name="regist" value="登録"><br>
			</form>
			<br><a class="Tologin" href="/e3/LoginServlet">ログインはこちら</a>
		</div>
	</main>
	
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
</body>
</html>