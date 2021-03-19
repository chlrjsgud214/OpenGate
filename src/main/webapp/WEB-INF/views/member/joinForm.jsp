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
			frm.id.focus();
			return false;
		}
		$.post("idChk.og","id="+frm.id.value, function(data) {
			$('#disp').html(data);
		});
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
<style type="text/css">
.container {width: 40%;}
h2 {padding-top:50px; font-size: 24px;}
form {padding-top: 50px;}
tr {color: #666;}


</style>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">회원 가입</h2>
<form action="join.og" method="post" name="frm"
	onsubmit="return chk()">
	<table class="table table-bordered">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" required="required"
				autofocus="autofocus" class="form-control" >
				<input type="button" onclick="idChk()" 
				class="btn btn-outline-info btn-sm pull-right" value="중복체크">
				<div id="disp" class="err"></div>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="password" 
				required="required"  class="form-control" ></td>
		</tr>
		<tr>
			<th>비밀번호 재확인</th>
			<td><input type="password" name="password2" 
				required="required"  class="form-control" ></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" 
			required="required"  class="form-control" ></td>
		</tr>
		<tr>
			<th>휴대전화</th>
			<td><input type="tel" name="phone" required="required"
			pattern="\d{3}-\d{3,4}-\d{4}" 
			placeholder="010-xxxx-xxxx"  class="form-control" ></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="email"
			 required="required" class="form-control" ></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="address"   
			required="required" class="form-control" ></td> 
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="가입하기"
				class="btn btn-outline-info pull-right">
			<a href="loginForm.og" class="btn btn-outline-primary">로그인</a>
			<a href="main.og" class="btn btn-outline-primary">메인으로</a>
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>