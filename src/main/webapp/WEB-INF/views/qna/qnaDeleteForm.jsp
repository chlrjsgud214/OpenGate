<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function chk() {
		if(frm.password.value != frm.password2.value) {
			alert("암호가 다릅니다");
			frm.password.focus();
			frm.password.value="";
			return false;
		}
	}
</script>
<script type="text/javascript">
	function back() {
		con = confirm("이 페이지를 벗어나시겠습니까?");
		if(con) history.go(-1);
		else {
			return;
		}
	}
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">삭제</h2>
	<form action="qnaDelete.og" method="post" name="frm" onsubmit="return chk()">
		<input type="hidden" name="password2" value="${qna.password }">
		<input type="hidden" name="num" value="${qna.num }">
		<input type="hidden" name="pageNum" value="${pageNum }">
		<table class="table table-bordered">
			<tr>
				<td>제목</td>
				<td>${qna.subject }</td>
				<td>작성자</td>
				<td>${qna.writer }</td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="password" required="required"></td>
				<td colspan="2">
					<input type="submit" class="btn btn-danger" value="삭제">
					<a class="btn btn-default" onclick="back()">뒤로</a>
			</tr>
		</table>
	</form>
</div>
</body>
</html>