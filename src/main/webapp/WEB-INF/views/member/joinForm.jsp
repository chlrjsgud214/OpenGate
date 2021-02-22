<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idChk() {
		if (!frm.id.value){
			alert("아이디를 입력하고 중복 체크 하세요");
			frim.id.focus();
			return false;
		}
	}
	function chk(){
		if(frm.password.value != frm.password2.value){
			alert("비밀번호가 일치하지 않습니다")
			frm.password.focus();
			frm.password.value = "";
			return false;
		}
	}
</script>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">회원 가입</h2>
<form action="join.do" method="post" enctype="multipart/form-data"
	onsubmit="return chk()" name="frm">
	<table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" required="required"
				autofocus="autofocus">
				<input type="button" onclick="idChk()" 
				checked="btn btn-info btn-sm" value="중복체크">	
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="password" 
				required="required"></td>
		</tr>
		<tr>
			<th>비밀번호 재확인</th>
			<td><input type="password" name="password2" 
				required="required"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" 
			required="required"></td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td><input type="tel" name="tel" required="required"
			pattern="\d{3}-\d{3,4}-\d{4}" 
			placeholder="010-xxxx-xxxx"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="email"
			 required="required"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr" 
			required="required"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="가입하기"
				class="btn btn-danger">
		</tr>
	</table>
</form>
</div>
</body>
</html>