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
				<div
					style="text-align: center; padding-top: 100px; padding-bottom: 20px;">
					<h1 style="font-size: 23pt">팁 게시판</h1>
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
							<tr>
								<td>2</td>
								<td class="title-td"><a href="#"
									style="text-decoration: none;">라면 맛있게 끓이는 법 </a></td>
								<td>라면빌런</td>
								<td>19.09.15</td>
								<td>55</td>
								<td>2</td>
							</tr>
							<tr>
								<td>1</td>
								<td class="title-td"><a href="#"
									style="text-decoration: none;">노래방 꿀팁 모음.txt</a></td>
								<td>노래방죽순이</td>
								<td>19.09.14</td>
								<td>101</td>
								<td>10</td>
							</tr>

							<!--게시글
								<tr>
								<td>글번호</td>
								<td class="title-td">
									<a href="#" style="text-decoration: none;">제목</a>
								</td>
								<td>작성자</td>
								<td>작성일</td>
								<td>조회수</td>
								<td>추천수</td>
							</tr>
						-->
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
							onclick="location.href='postWrite'">글작성</button>
					</div>

					<br> <br>

					<!--검색-->

					<%@ include file="/WEB-INF/include/searching.jsp"%>
					<br>
					<br>
					<br>
					<br>
		</section>
		<!--푸터-->
		<%@ include file="/WEB-INF/include/footer.jsp"%>

	</div>
</body>