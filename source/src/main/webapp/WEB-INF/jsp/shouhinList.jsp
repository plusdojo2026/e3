<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | 商品一覧</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>
<body>
<p>▶ 一覧 ： 登録した<strong>モノ</strong>たちを見てみよう！</p>
<main>
	<div class="items">
			<div class="item">
				<img src="images/shouhinList_bg.png" width=300px height=auto>
				<div class="nickname"><p>〇〇くん</p></div>
				<div class="img"><img src="sample" alt="画像"></div>
				<div class="name"><p>冷蔵庫</p></div>
				<div class="progress"><p>500日</p></div>
				<div class="day_price"><p>2円/日</p></div>
			</div>
			<div class="item">
				<img src="images/shouhinList_bg.png" width=300px height=auto>
			</div>
			<div class="item">
				<img src="images/shouhinList_bg.png" width=300px height=auto>
			</div>
	</div>
</main>
</body>
</html>