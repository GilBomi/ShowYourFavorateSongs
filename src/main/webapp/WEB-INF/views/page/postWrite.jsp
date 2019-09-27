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


<body>
	<div id="wrap">
		<header id="header">
			<%@ include file="/WEB-INF/include/top.jsp"%>
			<%@ include file="/WEB-INF/include/top2_board.jsp"%>
		</header>
		<section>
			<div id="content">
				<%@ include file="/WEB-INF/include/communityList.jsp"%>
				
				<!--글 본문-->
				<div class="container">
					<div class="jumbotron" style="margin-top: 40px;">

						<!--글 헤더-->
						<div style="margin-top: 30px;">
							<input type="text" id="Title" name="Title" value="" class="post_title_input" placeholder="제목을 입력하세요" />
						</div>

						<hr class="my-4" style="clear: both">

						<!--내용 작성-->
						<div>
							<textarea class="post_body_input" id="exampleTextarea" rows="15" placeholder="내용을 입력하세요"></textarea>
						</div>

						<hr class="my-4" style="clear: both;">

						<div style="padding-left: 10px;">
							<label for="inputFile">파일 첨부</label>
							<input type="file" class="form-control-file" id="inputFile" aria-describedby="fileHelp">
						</div>

						<hr class="my-4" style="clear: both;">

						<div style="text-align: center; margin-top: 70px;">
							<button type="button" class="btn btn-primary btn2" style="width: 100px;" onclick ="location.href='freeboard.html'" data-cancel-board>취소</button>
							<button type="button" class="btn btn-primary" style="width: 100px;" onclick ="location.href='freeboard.html'" data-add-board>등록</button>
						</div>

					</div>
					
				</div>
			</div>



		</section>

		<!--푸터-->
		<%@ include file="/WEB-INF/include/footer.jsp"%>

	</div>
</body>