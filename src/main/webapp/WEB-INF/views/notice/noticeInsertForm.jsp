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
		var con = confirm("이 페이지를 벗어나시겠습니까?");
		if(con)	history.go(-1);
		else {
			return;
		}
	}
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">공지글 입력</h2>
	<form action="noticeInsert.do" method="post">
	<input type="hidden" name="num" value=${num }>
	<input type="hidden" name="pageNum" value=${pageNum }>
		<table class="table table-bordered">
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject" required="required" autofocus="autofocus"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="40" required="required" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="입력" class="btn btn-success">
								<input type="reset" value="취소" class="btn btn-warning">
								<a class="btn btn-default" onclick="back()">뒤로</a></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>