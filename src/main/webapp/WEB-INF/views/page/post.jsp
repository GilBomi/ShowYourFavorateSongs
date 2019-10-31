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
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

<body>
	<div id="wrap">
		<header id="header">
			<%@ include file="/WEB-INF/include/top.jsp"%>
			<%@ include file="/WEB-INF/include/top2_board.jsp"%>
		</header>
		<section>
			<div id="content">
				<%@ include file="/WEB-INF/include/communityList.jsp"%>

				<div class="container">

					<div class="jumbotron" style="margin-top: 10px;">
						<h4 style="padding-left: 5px;">${post.board.board_name}</h4>
						<br>
						<h1 class="display-5">${post.title}</h1>
						<br>
						<!--글 헤더-->
						<div>
							<p class="lead-2">
								<a href="#">${post.user.nickname}</a>
							</p>
							<p class="lead" style="margin-right: 10px; float: right;">
								<img
									src="${pageContext.request.contextPath}/res/images/view.png" />&nbsp;${post.view}
							</p>
							<p class="lead" style="margin-right: 20px; float: right;">
								<img
									src="${pageContext.request.contextPath}/res/images/date.png" />&nbsp;${post.date}
							</p>
						</div>

						<hr class="my-4" style="clear: both">

						<!--내용-->
						<div class="lead-3" style="width: 100%">
							<p>${post.content}</p>
							<!--<p>본문 내용</p>-->
							<br> <br>
							<!--파일-->

							<c:forEach var="file" items="${files}">
								<p style="text-align: center;">
									<img
										src="${pageContext.request.contextPath}/upload/${file.file_name}"
										style="width: 700px;">
								</p>
							</c:forEach>
							<br> <br>
						</div>

						<!--추천-->
						<div class="lead" style="text-align: center; margin-bottom: 80px;">
							<a class="btn btn-primary" href="#" role="button"><img
								src="${pageContext.request.contextPath}/res/images/likey.png">&nbsp;추천</a>
							<div class="btn"
								style="border: 1px solid grey; background: white; color: grey">&nbsp;0</div>
						</div>


						<c:choose>
							<c:when test="${post.user.user_idx eq user.user_idx }">
								<!-- 자기가 쓴 글일 때-->
								<button type="button" class="btn btn-primary btn3"
									style="float: right; margin-right: 10px;"
									onclick="location.href='/page/postDelete?post_id=${post.post_id}'">삭제</button>

								<button type="button" class="btn btn-primary btn3"
									style="float: right; margin-right: 10px;"
									onclick="location.href='/page/postModify?post_id=${post.post_id}'">수정</button>

							</c:when>
							<c:when test="${user.manager eq 'true' }">
								<!-- 관리자일 때 -->
								<button type="button" class="btn btn-primary btn3"
									style="float: right; margin-right: 10px;"
									onclick="location.href='/page/postDelete?post_id=${post.post_id}'">삭제</button>

							</c:when>
						</c:choose>
						<br> <br>
						<hr class="my-4" style="clear: both;">
						<!--댓글-->
						<p class="lead-2" style="">댓글</p>
						<hr class="my-4" style="clear: both; margin-bottom: -100px">

						<!--댓글 목록-->
						<div>
							<ul class="reply_ul">

							</ul>
						</div>

						<!--페이지네이션-->
						<div class="text-center">
							<ul class="pagination pagination-sm" style="margin-top: 20px;">
								<li class="page-item disabled"><a class="page-link"
									href="#">&laquo;</a></li>
								<li class="page-item active"><a class="page-link" href="#">1</a>
								</li>
								<li class="page-item disabled"><a class="page-link"
									href="#">&raquo;</a></li>
							</ul>
						</div>

						<!--댓글 입력 폼-->
						<div class="txar_wrap">
							<div class="bottom_txar">
								<textarea name="comment" cols="30" rows="10" class="txar"
									placeholder=""></textarea>

								<button type="submit" name="" class="btn btn-primary"
									style="float: left; width: 100%">등록</button>
							</div>
						</div>


					</div>
				</div>
		</section>

		<!--푸터-->
		<%@ include file="/WEB-INF/include/footer.jsp"%>

	</div>
</body>