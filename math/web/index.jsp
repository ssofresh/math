<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="vo.Folder" %>
<% 
	Folder fo = new Folder();
	fo = (Folder)request.getAttribute("f1");
	String folder = request.getRealPath("/test");
	//System.out.println(folder);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="/math/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	function setValues(){
		
		var f1 = $("#folder1 option:selected").val();
		//console.log(path);
		//console.log($("#folder1 option:selected").val());
		//window.location.replace("/math/index.jsp?f1="+f1);
		$.ajax({
			url: "/math/fselect",
			type: "post",
			data: {f1 : f1},
			success: function(data){
				console.log("success : " + data);
				$("#div1").html(data);
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error: " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
		});
	}

	
</script>
<body>
<h1>감성수학</h1>

<br>
<%@ page import="java.io.File" %>
<%
        // Create a file object
       
        File file = new File(folder);
         
        // 1. check if the file exists or not
        boolean isExists = file.exists();
         
        if(!isExists) {
            System.out.println("There is nothing.");
        }
         
        // 2. check if the object is directory or not.
        if(file.isDirectory()) {
            File[] fileList = file.listFiles();
    %>     
<select id="folder1" onChange="setValues();">
	<option value="">폴더 선택</option>
    <%
            for(File tFile : fileList) {
                //System.out.println(tFile.getName());  
     %>
  <option value="<%= tFile.getName() %>"><%= tFile.getName() %></option>
  <% } %>
</select>    
<%         
        } else {
            System.out.println("It is not a directory.");
        }
%>

<div id="div1">학기 선택해주세요</div>


<%-- <jsp:include page="/views/second.jsp" flush="true" /> --%>

<%-- <%if (fo.getF1()!= null){ %>

	<%
			String f1 = "/" + fo.getF1();
	        // Create a file object
	        String folder2 = request.getRealPath("/test"+f1);
	        System.out.println(folder2);
	        File file2 = new File(folder2);
	         
	        // 1. check if the file exists or not
	        boolean isExists2 = file2.exists();
	         
	        if(!isExists2) {
	            System.out.println("There is nothing.");
	        }
	         
	        // 2. check if the object is directory or not.
	        if(file2.isDirectory()) {
	            File[] fileList = file.listFiles();
	    %>     
	<select id="folder2">
		<option value="">폴더 선택</option>
	    <%
	            for(File tFile : fileList) {
	                //System.out.println(tFile.getName());  
	     %>
	  <option value="<%= tFile.getName() %>"><%= tFile.getName() %></option>
	  <% } %>
	</select>    
	<%         
	        } else {
	            System.out.println("It is not a directory.");
	        }
	%>

<% }else{ %>
<h5>학기 선택하세요</h5>
<% } %> --%>

<br><br>
<button onclick="mkd();">폴더 만들기</button>
<script type="text/javascript">
	function mkd(){
		var make = prompt('폴더이름쓰삼');
		window.location.replace("/math/index.jsp?make="+make);
		<%
		String name = "/" + request.getParameter("make");
		
		String folder4 = request.getRealPath("/test"+name);
		
		File targetDir = new File(folder4);
		if(!targetDir.exists()) {
			targetDir.mkdirs();
		}
		%>
	}
</script>
</body>
</html>