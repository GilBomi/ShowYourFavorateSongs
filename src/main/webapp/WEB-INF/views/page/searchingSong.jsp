<%@ page pageEncoding="utf-8"%>
<meta charset="utf-8">
<title>너의 18번을 들려줘</title>
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
			<br><br><br>
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<input type="text" class="form-control" id="songName"
					style="float: right; text-align: center" placeholder="곡 제목 혹은 가수 검색">
			</div>
			<div class="col-md-1"
				style="float: left; text-align: left; vertical-align: center">
				<button type="button" class="btn btn-default"
					aria-label="Right Align">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</div>
		</div>
		<br><br><br>
		<!-- <h1 style="float: center; text-align: left">인기곡 리스트</h1>-->
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