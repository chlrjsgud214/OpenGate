<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" align="center">
	<h2 class="text-primary">Q&A</h2>
	<c:set var="num" value="${no }"></c:set>
	<table class="table table-striped table-hover">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:if test="${empty qnaList }">
			<tr>
				<th colspan="5">게시글이 없습니다</th>
			</tr>
		</c:if>
		<c:if test="${not empty qnaList }">
			<c:forEach var="qna" items="${qnaList }">
				<tr>
					<td>${num }</td>
					<c:set var="num" value="${num - 1 }"></c:set>
					<c:if test="${qna.del == 'y' }">
						<th colspan="4">삭제된 글 입니다</th>
					</c:if>
					<c:if test="${qna.del != 'y' }">
						<td title="${qna.content }">
							<c:if test="${qna.re_level > 0 }">
								<img alt="" src="resources/images/level.gif" height="5" width="${qna.re_level * 10 }">
								<img alt="" src="resources/images/re.gif">
							</c:if>
							<a href="qnaView.og?num=${qna.num }&pageNum=${pb.currentPage }">
								${qna.subject }
							</a>
							<c:if test="${qna.readcount > 50 }">
								<img alt="" src="resources/images/hot.gif">
							</c:if>
						</td>
						<td>${qna.writer }</td>
						<td>${qna.readcount }</td>
						<td>${qna.reg_date }</td>
					</c:if>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div align="center">
		<ul class="pagination">
			<c:if test="${pb.startPage > pb.pagePerBlock }">
				<li>
					<a href="qnalist.og?pageNum=1&search=${qna.search }&keyword=${qna.keyword}">
						<span class="glyphicon glyphicon-backward"></span>
					</a>
				</li>
				<li>
					<a href="qnalist.og?pageNum=${pb.startPage-1 }&search=${qna.search}&keyword=${qna.keyword}">
						<span class="glyphicon glyphicon-triangle-left"></span>
					</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
				<c:if test="${pb.currentPage == i }">
					<li class="active">
						<a href="qnalist.og?pageNum=${i }&search=${qna.search}&keyword=${qna.keyword}">${i }</a>
					</li>
				</c:if>
				<c:if test="${pb.currentPage != i }">
					<li>
						<a href="qnalist.og?pageNum=${i }&search=${qna.search}&keyword=${qna.keyword}">${i }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${pb.endPage < pb.totalPage }">
				<li>
					<a href="qnalist.og?pageNum=${pb.endPage+1 }&search=${qna.search}&keyword=${qna.keyword}">
						<span class="glyphicon glyphicon-triangle-right"></span>
					</a>
				</li>
				<li>
					<a href="qnalist.og?pageNum=${pb.totalPage }&search=${qna.search}&keyword=${qna.keyword}">
						<span class="glyphicon glyphicon-forward"></span>
					</a>
				</li>
			</c:if>
		</ul>
	</div>
	<form action="qnalist.og">
		<input type="hidden" name="pageNum" value="1">
		<select name="search">
			<c:forTokens var="sh" items="writer, subject, content, subcon" delims="," varStatus="i">
				<c:if test="${sh == qna.search }">
					<option value="${sh }" selected="selected">${tit[i.index] }</option>
				</c:if>
				<c:if test="${sh != qna.search }">
					<option value="${sh }">${tit[i.index] }</option>
				</c:if>
			</c:forTokens>
		</select>
		<input type="text" name="keyword" value="${qna.keyword }">
		<input type="submit" value="검색">
	</form>
	<div align="center">
		<a href="qnaInsertForm.og?num=0&pageNum=1" class="btn btn-success">게시글 입력</a>
		<a href="qnalist.og" class="btn btn-warning">Q&A</a>
		<a href="main.og" class="btn btn-default">메인</a>
	</div>
</div>
</body>
</html>