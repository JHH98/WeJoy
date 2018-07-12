<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WeJoy</title>
<link rel="shortcut icon" href="${path}/images/favicon.ico">

<script type="text/javascript">
		function SignUpPage() {
			location.href="SignUpForm"; 
		}
		$(document).ready(function(){	
			  var Mn="${MnVal}";
			  var modalLayer = $("#modalLayer");
			  var modalLink = $(".modalLink");
			  var modalCont = $(".modalContent");
			  var marginLeft = modalCont.outerWidth()/2;
			  var marginTop = modalCont.outerHeight()/2; 
			  var val=Mn;
				if(val=="1"){
					$("#main1").css("display","block");
					$("#main2").css("display","none");

				} 
				if( val=="2"){
					$("#main1").css("display", "none");
					$("#main2").css("display", "block");
				}
		

			
			  
			  
			  modalLink.click(function(){
			    modalLayer.fadeIn("slow");
			    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
			    $(this).blur();
			    $(".modalContent > a").focus(); 
			    return false;
			  });
			  
			  
				$('#head').load('${path}/head');
				$('#footer').load('${path}/footer');
			  

			  $(".modalContent > button").click(function(){
			    modalLayer.fadeOut("slow");
			    modalLink.focus();
			  });
			  
			  
			});	
		function MainChoice(){
			var val=$("#good").val();
			Mn=val;
			if(val=="1"){
				$("#main1").css("display","block");
				$("#main2").css("display","none");

			}
			if( val=="2"){
				$("#main1").css("display", "none");
				$("#main2").css("display", "block");
			}
		}
		
		function chk1(n) {
			var vall=$("#good").val();	
			location.href="${path}/main/pageNum/"+n+"?search=${search}&keyword=${keyword}&hobby_id=${hobby_id}&best=${best}&dates=${dates}&MnVal="+vall;
		}
</script>
</head>
<body>
<div class="frame">
		<c:url var="url" value="/main"></c:url>
			<div id="head"></div>
			<div class="post_list">
			<ul><li>
			<a href="${path}/main?best=y">베스트</a>
			</li>
			<c:forEach var="hobby" items="${list}"><li>
	 		<a href="${path}/main/pageNum/${pageNum}?hobby_id=${hobby.hobby_id}">${hobby.hobby_name}</a>
			</li></c:forEach></ul></div>
	
	
	
	<c:choose>
	<c:when test="${member.mm_id == null }">
		<a href="#modalLayer" class="modalLink" >로그인</a>
	</c:when>
	<c:otherwise>
		<a href="${path}/logout">로그아웃</a>
	</c:otherwise>
</c:choose>

<c:if test="${ hobby_id != 0}">
<div id="hobby_best" OnClick="location.href='${path}/main?best=y&hobby_id=${hobby_id}'">
게시판의 베스트</div>
</c:if>
<!--  -->
<c:if test="${hobby_id==0 && best=='y' }">
<form action="${url}">

<div id="best_of_best_box">
<div id="best_of_best" OnClick="location.href='${path}/main?best=y&dates=1'">일간</div>
<div id="best_of_best"  OnClick="location.href='${path}/main?best=y&dates=2'">주간</div>
<div id="best_of_best"  OnClick="location.href='${path}/main?best=y&dates=3'">월간</div>
<div id="best_of_best"  OnClick="location.href='${path}/main?best=y&dates=4'">년간</div>
</div>
</form>
</c:if>



<form action="${path}/login">
		<div id="modalLayer">
			<span onclick="document.getElementById('modalLayer').style.display='none'" 
			  	class="close" title="Close Modal">&times;</span>
		 	 <div class="modalContent">
			 	 <table>	
					<tr><td>아이디</td><td><input type="text" name="mm_id" 
						required="required" autofocus="autofocus"></td></tr>
					<tr><td>암호</td><td><input type="password" name="password"
						required="required"></td></tr>
					<tr><td colspan="2"><input type="submit" value="확인"></td></tr>
				 </table>
				 <a href="${path}/findIdForm"><h5>아이디찾기</h5></a>
			 	<a href="${path}/SendPwd"><h5>비밀번호찾기</h5></a>
			 </div>
		</div>
</form>	


<div class="container">
	<div id="main1">
	<c:if test="${pp.total > 0 }">
	<div class="imgfrm">
	<c:forEach var="post" items="${main}">
	<c:choose>
	<c:when test="${post.del=='n' }">
           <div class="imgcon" OnClick="location.href='${path}/view/ps_id/${post.ps_id}/pageNum/${pp.currentPage}'">
           <div class="subjectimg"><div class="imgtext3">${post.subject }</div></div>
           <div class="imgbox">
           <img src="${path}/upload/${post.origin_ig_name}" height=100% width=100%>
           </div>
           <div class="imgtext">${post.content}</div> 
           <div class="imgtext2"><img src="${path}/images/like.png" width="10%" height="10%">:${post.likes}
           <div class="NumOfVw">${post.read_count }</div>
           </div>
         </div>
	    </c:when>
	    <c:otherwise>
	      <div class="imgcon">
	      삭제된 게시글 입니당.
	      </div>
	    </c:otherwise>
		</c:choose>
		</c:forEach>
	</div>
	</c:if>
	</div>

	<div id="main2">
	<c:if test="${pp.total == 0 }">
	<tr><th colspan="5">데이터가 없습니다</th></tr>
	</c:if>
	<c:if test="${pp.total > 0 }">
	<div class="imgfrm">
		<table>
	<tr><th>번호</th><th>제목 </th><th>작성자</th><th>조회수</th><th>작성일</th><th>좋아요</th></tr>
	<c:forEach var="post" items="${main}">
	<c:choose>
	<c:when test="${post.del=='n' }">
    	<tr>
         	<td style="DISPLAY: none;"><fmt:formatDate var="Date" value="${post.reg_date}" pattern="yyyy-MM-dd"/>​</td>
			<td>${no}</td>
			<c:set var="no" value="${no - 1}"></c:set>
			<td>
				<div OnClick="location.href='${path}/view/ps_id/${post.ps_id}/pageNum/${pp.currentPage}'">
			    	<div id="postTitle">${post.subject}</div>
			    </div> 
			</td>	
			<td>${post.mm_id}</td>
			<td>${post.read_count}</td>
			<td>${Date}</td>
			<td>${post.likes}</td>
		</tr>
    </c:when>
    <c:otherwise>
      <div class="imgcon">
      삭제된 게시글 입니다.
      </div>
    </c:otherwise>
	</c:choose>
	</c:forEach>
		</table>
		</div>
		</c:if>
		</div>
		
			
		<form action="${url}">
			<select name="search">
			<c:forTokens var="s" items="subject,mm_id,content" 
				delims=","	varStatus="vs">
				<c:if test="${s==search}">
					<option value="${s}" selected="selected">${ops[vs.index] }</option>
				</c:if>
				<c:if test="${s!=search}">
					<option value="${s}">${ops[vs.index] }</option>
				</c:if>
			</c:forTokens>
		
			</select>
			<input type="text" name="keyword" value="${keyword}">
			<input type="hidden" name="hobby_id" value="${hobby_id}">
			<input type="hidden" name="best" value="${best}">
			<input type="hidden" name="dates" value="${dates}">
			<input type="submit" value="확인">
		</form>
		<div>
		<div class="paging">
		<ul>
			<c:if test="${pp.startPage > pp.pagePerBlock }">
				<li><input type="button" value="${i}" onclick="chk1(${i})"></li>
			</c:if>
			<c:forEach var="i" begin="${pp.startPage}" end="${pp.endPage }">
				<c:if test="${pp.currentPage==i }">
					<li>
						<li><input type="button" value="${i}" onclick="chk1(${i})"></li>
				</c:if>
				<c:if test="${pp.currentPage!=i }">
					<li><input type="button" value="${i}" onclick="chk1(${i})"></li>
					
				</c:if>						 
			</c:forEach>
			<c:if test="${pp.endPage < pp.totalPage }">
				<li><input type="button" value="${i}" onclick="chk1(${i})"></li>
			</c:if>	
		</ul>	
		</div>
		
		<select name="test" class="mainChange" id="good">
	<c:if test="${MnVal==1}">
	<option onclick="MainChoice()" value="1" selected="selected">그림메인보기</option>
	<option onclick="MainChoice()" value="2">글메인보기</option>
	</c:if>
	<c:if test="${MnVal==2}">
	<option onclick="MainChoice()" value="1" >그림메인보기</option>
	<option onclick="MainChoice()" value="2" selected="selected">글메인보기</option>
	</c:if>
</select>
		</div>
			<div id="footer"></div>
</div>
</div>

</body>
</html>