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
		<h2 class="text-primary">공지사항</h2>
		<c:set var="num" value="${no }"></c:set>
		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<c:if test="${empty noticeList }">
				<tr>
					<th colspan="5">공지사항이 없습니다</th>
				</tr>
			</c:if>
			<c:if test="${not empty noticeList }">
				<c:forEach var="notice" items="${noticeList }">
					<tr>
						<td>${num }</td>
						<c:set var="num" value="${num - 1 }"></c:set>
						<c:if test="${notice.del == 'y' }">
							<th colspan="4">삭제된 글입니다</th>
						</c:if>
						<c:if test="${notice.del != 'y' }">
							<td title="${notice.content }">
								<a href="noticeView.og?num=${notice.num }&pageNum=${pb.currentPage}">
									${notice.subject }</a></td>
							<td>${notice.writer }</td>		
							<td>${notice.readcount }</td>	
							<td>${notice.reg_date }</td>		
						</c:if>
					</tr>	
				</c:forEach>
			</c:if>
		</table>
		<div align="center">
			<ul class="pagination">
				<c:if test="${pb.startPage > pb.pagePerBlock }">
					<li><a href="noticeList.og?pageNum=1&search=${notice.search }&keyword=${notice.keyword}">
						<span class="glyphicon glyphicon-backward"></span></a>
					</li>
					<li><a href="noticeList.og?pageNum=${pb.startPage-1 }&search=${notice.search }&keyword=${notice.keyword}">
						<span class="glyphicon glyphicon-triangle-left"></span></a> 
					</li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
					<c:if test="${pb.currentPage == i }">
						<li class="active"><a href="noticeList.og?pageNum=${i }&search=${notice.search }
													&keyword=${notice.keyword }">${i }</a>
						</li>
					</c:if>
					<c:if test="${pb.currentPage != i }">
						<li><a href="noticeList.og?pageNum=${i }&search=${notice.search }
													&keyword=${notice.keyword }">${i }</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${pb.endPage < pb.totalPage }">
					<li><a href="noticeList.og?pageNum=${pb.endPage + 1 }&search=${notice.search }&keyword=${notice.keyword}">
						<span class="glyphicon glyphicon-triangle-right"></span></a>
					</li>
					<li><a href="noticeList.og?pageNum=${pb.totalPage }&search=${notice.search }&keyword=${notice.keyword}">
						<span class="glyphicon glyphicon-forward"></span></a>
					</li>
				</c:if>
			</ul>
		</div>
		<form action="noticeList.og">
			<input type="hidden" name="pageNum" value="1">
			<select name="search">
				<c:forTokens var="sh" items="subject,content,subcon" delims="," varStatus="i">
					<c:if test="${sh == notice.search }">
						<option value=${sh } selected="selected">${tit[i.index] }</option>
					</c:if>
					<c:if test="${sh != notice.search }">
						<option value=${sh }>${tit[i.index] }</option>
					</c:if>
				</c:forTokens>
			</select>
			<input type="text" name="keyword" value=${notice.keyword }>
			<input type="submit" value="검색">
		</form>
		<div align="center">
			<a href="noticeInsertForm.og?num=0&pageNum=1" class="btn btn-success">글쓰기</a>
			<a href="noticeList.og" class="btn btn-default">공지사항</a>
		</div>
	</div>
</body>
</html>