<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<form action="${path}/findId" method="post">
		<h3>아이디 찾기</h3>
		이름<input type="text" name="name" required="required" placeholder="이름을 입력해주세요">
		이메일<input type="email" name="email" required="required" placeholder="메일을 입력해주세요">
		<input type="submit"  value="확인">
	</form>
</div>
</body>
</html>