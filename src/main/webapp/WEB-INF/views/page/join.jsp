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
		<br> <br> <br>
		<div class="row" >
			<div class="col-md-4"></div>
			<div class="col-md-4"
				style="height:550px; background-color: #424242;">
				<br> <br>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<h1 style="color: white">회원가입</h1>
						<br>
						<div style="text-align: center; float: center">
							<p style="color: white; float: left">아이디</p>
							<input type="text" class="form-control" id="id"
								placeholder="ID 입력" style="float: center"> <br>
							<p style="color: white; float: left">비밀번호</p>
							<input type="text" class="form-control" id="password"
								placeholder="비밀번호 입력" style="float: center;"> <br>
							<p style="color: white; float: left">비밀번호 확인</p>
							<input type="text" class="form-control" id="password2"
								placeholder="비밀번호 확인" style="float: center"> <br>
							<p style="color: white; float: left">이메일</p>
							<input type="text" class="form-control" id="id"
								placeholder="이메일 입력" style="float: center"> <br>
							<button type="button" class="btn btn-default col-md-12" data-url="join_next"
								style="background-color: black; border: 1px solid black; color: white">다음 단계</button>
							<br>
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>