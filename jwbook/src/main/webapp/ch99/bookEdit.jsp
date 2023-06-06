<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>방명록 수정</title>
</head>
<body>
	<div class = "container w-75 mt-5 mx-auto">
	<h2 align="center">방명록 수정</h2>
	<hr>
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<table class="table table-stripped" style="text-align: center; border:1px; solid #dddddd">
					<tbody>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="username"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<td>제 목</td>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="text" name="pw"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea class="form-control" name="content" rows="10"></textarea></td>
					</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="수정">
				<input type="submit" class="btn btn-primary pull-right" value="삭제">
				<a href="bookList.jsp" class= "btn btn-primary pull right">목록</a>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>