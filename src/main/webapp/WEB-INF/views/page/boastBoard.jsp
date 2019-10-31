<%@ page pageEncoding="utf-8"%>
<meta charset="utf-8">
<title>너의 18번을 들려줘</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:url var="R" value="/" />
<!-- 이게 원래 css코드임 
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
	-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${R}res/common.js"></script>
<link rel="stylesheet" href="${R}res/common.css">


<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<body>
	<div id="wrap">
		<header id="header">
			<%@ include file="/WEB-INF/include/top.jsp"%>
			<%@ include file="/WEB-INF/include/top2_board.jsp"%>
		</header>
		<section>
			<div id="content">
				<%@ include file="/WEB-INF/include/communityList.jsp"%>

				<div
					style="text-align: center; padding-top: 100px; padding-bottom: 20px;">
					<h1 style="font-size: 23pt">전국 노래 자랑</h1>
				</div>

				<hr
					style="margin-bottom: -2px; border: 0; height: 1px; background: #E6E6E6; clear: both;">

				<!--게시글 목록 테이블-->
				<div class="container">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>날짜</th>
								<th>조회</th>
								<th>추천</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="post" items="${boastPosts}" varStatus="status">
								<tr>
									<c:set var="num"
										value="${fn:length(boastPosts)-status.index}" />
									<td><c:out value="${num}" /></td>
									<td><a href="post/${post.post_id}"
										style="text-decoration: none; font-weight: bold; color: grey">${post.title}
									</a></td>
									<c:set var="theString" value="${post.user.nickname}" />
									<td><c:if test="${fn:contains(theString,'관리자')}">${post.user.nickname}</c:if>
										<c:if test="${fn:indexOf(theString,'관리자')==-1}">
											<a href="user?user_idx=${post.user.user_idx}"
												style="text-decoration: none; font-weight: bold; color: grey">${post.user.nickname}</a>
										</c:if></td>
									<td>${post.date}</td>
									<td>${post.view}</td>
									<td>0</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>

					<div class="text-center" style="margin-top: 100px;">
						<!--페이지네이션-->
						<ul class="pagination">
							<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
							</li>
							<li class="page-item active"><a class="page-link" href="#">1</a>
							</li>
							<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a>
							</li>
						</ul>

						<!--글작성-->
						<button type="button" class="btn btn-primary btn3"
							style="float: right; margin-right: 10px;"
							onclick="location.href='postWrite/2'">글작성</button>
					</div>

					<br> <br>


					<%@ include file="/WEB-INF/include/searching.jsp"%>
					<br> <br> <br> <br>
				</div>
		</section>
		<!--푸터-->
		<%@ include file="/WEB-INF/include/footer.jsp"%>

	</div>
</body>