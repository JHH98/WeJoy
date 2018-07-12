<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE>
<html>
<script type="text/javascript">
function deletePost(ps_id,pageNum) {
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	   location.href="${path}/delete/ps_id/"+ps_id+"/pageNum/"+pageNum;
	}
	
	
}
</script>

<script>
var end="10";
var end2=10;
var start="0";
var ps_id="${post.ps_id}";
var id="${id}"
$(document).ready(function(){
	$('html').click(function(e) { if($(e.target).hasClass("frame2")) { 
		history.go(-1);
		} 
	});
	
	$('#clist').load('${path}/clist/num/${post.ps_id}?st='+start+'&ed='+end);
	$('.morecomm').click(function(){
		end2+=10;
		end2=String(end2); 
		end=end2;
		end2 = Number(end2);
		
		$('#clist').load('${path}/clist/num/${post.ps_id}?st='+start+'&ed='+end);
	});
	   $('#likes').click(function() {
		$.post('${path}/view2',"ps_id="+ps_id+"&id="+id, function() {
			
		}); 
	}); 
	
	/* $('#likes').load('${path}/view2/ps_id/${post.ps_id}/id/${id}'); */
	
	$('#comInsert').click(function() {
		if (!frm.replytext.value) {
			alert("댓글 입력 후에 확인을 누르세요");
			frm.replytext.focus(); return false;
		}
		var frmData = $('#frm').serialize();
		$.post('${path}/cInsert',frmData, function(data) {
			$('#clist').html(data);
			frm.replytext.value="";
		});
	});
});
</script>




<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="frame2">
	<div class="detailbox">
		<div class="detailtop">
		<c:if test="${id !=null }">
		<img src="${path}/images/like.png" width="10%" height="100%" id="likes" style="cursor: pointer;">
		
		</c:if>
		<span id="result"></span>
		</div>
		<div class="detailmid"><div class="imgbox">
           <img src="${path}/upload/${post.origin_ig_name}" height=100% width=100%>
           
           </div>
           <c:if test="${id ==post.mm_id }">
            <button OnClick="location.href='${path}/updateForm/num/${post.ps_id}/pageNum/${pageNum}'" >수정</button>
		  <button OnClick="deletePost(${post.ps_id},${pageNum})">삭제</button>
		  </c:if>
           </div>
		<div class="detailbot">${post.content}</div>
	<div class="detailcom">
	<details>
    <summary style="cursor: pointer;">댓글</summary>
    
    <div class="commentbox"><div id="clist"></div></div>
    <div class="morecomm">더보기</div>
   <form name="frm" id="frm">
	<input type="hidden" name="replyer" value="${post.mm_id}">
	<input type="hidden" name="pno" value="${post.ps_id}">	
	
	<textarea rows="3" cols="50" name="replytext" ></textarea>
	<input type="button" value="확인" id="comInsert">
	</form>
	</details>
	</div>
	</div>
	</div>
</body>
</html>