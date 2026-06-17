<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>モノカチコレクション | 商品詳細</title>
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
				<a href="${pageContext.request.contextPath}/LoginServlet">ログアウト</a>
			</div>
		</nav>
	</header>
	<!-- ヘッダーここまで　-->
	<main>
	<!-- 愛称 -->
	<div class="nickname">
	<P>${shouhininfo.nickname}</P>
	</div>
		<!-- キャラクター + 吹き出し -->
		<div class="iconSpeech">
			<div class="shouhinimg">
							<c:choose>
								<c:when test="${not empty s.base64Image}">
									<img src="data:image/jpeg;base64,${s.base64Image}" alt="商品画像">
								</c:when>
								<c:otherwise>
									<img src="images/noimage.png" alt="画像がありません">
								</c:otherwise>
							</c:choose>
						</div>

			<div class="speechBubble">
				<p>
					僕の一日あたりの価格は${shouhininfo.day_price}円だよ！<br> ${shouhininfo.progress}日使ったよ！<br> あと${shouhininfo.goal}日で目標達成♪
				</p>
			</div>
		</div>
		<div class="card">
			<!-- 商品情報 -->
			<table class="information">
				<tr>
					<th>ジャンル</th>
					<td colspan="3">${shouhininfo.genre}</td>
				</tr>
				<tr>
					<th>商品名</th>
					<td>${shouhininfo.shouhin}</td>
					<th>メーカー</th>
					<td>${shouhininfo.maker}</td>
				</tr>
				<tr>
					<th>購入日</th>
					<td>${shouhininfo.buy_date}</td>
					<th>価格</th>
					<td>${shouhininfo.price}<span>円</span></td>
				</tr>
				<tr>
					<th>保証期間</th>
					<td>${shouhininfo.wperiod}<span>年</span></td>
					<th>耐用年数</th>
					<td>${shouhininfo.life}<span>年</span></td>
				</tr>
				<tr>
					<th>1日あたりの価格</th>
					<td>${shouhininfo.day_price}<span>円</span></td>
					<th>目標達成まで</th>
					<td>${shouhininfo.goal}<span>日</span></td>
				</tr>
			</table>
		</div>
		<!-- 各種ボタン -->
		<div class="buttons">
			<button type="button"
				onclick="location.href='${pageContext.request.contextPath}/EditServlet?id=${shouhininfo.id}'">
				編集</button>
			<button type="button" onclick="return rirekicheck(${shouhininfo.id})">履歴へ送る</button>
			<button type="button" class=deleteButton
				onclick="return deletecheck(${shouhininfo.id})">削除</button>
		</div>
		<div class="backlist">
			<!--　一覧に戻る　-->
			<a href="${pageContext.request.contextPath}/ShouhinListServlet">
				◀ 一覧へ戻る </a>
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
    
    function rirekicheck(id){
        if (window.confirm('商品を履歴に登録しますか？履歴に登録した商品は復元できません。')) {
            alert('履歴への登録が完了しました。');
            location.href = '<%=request.getContextPath()%>
		/ShouhinDetailServlet?action=rireki&id='
						+ id;
				return true;
			} else {
				alert('履歴への登録がキャンセルされました。');
				return false;
			}
		}
    
    function deletecheck(id){
        if (window.confirm('本当に商品を削除しますか？削除された商品は復元できません。')) {
            alert('商品の削除が完了しました。');
            location.href = '<%=request.getContextPath()%>
		/ShouhinDetailServlet?action=delete&id='
						+ id;
				return true;
			} else {
				alert('削除がキャンセルされました。');
				return false;
			}
		}
	</script>
</body>
</html>