<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/math/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("img").css("display", "none");
		
		$("div").on("click",function(){
			//var d = $(this).attr('id'); 
			$(this).find("img").css("display", "block");
			
			
			//console.log(d);

			});

	});

</script>
</head>
<body>

<br><br><br><br>
<hr>

<%@ page import="java.io.*, vo.Folder"%>

<%
	Folder fo = new Folder();
	fo.setF3((String)request.getAttribute("f3"));
	//System.out.println("second 값 : " + fo.getF1());
%>

<%
  String fileDir = "/" + fo.getF3(); //파일을 보여줄 디렉토리
  String filePath = request.getRealPath("/test" + fileDir); //파일이 존재하는 실제경로
	String imgPath = request.getContextPath() + "/test/" + fo.getF3() + "/";

  File f = new File(filePath); 
  File [] files = f.listFiles(); //파일의 리스트를 대입

  for ( int i = 0; i < files.length; i++ ) {
    if ( files[i].isFile()){ 
    int m=i+1;
    out.println("문제 " + m + "번");
    out.println("<div id='" + m + "'> &nbsp;&nbsp;&nbsp;");
    out.println("<img src='" + imgPath +  files[i].getName() + "' width='500' height='150'>");
    out.println("</div>");
    }
  }
%>
</body>
</html>