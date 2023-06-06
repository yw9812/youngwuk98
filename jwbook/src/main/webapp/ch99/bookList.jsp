<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="ch99.BookDAO" %>
<%@ page import="ch99.Book" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>방명록 목록</title>
</head>
<body>
	<%
		String username = null;
		if (session.getAttribute("username") != null) {
			username = (String) session.getAttribute("username");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	
	<div class = "container w-75 mt-5 mx-auto">
	<h2 align="center">방명록 목록</h2>
	<hr>
		<div>
			<table class="table table-stripped" style="text-align: center; border:1px; solid #dddddd">
				<thead>
				<tr>
					<th style= "background-color : #eeeeee; text-align:center;">번호</th>
					<th style= "background-color : #eeeeee; text-align:center;">작성자</th>
					<th style= "background-color : #eeeeee; text-align:center;">이메일</th>
					<th style= "background-color : #eeeeee; text-align:center;">작성일</th>
					<th style= "background-color : #eeeeee; text-align:center;">제목</th>
				</tr>
				</thead>
			<tbody>
				<%
					BookDAO bookDAO = new BookDAO();
					ArrayList<Book> list = bookDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%= list.get(i).getID() %></td>
					<td><%= list.get(i).getUsername() %></td>
					<td><%= list.get(i).getEmail() %></td>
					<td><%= list.get(i).getDate() %></td>
					<td><a href="bookEdit.jsp?ID=<%= list.get(i).getID()%>"><%= list.get(i).getTitle() %></a></td>
				</tr>
				<% 
					}
				%>
			</tbody>
			</table>
			<a href="bookWrite.jsp" class= "btn btn-primary pull right">등록</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>