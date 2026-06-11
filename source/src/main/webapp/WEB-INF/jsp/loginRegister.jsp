<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | 新規登録</title>
<style>
.contain {
	display: flex; /* 横並び */
	
}
.notice { /* 左コンテンツ */
	background-color: #e0e0e0;
	margin: 10px;
}
.regist { /*　右コンテンツ */
	background-color: #f0f0f0;
	margin: 10px;
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
	
	<div class="contain">
	
		<div class="notice">
			<h2>はじめまして！</h2>
			<p>これは、あなたが<strong>モノ</strong>の<strong>カチ</strong>を計算できる魔法のツールです。<br>
			ここから、あなただけのコレクションを始めていきましょう。</p>
		</div>
		
		<div class="regist">
			<h2>会員登録</h2>
			<form method="POST" action="/e3/LoginRegisterServlet">
				ユーザーID<input type="text" name="id"><br>
				パスワード<input type="text" name="password"><br>
			</form>
		</div>
		
	</div>
	
</body>
</html>