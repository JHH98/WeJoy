<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:if test="${result ==-1 }">
	<script type="text/javascript">
		alert("아이디 또는 이메일이 잘못됬습니다.");
		history.go(-1);
	</script>
</c:if>
<script type="text/javascript">
	function MainPage() {
		location.href="main"; 
	}
</script>

</head>
<body>
<div>${msg}</div>
<div>찾으신 아이디:${mm_id}</div>


<button onclick="MainPage()">메인창 가기</button>
</body>
</html>