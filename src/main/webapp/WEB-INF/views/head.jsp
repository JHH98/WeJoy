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


<div class="header">
			<c:url var="url" value="/main"></c:url>
   			<div class="header_box">
   			<div class="logo" OnClick="location.href='${path}/main'" > We<a>Joy</a> </div>  
			<form action="${url}">
			<input type="hidden" name="search" value="subject">
			<div class="text"><a><input type="text" name="keyword"></a></div>
			<div class="submit">
			<input type="submit" value="확인">
			<input type="hidden" name="hobby_id" value=0>
			<input type="hidden" name="best" value="n">
			<input type="hidden" name="dates" value=0>
			</div>
			</form>
			
			<a class="img" href="${path}/myPage/pageNum/1"><img src="${path}/images/my.png" alt="Mypage" height="42" width="42"></a>
			<div class="img"><img src="${path}/images/message.png" alt="Mypage" height="42" width="42"></div>
			<a class="img" href="${path}/insertForm?pageNum=1"><img src="${path}/images/write.png" alt="Mypage" height="42" width="42"></a>
			<div class="img" id="dropDownMn"><img src="${path}/images/index.png"  alt="Mypage" height="42" width="42">
				<div class="downMn">
					<div class="dnm">사이트 정보</div>
					<div class="dnm"onclick="SignUpPage()">SingUp</div>
				</div>
			</div></div></div>
</body>
</html>