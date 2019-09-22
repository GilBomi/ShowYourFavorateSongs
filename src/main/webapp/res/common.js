
$(function() {

	$("[data-url]").click(function() {
		var url = $(this).attr("data-url");
		location.href = url;
	})

	
	$("[data-confirm-delete]").click(function() {
		return confirm("삭제하시겠습니까?");
	})
	$("[data-add-list]").click(function() {
		return confirm("마이 리스트에 추가하시겠습니까?");
	})
	$("[data-delete-list]").click(function() {
		return confirm("마이 리스트에서 삭제하시겠습니까?");
	})
	$("[data-add-board]").click(function() {
		return confirm("글을 등록하시겠습니까?");
	})
	$("[data-delete-board]").click(function() {
		return confirm("글을 삭제하시겠습니까?");
	})
	$("[data-modify-board]").click(function() {
		return confirm("글을 수정하시겠습니까?");
	})
	$("[data-cancel-board]").click(function() {
		return confirm("글을 취소하시겠습니까?");
	})
	$("[data-delete-comment]").click(function() {
		return confirm("댓글을 삭제하시겠습니까?");
	})


})

