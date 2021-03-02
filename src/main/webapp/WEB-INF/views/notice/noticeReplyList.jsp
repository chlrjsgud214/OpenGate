<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function noticeReplyDelete(bno, rno) {
		var sendData = 'bno='+bno+'&rno='+rno;
		$.post('noticeReplyDelete.og', sendData, function(data) {
			alert("댓글이 삭제 되었습니다");
			$('#noticeReplyDisp').html(data);
		});
	}
	function noticeReplyUpdate(bno, rno) {
		var txt = $('#td_'+rno).text();
		$('#td_'+rno).html("<textarea rows='3' cols='90' id='rt'>"+txt+"</textarea>");
		$('#btn_'+rno).html("<input type='button' onclick='up("+bno+","+rno+")' class='btn btn-sm btn-danger'"+
							"value='확인'> <input type='button' onclick='lst("+bno+")' class='btn btn-info btn-sm' value='취소'>");	
	}
	function up(bno, rno) {
		var sendData='replytext='+$('#rt').val()+'&bno='+bno+'&rno='+rno;
		$.post('noticeReplyUpdate.og?bno='+bno+'&rno='+rno, sendData, function(data){
			alert('수정 되었습니다');
			$('#noticeReplyDisp').html(data);
		});
	}
	function lst(bno) {
		$('#noticeReplyDisp').load('/notice/noticeReplyList.og?bno='+bno);
	}
</script>
</head>
<body>
<c:if test="${not empty nReplyList }">
	<table class="table table-striped">
		<tr>
			<td>작성자</td>
			<td>내용</td>
			<td>수정일</td>
			<td></td>
		</tr>
		<c:forEach var="nrbd" items="${nReplyList }">
			<c:if test="${nrbd.del == 'y' }">
				<tr>
					<td colspan="4">삭제된 댓글입니다</td>
				</tr>
			</c:if>
			<c:if test="${nrbd.del != 'y'}">
				<tr>
					<td>${nrbd.replyer }</td>
					<td id="td_${nrbd.rno }">${nrbd.replytext }</td>
					<td>${nrbd.updatedate }</td>
						<td id="btn_${nrbd.rno }">
							<button class="btn btn-warning btn-sm" onclick="noticeReplyUpdate(${nrbd.bno },${nrbd.rno })">수정</button>
							<button class="btn btn-danger btn-sm" onclick="noticeReplyDelete(${nrbd.bno },${nrbd.rno })">삭제</button>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</c:if>
</body>
</html>