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
			<!--본문 작성-->
			<div id="content">
				<div class="container">
					<div class="jumbotron" style="margin-top: 100px;">
						<!--검색창 영역-->
						<div style="margin: 100px;">
							<form class="form-inline my-2 my-lg-0" style="">
								<input class="form-control" type="text" placeholder="곡 제목 혹은 가수 검색" style="width: 80%; text-align: center;" value="술이 문제야">
								<button class="btn btn-secondary my-2 my-sm-0" type="submit">검색</button>
							</form>
						</div>

						<!--안내문 영역-->
						<div style="background: #E6E6E6; text-align: center; padding: 30px 0; color: #2E2E2E;">
							"술이 문제야"로 검색한 결과입니다.
						</div>

						<!--검색결과 테이블-->

						<table class="table table-hover" style="margin-top: 100px; background: #E6E6E6; color: #2E2E2E;">
							<thead>
								<tr>
									<th>태진</th>
									<th>금영</th>
									<th>곡명</th>
									<th>가수</th>
								</tr>
							</thead>

							<tbody>
								<tr data-add-list style="cursor: pointer" >
									<td>91564</td>
									<td>79942</td>
									<td>술이 문제야</td>
									<td>장혜진, 윤민수</td>
								</tr>
							</tbody>

						</table>


						<div class="text-center" style="margin-top: 100px;">
							<!--페이지네이션-->
							<ul class="pagination">
								<li class="page-item disabled">
									<a class="page-link" href="#">&laquo;</a>
								</li>
								<li class="page-item active">
									<a class="page-link" href="#">1</a>
								</li>
								<li class="page-item disabled">
									<a class="page-link" href="#">&raquo;</a>
								</li>
							</ul>
						</div>


						<!--안내문 영역-->
						<div style="background: #E6E6E6; text-align: center; padding: 30px 0; margin: 100px 0; color: #2E2E2E;">
							<span>찾으시는 곡이 없나요?</span>
							<span><a href="relative.html" style="font-weight: bold;">노래 신청하러 가기</a></span>
						</div>
					</div>
				</div>
			</div>

		</section>
		<!--푸터-->
		<%@ include file="/WEB-INF/include/footer.jsp"%>

	</div>
</body>