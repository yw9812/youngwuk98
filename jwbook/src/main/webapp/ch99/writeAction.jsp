<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch99.BookDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ch99" class="ch99.Book" scope="page"></jsp:useBean>
<jsp:setProperty name="ch99" property="title" />
<jsp:setProperty name="ch99" property="username" />
<jsp:setProperty name="ch99" property="content" />
<jsp:setProperty name="ch99" property="email" />
<jsp:setProperty name="ch99" property="pw" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 입력</title>
</head>
<body>
	<%
		String Username = null;
		if (ch99.getUsername() == null || ch99.getContent() == null || ch99.getEmail() == null || ch99.getTitle() == null || ch99.getPw() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'bookList.jsp'");
				script.println("</script>");
		}
	%>

</body>
</html>