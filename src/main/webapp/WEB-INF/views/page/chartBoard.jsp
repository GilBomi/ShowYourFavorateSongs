<%@ page pageEncoding="utf-8"%>
<meta charset="utf-8">
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">
<c:url var="R" value="/" />
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
<body>
	<br>
	<div class="container-fluid">
		<br> <br>
		<div class="row">
			<div class="col-md-1"></div>
			<h2 class="col-md-3" style="float: center; text-align: center">인기곡
				리스트</h2>
		</div>
		<!-- <h1 style="float: center; text-align: left">인기곡 리스트</h1>-->
		<div class="container">
			<table class="table table-condensed">
				<tr>
					<td>순위</td>
					<td>회사</td>
					<td>번호</td>
					<td>제목</td>
					<td>가수</td>
				</tr>
			</table>
		</div>
	</div>
</body>