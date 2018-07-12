<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
$(document).ready(function(){
	$('#head').load('${path}/head');
	 $('.delete_button').click(function() {
		 location.href = "${path}/main";
			}); 
		}); 
	
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="frame">
<div id="head"></div>
<div class="delete"><h1>지금까지 감사했습니다.</h1>
<div class="delete_button">
메인으로
</div> 
 </div>
</div>
</body>
</html>