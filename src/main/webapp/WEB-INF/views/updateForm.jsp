<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
$(document).ready(function(){
	$('#head').load('${path}/head');
	$('#footer').load('${path}/footer');
});	
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글수정</title>
</head>
<body>
<div class="frame">
	<div id="head"></div>
	
	<div class="container">
		<form action="${path}/update" method="post" enctype="multipart/form-data">
	  <input type="hidden" name="ps_id" value="${post.ps_id}">
	    <input type="hidden" name="pageNum" value="${pageNum}" > 
		<h1>게시글 수정</h1>
		<div class="subjectup"><input type="text" name="subject" value="${post.subject}" > 
		<div id="gery_box">제목</div>			
					<select  name="hobby">
					<c:forEach var="hobby" items="${list}">
						<label for="${hobby.hobby_id}">
						  <option value="${hobby.hobby_id}">${hobby.hobby_name}</option>
						</label>							
					</c:forEach>				
				  </select>
			
		</div>
		<div class="imgup">
			<input type="file" name="img"  id="img" required="required">${post.origin_ig_name}
        </div>
		<div class="content"><textarea rows="20" cols="100" name="content" required="required" autofocus="autofocus">${post.content}</textarea></div>
   		<div class="sub"><input type="submit" value="확인"></div>
   	</form>
   	</div>
      
	<div id="footer"></div>
	</div>
</body>
</html>