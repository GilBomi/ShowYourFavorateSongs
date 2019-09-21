<%@ page pageEncoding="utf-8"%>
<meta charset="utf-8">
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:url var="R" value="/" />
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet" media="screen">

<script src="//code.jquery.com/jquery.min.js"></script>
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js">
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
<c:url var="R" value="/" />
<body>
		<nav class="navbar navbar-default navbar-static-top navbar-inverse">
			<div class="container">
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li data-url="chartBoard"><a href="#">인기곡 순위</a></li>
						<li><a href="#">공지사항</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li style="color:white"><a href="#">베스트 게시판</a></li>
								<li><a href="#">자유게시판</a></li>
								<li><a href="#">곡 추천 게시판</a></li>
								<li><a href="#">팁 게시판</a></li>
							</ul></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">정보
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">지도</a></li>
								<li><a href="#">기타</a></li>
							</ul></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li data-url="home"><a href="#"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
						<li data-url="user"><a href="#"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
						<li data-url="login"><a href="#">로그인</a></li>
					</ul>
				</div>

			</div>
		</nav>

</body>