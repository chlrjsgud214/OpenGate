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
		$('#qnaDisp').load('qnaList.og', 'pageNum=${pageNum}');
	});
</script>
<script type="text/javascript">
	function qnaDel(num, pageNum) {
		var con = confirm("정말로 삭제하시겠습니까?");
		if(con) location.href="qnaDelete.og?num="+num+"&pageNum="+pageNum;
		else {
			alert("삭제취소");
			return;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">Q&A</h2>
		<table class="table table-striped">
			<tr>
				<td>제목</td>
				<td>${qna.subject }</td>
				<td>작성자</td>
				<td>${qna.writer }</td>	
			</tr>
			<tr>
				<td>이메일</td>
				<td>${qna.email }</td>
				<td>작성일</td>
				<td>${qna.reg_date }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">${qna.content }</td>
			</tr>
			<tr>
				<td colspan="4">
					<a href="qnaList.og?pageNum=${pageNum }" class="btn btn-info">목록</a>
					<c:if test="${id == qna.writer || id == 'master' }">
						<a href="qnaUpdateForm.og?num=${qna.num }&pageNum=${pageNum }" class="btn btn-warning">수정</a>
						<a class="btn btn-danger" onclick="qnaDel(${qna.num},${pageNum })">삭제</a>
					</c:if>
					<a href="qnaInsertForm.og?num=${qna.num }&pageNum=${pageNum }" class="btn btn-success">답글</a>
				</td>
			</tr>
		</table>
		<div id="qnaDisp"></div>
	</div>
</body>
</html>