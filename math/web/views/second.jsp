<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.File, vo.Folder" %>
<%
	Folder fo = new Folder();
	fo.setF1((String)request.getAttribute("f1"));
	//System.out.println("second 값 : " + fo.getF1());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/math/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	function setValues(){
		var f2 = "<%= fo.getF1() %>" + "/" + $("#folder2 option:selected").val();
		
		console.log($("#folder2 option:selected").val());
		//window.location.replace("/math/index.jsp?f1="+f1);
		$.ajax({
			url: "/math/fselect2",
			type: "post",
			data: {f2 : f2},
			success: function(data){
				//console.log("success : " + data);
				$("#span2").html(data);
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log("error: " + jqXHR + ", " + textStatus + ", " + errorThrown);
			}
		});
	}

	
</script>
</head>
<body>

<br>

	<%
	        // Create a file object
	        String second = "/" + fo.getF1();
	        String folder = request.getRealPath("/test" + second);
	        
	        fo.setF2(folder);
	        //System.out.println(folder);
	        
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
	<select id="folder2" onChange="setValues();">
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

<span id="span2">교재 선택해주세요</span>
</body>
</html>