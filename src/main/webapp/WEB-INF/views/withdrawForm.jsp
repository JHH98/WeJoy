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

var password="${member.password}";
var mm_id="${mm_id}";	
function withdraw() {
	 var pass = prompt("비밀번호를 입력해 주세요","" );
	    if (pass == password) {
		location.href="${path}/withdraw/mm_id/"+mm_id;
	    }else{
	    	alert("비밀번호가 다릅니다.");
	    }
	    
	}

function goback() {
	history.go(-1);
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="frame">
<div id="head"></div>
<div class="delete"><h1>회원탈퇴창</h1>

<div class="delete_bottom">정말 탈퇴 하시겠습니까?<br>
<button OnClick="withdraw()">탈퇴</button>
 <button OnClick="goback()" >돌아가기</button>

</div> 
 
</div>
<div id="footer"></div>
</div>

</body>
</html>