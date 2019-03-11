<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.io.*, vo.Folder"%>

<%
	Folder fo = new Folder();
	fo.setF3((String)request.getAttribute("f3"));
	//System.out.println("second 값 : " + fo.getF1());
%>

<%
  String fileDir = "/" + fo.getF3(); //파일을 보여줄 디렉토리
  String filePath = request.getRealPath("/test" + fileDir); //파일이 존재하는 실제경로


  File f = new File(filePath); 
  File [] files = f.listFiles(); //파일의 리스트를 대입

  for ( int i = 0; i < files.length; i++ ) {
    if ( files[i].isFile()){ 
    out.println(files[i].getName() + "<br>");
    out.println("<img src='/math/test/1-1/strong math/chapter1/" + files[i].getName() + "' width='200' height='200'>");
    }
  }
%>
</body>
</html>