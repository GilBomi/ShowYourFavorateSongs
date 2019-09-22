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

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<c:url var="R" value="/" />
<body style="background-color: grey">
	<br>
	<div class="container-fluid">
		<br> <br> <br><br><br>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4" style="height: 350px; background-color: #424242">
				<br> <br> <br>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<h1 style="color: white">로그인</h1>
						<div style="text-align: center; float: center">
							<input type="text" class="form-control" id="id"
								placeholder="ID 입력" style="float: center"> <br>
							<input type="text" class="form-control" id="password"
								placeholder="비밀번호 입력" style="float: center;"> <br>
							<button type="button" class="btn btn-default col-md-12"
								style="background-color: black; border: 1px solid black; color: white">로그인</button>
							<br><br><a href=""><span style="color:white;">ID 찾기</span></a><span style="color:white"> | </span><a href=""><span style="color:white;">비밀번호 찾기</span></a><span style="color:white"> | </span><a href="#"><span data-url="join" style="color:white;">회원가입</span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>