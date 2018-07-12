<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
		function SignUpPage() {
			location.href="SignUpForm";		
		}
		function MainPage() {
			location.href="main"; 
		}
		alert("로그인 후 이용해주세요");
		
</script>
</head>
<body>
<div class="frame">
	<div>
		<form action="${path}/login">
			<h2 >WeJoy에 오신 것을 환영합니다.</h2>
			<h3 >같은 관심사를 공유할 동반자를 찾아 봅시다!</h3>
			<table class="table-bordered">
				<tr><td>아이디</td><td><input type="text" name="mm_id" 
					required="required" autofocus="autofocus"></td></tr>
				<tr><td>암호</td><td><input type="password" name="password"
					required="required"></td></tr>
				<tr><td colspan="2"><input type="submit" value="확인"></td></tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>