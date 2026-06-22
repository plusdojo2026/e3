<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | アルバム詳細</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/sd_ad.css">
</head>
<body>
	<!--　ヘッダー　-->
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
				<a href="${pageContext.request.contextPath}/LogoutServlet">ログアウト</a>
			</div>
		</nav>
	</header>
	<!-- ヘッダーここまで　-->
	<main>
		<!-- キャラクター + 吹き出し -->
		<div class="iconSpeech">
			<div class="shouhinimg">
				<P>${rirekiinfo.nickname}</P>
				<c:choose>
					<c:when test="${not empty rirekiinfo.base64Image}">
						<img src="data:image/jpeg;base64,${rirekiinfo.base64Image}"
							alt="商品画像">
					</c:when>
					<c:otherwise>
						<img src="images/chara_logo.png">
					</c:otherwise>
				</c:choose>
			</div>

			<div class="speechBubble">
				<p>
					${rirekiinfo.progress}日使ったよ！<br> 大事に使ってくれてありがとう♪
				</p>
			</div>
		</div>
		<div class="card">
			<!-- 商品情報 -->
			<table class="information">
				<tr>
					<th>ジャンル</th>
					<td colspan="3">${rirekiinfo.genre}</td>
				</tr>
				<tr>
					<th>商品名</th>
					<td>${rirekiinfo.shouhin}</td>
					<th>メーカー</th>
					<td>${rirekiinfo.maker}</td>
				</tr>
				<tr>
					<th>購入日</th>
					<td>${rirekiinfo.buy_date}</td>
					<th>価格</th>
					<td>${rirekiinfo.price}<span>円</span></td>
				</tr>
				<tr>
					<th>保証期間</th>
					<td>${rirekiinfo.wperiod}<span>年</span></td>
					<th>耐用年数</th>
					<td>${rirekiinfo.life}<span>年</span></td>
				</tr>
				<tr>
					<th>1日あたりの価格</th>
					<td>${rirekiinfo.day_priceInt}<span>円</span></td>
					<th>目標達成</th>
					<td><c:choose>
							<c:when test="${rirekiinfo.goal <= 0}">
            ○
        </c:when>
							<c:otherwise>
            ✕
        </c:otherwise>
						</c:choose></td>
				</tr>
			</table>
		</div>
		<!-- 各種ボタン -->
		<div class="buttons">
			<button type="button" onclick="return deletecheck(${rirekiinfo.id})">削除</button>
		</div>
		<div class="backlist">
			<!--　一覧に戻る　-->
			<a href="${pageContext.request.contextPath}/AlbumListServlet"> ◀
				アルバムへ戻る </a>
		</div>
	</main>

	<!--　フッター　-->
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>
	<!-- フッターここまで　-->
	<script src="${pageContext.request.contextPath}/js/common.js"></script>
	<script>
    'use strict';
    
   function deletecheck(id){
        if (window.confirm('本当に商品を削除しますか？削除された商品は復元できません。')) {
            alert('商品の削除が完了しました。');
            location.href = '<%=request.getContextPath()%>/AlbumDetailServlet?action=delete&shouhinid=' + id;
				return true;
			} else {
				alert('削除がキャンセルされました。');
				return false;
			}
		}
	</script>
</body>
</html>