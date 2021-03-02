<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<h2 class="text-primary">Q&A수정</h2>
		<form action="qnaUpdate.og" method="post">
			<input type="hidden" name="num" value="${qna.num }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<input type="hidden" name="password" value="${qna.password }">
			<input type="hidden" name="email" value="${qna.email }">
			<table class="table table-bordered">
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" required="required" autofocus="autofocus" value="${qna.subject}"></td>
					<td>작성자</td>
					<td>${qna.writer }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<textarea rows="5" cols="40" required="required" name="content">${qna.content }</textarea>
					</td>	
				</tr>
				<tr>
					<td colspan="4">
						<input type="submit" class="btn btn-info" value="수정">
						<input type="reset" class="btn btn-warning" value="취소">
						<a class="btn btn-default" onclick="back()">뒤로</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>