<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function cDelete(cno, pno) {
		var frmData = "cno="+cno+"&pno="+pno;
		$.post('${path}/cDelete', frmData, function(data) {
			alert("삭제 되었습니다");
			$('#clist').html(data);
		});
	}
	function cUpdate(cno, pno) {
		var txt = $('#td_'+cno).text();
		$('#td_'+cno).html(
		  '<textarea name="replytext" cols="30" rows="1" id="ct">'
		  +txt+'</textarea>');
		$('#ptn_'+cno).html(
			'<input type="button" value="확인" onclick="up('+
				pno+','+cno+
			')"><input type="button" value="취소" onclick="lst('+
					pno+')">'); 
	}
	function lst(pno) {
		$('#clist').load('${path}/clist/num/'+pno);
	}
	
	function up(pno,cno) {
		var replytext = $('#ct').val();
		var frmData="cno="+cno+"&pno="+pno+"&replytext="+replytext;
		$.post('${path}/cUpdate',frmData, function(data) {
			alert("수정 되었습니다");
			$('#clist').html(data);
		});
	}
</script>

</head><body>
			
			<c:forEach var="cs" items="${clist}" begin="${start}" end="${end}" >
			<c:choose>
			<c:when test="${cs.del=='n' }">
			<div class="eachcomm">	${cs.replyer}:<c id="td_${cs.cno}">${cs.replytext}</c> 
			<c:if test="${post.mm_id == id }">
				 	<b id="ptn_${cs.cno}">
				 	<div class="list_button_box">
				 	<div class="list_button"
						onclick="cUpdate(${cs.cno},${cs.pno})">수정</div>
					<div class="list_button"
						onclick="cDelete(${cs.cno},${cs.pno})">삭제</div>
					</div>
					</b>
			</c:if>			
			</div>
			</c:when>
			<c:otherwise>
			<div class="eachcomm">삭제된 댓글 입니다.</div>
			</c:otherwise>
			</c:choose>
				
				<!-- 로그인한 ID(이름)와 댓글 ID(이름)와 비교하는 게 맞음 -->
				 
				</c:forEach>


</body>
</html>