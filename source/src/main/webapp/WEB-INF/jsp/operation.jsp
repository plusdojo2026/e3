<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale= 1">
<title>モノカチコレクション | 機能説明</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/dia_ope.css">
</head>
<body>

	<header> </header>

	<main>
		<!-- ロゴ(仮) -->
		<h1 class="title">
			  <img src="images/タイトルロゴ.png" alt="サイトタイトル">
		</h1>

		<p>
			▶ 機能説明 : 使い方をマスターしてコレクションを楽しもう！<br>
		</p>

		<!-- 説明事項 -->

		<div class = "explane">
			<h2>使い方</h2>
			 このアプリでは、家具や家電やその他、自分の身の回りにある
			<strong>モノ</strong> の <strong> カチ</strong> をコレクションすることができます。
			以下は機能の説明です。<br><br><br>
			
			<strong>✅メニュー</strong><br>
			登録したモノたちから届くメッセージと、価格・耐用年数から計算した今日の合計固定費をチェックできます。
			メッセージは最初に３件まで表示されますが、▼を押すことで追加を表示できます。<br><br><br>
			
			<strong>✅購入診断</strong><br>
			どのくらいの期間使うかを踏まえて１日当たりの価格を算出し、迷っている商品同士を比べることができます。 <br><br><br> 
			
			<strong>✅商品登録</strong><br> 
			モノの情報が登録できます。<br>
			必須項目は［ジャンル・商品名・購入日・価格・耐用年数］で、その他には［メーカー・保証期間］が登録できます。
			（ジャンルを選ぶと耐用年数が自動で入力されますが、ご自身で任意の年数を入力することも可能です。）<br>
			登録の際には、愛称やアイコンに写真を設定でき、設定すると、かわいいフレームを付けることができます。
			ペットにして、より大切にモノを使いましょう！🐶 <br><br><br> 
			
			<strong>✅一覧表示</strong><br>
			登録したモノを一覧で見ることができます。<br>
			一覧では、カード状に［愛称・アイコン・商品名・使用日数・各商品の固定費］が表示され、
			カードをクリックすると、商品詳細が確認できます。また、表示順は▼を押して任意の項目順［○○○］に並び替えることができます。 <br><br><br>
			
			<strong>✅商品詳細</strong><br> 
			モノの詳細情報を見ることができます。<br>
			登録した全ての情報に加え、１日当たりの価格と目標達成までの期間をペットが教えてくれます。<br>
			また、情報の編集画面への遷移や、アルバム（履歴）への移動、削除もできます。
			 <br><br><br>
			 
			 <strong>✅商品編集</strong><br> 
			登録した情報の編集ができます。<br>
			登録の際に入力ミスをしたり、愛称を変えたくなったりしても大丈夫！後から編集することができるので、安心して登録できます。
			 <br><br><br>
			 
			 <strong>✅ランキング</strong><br> 
			使い終わったモノたちのランキングを見ることができます。<br>
			ランキングは、▼で好きな項目［年数・１日当たりの価格］を選んで並び替えができます。
			TOP10が表示され、リストをクリックすると詳細を確認できます。
			 <br><br><br>
			 
			  <strong>✅アルバム一覧</strong><br> 
			使い終わったモノたちの記録をアルバムとして残しておくことができます。<br>
			一覧では、カード状に［愛称・アイコン・商品名・使用日数・各商品の固定費］が表示され、
			カードをクリックすると、詳細が確認できます。表示順は▼で任意の項目順［○○○］に並び替えることができます。
			たまに見返して思い出に浸るのもいいですね☺
			 <br><br><br>
			 
			 <strong>✅アルバム詳細</strong><br> 
			使い終わったモノの詳細情報を見ることができます。<br>
			登録した情報や、使用した期間をペットが教えてくれます。
			また、アルバムからモノの情報を削除することもできます。
			 <br><br><br>
			
			<p class = "sanrokugo">※このアプリでは、1年を365日として計算しています。</p>
			<br>

		</div>



	</main>

	<footer>
		<p class="copyright">&copy; Copyright 404. All rights reserved.</p>
	</footer>

</body>
</html>