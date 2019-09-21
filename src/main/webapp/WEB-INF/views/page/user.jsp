<%@ page pageEncoding="utf-8"%>
<meta charset="utf-8">
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${R}res/common.js"></script>
<link rel="stylesheet" href="${R}res/common.css">
<%@ include file="/WEB-INF/include/top.jsp"%>
<%@ include file="/WEB-INF/include/top2.jsp"%>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<c:url var="R" value="/" />
<body>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2">마루 님</div>
			<a class="btn btn-danger btn-sm col-md-1" href="#" role="button">정보
				수정</a> <a href="#"><span class="col-md-2"
				style="float: center; text-align: center"> 내가 쓴 글 </span></a> <a
				href="#"><span class="col-md-2"
				style="float: center; text-align: center"> 내가 쓴 댓글 </span></a> <a
				href="#"><span class="col-md-2"
				style="float: center; text-align: center"> 좋아요 한 글 </span></a> <br>
			<br>
			<div class="col-md-2"></div>
			<button type="button" class="btn btn-default">한줄소개</button>
			<span>멍멍이에요</span> <br> <br>
			<div class="col-md-2"></div>
			<button type="button" class="btn btn-default">팔로우</button>
			<span>후유</span> <span>유녕이짱</span> <span>소여니짱</span> <span>작은애</span>
			<br> <br> <br>
			<div class="col-md-2"></div>
			<div class="col-md-2">
				<h4>
					<strong>내 리스트</strong>
				</h4>
			</div>
			<div class="container">
				<table class="table table-condensed">
					<tr>
						<td>태진</td>
						<td>금영</td>
						<td>제목</td>
						<td>가수</td>
					</tr>
				</table>
			</div>

		</div>
</body>