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
				<a href="${pageContext.request.contextPath}/MenuServlet">メニュー</a>
				<a href="${pageContext.request.contextPath}/MyPageServlet">マイページ</a>
				<a href="${pageContext.request.contextPath}/DiagnosisServlet">購入診断</a>
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
	<h2 class="title">
			<b>▶ アルバム詳細 </b>：<br class = "mediabr"> 使い終わった<strong>モノ</strong>を見てみよう！
		</h2>
		<!-- キャラクター + 吹き出し -->
		<div class="iconSpeech">
			<div class="shouhinimg">
				<div class="imageArea">
					<P>
						<span class="cellText">${rirekiinfo.nickname}</span>
					</P>
				</div>


				<div class="frameWrap">
					<c:choose>
						<c:when test="${not empty rirekiinfo.base64Image}">
							<img class="itemImage"
								src="data:image/jpeg;base64,${rirekiinfo.base64Image}"
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
					${rirekiinfo.progress}日使ったよ！<br> 大事に使ってくれてありがとう♪
				</p>

			</div>
		</div>


		<div class="card">
			<!-- 商品情報 -->
			<table class="information">
				<tr>
					<th>ジャンル</th>
					<td colspan="3"><span class="cellText">${rirekiinfo.genre}</span></td>
				</tr>
				<tr>
					<th>商品名</th>
					<td><span class="cellText">${rirekiinfo.shouhin}</span></td>
					<th>メーカー</th>
					<td><span class="cellText">${rirekiinfo.maker}</span></td>
				</tr>
				<tr>
					<th>購入日</th>
					<td><span class="cellText">${rirekiinfo.buy_date}</span></td>
					<th>価格</th>
					<td><span class="cellText">${rirekiinfo.price}</span><span
						class="tanni">円</span></td>
				</tr>
				<tr>
					<th>保証期間</th>
					<td><span class="cellText">${rirekiinfo.wperiod}</span><span
						class="tanni">年</span></td>
					<th>耐用年数</th>
					<td><span class="cellText">${rirekiinfo.life}</span><span
						class="tanni">年</span></td>
				</tr>
				<tr>
					<th>1日あたりの価格</th>
					<td><span class="cellText">${rirekiinfo.day_priceInt}</span><span
						class="tanni">円</span></td>
					<th>目標達成</th>
					<td><c:choose>
							<c:when test="${rirekiinfo.goal <= 0}">
            <span class="cellText">○</span>
        </c:when>
							<c:otherwise>
            <span class="cellText">✕</span>
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
   
   //ラジオボタンの選択が変更されたときに実行
 //プレビュー用のフレーム画像の取得
 	const previewFrame = 
 		document.getElementById("previewFrame");
 	
 	//選択されたフレームによって表示するフレームを切り替える
 	const selectedFrame = "${rirekiinfo.frame}";
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