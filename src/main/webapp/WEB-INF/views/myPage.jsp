<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<c:if test="${result == 1 }">
	<script type="text/javascript">
		alert("로그인 후 이용해 주세요");
		history.go(-1);
	</script>
</c:if>

<script type="text/javascript">

$(document).ready(function(){
	$('#head').load('${path}/head');
	$('#footer').load('${path}/footer');
});	

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="frame">
	<div id="head"></div>
	<div class="background"></div>
	<div class="myInfo">
	<div class="pricing-table">
	<div class="pricing-plan">
	   <img src="https://s22.postimg.cc/8mv5gn7w1/paper-plane.png" >
	    <h2 class="pricing-header">${member.name}님</h2>
        <ul class="pricing-features">
          <li class="pricing-features-item">Id:${member.mm_id}</li>
          <li class="pricing-features-item">Email:${member.email}</li>
        </ul>
        <span class="pricing-price">환영합니다</span>
        <a href="${path}/editinfoForm/mm_id/${member.mm_id}" class="pricing-button">개인정보 수정</a>
        <a href="${path}/withdrawForm/mm_id/${member.mm_id}" class="pricing-button">회원탈퇴</a>
	</div>
	</div>

	</div>
	
	
	<div class="myPost">
   <div class="header2">게시글</div>
   
   <table cellspacing="0">
      <tr>
         <th>사진</th>
         <th>제목</th>
         <th>작성자</th>
         <th>날짜</th>
         <th>좋아요</th>
         <th>조회수</th>
         <th width="230">내용</th>
      </tr>
	 <c:forEach var="list" items="${list}">
      <tr OnClick="location.href='${path}/view/ps_id/${list.ps_id}/pageNum/${pp.currentPage}'">
         <td style="DISPLAY: none;"><fmt:formatDate var="Date" value="${list.reg_date}" pattern="yyyy-MM-dd"/>​</td>
         <td><img src="${path}/upload/${list.origin_ig_name}" alt="" /></td>
         <td>${list.subject}</td>
         <td>${list.mm_id}</td>
         <td>${Date}</td>
         <td>${list.likes}</td>
         <td>${list.read_count}</td>
         <td>${list.content}</td>
      </tr>
      </c:forEach>
   </table>
   </div>
  	<div class="my_paging">
		<ul>
			<c:if test="${pp.startPage > pp.pagePerBlock }">
				<li><a href="${path}/myPage/pageNum/${pp.startPage-1}">
					<span><<</span>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage }">
				<c:if test="${pp.currentPage==i }">
					<li style="border-color: red">
						<a href="${path}/myPage/pageNum/${i}">${i}</a></li>
				</c:if>
				<c:if test="${pp.currentPage!=i }">
					<li><a href="${path}/myPage/pageNum/${i}">${i}</a></li>
				</c:if>						 
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage }">
				<li><a href="${path}/myPage/pageNum/${pp.endPage+1}">
					<span>>></span>
				</a></li>
			</c:if>	
		</ul>	
		</div>


<div id="footer"></div>		
	</div>

	
	
</body>
</html>