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
	<div class="container-fluid">
		<div class="row" style="background-color:grey;height:200px;">
		
			<div class="col-md-4"></div>
			<div class="col-md-4" style="height:center">
			<br><br><br><br>
				<input type="text" class="form-control" id="songName"
					placeholder="곡 제목 혹은 가수 검색" style="float: right; text-align: center">
			</div>
			<br><br><br><br>
			<div class="col-md-1"
				style="float: left; text-align: left; vertical-align: center">
				<button type="button" class="btn btn-default"
					aria-label="Right Align" data-url="searchingSong">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
			</div>
		</div>
		<br> <br><br> <br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-2 out" style="height: 250px;text-align: center;border:1px solid #424242;background-color:#424242;color:white"><br><br><br><br><br><span class="glyphicon glyphicon-list" aria-hidden="true"></span><br><br>마이리스트</div>
			<div class="col-md-1"></div>
			<div class="col-md-2" style="height: 250px;text-align: center;border:1px solid #424242;background-color:#424242;color:white"><br><br><br><br><br><span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span><br><br>베스트</div>
			<div class="col-md-1"></div>
			<div class="col-md-2" style="height: 250px;text-align: center;border:1px solid #424242;background-color:#424242;color:white"><br><br><br><br><br><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span><br><br>위치</div>
		</div>
		<br> <br><br> <br>
	</div>
</body>