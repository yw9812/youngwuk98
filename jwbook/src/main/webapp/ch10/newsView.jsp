<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 관리 앱</title>
</head>
<body>
	<div class="container w-75 mt-5 mx-auto">
	<h2>${news.title}</h2>
	<hr>
	<div class="card w-75 mx-auto">
		<img class="card-img-top" src="${news.img}">
		<div class="card-body">
			<h4 class="card-title">Date: ${news.date}</h4>
			<p class="card-text">Content: ${news.content}</p>
		</div>
	</div>
	<hr>
	<a herf="javascript:history.back()" class="btn btn-primary"> << Back </a>
	</div>
</body>
</html>