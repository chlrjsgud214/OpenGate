<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
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
	<h2 class="text-primary">회원 정보 수정</h2>
<form action="update.og" method="post" name="frm" enctype="multipart/form-data"
	onsubmit="return chk()">
	<input type="hidden" name="id" value="${member.id }">
	<table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td>${member.id }</td>
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
			required="required" value="${member.name }"></td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td><input type="tel" name="phone" required="required"
			pattern="\d{3}-\d{3,4}-\d{4}" value="${member.phone }"
			placeholder="010-xxxx-xxxx"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="email"
			 required="required" value="${member.email }"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address"   
			required="required" value="${member.address }"></td> 
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"
				value="수정" class="btn btn-danger">
		</tr>
	</table>
	<a href="main.og" class="btn btn-success">메인으로 가기</a>
</form>
</div>
</body>
</html>