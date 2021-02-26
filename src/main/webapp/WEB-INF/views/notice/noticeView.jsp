<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$('#noticeDisp').load('noticeList.og', 'pageNum=${pageNum}');
		$('#noticeReplyDisp').load('noticeReplyList.og', 'bno=${notice.num}');
		$('#noticeReplyInsert').click(function() {
			var sendData = $('#frm').serialize();
			$.post('${path}/noticeReplyInsert', sendData, function(data) {
				alert('댓글이 작성 되었습니다');
				$('#noticeReplyDisp').html(data);
				frm.replyer.value="";
				frm.password.value="";
				frm.password2.value="";
				frm.replytext.value="";
			});
		});
	});
</script>
<script type="text/javascript">
	function delConfirm(num,pageNum) {
		var con = confirm("삭제하시겠습니까?");
		if(con) location.href="noticeDelete.og?num="+num+"&pageNum="+pageNum;
		else {
			alert("삭제 취소");
			return;
		}
	}
</script>
<script type="text/javascript">
	function chk() {
		if(frm.password.value != frm.password2.value) {
			alert("비밀번호가 일치하지 않습니다");
			frm.password.focus();
			frm.password.value="";
			return false;
		}
	}
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">공지사항</h2>
	<table class="table table-striped">
		<tr>
			<td>제목</td>
			<td>${notice.subject }</td>
			<td>작성일</td>
			<td>${notice.reg_date }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${notice.writer }</td>
			<td>이메일</td>
			<td>${notice.email }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><pre>${notice.content }</pre></td>
		</tr>
		<tr>
			<td colspan="2">
				<c:if test="${id == 'master' }">
					<a href="noticeUpdateForm.og?num=${notice.num }&pageNum=${pageNum }" class="btn btn-warning">수정</a>
					<a class="btn btn-danger" onclick="delConfirm(${notice.num},${pageNum })">삭제</a>
				</c:if>
			</td>	
		</tr>
	</table>
	<form action="" name="frm" id="frm">
		<input type="hidden" name="bno" value="${board.num }">
			<h2 class="text-primary">댓글 작성</h2>
		<table class="table table-hover">
			<c:if test="${id == null || id == '' }">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="replyer" required="required"></td>
					<td>암호</td>
					<td><input type="password" name="password" required="required"></td>
					<td>암호확인</td>
					<td><input type="password" name="password2" required="required"></td>
				</tr>
			</c:if>
			<c:if test="${id == 'master' || id != null }">
				<input type="hidden" name="replyer" value="${id }">
				<input type="hidden" name="password" value="${member.password }">
			</c:if>
			<tr>
				<td colspan="5"><textarea rows="2" cols="90" name="replytext"></textarea></td>
				<td><input type="button" class="btn btn-success btn-lg" onclick="return chk()" 
						value="입력" id="noticeReplyInsert"></td>
			</tr>
			<tr align="center">
				<td colspan="6"><a href="noticeList.og?pageNum=${pageNum }" class="btn btn-info">공지사항</a></td>
			</tr>
		</table>	
	</form>
	<div id="noticeReplyDisp"></div>
	<div id="noticeDisp"></div>
</div>
</body>
</html>