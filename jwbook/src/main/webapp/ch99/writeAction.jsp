<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch99.BookDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="ch99" class="ch99.Book" scope="page"></jsp:useBean>
<jsp:setProperty name="ch99" property="title" />
<jsp:setProperty name="ch99" property="content" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 입력</title>
</head>
<body>
	<%
		if (ch99.getUsername() == null || ch99.getContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BookDAO bookDAO = new BookDAO();
			String username = ch99.getUsername();
			int result = bookDAO.bookWrite(ch99.getTitle(), username ,ch99.getContent());
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'bookList.jsp'");
				script.println("</script>");
			}
		}
	
	%>

</body>
</html>