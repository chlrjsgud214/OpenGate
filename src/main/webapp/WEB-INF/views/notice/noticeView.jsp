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
				<a href="noticeList.og?pageNum=${pageNum }" class="btn btn-info">공지사항</a>
				<c:if test="${id == 'master' }">
					<a href="noticeUpdateForm.og?num=${notice.num }&pageNum=${pageNum }" class="btn btn-warning">수정</a>
					<a class="btn btn-danger" onclick="delConfirm(${notice.num},${pageNum })">삭제</a>
				</c:if>
			</td>	
		</tr>
	</table>
	<div id="noticeDisp"></div>
</div>
</body>
</html>