<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>



<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
 

<title>메일 보내기</title>
</head>
<body>
<div class="container">
  <h4>메일 보내기</h4>
  <form action="${path}/sendMail" method="post">
  	<div align="center">
  		아이디<input type="text" name="mm_id" size="120" style="width:100%" placeholder="아이디">
  	</div>
    <div align="center"><!-- 받는 사람 이메일 -->
       	 메일<input type="email" name="email" size="120" style="width:100%" placeholder="받는사람 이메일">
    </div> 
<!-- 	<div align="center">받는 사람 이메일
       	 <input type="text" name="title" >
    </div>  -->
    <div align="center">
      <input type="submit" value="메일 보내기" >
    </div>
  </form>
</div>
</body>
</html> 