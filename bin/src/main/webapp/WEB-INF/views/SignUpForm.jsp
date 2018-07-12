<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" >
	$(document).ready(function(){
		$('#head').load('${path}/head');
		$('#footer').load('${path}/footer');
		
		$(".next").click(function(){
			if(userInfo.chk.value=="1"){
				$("#firDisplay").fadeOut();
				$(".next").fadeOut();
				$("#SecDisplay").fadeIn();
				$(".previous").fadeIn();
				$(".submit").fadeIn();
			}
		});
	});
	$(document).ready(function(){
		$(".previous").click(function(){
			$("#SecDisplay").fadeOut();
			$("#firDisplay").fadeIn();
			$(".next").fadeIn();
			$(".submit").fadeOut();
			$(".previous").fadeOut();
		});
	});
	function MainPage() {
		location.href="main"; 
	}
	function chk() {
		if(userInfo.chk.value=="0"){
			alert("아이디 중복체크 하십시오");
			userInfo.mm_id.focus();
        	return false;
		}
	}
	$(function() {
	    $("#idChk").click(function() {
	        var mm_id =  $("#mm_id").val(); 
	        if(!mm_id) {
	        	alert("아이디를 입력하십쇼");
	        	userInfo.mm_id.focus();
	        	return false;
	        }
	        $.post("${path}/idChk","mm_id="+mm_id, function(data) {
				alert(data);
				userInfo.chk.value="1";
			});
	    });
	});
	
</script>
</head>
<body>
<div class="frame">
	<div id="head">
	</div>
	<br><br>
	<b><font size="15" color="blue">회원가입</font></b>
	<br><br><br>
	<form action="${path}/SignUp" method="post" name="userInfo" >
		<input type="hidden" name="del" value="n">
		<input type="hidden" name="chk" value="0">
		<div class="Total">
			<table id="firDisplay" align="center">
				<tr><td>아이디</td><td><input type="text" name="mm_id" id="mm_id"
					required="required" autofocus="autofocus" maxlength="50">
					<input type="button" id="idChk" value="중복체크"></td></tr>	
				<tr><td>비밀번호</td><td><input type="password" name="password" 
					required="required" maxlength="50"></td></tr>
				<tr><td>이름</td><td><input type="text" name="name" maxlength="50" 
					required="required"></td></tr>
				<tr><td>이메일</td><td><input type="email" name="email" required="required"></td></tr>
			</table> 
			
			<div id="SecDisplay" >
				<h2>관심사선택</h2>
				<div>
					<c:forEach var="hobby" items="${list}">
						<label for="${hobby.hobby_id}">
							<div class="hobby">
								<img src="images/hobby/${hobby.img}" id="pic">
								<div id="text">${hobby.hobby_name}<input type="checkbox" name="hobby_id" 
								value="${hobby.hobby_id}" id="${hobby.hobby_id}">	</div></div>
						</label>							
					</c:forEach>				
				</div>
			</div>
		</div>
		<input id="joinbtn" type="submit" value="가입" class="submit"/>
		</form>	
		<div class="btn">
		<button class="previous">이전</button>
		<button class="next" onclick="return chk()">다음</button></div>
	<div id="footer">
	</div>
	</div>
</body>
</html>