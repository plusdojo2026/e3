<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>モノカチコレクション | ログイン</title>
</head>
<body>
<h1>モノカチコレクション</h1>
<form method="POST" action="/e3/LoginServlet">
ユーザーID<input type="text" name="id">
パスワード<input type="password" name="password">
<input type="submit" name="login" value="ログイン"> 
</form>
</body>
</html>