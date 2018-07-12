<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" >
	$(document).ready(function(){
		$(".next").click(function(){
			$("#firDisplay").fadeOut()
		});
		$(".next").click(function(){
			$(".next").fadeOut()
		});
		$(".next").click(function(){
			$("#SecDisplay").fadeIn()
		});
		$(".next").click(function(){
			$(".previous").fadeIn()
		});
		$(".next").click(function(){
			$(".submit").fadeIn()
		});
		$('#head').load('${path}/head');
		$('#footer').load('${path}/footer');
	});
	$(document).ready(function(){
		$(".previous").click(function(){
			$("#SecDisplay").fadeOut()
		});
		$(".previous").click(function(){
			$("#firDisplay").fadeIn()
		});
		$(".previous").click(function(){
			$(".next").fadeIn()
		});
		$(".previous").click(function(){
			$(".submit").fadeOut()
		});
		$(".previous").click(function(){
			$(".previous").fadeOut()
		});
	});
</script>          
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="frame">
<div id="head"></div>
	<br><br>
	<b><font size="15" color="blue">회원정보수정</font></b>
	<br><br><br>
	<form action="${path}/editinfo" method="post" name="userInfo">
	<input type="hidden" name="mm_id" value="${member.mm_id}">
		<div class="Total">
			<table id="firDisplay" align="center">	
				<tr><td>이름</td><td><input type="text" name="name" maxlength="50" 
					required="required" value="${member.name }"></td></tr>
				<tr><td>비밀번호</td><td><input type="password" name="password" 
					required="required" maxlength="50" value="${member.password}"></td></tr>
			   <tr><td>이메일</td><td><input type="email" name="email" required="required" value="${member.email}"></td></tr>
			</table> 
			
			<div id="SecDisplay" >
				<h2>관심사재선택</h2>
				<div>
					<c:forEach var="hobby" items="${list}">
						<label for="${hobby.hobby_id}">
							<div class="hobby">
								<img src="${path}/images/hobby/${hobby.img}" id="pic">
								<div id="text">${hobby.hobby_name}
									<c:set var="loop_flag" value="false" />
							 <c:forEach var="mem_hob" items="${mem_hob_list}">
										<c:if test="${hobby.hobby_id == mem_hob.hobby_id }">
											<input type="checkbox" name="hobby_id" 
											value="${hobby.hobby_id}" id="${hobby.hobby_id}" checked="checked">	
										     <c:set var="loop_flag" value="true" />
										</c:if>
								</c:forEach> 
								<c:if test="${loop_flag == false }">
											<input type="checkbox" name="hobby_id" 
											value="${hobby.hobby_id}" id="${hobby.hobby_id}"">	
										     <c:set var="loop_flag" value="true" />
										</c:if> 
								</div>
								</div>
						</label>							
					</c:forEach>				
				</div>
			</div>
		</div>
		<div class="btn">
		<input class="btn" type="submit" value="수정" class="submit"/></div>
		</form>	
		<div class="btn">
		<button class="previous">이전</button>
		<button class="next">다음</button></div>
	<div id="footer"></div>
	</div>
</body>
</html>