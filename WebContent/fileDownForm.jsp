<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>fileDownForm.jsp<br>
	<%
		String saveDir = application.getRealPath("fileUpDown");
		File dir = new File(saveDir);
		String fName[] = dir.list();
		for(String fileName : fName){
			String en = URLEncoder.encode(fileName, "utf-8");
			out.write("<a href = http://localhost:8085/" + request.getContextPath() + 
					"/FileDown?fileName=" + en + ">" + fileName + "</a><br>");
			//request.getContextPath() : 프로젝트 이름까지 가져온다
			//FileDown은 서블릿이 생성해줌, 사용자가 직접 이름 정할 수 있다
		}
	%>
</body>
</html>