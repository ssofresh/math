<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*, vo.Folder" %>
<%
	Folder fo = new Folder();
	fo.setF3((String)request.getAttribute("f3"));
	//System.out.println("second 값 : " + fo.getF1());
%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
    String path = "/" + fo.getF3();
    String ImgDirRealPath 
                 = request.getRealPath("/test" + path);​
    System.out.println(ImgDirRealPath);
    
    File ImgDirObj = new File(ImgDirRealPath);            
    //현재 jsp파일이 있는 폴더의 images폴더의 이미지 목록 가져오기
    List<File> imgFileList = Util.getImgFileList(ImgDirObj); 
    
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 span.imgTitle {
     font-weight:bold;
     display:block;
     margin:15px;
 }
</style>
</head>
<body>
 <div class="image_list" id="image_list">
        
    <%
     String strImgConFormat1 = "<div class=\"images\">" 
                               + "<span class=\"imgTitle\">▒ %s ▒</span>"
                               + "<img width='200' src=\"%s\"/></div>";

        for(int i = 0; i<imgFileList.size();i++) {
            
            File f = imgFileList.get(i);                
            String title = Util.getFileNameNoExt(f.getName());
            //System.out.println(f.getName()+"/"+title);            
            String url = Util.getImgSrc(f);
            out.print(String.format(strImgConFormat1, title,  url ));
            
        }
    %>
        
        <!-- <div class="images" style="display:block">
            <span class="imgTitle">▒ 1-A_2 ▒</span>
            <img src="images/1-A/1-A_2.png"/>
        </div> -->        
    </div>


</body>
</html>