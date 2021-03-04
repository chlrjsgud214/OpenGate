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
			alert("암호와 암호확인이 다릅니다");
			frm.password.focus();
			frm.password.value="";
			return false;
		}
	}
</script>
<script type="text/javascript">
	function back() {
		var con = confirm("이 페이지를 벗어나시겠습니까?");
		if(con) history.go(-1);
		else {
			return;
		}
	}
</script>
</head>
<body>
	<div class="container" align="center">
		<h2 class="text-primary">Q&A입력</h2>
		<form action="qnaInsert.og" method="post" name="frm" onsubmit="return chk()">
			<input type="hidden" name="ref" value="${ref }">
			<input type="hidden" name="re_level" value="${re_level }">
			<input type="hidden" name="re_step" value="${re_step }">
			<input type="hidden" name="num" value="${num }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<c:if test="${id != null }">
				<input type="hidden" name="writer" value="${id }">
				<input type="hidden" name="password" value="${member.password }">
				<input type="hidden" name="email" value="${member.email }">
			</c:if>
		<table class="table table-bordered">
			<c:if test="${num == 0 }">
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" required="required" autofocus="autofocus"></td>
				</tr>
			</c:if>
			<c:if test="${num != 0 }">
				<tr>
					<td>제목</td>
					<td><input type="text" name="subject" required="required" value="답변=>"></td>
				</tr>
			</c:if>
			<c:if test="${id == null }">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="writer" required="required"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" required="required"></td> 
				</tr>
				<tr>
					<td>암호</td>
					<td><input type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<td>암호확인</td>
					<td><input type="password" name="password2" required="required"></td>
				</tr>
			</c:if>
			<c:if test="${id != null }">
				<tr>
					<td>작성자</td>
					<td>${id }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${member.email }</td>
				</tr>
			</c:if>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="40" required="required" name="content">${qna.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" class="btn btn-warning" value="입력">
					<input type="reset" class="btn btn-danger" value="취소">
					<a class="btn btn-default" onclick="back()">뒤로</a>
				</td>
			</tr>
		</table>	
		</form>
	</div>
</body>
</html>