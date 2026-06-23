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
				<a href="${pageContext.request.contextPath}/LogoutServlet">ログアウト</a>
			</div>
		</nav>
	</header>
	<!-- ヘッダーここまで　-->
	<main>
		<!-- キャラクター + 吹き出し -->
		<div class="iconSpeech">
			<div class="shouhinimg">
<div class="imageArea">
				<P>
					<span class="cellText">${shouhininfo.nickname}</span>
				</P>
			</div>


			<div class="frameWrap">
				<c:choose>
					<c:when test="${not empty shouhininfo.base64Image}">
						<img class="itemImage"
							src="data:image/jpeg;base64,${shouhininfo.base64Image}"
							alt="商品画像">
					</c:when>
					<c:otherwise>
						<img class="itemImage" src="images/chara_logo.png">
					</c:otherwise>
				</c:choose>
				<img class="frameImage" id="previewFrame"
					src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mP8z8AARwMCAp7YfWQAAAAASUVORK5CYII=">

</div>
			</div>
			<div class="speechBubble">
				<p>
					僕の一日あたりの価格は${shouhininfo.day_priceInt}円だよ！<br>
					${shouhininfo.progress}日使ったよ！<br> あと${shouhininfo.goal}日で目標達成♪
				</p>

			</div>
		</div>


		<div class="card">
			<!-- 商品情報 -->
			<table class="information">
				<tr>
					<th>ジャンル</th>
					<td colspan="3"><span class="cellText">${shouhininfo.genre}</span></td>
				</tr>
				<tr>
					<th>商品名</th>
					<td><span class="cellText">${shouhininfo.shouhin}</span></td>
					<th>メーカー</th>
					<td><span class="cellText">${shouhininfo.maker}</span></td>
				</tr>
				<tr>
					<th>購入日</th>
					<td><span class="cellText">${shouhininfo.buy_date}</span></td>
					<th>価格</th>
					<td><span class="cellText">${shouhininfo.price}</span><span
						class="tanni">円</span></td>
				</tr>
				<tr>
					<th>保証期間</th>
					<td><span class="cellText">${shouhininfo.wperiod}</span><span
						class="tanni">年</span></td>
					<th>耐用年数</th>
					<td><span class="cellText">${shouhininfo.life}</span><span
						class="tanni">年</span></td>
				</tr>
				<tr>
					<th>1日あたりの価格</th>
					<td><span class="cellText">${shouhininfo.day_priceInt}</span><span
						class="tanni">円</span></td>
					<th>目標達成まで</th>
					<td><span class="cellText">${shouhininfo.goal}</span><span
						class="tanni">日</span></td>
				</tr>
			</table>
		</div>
		<!-- 各種ボタン -->
		<div class="buttons">
			<button type="button"
				onclick="location.href='${pageContext.request.contextPath}/EditServlet?id=${shouhininfo.id}'">
				編集</button>
			<button type="button" onclick="return rirekicheck(${shouhininfo.id})">アルバムへ送る</button>
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
            location.href = '<%=request.getContextPath()%>/ShouhinDetailServlet?action=rireki&shouhinid=' + id;
			return true;
		} else {
			alert('履歴への登録がキャンセルされました。');
			return false;
		}
	}
    
    function deletecheck(id){
        if (window.confirm('本当に商品を削除しますか？削除された商品は復元できません。')) {
            alert('商品の削除が完了しました。');
            location.href = '<%=request.getContextPath()%>/ShouhinDetailServlet?action=delete&shouhinid=' + id;
			return true;
		} else {
			alert('削除がキャンセルされました。');
			return false;
		}
	}
    
 //ラジオボタンの選択が変更されたときに実行
//プレビュー用のフレーム画像の取得
	const previewFrame = 
		document.getElementById("previewFrame");
	
	//選択されたフレームによって表示するフレームを切り替える
	const selectedFrame = "${shouhininfo.frame}";
	if(selectedFrame === "1") {
		//うさぎフレーム
		previewFrame.src = "${pageContext.request.contextPath}/images/frame_usagi2.png"
	} else if(selectedFrame === "2") {
		//ねこフレーム
		previewFrame.src = "${pageContext.request.contextPath}/images/frame_neko2.png"
	} else if(selectedFrame === "3") {
		//くまフレーム
		previewFrame.src = "${pageContext.request.contextPath}/images/frame_panda2.png"
	} else if(selectedFrame === "4") {
		//いぬフレーム
		previewFrame.src = "${pageContext.request.contextPath}/images/frame_dog2.png"
	} else if(selectedFrame === "5") {
		//とりフレーム
		previewFrame.src = "${pageContext.request.contextPath}/images/frame_buta2.png"
	}
	</script>
</body>
</html>