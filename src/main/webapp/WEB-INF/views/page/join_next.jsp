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
		<br>
		<br>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4"
				style="height: 350px; background-color: #424242">
				<br> <br> <br>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<h1 style="color: white">회원가입</h1>
						<br>
						<div style="text-align: left; float: center">
							<span style="color:white">“이메일 주소”로 인증 메일을 전송했습니다.<br>메일을 확인해 회원가입을 마무리하세요.</span><br>
							<br><br>
							<button type="button" class="btn btn-default col-md-12" data-url="home"
								style="background-color: black; border: 1px solid black; color: white">메인으로</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>