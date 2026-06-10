<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | 購入診断</title>
</head>
<body>
<p>▶ 購入診断 : 気になる商品を比較して <strong>カチ</strong> のある買い物をしよう！</p>
<!-- 診断フォーム -->
<form id="regist_form"><!-- POST,action追加する -->
	<table class="diagnosis">
		<tr> <!-- 4つを一行扱いにしている -->
			<td>
				<label>商品名<br>
				<input type = "text" name = "shouhin_name">
				</label>
			</td>
			<td>
				<label>価格<br>
				<input type = "text" name = "price">円 
				</label>
			</td>
			<td>
				<label>想定年数<br>
				<input type = "text" name = "expect">年使用
				</label>
			</td>
			<td>
				<input type = "submit" name = "diagnosis" value = "　診断　">
			</td>
		</tr>
</table>
</form>


</body>
</html>