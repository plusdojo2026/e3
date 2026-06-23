<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale= 1">
<title>モノカチコレクション | 購入診断</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/dia_ope.css">


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


		<p>
			▶ 購入診断 : 気になる商品を比較して <strong>カチ</strong> のある買い物をしよう！
		</p>
		<br>
		<!-- 診断フォーム -->
		<form class="diagnosis_form" id="diagnosis_form" method="POST"
			action="/e3/DiagnosisServlet">
			<!-- action→同ページに表示 -->
			<div class="diagnosis">
				<label>商品名<br>
				<!-- textareaの方が良い？ --> <input type="text" name="shouhin">
				<!-- スペース4コ -->
				</label>
			</div>
			<div class="diagnosis">
				<label>価格<br> <input type="number" name="money">
				</label>
				<p class="tanni">円</p>
			</div>
			<div class="diagnosis">
				<label>想定年数<br> <input type="number" name="use_year">
				</label>
				<p class="tanni">年使用</p>
			</div>
			<div class="dia">
				<input type="submit" name="diagnosis" value="　診断　">
			</div>

		</form>


		<br>
		<!-- 改行 -->
		<!-- 診断結果リストの表示テーブル -->
		<!--<div class = "dr">-->

		<div class="card">
			<h3>診断結果</h3>
			<br>
			<table class="diagnosis_result" id="diagnosis_result">
				<!-- 枠はCSS? -->

				<c:forEach var="d" items="${diagnosisList}">
					<!-- EL式 -->
					<tr>
						<!-- 1つ目 -->
						<!-- マイナスボタン -->
						<td class="dia_button">
							<div class="dia_b">
								<form class="delete_form" method="POST"
									action="/e3/DiagnosisServlet">
									<!-- action→同ページに表示 -->
									<input type="submit" name="delete" value="－">
									<input type="hidden" name="id" value="${d.id}">
								</form >
							</div>
						</td>
						<td class = "shouhin">商品名 : ${d.shouhin}</td>
						<td>価格 : ${d.money}円</td>
						<td>年数 : ${d.use_year}年</td>
						<td>1日当たり価格 : ${d.day_priceInt}円</td>
					</tr>
				</c:forEach>

				</table>
		</div>


	</main>
	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>

	<!-- JavaScript -->
	<script>
		'use strict';

		// 診断情報入力フォームのアラート
		// 現状2つ(価格と想定年数)まとめてのアラート表示
		document.getElementById('diagnosis_form').onsubmit = function(event) {
			let money = document.getElementById('diagnosis_form').money.value;
			let use_year = document.getElementById('diagnosis_form').use_year.value;

			if (money === '' || use_year === '') {
				window.alert('価格と想定年数は必ず入力してください！');
				event.preventDefault();
			}
		};
	</script>

	<script src="${pageContext.request.contextPath}/js/common.js">
		
	</script>

</body>
</html>





