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
	<p>
		<b>▶ 一覧 </b>： 登録した<strong>モノ</strong>たちを見てみよう！
	</p>
	<main>
	<!--<c:forEach var="s" items="${list}">
			<div class="item">
				<a href="${pageContext.request.contextPath}/ShouhinDetailServlet?shouhinid=${s.shouhinid}">
				<img src="images/shouhinList_bg.png" width=300px height=auto>
				<div class="nickname">
					<p>${s.nickname}</p>
				</div>
				<div class="shouhinimg">
					<img src="${pageContext.request.contextPath}/ImageServlet?name=${s.shouhinimg}" alt="商品画像">
				</div>
				<div class="name">
					<p>${s.name}</p>
				</div>
				<div class="progress">
					<p>${s.progress}</p>
				</div>
				<div class="day_price">
					<p>${s.day_price}</p>
				</div>
				</a>
			</div>
		</c:forEach> -->
		
		<div class="items">
			<div class="item">
				<img src="images/shouhinList_bg.png" width=300px height=auto>
				<div class="nickname">
					<p>〇〇くん</p>
				</div>
				<div class="shouhinimg">
					<img src="images/kaden_reizouko.png" alt="画像">
				</div>
				<div class="name">
					<p>冷蔵庫</p>
				</div>
				<div class="progress">
					<p>500日</p>
				</div>
				<div class="day_price">
					<p>2円/日</p>
				</div>
			</div>
			<div class="item">
				<img src="images/shouhinList_bg.png" width=300px height=auto>
				<div class="nickname">
					<p>〇〇くん</p>
				</div>
				<div class="shouhinimg">
					<img src="images/kaden_reizouko.png" alt="画像">
				</div>
				<div class="name">
					<p>冷蔵庫</p>
				</div>
				<div class="progress">
					<p>500日</p>
				</div>
				<div class="day_price">
					<p>2円/日</p>
				</div>
			</div>
			<div class="item">
				<img src="images/shouhinList_bg.png" width=300px height=auto>
				<div class="nickname">
					<p>〇〇くん</p>
				</div>
				<div class="shouhinimg">
					<img src="images/kaden_reizouko.png" alt="画像">
				</div>
				<div class="name">
					<p>冷蔵庫</p>
				</div>
				<div class="progress">
					<p>500日</p>
				</div>
				<div class="day_price">
					<p>2円/日</p>
				</div>
			</div>
			<div class="item">
				<img src="images/shouhinList_bg.png" width=300px height=auto>
				<div class="nickname">
					<p>〇〇くん</p>
				</div>
				<div class="shouhinimg">
					<img src="images/kaden_reizouko.png" alt="画像">
				</div>
				<div class="name">
					<p>冷蔵庫</p>
				</div>
				<div class="progress">
					<p>500日</p>
				</div>
				<div class="day_price">
					<p>2円/日</p>
				</div>
			</div>
			<div class="item">
				<img src="images/shouhinList_bg.png" width=300px height=auto>
				<div class="nickname">
					<p>〇〇くん</p>
				</div>
				<div class="shouhinimg">
					<img src="images/kaden_reizouko.png" alt="画像">
				</div>
				<div class="name">
					<p>冷蔵庫</p>
				</div>
				<div class="progress">
					<p>500日</p>
				</div>
				<div class="day_price">
					<p>2円/日</p>
				</div>
			</div>
		</div>
	</main>
</body>
</html>