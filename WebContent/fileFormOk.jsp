<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String path = request.getRealPath("fileUpDown");
		//String path2 = "C:\\12월취업반정선주\\test";
		out.print("fileFolder Path : " + path);
		int size = 1024 * 1024 * 10;		//10M
		String file = "";
		String oriFile = "";
		MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
		//DefaultFileRenamePolicy : 동일한 이름의 파일이 존재하면 1, 2, 3을 넣어줌
		file = multi.getFilesystemName("file");
		oriFile = multi.getOriginalFileName("file");
		out.print("<br>DefaultFileRenamePolicy() : " + "동일한 이름의 파일이 존재한다면 1,2,3을 넣어주겠다");
		out.print("<br>file(저장될 파일 이름) : " + file);
		out.print("<br>oriFile(실제 파일 이름) : " + oriFile);
	%>
	<br>
	test : <%=request.getParameter("test") %><br>		<!-- request.getParameter로 이제 값이 전달되지 않는다 -->
	test : <%=multi.getParameter("test") %>
</body>
</html>