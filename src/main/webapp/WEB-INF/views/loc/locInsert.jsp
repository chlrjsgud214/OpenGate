<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0}">
	<script type="text/javascript">
		alert("등록되었습니다.");
		location.href="LocList.og";
	</script>
</c:if>
<c:if test="${result == 0}">
	<script type="text/javascript">
		alert("다시 시도해주세요.");
		history.back();
	</script>
</c:if>
<c:if test="${result == -1}">
	<script type="text/javascript">
		alert("이미 등록되어 있는 지점입니다.");
		history.back();
	</script>
</c:if>
</body>
</html>